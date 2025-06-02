Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1F9C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:36:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.45090.1748854929196346591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxhHVBUi;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23539a1a421so17407985ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748854928; x=1749459728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKKUQXVCN8zdVqKLfXUdsIm56qOBqA+HfCXgtuK1eJk=;
        b=CxhHVBUiSGBEOsd0xVpQJWvwSk+QEleQQXg+I5b10UUIeq6xw8NkhlbEr6kigIyQfD
         +R+oalVogPgQ3QeAGxYrf8soK6KAZ4T5p1jaKjJ09VtkoOGPIwCMhYlOO0x+cGbcoE+t
         akw0OaPmA9Q1veL3KTGZ7lKIUOG9nJvq8oBZ2ayEgTBhAAYYKIbgPwBxcYvzOjhW0NTX
         mBPRneTWclkDi3mBH0ZFn7FrOMk86KDea9bzBKi1YcsArj0ioVqE4JRNeQGHVh6wrP9N
         Peg7T77uvuyzIov233MOc2ZhHs5vmkJ1qjzFXYJbEzKOVVoQtpwcjSysu/M27ZbQWfEP
         cWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854928; x=1749459728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKKUQXVCN8zdVqKLfXUdsIm56qOBqA+HfCXgtuK1eJk=;
        b=O2t9IArJkwRr5xOUW07UhGkNRsPVPPmXIuFfE1YH/kINcdD+wXRy4zUFuMmtZHyKVj
         3NC3IY1jKr5EdgxekjQpismx8RgIu5bIff1n09vNobGWyUMuqWlBw5j/VIzERieKJPjK
         lpnl2wsZjN3XbDCDuFX6CnOkgpj3cEn15WBNSu6Pynjz5iVLG1VDmTvEqlm9MI0LwtGl
         G/yPs4eOW485YOxpaysClA29dfisF5N0nOhl5TptUFssS51wvr64oArdTl0cSkUOJN9j
         1t82VmYTCDpTSyfEVOIu0syfNGOnLfskCki9gB93IlQAbGTD8KUjQPdmHikkiyneauGh
         Z65Q==
X-Gm-Message-State: AOJu0YzQpUhFhlBYuTRoS21bVjpIc+00kHBtElBh4Hfm/33RjGOy0eqN
	wK0s8cqV1IshTIh/ujUBlkgMgegQQuWGzk3Bre7n6WEs7guG5wWQlv3U2ozTdA==
X-Gm-Gg: ASbGncuLgD65iZCyX8kCNHa/tLb+L8vgfLHm8PN/khAvrSFTrEMIqE2xNYZ5yzH+i9j
	k9o5M0YAl0sxEBlJtty+/Ka5t/Dt8AlMY8nnfK9jXUIPTgukqPr80seDCk8CXUgNXs/tAZ8EulZ
	wNOhafdSHgmYySw8/zBrnujcXxj8H8dpV/CwbqjUkDWH+xlOtuWvee8rP6hfX825Y+N1Q4wU0C3
	AigqrJlsJw5K7wp+3JWSJsw1NCrAR+uuZcLhHvIqpkYxc1gwGiUyIvq6WW5GSWgYDZo8V/eZJwi
	BRdLXjWz/qBCua/2kFrjv1S3LGBJWhM66mjpQzu+QAVfDwV7VX2o2heeLeIxXK4aZ/ZkMIPmdAY
	XY2xSqA==
X-Google-Smtp-Source: AGHT+IFD0Nk1RtbEwUMlhaAtYeJyjgQCY15eXnMhLsNx+BEdQrTcX9Nm/5jim6wlOzUmfMIrPir+cQ==
X-Received: by 2002:a17:903:2f92:b0:234:a139:1215 with SMTP id d9443c01a7336-2355f77ea51mr118202755ad.35.1748854927919;
        Mon, 02 Jun 2025 02:02:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:889e:c424:68c3:216f:8607:73ca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d2323csm66165895ad.259.2025.06.02.02.02.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 02:02:07 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH] imagemagick: guard sed operations in do_install for optional files
Date: Mon,  2 Jun 2025 14:31:58 +0530
Message-Id: <20250602090158.93392-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 10:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117704

When PACKAGECONFIG options like 'cxx' 'webp' and 'xml' are disabled,
certain files such as Magick++-config.im7, configure.xml, or
delegates.xml are not installed. Unconditionally running sed
on these files results in errors during do_install
Error:
sed: can't read .../image/usr/bin/Magick++-config.im7: No such file or directory

Update do_install to check file existence before running sed

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 5407c4e400..752fef303b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -36,13 +36,24 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
 PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxml2"
 
 do_install:append:class-target() {
-    for file in MagickCore-config.im7 MagickWand-config.im7 Magick++-config.im7; do
-        sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${bindir}/"$file"
+    for file in MagickCore-config.im7 MagickWand-config.im7; do
+        sed -i 's,${STAGING_DIR_TARGET},,g' "${D}${bindir}/$file"
     done
-    sed -i 's,${S},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
-    sed -i 's,${B},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
-    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
-    sed -i 's,${HOSTTOOLS_DIR},${bindir},g' ${D}${sysconfdir}/ImageMagick-7/delegates.xml
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
+        sed -i 's,${STAGING_DIR_TARGET},,g' "${D}${bindir}/Magick++-config.im7"
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'xml', 'true', 'false', d)}; then
+        xml_config="${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml"
+        sed -i 's,${S},,g' "$xml_config"
+        sed -i 's,${B},,g' "$xml_config"
+        sed -i 's,${RECIPE_SYSROOT},,g' "$xml_config"
+    fi
+
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'webp openjpeg', 'true', 'false', d)}; then
+        sed -i 's,${HOSTTOOLS_DIR},${bindir},g' "${D}${sysconfdir}/ImageMagick-7/delegates.xml"
+    fi
 }
 
 FILES:${PN} += "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
-- 
2.25.1


