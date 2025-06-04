Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6825CC5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 10:28:11 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.8882.1749012707238311629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 21:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIAHZk4I;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: sanakazi720@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so4700077a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 21:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749012706; x=1749617506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClM17WSFXZMUwfVLxcMeXZ9Y5AxWxQznTOyLb78+ct4=;
        b=KIAHZk4IdUOaYem83ZQ9E0J4MU7S/F1T84AyehOS55+6wh35ojk3k+SRXYHgyUyggV
         zVtQs2YzbEu2dDDH1kdzyftR+/qjpYKdfZHS9eu1JXWUNvw2Wa3EPenU4SDTN7pGu286
         Qzoa5Vc2OjTg9RkJrJ80m4oLLImFUg+bbjkdg6w6F5oknjDqJBxpHDS5CWdTDqG7szN9
         uTmGbSOiRc2Vj6WaIuA4fajBur1sdQg31v4vZSo6Wm7f52baTVvAOB3nCH+8Vz71m4/O
         7AeDcxfHRXusHsCcIZ0AR7w50g0X7fcpQZN+fOvmF0TzGxnNtQ+Jfv2Vwk4hAxjCKNGF
         gPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749012706; x=1749617506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClM17WSFXZMUwfVLxcMeXZ9Y5AxWxQznTOyLb78+ct4=;
        b=XRUJ7YHmwLclZZnfR1iacH9iR1MLq5rvWxNv9/+UVYLsvQehu7cCJeh9sM4IA6RQvP
         SKaBYgpQR5jMGR8IMfZJ3NYCK/sJ4fe6Wh9L0aeMyyaOFTx162md5RoeQ1pCfOefB5mi
         DDOb+XhO6LNB+PH559IiLGrPos3CiXM/9Bk2CvLx+bw24wCnDbcQxLQlOZKJbmorEXy8
         8bAQZEc3KWHVoX2gE58UPmDCz0Ds49/qRwLZv0FneJ8vZJBgRewqxmkdyuy4S6ndkVlo
         qCZZsE1ziF77/o/QY3MtTTcz7e/wDcNeYcdMHUjt4nFVtMhIS5i5wbHa1q53baj5eztk
         /1kQ==
X-Gm-Message-State: AOJu0Yx6Zpr8B8FSsFa1MW6X/BzdZ8XLFvVOxj6iOWy5BOSQprAQWUVl
	YQlnSgS9uUQtUPJ66cmDwLwDzuLXoJ67kvQ57dgNlU2JYpKnG7itWgaEqytA4w==
X-Gm-Gg: ASbGncsu3ueu8t1r14V/ai9VQZWThuo/oCA2G4catfm0OZHU5d6agtBka6NeI8jxo9T
	TcKhIxW12Dvk67jEo6ydHLPYW/4YFB6/Mra76IvQJfiZ13FZzkSiL1+6EPCeblFSsAjSa2J3Xkx
	QltbZzPwsNi4ca5n0iQZ1UEBK73jTYpCAH44BPeLwwu/+527Os2WNM8nIM4r9PUMXnxtLdy69ac
	FIG6PO1R9JLQ/6XDmHkrhsVO8anvTOCayYrxHrW/8VQvpew6yPZfP9D2A25D+lQhtc1xSAoZpE/
	fUihx8hB31Q5QdnsDPe8pu9haVuzaESUQ0Bn3UvK5l81NoDQq0vNhJIr6z1y6vXNC1cEDiq3QYW
	3YAuTWsknhagL6+nV
X-Google-Smtp-Source: AGHT+IHCIF12u8/3VZVAVaMLiODeF8aHPs3VJTq7GyejnzC3yQBtBIhTf0/Z02pIvJ4G7Mfvx64XTw==
X-Received: by 2002:a05:6a20:6a1a:b0:206:a9bd:ad7b with SMTP id adf61e73a8af0-21d22be37femr2359107637.7.1749012706254;
        Tue, 03 Jun 2025 21:51:46 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:889e:c6ca:a9af:35ed:ceb4:bd3a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeade44sm10206195b3a.70.2025.06.03.21.51.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:51:45 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [master][PATCH] imagemagick: guard sed operations in do_install for optional files
Date: Wed,  4 Jun 2025 10:21:31 +0530
Message-Id: <20250604045131.312760-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 10:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117735

When PACKAGECONFIG options like 'cxx' 'webp' and 'xml' are disabled,
certain files such as Magick++-config.im7, configure.xml, or
delegates.xml are not installed. Unconditionally running sed
on these files results in errors during do_install
Error:
sed: can't read .../image/usr/bin/Magick++-config.im7: No such file or directory

Signed-off-by: Nikhil R <nikhilr5@kpit.com
Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../imagemagick/imagemagick_7.1.1-43.bb       | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 9932cf01db..a892a55844 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -37,13 +37,24 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
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


