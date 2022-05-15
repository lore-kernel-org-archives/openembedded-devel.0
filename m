Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CB9C433FE
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:50:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.16978.1652622590826246546
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NeXrgIOd;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id bo5so11774012pfb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r56M9SjvjwUIb0YI3eFQS09UialFIelShGpBVZ+2MV4=;
        b=NeXrgIOdo8RrEoMjK0ZER/8B/DDMWzYuwgZftKOXumIGtouvInupFY6gKJBxVCQzpV
         D2/YLlhx11hlmy9zbP4+mYkal63cnjFByE49vSp12Rc/cB5NJxhBvyq/mYhRp2qQ3mxm
         d4XVTRWwsbySu07L0hzysl5W2VGEZ8ESkXueHUZzXTyr9ehr/QH47MFHx5MxPEOIuY+F
         07O5lABgphUCqDmQ2LS18Xmf4f0im62RWYSKAR59BHQMKDaviXbMDs1/A/u6IzX3ICkt
         Hq+FpAHFkNvQ/x+OyjBzRO4GPvtg7IgGOd1AQoBtcmyiREWeJiESjTxqRjiUjqbQpKhu
         8boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r56M9SjvjwUIb0YI3eFQS09UialFIelShGpBVZ+2MV4=;
        b=jDfqXndGBFfdYkoEZftQ/WMAxQGx7C+kMh7uWsL2SFhdGVZ0vkuwpvE5S+7Detw/5X
         R+KG2V/HJlOt6T8oHBUNdWcfyIXviKuq4CyelyJebutPvYlGqcVVjzftRBybXfuunEw/
         mSRAWo6DACW/meZWdJA3P2zsZRNJ1hSoKCd8cKXhJqb80TwuZtMUKgGYz/ovvSpUtMng
         Eixe6u7ia56OvC3LymYFcqaqCrtfuzGCTH26HGx6l4EENm0qZuVUPl5W/zFOc5qSAHOr
         FCcfdi1dvgOiMK1NIJjVGIUDvruA1Ltr8XBC93LyPlUm5huW52U0HlR6RvAJIpgbUbBj
         FQnw==
X-Gm-Message-State: AOAM533KyDDIQZKlUShfxj+SNXCgyMI2r0xFJr/QlAmj2L1SGvUZ4WFL
	6s7osny56PLDZ/Jh1aHaOviGdddczG/bUw==
X-Google-Smtp-Source: 
 ABdhPJxABR/Sxvs6NR7c1qRHuIkpiaL45pbnIM4SR308YeUqt3M3jD++G8qmptPku6U2YKaUBK3GIw==
X-Received: by 2002:a63:69c7:0:b0:3c2:2b51:a4b6 with SMTP id
 e190-20020a6369c7000000b003c22b51a4b6mr11790388pgc.153.1652622591566;
        Sun, 15 May 2022 06:49:51 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 19/22] devmem2: add support for different page sizes
Date: Sun, 15 May 2022 06:49:19 -0700
Message-Id: 
 <2f5a9c8d33116997a27ac606c6fc2712290c2922.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97116

From: Denys Dmytriyenko <denis@denix.org>

Instead of hardcoding 4K page size, query the system and use the value for
memory mapping.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3af1d119de53a92f4d0fbfb8a61f999d1d541253)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb    |  4 ++-
 ...ort-different-page-sizes-at-run-time.patch | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index c6b8df5e47..ba7aad8ab9 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -5,7 +5,9 @@ PR = "r7"
 
 SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
-           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
+           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
+           file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
+"
 
 S = "${WORKDIR}"
 
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
new file mode 100644
index 0000000000..0da0732c57
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
@@ -0,0 +1,35 @@
+From 0f6af48b2fbc71ec8abe862d3e9eb6da7b03538b Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 8 Aug 2018 14:38:00 -0400
+Subject: [PATCH] devmem2: support different page sizes at run-time
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ devmem2.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/devmem2.c b/devmem2.c
+index 68131b2..76af2d6 100644
+--- a/devmem2.c
++++ b/devmem2.c
+@@ -53,8 +53,6 @@
+ #define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]\n", \
+   __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
+  
+-#define MAP_SIZE 4096UL
+-#define MAP_MASK (MAP_SIZE - 1)
+ 
+ static inline void *fixup_addr(void *addr, size_t size);
+ 
+@@ -66,6 +64,8 @@ int main(int argc, char **argv) {
+ 	int access_type = 'w';
+ 	char fmt_str[128];
+ 	size_t data_size;
++	unsigned long MAP_SIZE = sysconf(_SC_PAGE_SIZE);
++	unsigned long MAP_MASK = (MAP_SIZE - 1);
+ 	
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+-- 
+2.7.4
+
-- 
2.25.1


