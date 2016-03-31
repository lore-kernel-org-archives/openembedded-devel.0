Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B13E60290
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 19:38:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2VJcCqs024510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:38:12 -0700 (PDT)
Received: from co-op.corp.ad.wrs.com (128.224.56.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 31 Mar 2016 12:38:12 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Mar 2016 15:38:02 -0400
Message-ID: <1459453082-22086-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.2
MIME-Version: 1.0
Subject: [PATCH] autotools-bootstrap: don't fake submodule to avoid gnulib download
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
X-List-Received-Date: Thu, 31 Mar 2016 19:38:14 -0000
Content-Type: text/plain

We were creating a .gitmodules on the fly to avoid downloading the
gnulib via git.  However this is problematic if the pkg had its own
.gitmodules already -- we'd clobber it and this breaks netcf build:

   ./bootstrap: getting gnulib files...
   error: pathspec 'gnulib' did not match any file(s) known to git.

There is a more proper way to do this:  bootstrap supports this:

 --no-git           do not use git to update gnulib.  Requires that
                    --gnulib-srcdir point to a correct gnulib snapshot

and if we use that, we can use our sysroot copy of gnulib without
having to fake a .gitmodules submodule file.  This keeps the build
of netcf happy.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-oe/classes/autotools-bootstrap.bbclass b/meta-oe/classes/autotools-bootstrap.bbclass
index 8d7af1b47222..cae037559aa4 100644
--- a/meta-oe/classes/autotools-bootstrap.bbclass
+++ b/meta-oe/classes/autotools-bootstrap.bbclass
@@ -7,18 +7,13 @@ do_configure_prepend() {
     currdir=`pwd`
     cd ${S}
 
-    # avoid bootstrap cloning gnulib on every configure
-    cat >.gitmodules <<EOF
-[submodule "gnulib"]
-	path = gnulib
-	url = git://git.sv.gnu.org/gnulib
-EOF
+    # avoid bootstrap cloning gnulib on every configure, hence "--no-git".
     cp -rf ${STAGING_DATADIR}/gnulib ${S}
 
     # --force to avoid errors on reconfigure e.g if recipes changed we depend on
     # | bootstrap: running: libtoolize --quiet
     # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
     # | ...
-    ./bootstrap --force
+    ./bootstrap --force --no-git --gnulib-srcdir=gnulib
     cd $currdir
 }
-- 
2.7.2


