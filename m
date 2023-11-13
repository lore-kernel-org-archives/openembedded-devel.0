Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B157C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 11:39:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.34868.1699875589756096749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 03:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LvXylw5U;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-407da05f05aso32069455e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699875588; x=1700480388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NcDkm77filFSbrAuUmdvFLDB8ATLSEa9uPxufhKPDm4=;
        b=LvXylw5U0vvYSUexXqssgkxbewVNJ+8tdCbt4FI3SYsDCz1GuIPj1Fr3g1I2yjPC6w
         Az/7sk3No+k91thuwiZ9VcSpYzh4x39YSmbv3/KVV+3iexn8j3LpHlzAWl4zm+B5b+cU
         Rb4g5J9vdQjseF9ur2Fj2IOc/lE/7czpoNiZwr6BJpAPYj8qXwDKVUd7y2adzOV4FwCt
         ZEEzyuLWMPAfe9Xig6M/AjRLfOJ+eeU++tRoD3dCjx/LgNJJQFD4eJn91x4tf22ayuan
         N9EMRsvf3rqEHzpLbOnOOdt8UNAoicFmXL072WPSxylUUIYPGMEAyCOspJiOYQZh2nVd
         hiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699875588; x=1700480388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcDkm77filFSbrAuUmdvFLDB8ATLSEa9uPxufhKPDm4=;
        b=jrO/PSghCokeTWFHnFiZ0qwgsLzLMa52GjbMa3D/1RW4LPtmCKtOgnMvnneXbQ4NDC
         V7Yv+D84FoXA4TLZzJwQT2Cvcocm/N5HsLLKwhTXoMbdhrjV3TRmmALMqarr0zcaSqiy
         D9IofUY/bht/tq72bNmc0equ/vFu0PgpVbCOBx70MZ0AxGkwU91THneKdZh48wWowQ6g
         lpOqdRYfrqHshNIKOWOUBzSMPOtccpaCIiUUagZiIkAnSk890P+JpWdlkB6rmive8uqi
         qIN1ZwAxVWL2CQV177BD36fgOxh6gyWMDuc69FZ2bKM9JzR9fN7sCIlCcQd0fqky/6Fi
         S3ow==
X-Gm-Message-State: AOJu0Yzhh9a2E1Bt1i26NjxxOooR9TOSG069IVztDsjOxoSi1Nv6hygs
	JOlvkKkg8J2bzaUJJgFxTUMYIJcCFRM=
X-Google-Smtp-Source: AGHT+IEcpCVcJoAciz314iQ7SaOvD62Ail5sf/KytJ04riFm5AlzPcCCGqGmXypHtkX6nLvU3AGMFg==
X-Received: by 2002:a05:600c:3151:b0:402:f55c:faee with SMTP id h17-20020a05600c315100b00402f55cfaeemr5049703wmo.26.1699875587374;
        Mon, 13 Nov 2023 03:39:47 -0800 (PST)
Received: from Unimatrix08-Jammy.lan ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id n15-20020a1c720f000000b0040a44179a88sm10547200wmc.42.2023.11.13.03.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:39:46 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: cherry-pick another upstream-proposed patch
Date: Mon, 13 Nov 2023 12:39:42 +0100
Message-Id: <20231113113942.112938-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 11:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106638

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/567.patch           | 36 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.10.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
new file mode 100644
index 000000000..fd3648045
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/567]
+
+From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Mon, 13 Nov 2023 12:37:23 +0100
+Subject: [PATCH] dlt_cdh:
+
+Make sure on 64 bit we read an ELF64 structure.
+Otherwise we get a read error, and the context file is missing some good
+to know information
+---
+ src/core_dump_handler/dlt_cdh.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_cdh.h
+index 8608c6c4..3dac480a 100644
+--- a/src/core_dump_handler/dlt_cdh.h
++++ b/src/core_dump_handler/dlt_cdh.h
+@@ -45,10 +45,17 @@
+ #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
+ #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
+ 
++#if ((__SIZEOF_POINTER) == 4)
+ #define ELF_Ehdr    Elf32_Ehdr
+ #define ELF_Phdr    Elf32_Phdr
+ #define ELF_Shdr    Elf32_Shdr
+ #define ELF_Nhdr    Elf32_Nhdr
++#else
++#define ELF_Ehdr    Elf64_Ehdr
++#define ELF_Phdr    Elf64_Phdr
++#define ELF_Shdr    Elf64_Shdr
++#define ELF_Nhdr    Elf64_Nhdr
++#endif
+ 
+ typedef struct
+ {
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 410fffa24..3d2e4a73f 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
            file://544.patch \
+           file://567.patch \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
-- 
2.34.1


