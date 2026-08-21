Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F33C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:15:30 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6108.1787314525429651403
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g3dryqZy;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dcbade417so884076a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787314525; x=1787919325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGQcIrehKl9tYnnBARyEMHeY1QJndA5so7qMD1Esqss=;
        b=g3dryqZyRVCUkMU7Rz1gw0V2C7EcDEQbU8LxBQnXUlcK/+XY/YenrO3zCDgrTWOBpl
         YKUnp4zrbixAq39xd7cycMIRaV2Rq07GfFyZ5dJDKpSbcGjMs8jih6hEBR2v3pFaOXdz
         MvDBkvzcx2PyYZtTVJYf5dv849FFwJQKT3zKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314525; x=1787919325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGQcIrehKl9tYnnBARyEMHeY1QJndA5so7qMD1Esqss=;
        b=N6r83aqRZz0hMBc+dTCDCiKZrToSP2Yt431x7z104s7VDbuW6u0eId4Y6v4r6Ad4dZ
         F8dPJM1RM6N7qBz+cf7/EA3a0jtwXI5FWEWmrN2qBuDqvsx3/6YsxEg/OuxkQXK9nmOQ
         tFu3z9zweCeLIkC8odzqQIWstt5shIfoGPrqcKqgpMNybPreBQXvB64LcLi7lLSDZnds
         sN4aYgISKF8h7N//o7RWUyr92HJFIqE34c08I9vTFDmJHPtHohCgtNe2h4gNHVZXr3z8
         yrHC00pcbw4VQ05QpkyrKargCcs9NlcUbKi98hH0t229NAPznAcjdzZ42gy8vy9XmoQL
         +RdA==
X-Gm-Message-State: AFuF++n1zBMU29T72qVN7eRbS6JGkc67yirt79OtHLPBEyZCttCYDBbv
	HfNxDA8vIjU73waWa293ZVgGhYokoGaVYgraSyCTTnftHd5Yboqa26nVKCMfF35jFbFllFWOj8W
	2Ay9F
X-Gm-Gg: AR+sD12MN7qqe5uWj+Iop7RsWP8ESoya4ST6Ay0D8rH67fLhHs+y+r7COnLRkddSLkl
	rGmPDqUH4bf2M6dTfR7dw7UYZUw/uXbazCNoyqQqy0yuO6U1HsnFD9eQ7LyctuAeAJ20+tsFjWN
	JMhjKhY87nYP63nuBl/AV7j+AipM7vB2gtJkmr3GTPa5v+GnLwhZbk8383b3n4uf/MFu+RPZjOC
	Hse2rmqgCtj9Z/UXWQzY1pgzuMRhkWeE+co3fVe/alnPBiKVUUWDs8csIrE4fNXIJ1DnaOARqXd
	ZxNne0lNx4UOtPL/dD9MBr93mtFl0Di9ncvwkXOqvCMNEAEgySxRRtawy53Bq/GXL8kANMPkOeL
	1AT18jimmrGO87g/o6q3gyQidYTaImNdZYslsxQdM2Ms3X4CG2gBH6DLXO05jOXAY4x25Abs/7p
	I4FpF+ftlxcLzfCGl4Z/oHhj7UQkXLVVr/Ma5bhhj9Ht88bJWs9LS845crow2UfSLF2OzmsEGzu
	DOdJ8g=
X-Received: by 2002:a17:90b:1c0a:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-395c336c815mr9337039a91.5.1787314524776;
        Fri, 21 Aug 2026 05:15:24 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327cb5a9831sm20584470eec.21.2026.08.21.05.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:15:24 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] opensc: fix for CVE-2026-40528
Date: Fri, 21 Aug 2026 17:45:17 +0530
Message-ID: <20260821121517.128373-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129418

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/OpenSC/OpenSC/commit/0358817ec74aeca654f83e7709c7720b14c5db59
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40528

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../opensc/files/CVE-2026-40528.patch         | 44 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.25.1.bb   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2026-40528.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2026-40528.patch b/meta-oe/recipes-support/opensc/files/CVE-2026-40528.patch
new file mode 100644
index 0000000000..d3820b6009
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2026-40528.patch
@@ -0,0 +1,44 @@
+From 0358817ec74aeca654f83e7709c7720b14c5db59 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 3 Mar 2026 15:04:33 +0100
+Subject: [PATCH] profile: Avoid possible buffer overrun
+
+Profile file of the following format will cause buffer overrun
+when parsed during the pkcs15-init invocation:
+
+```
+cardinfo {
+    key CHV1 {
+        value = "=XXXX...";  // 200+ X characters
+    }
+}
+```
+This will cause both stack and heap buffer overrun.
+
+Thanks Nicholas Carlini from Anthropic for the report.
+
+CVE: CVE-2026-40528
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/0358817ec74aeca654f83e7709c7720b14c5db59]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/pkcs15init/profile.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/pkcs15init/profile.c b/src/pkcs15init/profile.c
+index a6b2103f8..58416b7e1 100644
+--- a/src/pkcs15init/profile.c
++++ b/src/pkcs15init/profile.c
+@@ -987,6 +987,10 @@ do_key_value(struct state *cur, int argc, char **argv)
+ 	if (key[0] == '=') {
+ 		++key;
+ 		key_len = strlen(key);
++		if (key_len > sizeof(keybuf)) {
++		    parse_error(cur, "Key value too long (%zu > %zu)\n", key_len, sizeof(keybuf));
++		    return 1;
++		}
+ 		memcpy(keybuf, key, key_len);
+ 	} else {
+ 		key_len = sizeof(keybuf);
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
index 5f4382642c..689bb4f01e 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https \
            file://CVE-2025-66215-2.patch \
            file://CVE-2025-66215-3.patch \
            file://CVE-2025-66215-4.patch \
+           file://CVE-2026-40528.patch \
          "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.50.1


