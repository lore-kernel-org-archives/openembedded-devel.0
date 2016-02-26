Return-Path: <net147@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id E16B9770A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:19:35 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q63so48304101pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=emFhtCA1D+I03azO7i0kdx4QyltA5ZoKGVc09Molxpc=;
	b=bsv44Mc01lTlALNNVfeousy+WflJ8yVCjQNWYgd07hlrS8/Ud2btZTOs8Js8xPpavU
	0UAuZCtfO3BM7PFnMe48f0rZZ/z9xs9uli2l6UAc2CD1Si1wlhdEq96ZaerQH0psQMBW
	oRmq5QUQfTrOkMJA/Idq/Sk+G8Nyv9z9I17A0u7dLuYOLaRNokhrBaG+8bT/CRATYhrd
	qUzNd5lazQowfDf6WSrhu7VlCuAZUm1+IzcgF9tyWBnds4/hWUvVBQICgoDsAEAOMNcw
	97eGQT23TqBEPTkKbaOKYc02dfCVPUeG/HrmSeS/zlW2eTXRQxlE7+sd5ZxZTXi3WhUD
	vahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=emFhtCA1D+I03azO7i0kdx4QyltA5ZoKGVc09Molxpc=;
	b=JZYx3VKBIydq+KYNUK9zDUP1jXeR4otYKzuGN5Tsa0LHGJf//TH7RCP0tfeblCDYgm
	3etTP8SesOkiH/qlJ68nO92AKne9lSsZyS26xTcp9uzCwoSSBCAs94csI5VewLdZncHh
	fEJ9/XXNdisZPo+mTVAPJGiJJDGqFHRv1E6g0En1uW2Y8Z/kUomCxCW+V7u4erKQtTHo
	rM3ik4vHD9Xofj5gpq62ccdzm+MhNuDG8YZf9tBH6mlKrc+WU6Nhknrge4ym/4E3mAaB
	2DhSxu6LgHmFSZq40NxYVZLWgi2eG/TktV/+tb+MbDv5Uv6rKVK4/Q7llBFGN1eGGRK2
	sK4A==
X-Gm-Message-State: AD7BkJKDttROOKYGP7SCZJ07Hd37cLKSph5dn3cd9CIH5ikIMIy/HOiNT3w3b9zpn9Re8A==
X-Received: by 10.98.67.153 with SMTP id l25mr289366pfi.111.1456474776064;
	Fri, 26 Feb 2016 00:19:36 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	q8sm17268879pfa.70.2016.02.26.00.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 00:19:35 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2016 19:19:28 +1100
Message-Id: <1456474768-24329-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase: fix up pkgconfig replacements
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
X-List-Received-Date: Fri, 26 Feb 2016 08:19:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The replacements were being done in qt_module.prf which is not included
when building 3rd party libraries. To resolve this, move the
replacements from qt_module.prf to qt.prf which is included when
building any qmake project. The pkgconfig include replacement is removed
as it doesn't seem to be needed anymore and causes issues when the
includedir path in pkgconfig has part of its path replaced with
${includedir} resulting in a circular reference that causes the OE
package_do_pkgconfig task to fail.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 56 +++++++++++-----------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 7520107..4807df0 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -61,11 +61,36 @@ Content-Transfer-Encoding: 8bit
 Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 ---
+ mkspecs/features/qt.prf        | 13 +++++++++++++
  mkspecs/features/qt_common.prf |  2 +-
- mkspecs/features/qt_module.prf | 16 ++++++++++++++++
- 2 files changed, 17 insertions(+), 1 deletion(-)
+ 2 files changed, 14 insertions(+), 1 deletion(-)
 
+diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
+index f62b6bb..91be8b3 100644
+--- a/mkspecs/features/qt.prf
++++ b/mkspecs/features/qt.prf
+@@ -321,6 +321,19 @@ contains(TEMPLATE, .*app) {
+     QTPLUGIN = $$manualplugs $$autoplugs
+ }
+ 
++contains(TEMPLATE, .*lib) {
++    pkgconfig_prefix_replace.match = "prefix=$$[QT_SYSROOT]"
++    pkgconfig_prefix_replace.replace = "prefix="
++    pkgconfig_prefix_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_prefix_replace
++
++    # drop -L/usr/lib in .prl files
++    prl_replace.match = "-L\$${libdir}"
++    prl_replace.replace = ""
++    prl_replace.CONFIG = path
++    QMAKE_PRL_INSTALL_REPLACE += prl_replace
++}
++
+ QT_PLUGIN_VERIFY = DEPLOYMENT_PLUGIN
+ contains(QT_CONFIG, static) {
+     QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
 index 38602f6..f9c401f 100644
 --- a/mkspecs/features/qt_common.prf
@@ -79,33 +104,6 @@ index 38602f6..f9c401f 100644
      }
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
-diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index aefd3ae..775cda2 100644
---- a/mkspecs/features/qt_module.prf
-+++ b/mkspecs/features/qt_module.prf
-@@ -276,6 +276,22 @@ load(qt_targets)
-         ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
-     ltlib_replace.CONFIG = path
-     QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
-+
-+    pkgconfig_include_replace.match = $$rplbase/include
-+    pkgconfig_include_replace.replace = "\$$\\{includedir}"
-+    pkgconfig_include_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
-+
-+    pkgconfig_prefix_replace.match = "prefix=$$[QT_SYSROOT]"
-+    pkgconfig_prefix_replace.replace = "prefix="
-+    pkgconfig_prefix_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_prefix_replace
-+
-+    # drop -L/usr/lib in .prl files
-+    prl_replace.match = "-L\$${libdir}"
-+    prl_replace.replace = ""
-+    prl_replace.CONFIG = path
-+    QMAKE_PRL_INSTALL_REPLACE += prl_replace
- }
- 
- contains(QT_PRODUCT, OpenSource.*):DEFINES *= QT_OPENSOURCE
 -- 
 2.7.1
 
-- 
2.7.1


