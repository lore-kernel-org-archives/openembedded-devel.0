Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D924CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:35:52 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5210.1761028547566390796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLLcIdDY;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290cd62acc3so47158605ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 23:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761028547; x=1761633347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXbMkB7shAgJquuMcg9/to1o2vRaTcrTIeNJ2RZwlKc=;
        b=RLLcIdDYq1PMYQL/EbPcjXMfoAv/kM9r4TA42zrCkTpRCoineEXBYLBDAuvE4h8pQv
         CFBkl8P8dr5Z7FbcyH2avuH6wsnmEH6aP6/u66PG4fnfGIjk+DHnTk6gGHYZ9DK41tS6
         Tt542ZUE1w7KAubhLHxaGVXiVY4oipRuxShJ7D4/3MNQG40a+SonEikgPsnSSAyfRWrn
         rNlaoYF37n0Iu7dLgEV6BtoUtJok3Ii88wvgSHg/Wulgb6RRsH1gnoeII99AhKGEfFEU
         ig9VcYPEdV5VBaWPeM1jjEpqmoQf6KCdgZWfxR+nDB/IAYjbg+b55dCcwe8TfXqZEVXE
         3VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028547; x=1761633347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXbMkB7shAgJquuMcg9/to1o2vRaTcrTIeNJ2RZwlKc=;
        b=uTpGfJb/2GR9cf5f0LN+/lCXPAgE4HLOs9Y0+Dhxl/wI8JSfx7Nj9qGwdGZiVpEIFX
         5kV9LYHRrWSMyOUjrBl4AveAcihrLwlutpiApXYKLR2eVwVxp+v7mlTs4Y+WpEaxwgDn
         uIER36apBRcC0rfWyifro6gLi0iJeW8kYqlEG9kR3R7PFUe+FMymDKc/VYltox+u0shN
         Wcix+2Xtm6dllYQnF0NSlyom6sNRWW+IACR+kIroruHoyOi6SQBm4NaNWxsZUzxGhuEQ
         msjzSUk3Ty3Gnf6Mo1DsMQiGv/gbot95/bd5rM6nh33CTumqe2fbWvn3i6jHD/itcOTz
         njTA==
X-Gm-Message-State: AOJu0YybPCpAuN+XQ8sfzkkpFmlseKIXjpn+RUzcglLWEgrOl66iixyF
	k01c7AywsYq67ZatR8fJjDpydsTYKpxWylRwrNDuUsMVzrptfBH2LA/2BT0vLQ==
X-Gm-Gg: ASbGncvwE6V3ykOARsvNbRtc938SNCipzskcg8lqNGtfB+N0fUtY2EJ6N9o7fBbN3Y3
	YvO0mEfCn2ZLnW7aETLyvIl1z+1kAlAnm+9bap8FdXnUCV3eAqZe+GspzfGEUnISsp5kuxg6w5n
	3CGQzxoJgSakVjurb52lyrHUDMU2fcwQ/kGjqLfUIeBRIKTBEWeL4e6AxV07bLNiyicuz4wEaRl
	da+gJysyesECrIrRY+9V6NGOX+93hKNvN6qQ+LwiH5LpvHflQExv604DRb2NQmvI2KI4eH6cPfG
	Xew2xXec9LxIqvyKZeUK1iMrnspZmO9N1E5lQh4RvXrQkveWz36riSmmAwSPGuasz3lOd3B+/k6
	hz914wXyRTXqDNfeLge+qUgjGEok8Q6mBRQTVfY6jebOijjiJh+TVm3FA6iNvdM6ZeVfL6FbZiu
	e2a5sTP8akfx1rShFZ4R/cs0iljUYLUTMzDXE=
X-Google-Smtp-Source: AGHT+IFapqU7f+DQGcEsHxF/C6b+hq9KKnJNRVvb15KfhrN7hjI9zjN/eGqqGu7OFomwgPPo2wlaOg==
X-Received: by 2002:a17:902:ce12:b0:28e:7fce:6685 with SMTP id d9443c01a7336-290cb94792amr179153715ad.32.1761028546731;
        Mon, 20 Oct 2025 23:35:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm99609595ad.62.2025.10.20.23.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:35:46 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/5] libiec61850: patch CVE-2024-26529
Date: Tue, 21 Oct 2025 19:34:05 +1300
Message-ID: <20251021063407.232340-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
References: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 06:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120829

Details https://nvd.nist.gov/vuln/detail/CVE-2024-26529

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2024-26529.patch    | 33 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-26529.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-26529.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-26529.patch
new file mode 100644
index 0000000000..ea3f472f30
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-26529.patch
@@ -0,0 +1,33 @@
+From e29799cba6f1d08cf6463a2b190c0e6502b885df Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Fri, 2 Feb 2024 06:44:47 +0000
+Subject: [PATCH] CVE-2024-26529
+
+fixed - null pointer dereference in mmsServer_handleDeleteNamedVariableListRequest when receiving malformed message (LIB61850-430)
+
+CVE: CVE-2024-26529
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/cf94d64206cf53298edf4799a75b31657bb7cbb3]
+
+(cherry picked from commit cf94d64206cf53298edf4799a75b31657bb7cbb3)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mms/iso_mms/server/mms_named_variable_list_service.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/mms/iso_mms/server/mms_named_variable_list_service.c b/src/mms/iso_mms/server/mms_named_variable_list_service.c
+index 3a27061c..3365f771 100644
+--- a/src/mms/iso_mms/server/mms_named_variable_list_service.c
++++ b/src/mms/iso_mms/server/mms_named_variable_list_service.c
+@@ -140,6 +140,12 @@ mmsServer_handleDeleteNamedVariableListRequest(MmsServerConnection connection,
+         mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
+         goto exit_function;
+     }
++
++    if (request->listOfVariableListName == NULL)
++    {
++        mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
++        goto exit_function;
++    }
+  
+ 	long scopeOfDelete = DeleteNamedVariableListRequest__scopeOfDelete_specific;
+ 
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index fa9e84a29e..ec10f0990e 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -18,6 +18,7 @@ SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
+           file://CVE-2024-26529.patch \
 "
 
 S = "${WORKDIR}/git"

