Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3005EC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:22:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.16816.1699978934380235518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 08:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lM6Gv/cO;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32d849cc152so4028187f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699978932; x=1700583732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alLV67KUaqzHmvVWjf1C2sDOzWHuZ5KZ1rEfPz/30Sk=;
        b=lM6Gv/cOEZWM4LlV+REvyX5tsJPSz42wsPsHuzDi42RZkbl7QLPkHFFdGU8vjJ4cgC
         dCg0/0BebCbDc/JaVLz7KVfnH2zofSozoNov0fop8QiXG9gw7tL/0/c9hDpT6dMqhgR+
         RnBLztSEbblidfYFoMEjLE/IhJj81GROYKRHfz2YuQPZM79HHhPuxA+jmitlbMTxH+yn
         vkcn+jwi4fVxs2VhFs8hr5HH37/Ao4GGPs4jTAVCK9XOV1D5stlZ8VQ/y8nR/lJ6LY4C
         CPq+kOB9Oau3B20NkLa2eLckcgdzWoufPkkOjrRHN0yyzVRQoZJukv9WbdA2tH8eGTWG
         FOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699978932; x=1700583732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alLV67KUaqzHmvVWjf1C2sDOzWHuZ5KZ1rEfPz/30Sk=;
        b=YVDcmEsQbFHt3lUCfelhuR6EH9cCknDXBmun0qcLbIyX7s6PbFZjYZt9DR/VqCV/Wv
         WQYKBZ7grnKZ0tgl5s7/HUPDJSEIaAnWgJwMK88LfMXF/r1OnAI9gUZ+8PPIiNnhfhp3
         SYQjft+I4lYcVDNdX42cF6A1VlQMk6vjZWOD0ueYqiiyBbJzOHEY+3XbDCQMdHcRajtK
         x8Vyv8YC9vPi21u+QGNyxc6KJENL1KxzcYTUwyTXsS4ZLcenbqL6b5OR6WN0KX4LLNjo
         DcfoDBIR9LfCzB69qZwAdePxDcZX1IQidC6PpPILOllgKqyMCi13w+Aep2U08x9dnksu
         knfw==
X-Gm-Message-State: AOJu0YyfRqWaMSJ6H9q7TMhKowjlLHHm2fRmuxK1hiGdvGDUSYrw9Ccq
	S5ry2q75nikyGBlhOBmCmaOnACCiYks=
X-Google-Smtp-Source: AGHT+IFPiHTpxgPMnLDXohaj71i6fNxyqqUg/DFkKfSJsXZrsuHUjpBt0ZQn/8r7A5LxFKV2wP5AtQ==
X-Received: by 2002:a05:6000:144c:b0:32f:71e2:adfb with SMTP id v12-20020a056000144c00b0032f71e2adfbmr8682138wrx.3.1699978931752;
        Tue, 14 Nov 2023 08:22:11 -0800 (PST)
Received: from Unimatrix08-Jammy.lan ([109.53.92.211])
        by smtp.gmail.com with ESMTPSA id e2-20020adfa442000000b0032f7eaa6e43sm8317299wra.79.2023.11.14.08.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 08:22:11 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: cherry-pick another upstream-proposed patch
Date: Tue, 14 Nov 2023 17:22:08 +0100
Message-Id: <20231114162208.332056-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 16:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106719

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/568.patch           | 27 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.10.bb          |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/568.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/568.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/568.patch
new file mode 100644
index 000000000..1a14daa4d
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/568.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/568]
+
+From f68119a1ef9b8ae2bb894801a22842719d0856be Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Tue, 14 Nov 2023 17:18:57 +0100
+Subject: [PATCH] dlt_cdh:
+
+Make sure on 64 bit we read an ELF64 structure.
+Otherwise we get a read error, and the context file is missing some good
+to know information
+---
+ src/core_dump_handler/dlt_cdh.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_cdh.h
+index 3dac480a..1ace805b 100644
+--- a/src/core_dump_handler/dlt_cdh.h
++++ b/src/core_dump_handler/dlt_cdh.h
+@@ -45,7 +45,7 @@
+ #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
+ #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
+ 
+-#if ((__SIZEOF_POINTER) == 4)
++#if ((__SIZEOF_POINTER__) == 4)
+ #define ELF_Ehdr    Elf32_Ehdr
+ #define ELF_Phdr    Elf32_Phdr
+ #define ELF_Shdr    Elf32_Shdr
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 3d2e4a73f..b6cb788fe 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0004-Modify-systemd-config-directory.patch \
            file://544.patch \
            file://567.patch \
+           file://568.patch \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
-- 
2.34.1


