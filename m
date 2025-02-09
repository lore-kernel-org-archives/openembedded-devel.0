Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE980C02199
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 15:35:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.30638.1739115341450660406
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 07:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YrkyY9k2;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso10684055e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739115340; x=1739720140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlL/D7P6aOsdKhSsgcphwsXuIR2sJnFH6iGi0o4HI+o=;
        b=YrkyY9k24aZypRDodChWBOsMYwR3lBEPWzu4ta0kqTYdOoS5YStucm0xcwVdS3wrGp
         NI+j6LhNvon4m/wztv0vfm2xghubrY4eGCyfBHaf2Y4idPh1XVPi9DirypIN5/vYv37N
         u/RaRTAn4Zjh9S+GtaHJ8tH+faw8iBMu4m1FZPbi90beZi1ra8r21m2O1RlgnndyRhm5
         8CV/ptC/PfgXgbppdedTqbhyFoaQUEwL3KlEajjPXlI2BkVjZxZ3zq7CrhOjdQxpZIef
         4jiGifvL1C6irFbi5t0OYfRDs7QhFlFLWgdxxKR1Y3iK5wMcBC/WWfyFM5GR+RLx9uls
         68BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739115340; x=1739720140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlL/D7P6aOsdKhSsgcphwsXuIR2sJnFH6iGi0o4HI+o=;
        b=ossKoAZ+9ZWeG9oqZxr2rVJHbdXR/6KyeoupvR68K+Tu9Ewk8b7VAzX2Q8tf9TuKxW
         sgj9lVeG9adXczjsKeWTgA7nrDEaE97iV6ThjfyoBCtbg8CKzRo2PgCjF8q2vTOu0YGe
         SJuS8xIn8MxwIOkUKCbjrddW6Yfy1GqgcaLeRQbkS7wnF9pEHh0uOQ8kNcn9IdGMfa+o
         7fo9Jr+D8wCn+PjFycVRduxugZbYS4bMm5XSbvYvuW06UyvVpjxsAiTtuwElZb6MmMws
         SL1wEPLg/Pty4x8ElW1dWqRfaLm/1D6z5/q5vJUtvuPLUwJ6aiRNVn7twQb/eXlD1exd
         u5TQ==
X-Gm-Message-State: AOJu0YxrFMaHTLas1lbeU8xE9TCLamvA269q0WYDoFDgucIzY4nMx3eQ
	1YvkPHcctBOIE72GTwz7z8+NTeWwXv4gspwSfE6+m5L83g/DA7EU+RgVcg==
X-Gm-Gg: ASbGncv5xB1U89QxIGdee7VZl6acFFqzCQWIfPDTXmensgwP8Bmy0cCZQ5hkVR9fDKw
	J9DzSFuQ49JNgDXSMcS8xeoeYu9P/l/5piVIGFm2wDZd/FphsVXmJiYxSQ/aitxsJlzwLgV10L8
	bnAeeoD0QRZYWtdo45SLD6ENPw16KjEntNef1XbSEGOQ5oxjwkbSkfEtNWkcDNAOshR892B+VZo
	DTrJBp/5pseSsSn0P/NJRBHUbTOyJp7dtHGbyv4DZyKZgzg8LpzBWWBCdejm21+nZfkiSZEY5RP
	k7F7TDFJhqWp2n00H9jVqJnw88QdU+4=
X-Google-Smtp-Source: AGHT+IFdg+Xza9TASLk54wGCfVkTWDnBU8EOr8SerIstTyQOHXMC71V9TgEyC94xD7vuQDv9bTNjow==
X-Received: by 2002:a05:600c:1da8:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-439249a7534mr77383255e9.21.1739115339727;
        Sun, 09 Feb 2025 07:35:39 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm10036738f8f.90.2025.02.09.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 07:35:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-gnome][PATCH] gegl: Clean up PACKAGECONFIG
Date: Sun,  9 Feb 2025 16:35:37 +0100
Message-ID: <20250209153537.3382225-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115317

1. Correct the compile-time dependency name for "webp"
PACKAGECONFIG (webp -> libwebp)

2. Remove jpeg and libpng PACKAGECONFIGS, and add jpeg
and libpng to DEPENDS: both libjpeg and libpng are mandatory
dependencies since 0.4.30, and the corresponding meson
options have no effect.
(This didn't fail the compilation in the past when these
PACKAGECONFIGs were disabled, because these packages are
pulled into the sysroot also by other dependent packages,
which are usually not disabled. E.g. jpeg is pulled in by
babl, libpng is pulled in by cairo)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
index b993386e3..2717b3fa8 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
@@ -11,6 +11,8 @@ DEPENDS = " \
     zlib \
     \
     json-glib \
+    libpng \
+    jpeg \
 "
 
 DEPENDS:append:toolchain-clang  = " openmp"
@@ -28,16 +30,14 @@ SHPV = "${@gnome_verdir("${PV}")}"
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "ca212a0fc3e0448c5058c51ca6a0d30fdfb02971f21f28820da2b4901396000a"
 
-PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
-PACKAGECONFIG:class-native = "libpng librsvg"
+PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
+PACKAGECONFIG:class-native = "librsvg"
 
 PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
 PACKAGECONFIG[gexiv2] = "-Dgexiv2=enabled,-Dgexiv2=disabled,gexiv2"
 PACKAGECONFIG[graphviz] = "-Dgraphviz=enabled,-Dgraphviz=disabled,graphviz"
-PACKAGECONFIG[jpeg] = "-Dlibjpeg=enabled,-Dlibjpeg=disabled,jpeg"
 PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
 PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
-PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
 PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"
 PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
 PACKAGECONFIG[pango] = "-Dpango=enabled -Dpangocairo=enabled,-Dpango=disabled -Dpangocairo=disabled,pango"
@@ -45,7 +45,7 @@ PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
 PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,libsdl"
 PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,libsdl2"
 PACKAGECONFIG[tiff] = "-Dlibtiff=enabled,-Dlibtiff=disabled,tiff"
-PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,webp"
+PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 
 # There are a couple of non-symlink .so files installed into libdir, which need to go into main package
 FILES:${PN} += " \

