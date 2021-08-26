Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.29634.1629979607106904884
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=m1OaB2Y0;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629979607;
  x=1661515607;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RKjaUMw3toSB9kuUesnB3kjGCUdWNrjO5oKpd+jFBVo=;
  b=m1OaB2Y0oE/odTjL1aCgJEWCBymhhAHPZTL/YoC+4c5/n/uv/AIZpoa+
   /doDK6QZ/AS0jE/V3SfuQTKjQPhr0EG4QweCf7A+6kahG2zAwUwm3Teeo
   sxVyPoNKcQklChAo+xR2UWt5//K3aKtOxSWq4X9pWf+fTiAuon1WlAh7U
   Q4/n5KfDcqDB1HUulm5jGikPOLcAlseeFy29xMLX+ByLodZUa91UStc5V
   BNB2LVRnRNrRKB1kip+dn7NmEnQUpfELNFWWje1ftAs8DSeoY+v/8L/ev
   X7EY95/9I8lf0OU6nWLrc5bMa9OCHn6DqOSFxETZYz40OYl2nkToCUyDl
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] poppler: Explicitly enable/disable boost together with splash
Date: Thu, 26 Aug 2021 14:06:41 +0200
Message-ID: <20210826120641.28049-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This avoids the following error when splash is not enabled in
PACKAGECONFIG:

  -- Could NOT find Boost (missing: Boost_INCLUDE_DIR) (Required is at
     least version "1.58.0")
  CMake Error at CMakeLists.txt:196 (message):
    -- Boost recommended for Splash.  Use ENABLE_BOOST=OFF to skip.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/poppler/poppler_21.08.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.08.0.bb b/meta-oe/recipes-support/poppler/poppler_21.08.0.bb
index d3135a44c..1fc3bf3f4 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.08.0.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[curl] = "-DENABLE_LIBCURL=ON,-DENABLE_LIBCURL=OFF,curl"
 PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=none,openjpeg"
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
 PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
-PACKAGECONFIG[splash] = "-DENABLE_SPLASH=ON,-DENABLE_SPLASH=OFF,boost"
+PACKAGECONFIG[splash] = "-DENABLE_SPLASH=ON -DENABLE_BOOST=ON,-DENABLE_SPLASH=OFF -DENABLE_BOOST=OFF,boost"
 
 # surprise - did not expect this to work :)
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
