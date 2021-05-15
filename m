Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.570.1621121959956810242
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zt11GLBE;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id s22so3564425ejv.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nNivk+FGe2W1rNjzGFw55jURLCUbnd9csbXvkPcjRw0=;
        b=Zt11GLBE31Hazyc2oSdZnbzOPzu60DC2Xi6Ico5yHTV2I0O6tywR0p/4KWbvFyyQ3R
         94j/iPqio20SIniFrdxjni0d0WEobuG8WmW0cfUvZGOnFddv5hYA2VbIJvgGTdPyz5Dw
         zIgJlVXJag05BNcLgwWK6vM0qgogkEtt4jaNJu/izvZhh9sCTq2OSheBFWH/GIlyILFd
         K/IXHhe3pBEIac4a08Xarae+MHQ/sweQLgX9Isb6dOtoJML5L/N3mfiay3hWvtQLAAmw
         tdoJLzhcr0iPVZ/fESJiLpK2t2wIeWVD1yxizD/Et2AWmdRVvb2cEYcDmEoqN6q3boMu
         8aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNivk+FGe2W1rNjzGFw55jURLCUbnd9csbXvkPcjRw0=;
        b=g8EsLGc7P40N5Uqc6Go6xo8Jml53RG+DKLP64JqprVEF8H4jZ+op6iAeP3Osc9PI7n
         dxwn6R41d2k6LVM7Jk5H9hAU8WhoJODv4v/zTzqyivsiB/G2OBXfXj3nX/bLowBd8/Ge
         dmw1U04XeXjrMLPcz0dNJHuVKD3ZPMk3kp1nVGyB9fccU0G+k1o3h+ZaXkH06tiycTpp
         blAnIH0jDBsPFCemD77tUrWo64B3s5Xx75RoJAfOM+TQYGGzw6Z/rSX9Bu56XOdT1HQl
         1dOshZO1mMQd5Vnlv+csMgf/UOTqShBNaSL87rSENlTtzXiWbWwJjvr0saamjBxk7M3W
         AijQ==
X-Gm-Message-State: AOAM531/Vl85iyKYUsbW4JatB+ur1U7LjZbRrEGXWe+PvTkcSTBLAcqC
	lYJh8pV3y6nDlOE42msI25HRnFQ+m/0=
X-Google-Smtp-Source: ABdhPJyC57+g4dQacBWy9+riytQ94s7FWtal08IAA5kjk5USGb6IyCQT1cmNJDXWrwkeL8Jt9KZnEQ==
X-Received: by 2002:a17:906:4a13:: with SMTP id w19mr54520830eju.533.1621121958576;
        Sat, 15 May 2021 16:39:18 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:18 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/20] Revert "gimp: Disable svg icons on arm"
Date: Sun, 16 May 2021 01:38:50 +0200
Message-Id: <20210515233853.583490-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gimp builds without issues on armv7 / gcc 11.1.0

This reverts commit 57a7c1ed7d45b28cadd70d8fabda42fe906ddff7.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
index 237d08a09..e729d9deb 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
@@ -54,7 +54,7 @@ EXTRA_OECONF = "--disable-python \
 EXTRA_OECONF_append_mipsarch = " --disable-vector-icons"
 EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
 EXTRA_OECONF_append_libc-musl_x86 = " --disable-vector-icons"
-EXTRA_OECONF_append_arm = " --disable-vector-icons"
+EXTRA_OECONF_append_toolchain-clang_arm = " --disable-vector-icons"
 
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.31.1

