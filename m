Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A45C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 12:33:36 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.47739.1748865109204602493
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 04:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C2aYXWV/;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23526264386so28571645ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748865108; x=1749469908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzmvGsqkZwl6ppGhHixIb8wCg2NMvQdZifQg/qGgt2M=;
        b=C2aYXWV/ptkhpWwA0DRnbkWyrntUAy8r7W0zaAcC2vjD0sCo3wub/qtuG5UMuYDnFv
         q3Ntm4KafWxu4TyAtIGjSdCrh+a/NyiTfuNv5CJCfQE/sInYkIexCHRXiF4GP/j6lSgv
         9psYEvoNjCXM1MwneAI6DDei288pzGkutCRjEN3yM9RNpgRmwJLzvtt/FCt3U38DVOZ1
         xHFyobQvqTHmouUYI+Czt/JsyXcg2PE2fwy1odPIp02CAin2X3IZu0Mt6iOWxLHW9m0t
         DQ15NVzaJjUE0Ebt1Xqal3/l/FfYZ2wT5wGpWBtkxcgQrphloMUGNIBb++fb8rftP6ms
         Iy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748865108; x=1749469908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzmvGsqkZwl6ppGhHixIb8wCg2NMvQdZifQg/qGgt2M=;
        b=HTbCoxln7QtxU50MW498oxg1i6Oo3u/6l7m/C/H59i9H41AUtYde3E9CZmhLzbQ2gk
         dQGfRtbw65Ku99aIR+HcIBnpYRwK9KEhPX9Atqz/HSewecIoeELK62fd5xad8q/tjV9s
         y6S9KRTB/Bg+IWGMi17g7T2MtunjVcNPXT8MAnJ799mtGvDjC9rNyTMi9XBHJMq+SsaH
         5OryKAveJWRIyUJ+K+oPFTPq8XHIF08wFMry/Rvxb2fFeCUpZossAyPMYVKbGQ1Bh4Ht
         Iuj0Eqje/faeFPpj3Ipk7k228a3UDv1cqFbL/s+YNFIHVyNs8YyuhmnSGOeFAGZEvjkx
         XctA==
X-Gm-Message-State: AOJu0YwrUZhrsRdNH6EJSL9GdYR/Rb+7ydmwyoZ9rImfWnyDGsaU+yZ3
	xkHHp8lfkPfWfQ4BG/lgaPH7NRftBeqlwMeSlerqDCETzIZcajUr30mTBrHQ8g==
X-Gm-Gg: ASbGncsStiWUJppqG1RL1dLYarIetxEcjBWzl/Zl6+Yi2ovPf40LyVyb1F9ZEaCUU57
	/5QP10ybo+Gwx+cw+y8T/CA0gPn4tbF8cGxHi24RoSRdBH0UY6gnIcK8mc4vH2lpwKHDzkfXsSW
	tBioUYsR9UyxWLtT7/QZcfNCLJnpQM8P+lcEoujNzkIGWpe547Bq9c3S69Po2FQ8HJ88yX1Zp01
	2CR0M+g8wzvL9BYrymPc4VFf/oQWQ7vTj1Rl0dUBma6jsvH30WP/gGSsVjsJfuyvF32REVMWZzU
	SyoEtGJtyb0mdvfJMv1+jr8pfT28Rmeg4hsTIk3RKWfCUOe61H5tedDmsLkkIapGWDghdfCQU8f
	v+ufA9Q==
X-Google-Smtp-Source: AGHT+IH82cFoF2yn8IrZ17HeNMtXaEaXY/NkPhUTsGlLuXF/NhJcZZMw9PEzrwbKdv/foEx/Jmdg3w==
X-Received: by 2002:a17:903:fa7:b0:234:e655:a632 with SMTP id d9443c01a7336-2355fa00335mr100513385ad.51.1748865108205;
        Mon, 02 Jun 2025 04:51:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:889e:c424:68c3:216f:8607:73ca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d209f5sm68922475ad.252.2025.06.02.04.51.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 04:51:47 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCHv2] imagemagick: guard sed operations in do_install for optional files
Date: Mon,  2 Jun 2025 17:21:23 +0530
Message-Id: <20250602115123.103345-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 12:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117705

When PACKAGECONFIG options like 'cxx' 'webp' and 'xml' are disabled,
certain files such as Magick++-config.im7, configure.xml, or
delegates.xml are not installed. Unconditionally running sed
on these files results in errors during do_install
Error:
sed: can't read .../image/usr/bin/Magick++-config.im7: No such file or directory

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


