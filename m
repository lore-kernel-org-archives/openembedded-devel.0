Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB85677B27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:34:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5Q8Y2Gq015758
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Jun 2017 01:34:02 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 01:34:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jun 2017 04:34:00 -0400
Message-ID: <1498466040-142806-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsprogs: remove redundant install rule in do_install
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
X-List-Received-Date: Mon, 26 Jun 2017 08:34:03 -0000
Content-Type: text/plain

Since the recipe inherits autotools-brokensep, it has
`make install' in do_install by default. The extra one
is not required which may conflict with install-dev.

Occasionally build failure:
...
Installing include-install
Installing libxfs-install-dev
make[1]: *** No rule to make target '../inclu', needed by 'xfs_dir2.lo'.
Stop.
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:132: libxfs-install-dev] Error 2
...

It is hard to reproduce by manual build, so export BUILD_VERBOSE to
gain more debug info duiring the build.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
index 50ab987..b4f2c11 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
@@ -41,6 +41,7 @@ PACKAGECONFIG[readline] = "--enable-readline=yes,--enable-readline=no,readline"
 PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
 
 export DEBUG="-DNDEBUG"
+export BUILD_VERBOSE="1"
 
 EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
@@ -54,7 +55,7 @@ do_configure_prepend () {
 }
 
 do_install_append() {
-        oe_runmake 'DESTDIR=${D}' install install-dev
+        oe_runmake 'DESTDIR=${D}' install-dev
         rm ${D}${libdir}/*.la
         rmdir --ignore-fail-on-non-empty ${D}${libdir}
 }
-- 
2.8.1


