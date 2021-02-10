Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.12179.1612990555851229846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DcoosoU6;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id j11so3031944wmi.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gmsbDQa72TQBEwO5aDZ5Gm8xAghDEYl/NTd+QgbEOUg=;
        b=DcoosoU6YqU7/82e8CubyXTUtMHIsQF+XX4Ism0pCvE1CyXHDL+jWbn64s7nI3x05I
         JVOXpHL5zEeTyNifsVWaTSnUzblEYE2cWeTO0nzF0nhtMIXiQ00WAgmHeoUA6sdYN2rM
         vgu0rmCdYFqMZW4HYra9j0ea351omkA7deYUuFIVb8yxc7iZPUBvm4qrWu/QYzXPwhhg
         aFTgVb4qEMBrzn3uHLc4JxKD7Uc/91/POQkREy7N1rRGPQzYkfyUi8DbUkA76UNY81af
         SwZDQm5Or2gZmm5S0o4DO2LWU3KwCsMWlNitONhHHI2m53oOxOxEfH9B9oiCYiAPHJ5k
         /Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmsbDQa72TQBEwO5aDZ5Gm8xAghDEYl/NTd+QgbEOUg=;
        b=LXXfMVIk0wzPSfpSutGubuRq3GZ9jtDCeK4OiMuODSP2/h4g7O/HCXDuDnOXSbzG3Q
         eKpqV4fYWBYcE/52byCIOO6pafASSULLctj0rwHpGeU0MyhSV8h1EFGBpdEnLLUuhZf0
         Z0IRVnnvmywojqg+J/tKl//VzGO/W6bF8Y+P1s/aEJy6TzGwMyh1nekc/TXYeBJxjmBJ
         cLN9BwycxxnG0zKWxswWeGPLc4oaKWqbdU36B3yA3U6U4o/o8G65eOzqy0AWQs86sOUt
         l6WN+aq961Wzefvc0DRblJ4xcbBmdmjInN60JZCWSGcXSSWjlo2SmezsBI68GfnzUoXL
         0TNA==
X-Gm-Message-State: AOAM5305Jj3tZFs4F7EF2JNydDv2BLZsXaVBrghS6+twdAD1zPP4HVLK
	vf9eq2zUy8WHJkmtpgE14rd1sNTi+Ps=
X-Google-Smtp-Source: ABdhPJwNS9ElP3gzVbrE/ccb3YxWFlrsGwu/cyw/j2e1AwN/QEPovq8NMwNfreTHQH3X/egZ4c9sWQ==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr918591wma.26.1612990554479;
        Wed, 10 Feb 2021 12:55:54 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:54 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/13] babl: upgrade 0.1.82 -> 0.1.84
Date: Wed, 10 Feb 2021 21:55:30 +0100
Message-Id: <20210210205538.690009-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/babl/{babl_0.1.82.bb => babl_0.1.84.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.82.bb => babl_0.1.84.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.82.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.84.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.82.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.84.bb
index 244b867fa..b49d9d7e8 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.82.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.84.bb
@@ -15,6 +15,6 @@ CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c62d93d4ad6774cb8e3231bbbc7f2e61e551e7242d78640d757505ee1a9fadc5"
+SRC_URI[sha256sum] = "e7e38b8441f77feb9dc8231cb434a86190a21f2f3692c281457e99d35e9c34ea"
 
 BBCLASSEXTEND = "native"
-- 
2.26.2

