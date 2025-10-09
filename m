Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EB9CCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 04:11:14 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.4508.1759983068538142650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 21:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f6wK7iTa;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-92aee734485so19155439f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 21:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759983067; x=1760587867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkwtxTBLxuzsVHN6bkII7juMWDN/gOiUCj7bTUbvFRc=;
        b=f6wK7iTak7jAUdqgRNCOT1mrQFmytUtOEs4jOmqJXJAQEGX/UYOabrEGE7dzuu/lJo
         7pkjt2RqDJ85n/ZG25sVZYKX+J5opaHZKJjjNwJNjU/Jy93DOTXDh4cJn5QLtbu3REHb
         m11k8lbmTpC27olFCYcSI6msArUGHL6WXR+U9y/ZNyHL2xNNmgoiDaOcH8u2ewU5g6sb
         QTh7leXGhQ8DsYlO1NqSuiJwHcMCFKXDpL4af8YvnxnzFZuLyYgLHLc7nYGrjvPK9Ywu
         5nHc/Krfnn5zIS1Syx/Iscy/YWkNTgrECcLKi+b/TJ1oc4jgJIZHM5QScjPVtcXnqHJ8
         R8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983067; x=1760587867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkwtxTBLxuzsVHN6bkII7juMWDN/gOiUCj7bTUbvFRc=;
        b=mncLtALk2UfAn7zC6WlkFu6qlReThCmsWFS5vmClXiqKvHsfJa6J8PdFOmEt+UKnJs
         xAUzh5ru8xd7WRDB4Vs/Pm2K3ApvRy+8z/Oda5w3n1uDpdvxOlsZVxFeYMFINRuAXdHA
         jmcIgX3Lsx9v+/A8xl8QfjgDrY7JJJyLh/wtikBCBQdphxQ4ZO5qyWXQObznQTtOKd4w
         R1xy18McwezG3v344d9a5TurgG3HHF+hRmowTp7cqc3Q2VGENykOqkowpo5GKnuEx34h
         AEuO9nL+e2umuMaV21aFOyOjbksUxFSUP3wHbbvFuYEVS/I/dNkgd0lv/mGM9gFK2eLv
         Pdxg==
X-Gm-Message-State: AOJu0YywcyxZ4p5enwescHNTtUqaETifelmEoEqnPp7cafQGZyv/CvU+
	RzhLEYXnCkV3W/wgmRNXqR40TLmIeiy8BfP4fSxYjPt4FpSZy4rxTLMyZEiCwA==
X-Gm-Gg: ASbGncuIbncSoD80aFCAoN/ygLcbHqfcnfHejqWpTb6dXdIqu3fnPMpCcCy0oKXgHKu
	BR5K5LyEI1cA0+eE9ILPGBaFBNVinosUnMpkEWiyXJoW3P2iQBBZZqdlYZ4ukw76I+Dpypuj5R+
	/EyKjiChqXkGMir9mk4Q3slGCf7ZXiEUNoeGEQfa7wHpicQAIdYb4FD814gCh6LImwAvf9TaO6B
	XDADAcRTxpE7aHZJqCHpCe+3dw3sA7lWXG0jKLrPpqSoR8XBSMkBmOTse1jDkAYI6cnzUf/hVtm
	hG5yijZspVkja3bFog3ISHhOg5Lin1QPUUElKymRoyyKnXYGfPG2U/EPtYG6mAZOrWhZ3vb4Nn6
	TBq8NfBKB0xCQ7rYGZP5GY4kf8dEmogeS5b2SxyLD79TgoYppbChXdfatAezU+LxPxS2RIlcpa5
	7b
X-Google-Smtp-Source: AGHT+IEBfyYQHPwSpgrDiplU+exnz//vUFpzicVLwHyoJyf93ADmFXMa+8Q+0Qw3H9+QrI0PqTVcKA==
X-Received: by 2002:a92:cda2:0:b0:427:70e7:ea09 with SMTP id e9e14a558f8ab-42f8738444fmr58593765ab.14.1759983067365;
        Wed, 08 Oct 2025 21:11:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9036e8a3sm6373825ab.31.2025.10.08.21.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 21:11:06 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][walnascar][PATCH 3/3] libiec61850: patch CVE-2024-45970
Date: Thu,  9 Oct 2025 17:10:49 +1300
Message-ID: <20251009041049.3279700-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
References: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 04:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120397

Details https://nvd.nist.gov/vuln/detail/CVE-2024-45970

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ed-potential-buffer-overflows-in-MMS.patch | 73 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0005-LIB61850-449-fixed-potential-buffer-overflows-in-MMS.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0005-LIB61850-449-fixed-potential-buffer-overflows-in-MMS.patch b/meta-networking/recipes-connectivity/libiec61850/files/0005-LIB61850-449-fixed-potential-buffer-overflows-in-MMS.patch
new file mode 100644
index 0000000000..fe80e73fe6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0005-LIB61850-449-fixed-potential-buffer-overflows-in-MMS.patch
@@ -0,0 +1,73 @@
+From 3238485703baf62a66da6c9dae63eb648c230b8c Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 23 Jul 2024 18:50:15 +0100
+Subject: [PATCH] LIB61850-449: fixed potential buffer overflows in MMS client
+ file service handling
+
+CVE: CVE-2024-45970
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/ac925fae8e281ac6defcd630e9dd756264e9c5bc]
+
+(cherry picked from commit ac925fae8e281ac6defcd630e9dd756264e9c5bc)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mms/iso_mms/client/mms_client_files.c | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/src/mms/iso_mms/client/mms_client_files.c b/src/mms/iso_mms/client/mms_client_files.c
+index 4fca418e..935ba1a4 100644
+--- a/src/mms/iso_mms/client/mms_client_files.c
++++ b/src/mms/iso_mms/client/mms_client_files.c
+@@ -487,8 +487,13 @@ parseFileAttributes(uint8_t* buffer, int bufPos, int maxBufPos, uint32_t* fileSi
+             break;
+         case 0x81: /* lastModified */
+             {
+-                if (lastModified != NULL) {
++                if (lastModified != NULL)
++                {
+                     char gtString[40];
++
++                    if (length > sizeof(gtString) - 1)
++                        return false; /* lastModified string too long */
++
+                     memcpy(gtString, buffer + bufPos, length);
+                     gtString[length] = 0;
+                     *lastModified = Conversions_generalizedTimeToMsTime(gtString);
+@@ -515,12 +520,14 @@ parseDirectoryEntry(uint8_t* buffer, int bufPos, int maxBufPos, uint32_t invokeI
+     uint32_t fileSize = 0;
+     uint64_t lastModified = 0;
+ 
+-    while (bufPos < maxBufPos) {
++    while (bufPos < maxBufPos)
++    {
+         uint8_t tag = buffer[bufPos++];
+         int length;
+ 
+         bufPos = BerDecoder_decodeLength(buffer, &length, bufPos, maxBufPos);
+-        if (bufPos < 0) {
++        if (bufPos < 0)
++        {
+             if (DEBUG_MMS_CLIENT)
+                 printf("MMS_CLIENT: invalid length field\n");
+             return false;
+@@ -534,12 +541,20 @@ parseDirectoryEntry(uint8_t* buffer, int bufPos, int maxBufPos, uint32_t invokeI
+             tag = buffer[bufPos++];
+ 
+             bufPos = BerDecoder_decodeLength(buffer, &length, bufPos, maxBufPos);
+-            if (bufPos < 0) {
++            if (bufPos < 0)
++            {
+                 if (DEBUG_MMS_CLIENT)
+                     printf("MMS_CLIENT: invalid length field\n");
+                 return false;
+             }
+ 
++            if (length > (sizeof(fileNameMemory) - 1))
++            {
++                if (DEBUG_MMS_CLIENT)
++                    printf("MMS_CLIENT: filename too long\n");
++                return false;
++            }
++
+             memcpy(filename, buffer + bufPos, length);
+             filename[length] = 0;
+ 
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 962fca1c07..4668cc450b 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch \
            file://0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch \
+           file://0005-LIB61850-449-fixed-potential-buffer-overflows-in-MMS.patch \
 "
 
 S = "${WORKDIR}/git"

