Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0FDCCD19F
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:35:52 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.5212.1761028552015293404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ILZi60eQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4359819a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 23:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761028551; x=1761633351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQx8Jyz6w3iwH9lllXMEpNgk/IgsKeyX8UeK1kcsQYI=;
        b=ILZi60eQUupt+SLrLaPKTfWeZRE0zqYnM2yoqXLmwmsLuvAvQ8vzpW3SrxbDbINTdk
         S6jTmpQOxiB5w6p3rCOzvsfuVFNxejvBVE6Xu2Re0uVBvu3DMzcvwnjdrZTole6BaDOc
         Be5qE4zV83Cae+BBTfiMqQzNngFo02WXiPTTnn9R0b4Uh/rnjFIDijHjcUWDXlUsRwVH
         /yk0XRENCWaxAZ9Wdry36RPeLRgkmxZNDwbOUowTznrjuIIuEHRf3VmIOg3AOo2TC0Em
         bZ3seclVB5Qdgc+wlRk4RaKgnEdGjcKHuqw+Pjiz2jXELUx2asih6mtxJD+d22pOdw/q
         Zv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028551; x=1761633351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQx8Jyz6w3iwH9lllXMEpNgk/IgsKeyX8UeK1kcsQYI=;
        b=BaE0mo1/5/EOG9BkKiZDD8nClW5aXmhcggdK64yR8dJYWAEPux2fofFaPPUSg/31QE
         i7GdzNNCc0Iy6vm9jOgkXVEKteJ+Z4MXUbzbfsuui6ENQwj8lLh+bqPzmszluoqmNWXS
         ggI8b/7cwIhBkdps1oPvBeEEfBX67+2OQq1dSIBKr+glZGQnTjdv6uEHgKKFzeXgxnfL
         /OsAzeqgzQaRNYy0H2rRasOR3Dyg9UmXs2IbSpnE4Hr92FneyRuWiZLQAjHlJhP1hmsO
         B77zWKp4Pw2LckIu8ul8Xrc/448u/L95ZSbKojONJB6UUPKdWrhzuzyvMrPcXIVreL48
         fVkA==
X-Gm-Message-State: AOJu0Yxsnol4T7OZGkT75pdcSl9bGZqxCGugeNl8uTbhGxS+gX1mOBPQ
	AQExhUZvdni/nF2w67f497wh+8gin4JPeYrTIpUXqrAiuYuYXzSCB4QXiCaBXg==
X-Gm-Gg: ASbGnct2fqVryj8HpvMkrz+paf6X6ZdKjEy6NeI1DeGT+470fUHfIbcZrIzg/oHPThr
	Mh9e8bt9G2gC0ci/0kOKBNMfI/zqLYVod58KQQTBxgTR+Wlhj67RRlSQCPtAccZxfHBjQD96M58
	UW8GRyoR9Fs10ElXWwaD2is87gOAQXPd2486U/yD6Xf7JlUoHs5H1hF9e4iiZzgaDUbyQLjCEr7
	U97GkOhmyPgWq8dZoVTq4mcvm/M0jf8pZXFaEDrer4w+9C++Cpq9o9IIGo2szmy0D1SM58lp3Wo
	v83SZqQEv7ohW9tm2FUswm6+SJwlxXJIE5bCA7Nr6n1LuWsBeGFQOQ/bwNMNyDfqcQXF1i4RiuQ
	E2E9BbBoxhSb1/CMVQ5eMzcZE0ESPepT9qy0JdgnW4EOViZzcf1Fvf1UhGlLbLBlwVxkmRGhhmd
	w968iyHpivVfyQl8LKPM62Mjzv
X-Google-Smtp-Source: AGHT+IHoWEWE+TtZTJ0cy9Yvs69crqSSGNNoyhtuucNgNwoVZ+CPMCOl3bO3i+HB82uICz8hXQ35rw==
X-Received: by 2002:a17:903:287:b0:24b:4a9a:703a with SMTP id d9443c01a7336-290c9cbc0d7mr194895135ad.17.1761028551122;
        Mon, 20 Oct 2025 23:35:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm99609595ad.62.2025.10.20.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:35:50 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/5] libiec61850: patch CVE-2024-45970
Date: Tue, 21 Oct 2025 19:34:06 +1300
Message-ID: <20251021063407.232340-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
References: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 06:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120830

Details https://nvd.nist.gov/vuln/detail/CVE-2024-45970

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2024-45970.patch    | 74 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch
new file mode 100644
index 0000000000..d0f10287ba
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch
@@ -0,0 +1,74 @@
+From d5bd7cbf26b0254ce068ba7d940c26adbf9ce8e8 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 23 Jul 2024 18:50:15 +0100
+Subject: [PATCH] CVE-2024-45970
+
+fixed potential buffer overflows in MMS client file service handling (LIB61850-449)
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
index ec10f0990e..70d3b6d2c9 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://CVE-2024-26529.patch \
+           file://CVE-2024-45970.patch \
 "
 
 S = "${WORKDIR}/git"

