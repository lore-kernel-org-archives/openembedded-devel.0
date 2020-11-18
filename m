Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.25418.1605712088758922831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i9hwM21D;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id fw15so371639pjb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LvAb39rIPfF7zF1V/kDEed99rPQs7av/mZVMoObrONk=;
        b=i9hwM21DvW+koVTyTETb4B0QksaNkBk/62YeVMu+fe0T+/H1LVL8ojycB7jF6tln7O
         I+amb9Qd+tGJM47caT4BKquGwp6DYCQW7HfPzqYuCS4tVJt/EOsWMzBiinvd613XM4w5
         +7YamPBaDz1aSz3rIFM2TxqYH/igUHkQJg2b3TS12nalDW/B0Hg3gpUmzch1OrQipNeX
         bGBmz6gnmg9kw/s8NMvsfa3aOJ67y+4kAsfP5S4ZHNcdzbFIYqZaFG11XwJLLT1ou9gp
         2R52qECTsShVp/I+poXLeYOiQl5PtRkAKkb5ggotOy/7EOjDxpV+za5hylVA2+SrwzaN
         m8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LvAb39rIPfF7zF1V/kDEed99rPQs7av/mZVMoObrONk=;
        b=Pu1n6zToTDlpD0yZYNSzh2sylp5TnsF1QDtL9GIWCEl8JXPRWrD5gIaEekZJbze59l
         pdq1/baN8RquLHcJUFQ3Id2C59EDiMvGE65/Qh75Xc1ZGWK41I+vwSLi96tq3XM+6euy
         Q/PrSzqMaWlWqhhuW0+laLy+EWbTiw/d8farA0ql0bsIEibl+DWSsf5ZFZ3pf0FriI1h
         W67Vctn/BUq0uuL0JIFlggvWwmY4QuZA/JY0EcIDGUbVmmVBtBPbWQILNvPcxrAe7EiU
         UlCl70aWK+pJbis/03UyQ2zGYpgxI+jdg5UdvOyoRmoIlO+0nUQiuaDW//alylMIBp5e
         Empg==
X-Gm-Message-State: AOAM532oP66UvBOyRVR2kPGXLVlQquS0hXeYDQrP8BoYn9KZjJTOMqiv
	Q5vjI9pbTqmfJZav6JJwUwNKVswFr9s=
X-Google-Smtp-Source: ABdhPJxlegibPWMaKElf5uBCDwTaw4cwiGwzjfBEIBeKCEucIjbohDtKJZeW5w+jNOGyHzZUcrcUug==
X-Received: by 2002:a17:902:d906:b029:d9:7dcf:735e with SMTP id c6-20020a170902d906b02900d97dcf735emr1770627plz.80.1605712088188;
        Wed, 18 Nov 2020 07:08:08 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:07 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/17] ubi-utils-klibc: Remove trailing slash from S
Date: Wed, 18 Nov 2020 07:07:45 -0800
Message-Id: <d77472853730b0d1197f7a874118e9e74b2fdc10.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This slash is redundant and removing it could help pseudo maintain its database

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fdf7bd0de289927efe5045966608494c4975a2e5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index 0475cbeaeef..d3223816210 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
              file://0005-common.h-replace-getline-with-fgets.patch \
              "
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--disable-tests --without-jffs --without-ubifs"
 
-- 
2.17.1

