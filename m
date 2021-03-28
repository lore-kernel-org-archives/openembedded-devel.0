Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.11400.1616958817177780614
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 12:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xn9pUucx;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id c204so8474110pfc.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D1hHNSRdklVpqmp6Pv+97O/uxivm5rkNwEWHsQthZXg=;
        b=Xn9pUucx44ZbCvpR4SPeONvCazgZSDBe/eZBJcO/weQ1q277jaGWbhxlWRTnbOPlRB
         FGsX2JOM9ebOLBx6txvGVTHyqszo3oecghjvOtbFVZiJowADt8DvNcY1/RgjBnssXQ7W
         /ptTV1Sm/K0/aSqE9rJ3QlOeWyveeNmrSXMByubtt/oUVzRkZv9O+DaGZ6mDXPLKTH+k
         btEh8OqgZacudzLMI5L2v+iaFQMP/Vik4x8bSZbpfecw8/xDnDxD3VSxkHzCGsdq7DDg
         H5VGcq34s3sEyGU6XdaTOtx3Nr32TlQQtCqKImmCwjAFtBLXrm/OXrHr5SM3Se98uMWy
         e1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D1hHNSRdklVpqmp6Pv+97O/uxivm5rkNwEWHsQthZXg=;
        b=LR1+dP/KJGKaCXkAt4Wdd/p+rNAtTtD7KH0D8tOL6BWuPHizhWCryy9hCM7944CfoC
         JtCfUzXq7O+FZYyXhzjUKjfLmAv4EgDTZ8IcVcC1x/ZjKJ2L7GwOyALixCmYicTK3RAw
         ab4RrsQu+c0ympLhn4Nyb80k7IqhJ2fcq+xcnoYeKntXvddsqAHENq89+dsa44Qv89C0
         Q0IsguCMegG1pIf9+CnqbnzSeiveiGUy4auXoDZvEEOaz9B5MWgUONUn/wwlnm0zlUys
         VfoejEwJyExTkD72gBT8WztJtaw92XXtLtRhBErGUlJ9WuaA3wU5CMiEs5RbLYHxHymi
         +aAw==
X-Gm-Message-State: AOAM533KH/Z28tiBulHo+hDtfKsiTl7/97zo9KXzhBliNDNz8uH7237S
	rDtGUWUVovja6jjZxa/ocxhFuKNTeuaJwQ==
X-Google-Smtp-Source: ABdhPJyBOF4rrWT085BVXp5pYpo1sRFaMAouWphGdCLb/N3fhYWDNp32jnkmvS8tA1lpBqtH0qMikQ==
X-Received: by 2002:a62:b403:0:b029:20c:cbd5:5be1 with SMTP id h3-20020a62b4030000b029020ccbd55be1mr22498525pfn.53.1616958816407;
        Sun, 28 Mar 2021 12:13:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id k22sm4625765pfa.93.2021.03.28.12.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 12:13:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector iconn on rv32/musl
Date: Sun, 28 Mar 2021 12:13:33 -0700
Message-Id: <20210328191333.30723-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu crashes during build
| make[3]: *** [Makefile:2395: 24/gimp-channel-alpha.svg] Segmentation fault (core dumped)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index 2d75d6011e..aa5112add6 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -54,6 +54,7 @@ EXTRA_OECONF = "--disable-python \
                 --without-wmf"
 
 EXTRA_OECONF_append_libc-musl_mipsarch = " --disable-vector-icons"
+EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
 EXTRA_OECONF_append_arm = " --disable-vector-icons"
 
 do_configure_append() {
-- 
2.31.1

