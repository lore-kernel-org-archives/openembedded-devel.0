Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 746A2731C9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2016 19:08:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u48J8TS3009913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 May 2016 12:08:30 -0700 (PDT)
Received: from co-op.corp.ad.wrs.com (128.224.56.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 8 May 2016 12:08:29 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 8 May 2016 15:08:13 -0400
Message-ID: <1462734493-3819-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
References: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] netcf: fix mishandling of gnulib submodule causing build fail
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 May 2016 19:08:31 -0000
Content-Type: text/plain

netcf fails to build on certain hosts with newer versions
of git installed as follows:

| ./bootstrap: Bootstrapping from checked-out netcf sources...
| ./bootstrap: consider installing git-merge-changelog from gnulib
| ./bootstrap: getting gnulib files...
| error: pathspec 'gnulib' did not match any file(s) known to git.

If we do a devshell we will see that our configure prepend that
intended to _create_ the .gitmodules has instead _modified_ it
and left us with this change present:

  sh-4.3# git diff
  diff --git a/.gitmodules b/.gitmodules
  index 7acb1ea19ca7..2d10b0e0e0fe 100644
  --- a/.gitmodules
  +++ b/.gitmodules
  @@ -1,3 +1,3 @@
   [submodule "gnulib"]
  -       path = .gnulib
  -       url = git://git.sv.gnu.org/gnulib.git
  +       path = gnulib
  +       url = git://git.sv.gnu.org/gnulib
  sh-4.3#

What happens is that the newer git does not respect uncommitted
changes to the .gitmodules file, and hence the path ".gnulib" is
still considered valid vs. the in tree updated path "gnulib".  It
doesn't help any that the package has its own tracked files in
gnulib/ that we stomp over, but the real fail is just uncommitted
changes to the .gitmodule as this insertion of a random path shows:

  sh-4.3# git diff
  diff --git a/.gitmodules b/.gitmodules
  index 7acb1ea19ca7..91bd45f8e4d4 100644
  --- a/.gitmodules
  +++ b/.gitmodules
  @@ -1,3 +1,3 @@
   [submodule "gnulib"]
  -       path = .gnulib
  +       path = gnulibaaa
          url = git://git.sv.gnu.org/gnulib.git
  sh-4.3# git --version
  git version 2.7.4
  sh-4.3# git submodule init
  fatal: no submodule mapping found in .gitmodules for path '.gnulib'
  sh-4.3#

Since the original bbclass simply assumed there was no .gitmodules
file to begin with, we can easily solve this by not clobbering it
and respect the path choice used by the package itself.

As the version of ./bootstrap shipped with netcf supports this:

     --no-git       do not use git to update gnulib.  Requires that
                    --gnulib-srcdir point to a correct gnulib snapshot

we can use it in conjunction with the pathspec since we know the
gnulib was just copied in from the sysroot, and does not need
to try and pull any further updates.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index f67f4ec6082e..8d6d32a60895 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -28,18 +28,17 @@ do_configure_prepend() {
     cd ${S}
 
     # avoid bootstrap cloning gnulib on every configure
-    cat >.gitmodules <<EOF
-[submodule "gnulib"]
-       path = gnulib
-       url = git://git.sv.gnu.org/gnulib
-EOF
-    cp -rf ${STAGING_DATADIR}/gnulib ${S}
+    # the rmdir acts as a sentinel to let us know if the pkg ever changes
+    # the path for GNUlib or populates the dir making it non-empty.
+    rmdir ${S}/.gnulib
+    cp -rf ${STAGING_DATADIR}/gnulib ${S}/.gnulib
 
     # --force to avoid errors on reconfigure e.g if recipes changed we depend on
     # | bootstrap: running: libtoolize --quiet
     # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
     # | ...
-    ./bootstrap --force
+    ./bootstrap --force --no-git --gnulib-srcdir=.gnulib
+
     cd $currdir
 }
 
-- 
2.7.4


