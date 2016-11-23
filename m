Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2507771AF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 12:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uANCduRj032452; Wed, 23 Nov 2016 12:39:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yfgWGqfP2V7x; Wed, 23 Nov 2016 12:39:56 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uANCdr97032449
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Nov 2016 12:39:54 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1c9Wq9-0000Qh-TH; Wed, 23 Nov 2016 12:39:53 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 12:39:49 +0000
Message-Id: <1479904789-1607-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] nis/opencv: Update getVar/setVar syntax
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
X-List-Received-Date: Wed, 23 Nov 2016 12:39:57 -0000

The deprecated APIs are removed from bitbake, update two old style references
in meta-oe/meta-networking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-networking/recipes-support/nis/nis.inc  | 2 +-
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index c4aa10e..e027a1c 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -25,7 +25,7 @@ do_install() {
 # so force the package to be skipped here (this will cause a
 # 'nothing provides' error)
 python () {
-    os = bb.data.getVar("TARGET_OS", d, 1)
+    os = d.getVar("TARGET_OS", True)
     if os == "linux-uclibc":
         raise bb.parse.SkipPackage("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
 }
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 2136b07..670c94b 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -108,7 +108,7 @@ python populate_packages_prepend () {
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
 }
 
-- 
2.7.4


