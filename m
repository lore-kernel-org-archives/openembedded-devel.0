Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072DBD49C65
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5536.1769756786903525466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtRjWPSb;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so16514915e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 23:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756785; x=1770361585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4fcbSXDM/gMqRmNIMjwL8SCWylaU5iwF/x3uxmBFDA=;
        b=jtRjWPSbBho7z/JJXC9LGu+Ri8ganvatJybpotQotFb5RUpM6Zp5m/ZcPzWn5OOkTc
         KA9p8xngfSWSM9LPUmJUqqZAjo0RgVTMPr/J0ciUd4WWOdcivP0CreImMcIgQPltTklf
         dvmUMCsATGnWahzOczOiReDCj0XkFoM31i2o5lpUhqfudJCdTkQyJ4ypAlYs1wL/hoUg
         EWLyk8Ty1zd3hFFyN4g4oJl7iSeJ4SZSMQkNWMqGG00QXBbVp0xMdbPNHgYwMaV4pOj8
         fIa4PNNpZrOaB0aOQ2DmK4TaApgB/JzekxIIzr0Wx+nqyB0aoJi6+ddvl0zX3pEY7eGo
         jikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756785; x=1770361585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4fcbSXDM/gMqRmNIMjwL8SCWylaU5iwF/x3uxmBFDA=;
        b=FPtQSt+cnWO3DUAW1F1DeRtBEjkz2SnoFovZn6JR6BVRtUEDP4WFWEKFFyZSHlkxRP
         oAT2BbQVw+ozX0576NkXopJXxyYqGrmZt1Odynpw/Po0i5Qqwo52R/erqa5thXkEKHsr
         62OMMCWhp2QQekvJyav1a4xT/2mrzS7gGlugRaaDh3mwN2A1G14/GJd/n8h5vCzR+fbl
         ugYHE8uk+1IVTTlyALGXEip01l2v3ebcuR3JZV7A5TW7yIuLCL35ZGyj+fWdcN4mO5tV
         NN+XBpFFYZaHCCSyefQxKy6SKA7DzJ8f6oVSWbXXyS4yshe5k5MFMOdeNhjUpxXV6ZRX
         qYhQ==
X-Gm-Message-State: AOJu0Yy5DdgL4Q6SvJ0er3LdrQUZGfiJ6NtDKMXEh4gjsbaZ3WMOcMZ5
	M+OrDLOHymU2IGCcTvXkGR/g3PmLaDzMxl3I3FErzjWTYr3+L3AelEOW091Pww==
X-Gm-Gg: AZuq6aImAAr/rCD72toM3EupYg/b9igiWjPsBwSqaBAfs3FmfTN+4iTkWgicw1H6dXG
	J5UAzB9kqwLefYS2XxWbGbR8AENCQ9enLFYyLh6vXkXy0OVMxJqCP8caZkaLCtIbpsV2zEvlNXg
	KxAmm2PtbbXX9RK/vPycr0D1Xgj426y8ceQJpbT3RuemaTqGlPOmyGBH7IexaVj1elo6IBwmSKz
	aN7YNMY0ZAutZhkghY4NpUaZ5pjvi4QHtLh/D18eX2HqCYeQl8SzR2l4GsSocyjVpH6lZes23YR
	UVGJZJCv6rhFwC4OLEXQoP/X0oyRTpRClyrogOF7Xy66CWoVad9EIy4VMM8cGDrz3Pye51eUugO
	rYri051Y8gPt7rzoO1lPTeWiPt918ka81eZh59eXy48WUx4FjKbMiV0uc+iEHr4AJJq5mH6SZyU
	fgI0xNmPjf
X-Received: by 2002:a05:600c:6214:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-482db49dbd5mr14806185e9.34.1769756785205;
        Thu, 29 Jan 2026 23:06:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm280057445e9.1.2026.01.29.23.06.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:06:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/5] libiec61850: patch CVE-2024-45969
Date: Fri, 30 Jan 2026 08:06:20 +0100
Message-ID: <20260130070621.3171877-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130070621.3171877-1-skandigraun@gmail.com>
References: <20260130070621.3171877-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 07:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124000

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-45969

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libiec61850/files/CVE-2024-45969.patch    | 31 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.1.bb          |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch
new file mode 100644
index 0000000000..d1dc8f0e6e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch
@@ -0,0 +1,31 @@
+From d1afa7d8946ff05f73440e1fb5c14adcd5058b0d Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Wed, 27 Mar 2024 12:26:58 +0000
+Subject: [PATCH] - ACSE: added check for minimum message size (LIB61850-438)
+
+CVE: CVE-2024-45969
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/7afa40390b26ad1f4cf93deaa0052fe7e357ef33]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/mms/iso_acse/acse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/mms/iso_acse/acse.c b/src/mms/iso_acse/acse.c
+index 60b0f534..1f4d6eb9 100644
+--- a/src/mms/iso_acse/acse.c
++++ b/src/mms/iso_acse/acse.c
+@@ -420,6 +420,14 @@ AcseConnection_parseMessage(AcseConnection* self, ByteBuffer* message)
+ {
+     AcseIndication indication = ACSE_ERROR;
+ 
++    if (message == NULL || message->size < 1)
++    {
++        if (DEBUG_ACSE)
++            printf("ACSE: invalid message - no payload\n");
++
++        return ACSE_ERROR;
++    }
++
+     uint8_t* buffer = message->buffer;
+ 
+     int messageSize = message->size;
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
index 3e5fc91dad..d36a3c9306 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
@@ -18,7 +18,8 @@ SRCREV = "210cf30897631fe2006ac50483caf8fd616622a2"
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
-"
+           file://CVE-2024-45969.patch \
+           "
 
 S = "${WORKDIR}/git"
 

