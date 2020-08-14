Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.12369.1597383428531259137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkKD7vq+;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id s15so3991220pgc.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fbGTA1wA/ok0pba6rjrUnTpOBcbgfkoMRkdcZ8PnGr8=;
        b=OkKD7vq+cNV2muMJRCAbZH2P/xnld1OSsxiqarw0WtHNJIP5c4tRc5Y224OlH2fDt9
         Kz0J1UF2jPpuM2s5Hl4y1yu3481Jt3zgqNSKyydtPdBPNGNDmBPvNk+oXWuwrNIfUpmp
         gTQ/DZqXehJeb+1HyFGhhBpxyn9k8T22QlTqANhom/v/TAnkgwsFrcanyodyU3X9HumK
         zwDiavyuPPDYdfotZfggDVlsokcUD0eU2ICBXXN+/btBV6Lb+0FuOMcMAzdcvNrwYAs4
         EfsLB1oVH5CZHeig3OpzIyx2WNmFwBJ4rBlEz5Z4JSEkkhqWN6o9+Vdn+YggXOiyOx4L
         mwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fbGTA1wA/ok0pba6rjrUnTpOBcbgfkoMRkdcZ8PnGr8=;
        b=kxcc6wUnkQ55w4nTG7uoZidOkYKxMMnvgmVHRowIbnJJFOwaNwrwBq8tMVEQ7T9hb3
         bmy7f5D0ntU8eTXR5x04c0DvMxypwAc/8igt5MoVECtBxSPsOEt9LCexGHfexUDgln2K
         ywm1Gheh23NqM1yvTO6nRIQsemIy780KSr82em5SmfS/Ga9eeMdLfcYY2XqUn7I5tgUL
         JkFjg+lJlGw/p6ElUwloDVXsbKqS7QKbK1dQl8h/fGdRcQSDan4ei/NgeB61A51oYzlL
         v8kSSeJFZTGSQIXq5DSVfWyjCu1WNf2KmJHDQdR5LLDUNOT5eMdspnb30AurMt3hXjCa
         0xkg==
X-Gm-Message-State: AOAM532kVlWlnXiHcYhIC/GGuGpt4gQfhDKKwKb+wQMJSSUSULMyH0to
	/sPYSubFc7rjHos8B00XEyBCsuEl1GUVaw==
X-Google-Smtp-Source: ABdhPJyTNLaT5nwORPhYqlcpTdleRZrhUs35XgrQAsRplfPKE/tUD00WGVcg9DRqGfUbzcC2rsT6nw==
X-Received: by 2002:a62:1b0e:: with SMTP id b14mr654445pfb.281.1597383427748;
        Thu, 13 Aug 2020 22:37:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/21] openocd: Fix build with gcc10/-fno-common
Date: Thu, 13 Aug 2020 22:36:45 -0700
Message-Id: <20200814053657.1701247-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-Make-bitbang_swd-extern-definition.patch | 42 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch
new file mode 100644
index 0000000000..d42b628dae
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch
@@ -0,0 +1,42 @@
+From 428f9f3c4a5be973e4c7fc1325ae9dbe41040df2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 17:47:35 -0700
+Subject: [PATCH] bitbang: Make bitbang_swd extern definition
+
+Fixes build with gcc10+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jtag/drivers/bitbang.c | 1 +
+ src/jtag/drivers/bitbang.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/jtag/drivers/bitbang.c b/src/jtag/drivers/bitbang.c
+index b5078c080..f8612aade 100644
+--- a/src/jtag/drivers/bitbang.c
++++ b/src/jtag/drivers/bitbang.c
+@@ -43,6 +43,7 @@ static int bitbang_stableclocks(int num_cycles);
+ static void bitbang_swd_write_reg(uint8_t cmd, uint32_t value, uint32_t ap_delay_clk);
+ 
+ struct bitbang_interface *bitbang_interface;
++const struct swd_driver bitbang_swd;
+ 
+ /* DANGER!!!! clock absolutely *MUST* be 0 in idle or reset won't work!
+  *
+diff --git a/src/jtag/drivers/bitbang.h b/src/jtag/drivers/bitbang.h
+index 577717ebd..0faf5d9ae 100644
+--- a/src/jtag/drivers/bitbang.h
++++ b/src/jtag/drivers/bitbang.h
+@@ -57,7 +57,7 @@ struct bitbang_interface {
+ 	void (*swdio_drive)(bool on);
+ };
+ 
+-const struct swd_driver bitbang_swd;
++extern const struct swd_driver bitbang_swd;
+ 
+ extern bool swd_mode;
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index f01b224fac..c7d754fdba 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
     file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
+    file://0001-bitbang-Make-bitbang_swd-extern-definition.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-- 
2.28.0

