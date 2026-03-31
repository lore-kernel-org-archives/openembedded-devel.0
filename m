Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34486FF60F9
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:27:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16201.1774949255828606007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tBIfXUG1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774949256; x=1806485256;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/o5dBf2SSdPUrAZ1E3ZRIj7WLa+oUwyFcuMLqJMDoSY=;
  b=tBIfXUG1BS9kFaRuIWCQ4zQoZxk3tVVT3E17s5Z0ac/zC1sAj30sQ5Vs
   p84FHvyGIcAH0NxE/0W2G3IVMshkXgAmk0Yr01VVBAjQwiTjv340wtSVZ
   g4c9d06UbdjIDZ4lh5t4ff1TFcoLBsJkky/D7RpZG3MTV5BT2yd6rzw8V
   YJSgyKTL+Y2saXRh89Y8td4q4Ce8+/JVQ8Y4aqiZY70aIF7YKYwpp6zJu
   A1LXOKTjsJOr034o8qLNJRFybda2OhvGV3cjpndRIAo69ncWgDSbU6lp8
   L4ZRpYXXjl5oF+Wv8+KNXN451XZsTq7mgbpke5jtBPXhOSNLK48/2o0Xm
   g==;
X-CSE-ConnectionGUID: LbQBHMPsQvK6mhUnQbULGQ==
X-CSE-MsgGUID: x4L3Xd68Q5yRp8FarOogiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="214275882"
X-IronPort-AV: E=Sophos;i="6.23,151,1770562800"; 
   d="scan'208";a="214275882"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:27:34 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4E67C5C02
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:34 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0FAAC1809AF8
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:34 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CAE5418004F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:31 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libtorrent-rasterbar: upgrade 2.0.11 -> 2.0.12
Date: Tue, 31 Mar 2026 17:27:29 +0800
Message-ID: <20260331092729.12455-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125883

1.Changelog
  https://github.com/arvidn/libtorrent/releases/tag/v2.0.12

2. Add 0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch to fix package QA Issue:
libtorrent-rasterbar-2.0.12-r0 do_package: QA Issue: libtorrent-rasterbar: Files/directories were installed but not shipped in any package:
  /lib/python3.14/site-packages/libtorrent.so

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-packages-path-to-fix-package-QA-Iss.patch | 27 +++++++++++++++++++
 ...0.11.bb => libtorrent-rasterbar_2.0.12.bb} |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch
 rename meta-oe/recipes-connectivity/libtorrent-rasterbar/{libtorrent-rasterbar_2.0.11.bb => libtorrent-rasterbar_2.0.12.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch b/meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch
new file mode 100644
index 0000000000..2ed6ab8500
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch
@@ -0,0 +1,27 @@
+Subject: [PATCH] Fix Python3 site packages path to fix package QA Issue
+
+libtorrent-rasterbar-2.0.12-r0 do_package: QA Issue: libtorrent-rasterbar: Files/directories were installed but not shipped in any package:
+  /lib/python3.14/site-packages/libtorrent.so
+
+Upstream-Status: Inappropriate [ OE specific ]
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ bindings/python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bindings/python/CMakeLists.txt b/bindings/python/CMakeLists.txt
+index 4e8ee816b..ee9566afc 100644
+--- a/bindings/python/CMakeLists.txt
++++ b/bindings/python/CMakeLists.txt
+@@ -96,7 +96,7 @@ else()
+ 	execute_process(
+ 		COMMAND "${Python3_EXECUTABLE}" -c [=[
+ import sysconfig
+-print(sysconfig.get_path('platlib', vars={'platbase': '', 'base': ''}))
++print(sysconfig.get_path('platlib', vars={'platbase': '/usr', 'base': ''}))
+ ]=]
+ 		OUTPUT_VARIABLE _PYTHON3_SITE_ARCH
+ 		OUTPUT_STRIP_TRAILING_WHITESPACE
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.11.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.12.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.11.bb
rename to meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.12.bb
index ca3fe2c8ee..6a61286f7a 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.11.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.12.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8b6cb42d66e6b3c47a909c3ce678a7b"
 DEPENDS = "boost openssl"
 
 SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https;tag=v${PV} \
-	git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/try_signal;name=try_signal"
+	git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/try_signal;name=try_signal \
+           file://0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch"
 
-SRCREV = "9d7443f467147d1784fb7516d2a882db1abb5a8b"
+SRCREV = "740a0b9aeabe00e762cc0efe4a0f27593db2550b"
 SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
 SRCREV_FORMAT .= "_try_signal"
 
-- 
2.43.0


