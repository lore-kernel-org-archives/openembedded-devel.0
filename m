Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AD4C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 21:14:59 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.94.1716326090465267215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 14:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiWtNgYH;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ee954e0aa6so5448565ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716326090; x=1716930890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5tFKv3K21RN6JRIbRL6KAMKj8k85UzRUpJFMhBz90U=;
        b=eiWtNgYH8V2dIV4vB99TKJyEGcV59M8BMOQQBwHZp/Qvag+C36xxIdiUCxYjSZsNbi
         PBsqes4DH40CVu/3Yv7yamx8HwPmiEr03KnCfzvPUwjXVjPG9r4wdPGOi30u4loNVSYd
         hhAcW9KZCMSXMklF+LwHl4CwEJdFRZCkscsh+7D5KfNR9oNnI4u1mNOLLdwldBFsZrhA
         tldM6UNxDcSG75CA/ZB2CCgyVBkZWIpyjxkQ+GRPq25WcTH7rtr2+Yf4iS496vCyVGGq
         4OKvTepV6kR+5TvHt0Dn67ah2O8Z9eIY/AGeG2hZE6bwEs3vDucW3Tanm10rNMyhQL67
         /9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716326090; x=1716930890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5tFKv3K21RN6JRIbRL6KAMKj8k85UzRUpJFMhBz90U=;
        b=OSjcvsNQm5A6geaAjaoHCmDMS1Bg1npi/OPzyJNF8ircxChZL7zt46AQB1sP6iYBsZ
         TsD805nTHGdgS5ISi8ZhDxvfsG4/8pNBS+O5zI9oT1GZwTSopgot7ezxBK3rIE8Oc+YS
         g1/1FwqvxI1sgY+LfspucBAN4UdaCy+sb5DUlEPz9yXA0ckpxydCV1GJKJCawhKybzAm
         OczXnN1XqcCWJV2whC8OZCGFizSjHGSe3sgoiMy1vQAaczS1vLXYzlIfLM1P7t30OwqK
         iHGioAWYKSHSObO1g8naj3/BBOoU155mKCt2V/vvY26Nz7J63jSdo1BHo/V+FfK7sg5C
         GG6Q==
X-Gm-Message-State: AOJu0YwPFBpjqIl4BPKJ4a1Z6DourXwtP0VKQZdWY6iMrUzhGq2j/Kha
	afJKkJlH8f/BP0YGHd9cuXwOgDSsuEZ5A8nN+WVi3tPBFIhUFck/oU9Yb4NGMDw=
X-Google-Smtp-Source: AGHT+IEwM+0fvORXiLt3PFF6FVrbiSCx6zuknvGxDDxP54AJQKeVj2ztURXkDvXeKpgvj6yeSmeUJQ==
X-Received: by 2002:a17:902:d4ca:b0:1e7:8d21:7fd7 with SMTP id d9443c01a7336-1f31c98ee00mr1762645ad.28.1716326089561;
        Tue, 21 May 2024 14:14:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13692asm226146045ad.252.2024.05.21.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 14:14:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nvme-cli: Fix build on musl
Date: Tue, 21 May 2024 14:14:46 -0700
Message-ID: <20240521211446.2347991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 21:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110476

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-nvme-Use-C99-types-for-uint32_t.patch | 88 +++++++++++++++++++
 ...stc-Replace-__uint16_t-with-uint16_t.patch | 34 +++++++
 .../recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb    |  5 +-
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch
new file mode 100644
index 0000000000..be1452af51
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch
@@ -0,0 +1,88 @@
+From ac2ff1dbe0b44953de636c50c7d7f8c1e9f1e458 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 4 May 2024 09:13:06 +0100
+Subject: [PATCH] nvme: Use C99 types for uint32_t
+
+<stdint.h> provides `uint32_t`, while `u_int_32` is an unofficial/internal
+typedef that glibc happens to provide. This fixes the build on musl.
+
+Bug: https://bugs.gentoo.org/931194
+
+Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/ac2ff1dbe0b44953de636c50c7d7f8c1e9f1e458]
+Signed-off-by: Sam James <sam@gentoo.org>
+---
+ nvme.c        | 13 +++++++------
+ util/base64.c |  5 +++--
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/nvme.c b/nvme.c
+index 46a2399a..5409ddf2 100644
+--- a/nvme.c
++++ b/nvme.c
+@@ -34,6 +34,7 @@
+ #include <inttypes.h>
+ #include <locale.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+@@ -9081,8 +9082,8 @@ static int check_dhchap_key(int argc, char **argv, struct command *command, stru
+ 
+ 	unsigned char decoded_key[128];
+ 	unsigned int decoded_len;
+-	u_int32_t crc = crc32(0L, NULL, 0);
+-	u_int32_t key_crc;
++	uint32_t crc = crc32(0L, NULL, 0);
++	uint32_t key_crc;
+ 	int err = 0, hmac;
+ 	struct config {
+ 		char	*key;
+@@ -9150,10 +9151,10 @@ static int check_dhchap_key(int argc, char **argv, struct command *command, stru
+ 		return -EINVAL;
+ 	}
+ 	crc = crc32(crc, decoded_key, decoded_len);
+-	key_crc = ((u_int32_t)decoded_key[decoded_len]) |
+-		   ((u_int32_t)decoded_key[decoded_len + 1] << 8) |
+-		   ((u_int32_t)decoded_key[decoded_len + 2] << 16) |
+-		   ((u_int32_t)decoded_key[decoded_len + 3] << 24);
++	key_crc = ((uint32_t)decoded_key[decoded_len]) |
++		   ((uint32_t)decoded_key[decoded_len + 1] << 8) |
++		   ((uint32_t)decoded_key[decoded_len + 2] << 16) |
++		   ((uint32_t)decoded_key[decoded_len + 3] << 24);
+ 	if (key_crc != crc) {
+ 		nvme_show_error("CRC mismatch (key %08x, crc %08x)", key_crc, crc);
+ 		return -EINVAL;
+diff --git a/util/base64.c b/util/base64.c
+index 7f47cda6..0e89f2e9 100644
+--- a/util/base64.c
++++ b/util/base64.c
+@@ -20,6 +20,7 @@
+  * MA  02110-1301, USA.
+  */
+ 
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
+@@ -42,7 +43,7 @@ static const char base64_table[65] =
+ int base64_encode(const unsigned char *src, int srclen, char *dst)
+ {
+ 	int i, bits = 0;
+-	u_int32_t ac = 0;
++	uint32_t ac = 0;
+ 	char *cp = dst;
+ 
+ 	for (i = 0; i < srclen; i++) {
+@@ -77,7 +78,7 @@ int base64_encode(const unsigned char *src, int srclen, char *dst)
+  */
+ int base64_decode(const char *src, int srclen, unsigned char *dst)
+ {
+-	u_int32_t ac = 0;
++	uint32_t ac = 0;
+ 	int i, bits = 0;
+ 	unsigned char *bp = dst;
+ 
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch
new file mode 100644
index 0000000000..1881b18aac
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch
@@ -0,0 +1,34 @@
+From 47d33d8da7a5b7310a2c2f4328115b439039e46c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 May 2024 14:09:32 -0700
+Subject: [PATCH] plugins/ssstc: Replace __uint16_t with uint16_t
+
+uint16_t is ISO defined and comes from stdint.h, makes it
+portable across glibc and musl on linux.
+
+Upstream-Status: Submitted [https://github.com/linux-nvme/nvme-cli/pull/2351]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/ssstc/ssstc-nvme.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/ssstc/ssstc-nvme.c b/plugins/ssstc/ssstc-nvme.c
+index 03e4fe3f..302df988 100644
+--- a/plugins/ssstc/ssstc-nvme.c
++++ b/plugins/ssstc/ssstc-nvme.c
+@@ -64,9 +64,9 @@ void show_ssstc_add_smart_log_jsn(struct nvme_additional_smart_log *smart,
+ 		unsigned int nsid, const char *devname)
+ {
+ 	struct json_object *root, *entry_stats, *dev_stats, *multi;
+-	__uint16_t wear_level_min = 0;
+-	__uint16_t wear_level_max = 0;
+-	__uint16_t wear_level_avg = 0;
++	uint16_t wear_level_min = 0;
++	uint16_t wear_level_max = 0;
++	uint16_t wear_level_avg = 0;
+ 	uint64_t raw_val = 0;
+ 
+ 	root = json_create_object();
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
index 8c090186d8..ad1728eed6 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
 DEPENDS = "json-c libnvme"
 SRCREV = "b340fd7dcf1aef76f8d46ab28bef3c170d310887"
 
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https \
+           file://0001-nvme-Use-C99-types-for-uint32_t.patch \
+           file://0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.45.1


