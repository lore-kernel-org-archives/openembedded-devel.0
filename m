Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E705ED49C64
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5561.1769756787577961577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJXoXkwP;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48069a48629so17917585e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 23:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756786; x=1770361586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWQnIDLe1mEqxFrMpGvwhDFwIPDqJ3imJOkpskoTWqY=;
        b=VJXoXkwP/VnqHYSj9RqWeoH+TWIy2R0MZHTeJaI5DUHH8v5Hu2NUGc8xQnrBrjY/af
         QbePVZ9PF1ca93nwi8sd+Wobt45vuP6F0YwCA8yBCI/4qZgCnSoj43YbSS2UqDkiSIre
         2G72Li94i5hhYw2/lkmPRYLfO58XqE5m1wB2j1/Rr0fP1SJPIiq7SawRUDxdhwVP7G/v
         kw9CTMBmzKL2C9Q7W2yVu1Jw12K3KKrz4yUHQgVDjS2s6/Lrg/n7kOKAasdPv2aCUvfz
         /nlpkDEybGUZcVeFwB5W1HpPxJunDb06TL7Xp4wrmpAYZOEX6BIZ/uAoVemkYJbpLOVL
         7Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756786; x=1770361586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EWQnIDLe1mEqxFrMpGvwhDFwIPDqJ3imJOkpskoTWqY=;
        b=IBM1WUdnk4Mki3Lf3qhQB/aU97U9irQbjIgh9xjZFKJdvOGO15mMLBViQ9ACTG+H8f
         WnMfhm2nDFkRaZ/MuqqSJUJRyY+ElPM91pOO/Viwv2E3mW8K+9gj1xQU0Z+fIkh2wVwb
         kcjYI9p7svQzHq3BEXi5K+T+sZDztx0jLYlN6YfNQ10MaGsVQjM9BFqRA7pkOHaWvc74
         2oP6MDHEomasLloQUDBUBtoQSFKvqy43Sjdc9jSndkNlZnMtAt5Dk5r03eLd2DZfY2Re
         t84W++X8guQdZb+RtbwGQkeen1a49HgozprId2wn9V2aDRf60wgxoXM2HBGH6hDn/2RK
         oDgg==
X-Gm-Message-State: AOJu0YwDs7Lqt3LrtWY/mgVu37EHBaoc/D3Fsm/QRA56JGL00oJ5R+50
	7EqLlZX9JFx8bZfhiZJ3LOdTNpYeoiD6mvxIETBcFLU+Rt0wpjiPwlYzgAvNLA==
X-Gm-Gg: AZuq6aLk7fN1+sSsY2YkDK4MISvo09NwnhwfnJDT2jGaZG3Av3tsJrbbSZ96j/vl3Vf
	p2FCPR3GyoIIlHqx3XiekiKuT0g8rMn1DuVBPKki5LeV7Hf7dQ5on9OjNDCg5hSRRFFbYhPxI1p
	vazzb2FlcXwM21Yji/R+yPP+snDpMAZ92lPJ316/lqeGb5Oh7izku0JA/hEFpRW+jKL9hwsBdQN
	kYJ+QLp0ik9FKMPzIRxiQpXpoJnNu47eJjdsFeugvkxCp2eLgzBeRym/QYtSDosqBEtGbUvvNjP
	p/Y21jZCsG8GYid02WXFD/sOdu5llpCw4GnrzCpYCJ2IkiHxqDzPOxegO8zlLGeMrP4wLhKKTjD
	ilkeZg+pfkL7CvrbTQm53jOjAziMcWQHqS3rPQyv5SKKRHsrs2skRzc30g4kQ0kWEuRjuDRbdXW
	Lzb0BHVJQDDAw8mUuzWMo=
X-Received: by 2002:a05:600c:1c26:b0:47e:c562:a41f with SMTP id 5b1f17b1804b1-482db481c92mr21690005e9.18.1769756785824;
        Thu, 29 Jan 2026 23:06:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm280057445e9.1.2026.01.29.23.06.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:06:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 5/5] libiec61850: patch CVE-2024-45970
Date: Fri, 30 Jan 2026 08:06:21 +0100
Message-ID: <20260130070621.3171877-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130070621.3171877-1-skandigraun@gmail.com>
References: <20260130070621.3171877-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 07:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124001

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-45970

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libiec61850/files/CVE-2024-45970.patch    | 71 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.1.bb          |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch
new file mode 100644
index 0000000000..81759438e1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch
@@ -0,0 +1,71 @@
+From 554e77c542f1c09b689907d5e2ea8bff4b2ad969 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 23 Jul 2024 18:50:15 +0100
+Subject: [PATCH] - fixed potential buffer overflows in MMS client file service
+ handling (LIB61850-449)
+
+CVE: CVE-2024-45970
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/ac925fae8e281ac6defcd630e9dd756264e9c5bc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/mms/iso_mms/client/mms_client_files.c | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/src/mms/iso_mms/client/mms_client_files.c b/src/mms/iso_mms/client/mms_client_files.c
+index 307ab534..1aa8dff2 100644
+--- a/src/mms/iso_mms/client/mms_client_files.c
++++ b/src/mms/iso_mms/client/mms_client_files.c
+@@ -478,8 +478,13 @@ parseFileAttributes(uint8_t* buffer, int bufPos, int maxBufPos, uint32_t* fileSi
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
+@@ -506,12 +511,14 @@ parseDirectoryEntry(uint8_t* buffer, int bufPos, int maxBufPos, uint32_t invokeI
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
+@@ -525,12 +532,20 @@ parseDirectoryEntry(uint8_t* buffer, int bufPos, int maxBufPos, uint32_t invokeI
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
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
index d36a3c9306..ce6f79e996 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://CVE-2024-45969.patch \
+           file://CVE-2024-45970.patch \
            "
 
 S = "${WORKDIR}/git"

