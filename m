Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id ED51573D46
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 06:49:49 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so57667896wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 22:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QGsiWqaob11eYs78PkgccQpWUgmfNnGzwm0WA0gunHE=;
	b=GWRFfLZk/Dz0LpJ81e58T566BrgMQZ6+YQFNR+auqoLpYMc1rDjk/l18xsIXJAfa1E
	a379ldenBVwVQcaaEArNQaFO/v1xVpFVs3rJcffwPIwXb5PU1yATt0SwbV5CaHGTa0bL
	fG0fai/HtIC9NTZ4a2xProH/9kCxGsM6MYv7V90TB3aXli2MnYjK+VmmbPgw67F1AJ5F
	qTCTYDxpREK1Ki+VRrfm1ZQDWN/joKyFx6n4nYCIboeiXbZH5vefCKLFGwmrkHXKSURW
	mJPI19dhdW92ZQW1ThS28sUyRibM8U0ESqVUfNWMVf6O+AdU+1TpC3is/OJPE/rLbeHq
	ilIA==
X-Received: by 10.28.23.66 with SMTP id 63mr29404099wmx.4.1447138188907;
	Mon, 09 Nov 2015 22:49:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh5sm1730271wjb.42.2015.11.09.22.49.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 22:49:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 07:49:50 +0100
Message-Id: <1447138190-11249-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-qt5] qtwebengine: disable autodetection from sysroot
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
X-List-Received-Date: Tue, 10 Nov 2015 06:49:51 -0000

* bundled nspr fails to build when system nss is used
  | work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76-r0/git/src/3rdparty/chromium/third_party/nss/nspr/pr/include/md/_unixos.h:596:9: error: unknown type name 'off64_t'
  |  typedef off64_t _MDOff64_t;
  |          ^
* addin qtlocation to resolve:
  WARNING: Failure to find: git/src/core/Release/obj/src/core/QtWebEngineCore.location_provider_qt.o

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index d12e3b9..6e913bc 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -13,6 +13,7 @@ DEPENDS += " \
     ninja-native \
     qtwebchannel \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
+    qtlocation \
     libdrm fontconfig pixman openssl pango cairo icu pciutils \
     libcap \
 "
@@ -28,6 +29,20 @@ DEPENDS += "flac"
 DEPENDS += "yasm-native"
 EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm"
 
+DEPENDS += "libwebp"
+EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_libwebp"
+DEPENDS += "libxslt"
+EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_libxslt"
+DEPENDS += "libevent"
+EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_libevent"
+DEPENDS += "flac"
+EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_flac"
+DEPENDS += "speex"
+EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_speex"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[opus] = "WEBENGINE_CONFIG+=use_system_opus,,libopus"
+
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
@@ -57,6 +72,9 @@ do_configure() {
     export CXX_host="g++"
     export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
 
+    # Disable autodetection from sysroot:
+    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/a; s/^ *packagesExist\($$package\):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
+
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
     ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" \
-- 
2.6.2


