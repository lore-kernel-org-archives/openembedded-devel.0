Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.641.1614811872248171833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=unYwjUdY;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id j12so17337669pfj.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 14:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PmAfTN6VvIHiEdRjkTcxxMLnXt1JLfBZqcqOimbdWEo=;
        b=unYwjUdYic11hoHzEi9V8qItcKvlLyMgq//OIFUgVtxjuGCgRdVmCtKmKOF5B0K7Ml
         orzNQSNc5bna/cN53n+fXmZ8zrc0ZuzLMZswkF0YL6fFv7tAI7gOhhuSI9OP0IhGfNDc
         vjS/TmYt1hm0bOQ/ljuRW85jAD43c2GBQAvgjChoyqVT398P9o+gz6zE0iKYA/rXMg2q
         p8xCKyRzHN4z/eUNbCI2DHMfsF6UV4GPnzW7M4hNFDrWTiPbtI0mUMqy/UmaB3SaBfH8
         KT+B03w7Ij4hO4cXp8NCsfGp+AM27Jm54hIge5YCS0UVJdB2F5nk1pLYeAoPw9OEwjzk
         7nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PmAfTN6VvIHiEdRjkTcxxMLnXt1JLfBZqcqOimbdWEo=;
        b=BCkx5VCTBOHbuils+a4Kyk+hC06gkczpViMc/AZtQCqAmOzlA8qnC9I+c0yKXaAFaE
         66NWVH0U9X55lRXgqMzTP9oaBYoogLIWuvfMkDjKINmoGDx40hRobhcdJ25nEJJJDLgE
         Wo7HvbjhKT9wyjnEfgimvOxd48/bH/CNwyfSOyJK1x2qQNSjw3H7QG+lFHKZgeZzT+Ar
         LpqwyeAfyDE7WAzuiJQISFupwr5ku70HnQ3T/JDVVzRMm2ukgPGbcek3AWuwp5lEvIKF
         +fFFNCyNIUV+z//2G9yk2aCctVtA+fEXqX1KJ8WPh2JartzwLRDivEiMAhMDuLG/F0jF
         jHQA==
X-Gm-Message-State: AOAM533a9tenZmgjWhK9lJxeRFjG213F7CyC46DuWUcGQVxUuteN9G6H
	YE4aVKxzpnBTgsf/u8aoeGwgjqh4fl/YvQ==
X-Google-Smtp-Source: ABdhPJxxxZrfAI2MeFylc1+Wcexb64NA2SoBrVeCVulRF52EtQ0hIK2Jdot/O7EkmuWsACgNtT2OKA==
X-Received: by 2002:a63:5a50:: with SMTP id k16mr1025660pgm.155.1614811871483;
        Wed, 03 Mar 2021 14:51:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id b6sm23370466pgt.69.2021.03.03.14.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:51:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH 2/2] gimp: Disable svg icons on arm
Date: Wed,  3 Mar 2021 14:51:01 -0800
Message-Id: <20210303225101.3347910-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303225101.3347910-1-raj.khem@gmail.com>
References: <20210303225101.3347910-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

latest gcc11 causes segmentation faults during build

| make[3]: *** [Makefile:2395: 24/gimp-color-space-perceptual.svg] Segmentation fault
| make[3]: *** [Makefile:2395: 24/gimp-char-picker.svg] Segmentation fault

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index b6135eef57..2d75d6011e 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -54,7 +54,7 @@ EXTRA_OECONF = "--disable-python \
                 --without-wmf"
 
 EXTRA_OECONF_append_libc-musl_mipsarch = " --disable-vector-icons"
-EXTRA_OECONF_append_toolchain-clang_arm = " --disable-vector-icons"
+EXTRA_OECONF_append_arm = " --disable-vector-icons"
 
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.30.1

