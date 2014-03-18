Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 05CFD6F8D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:21:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2I8LB1M007792
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Mar 2014 01:21:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 18 Mar 2014 01:21:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Mar 2014 16:21:06 +0800
Message-ID: <316bd69dad824f3241ca471b85a35acab15149a2.1395130693.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395130693.git.hongxu.jia@windriver.com>
References: <cover.1395130693.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] netcf: fix gnulib not found in sysroots while using a shared sstate cache
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Mar 2014 08:21:14 -0000
Content-Type: text/plain

...
./bootstrap: Bootstrapping from checked-out netcf sources...
./bootstrap: consider installing git-merge-changelog from gnulib
./bootstrap: line 641:
tmp/sysroots/qemux86/usr/share/gnulib/gnulib-tool: No such file or
directory
...

The gnulib source was incorrectly populated to ${STAGING_DATADIR}.
While the build shared an existed sstate cache, the gnulib's
${SYSROOT_DESTDIR} was empty, the gnulib source code was not
found in sysroots.

We should use do_install task to install them to ${D}, and the
default do_populate_sysroot task will populate them to
${STAGING_DATADIR}.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/netcf/gnulib_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-networking/recipes-support/netcf/gnulib_git.bb
index 730f5cd..1da6c83 100644
--- a/meta-networking/recipes-support/netcf/gnulib_git.bb
+++ b/meta-networking/recipes-support/netcf/gnulib_git.bb
@@ -16,18 +16,15 @@ SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
 "
 S = "${WORKDIR}/git"
 
-# Git clone a copy of gnulib source to the staging data dir
-sysroot_stage_all () {
-    [ -d ${STAGING_DATADIR}/gnulib/ ] && rm -rf ${STAGING_DATADIR}/gnulib/
+do_install () {
     cd ${S}
     git checkout master
-    git clone ${S} ${STAGING_DATADIR}/gnulib
+    git clone ${S} ${D}/${datadir}/gnulib
 }
 
 do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-do_install[noexec] = "1"
 do_package[noexec] = "1"
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
-- 
1.8.1.2


