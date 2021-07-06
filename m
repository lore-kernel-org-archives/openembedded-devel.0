Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.3731.1625562822898125148
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TbE9hNUX;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id ch27so626221edb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WqQu7/moOQuKx8NwXCj/+YTo6cDFAoFOy5JI03FBi4A=;
        b=TbE9hNUXqsETDRmc8IJ4ckUkLR2uJdoB+SK6HcgfkrgYZx9JH3sC3uVkrC29GaqR8B
         K1s9dJ7AQNL6BewMl/X/uRzs9V1YR5Hxoa5+5hSruLY3/UT9I/Xwkuc232GhjuWGIAa0
         G2Moi9MSDPA9uQwqSJ62lbAsgv9nJ73aMotl7DO8TBPj06Etfjyr/DXE3qNRjqd2tS4A
         zxq8H+ah1OwcN3ZRW364XUeSfWroSdTS+YAf22QuVdDg+cZeFxfxiIoHs9Md605zpl/2
         xdKdHC5nrmMC7dkE4UVlsYMTpoF63RYkmSHB1C6ip900m5KNc343xzoSCiVkr1Q44K9m
         LBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WqQu7/moOQuKx8NwXCj/+YTo6cDFAoFOy5JI03FBi4A=;
        b=M+r4V1uq3r1W+GXOIbnD1b70CIPrntmAAUIL+NLPsNCMF6SofVjoG8jBKGLHSSZ+mm
         0F1C+S7tOjRs4A8j0K1pPWvvns7BASdooUqyQA/ppbx0X8c2akhMmzyM0ueHFAx8YTfv
         DYnbRsvD1PDpkvG/SrntXAnDfHi2A5B4+HpJ0KqN8MXRQjr9iL5BfEhAT8Cgmuo6LheH
         brPfTkHTH/EDsuAAWckBlkGOPn0cRdUSFURQXqDu7WMmQoGguIPhLg7V2wj4j7iPRZhQ
         7emYWSGSofexilUf6VfbX7LxHi+ohfZ51hzJd9ctYVA8d9BQltmhhlEwBcLRCVT7HJBn
         cudg==
X-Gm-Message-State: AOAM532+6FxpM1Px36sbpNLboVc/gAQsRKgzIDoR+hw/xqFFahk6tCI0
	qluaOE1tS78TKlgzRXEtHKqrwypx2rU=
X-Google-Smtp-Source: ABdhPJynEYrRDX6izQ52VIGiSSb3LOhtFFx0mo5gGjxl3aNsjoggMsRG9CBsEsBkemJT3Jq4rARHyw==
X-Received: by 2002:a05:6402:1001:: with SMTP id c1mr21690171edu.26.1625562821518;
        Tue, 06 Jul 2021 02:13:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 9/9] gimp: remove --disable-vector-icons
Date: Tue,  6 Jul 2021 11:13:27 +0200
Message-Id: <20210706091327.1513939-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These were workarounds for broken gegl-native

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
index e729d9deb..be05354da 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
@@ -51,11 +51,6 @@ EXTRA_OECONF = "--disable-python \
                 --disable-check-update \
                 --without-wmf"
 
-EXTRA_OECONF_append_mipsarch = " --disable-vector-icons"
-EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
-EXTRA_OECONF_append_libc-musl_x86 = " --disable-vector-icons"
-EXTRA_OECONF_append_toolchain-clang_arm = " --disable-vector-icons"
-
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
-- 
2.31.1

