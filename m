Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BB3E75422
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:49:49 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116907.1766562586163041634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KoS4XsIf;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso6558029b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 23:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766562585; x=1767167385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1LMekRdgFt35f0VGNsYV6+wEusolRNj5VHPTWGAy94=;
        b=KoS4XsIfwC3DGnbiV/Q7Bqg1FL0bUlMMXRiWiRmllxQgsg7/M4wFRbeEhpQd3X4Xpk
         KHhASVCI9F/hu6b3OnfuJ6+y+qfWM8Q8kaN7WRvYBRcNA6tZdy7UlcEGh55v+3ecibpP
         G3uXOwMDBDIicAE+AsrEAsvkUt+I5kQj89Bj5nAYPQpjzK6yreV5rchUHp1/N3iXE2UF
         ZTJSfytPCaLf4jADMmhysGWQMsIbW5XMZcvv8X9E393hHwLOJU3fbgiGrERyhEiuPZkC
         pkT2UEO9i7/yBRf/nHKaDRNtH8XJ2shMO0wz5GZiOuNNqNuChUaZpSuP1JnBuWxvXuX+
         6ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562585; x=1767167385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1LMekRdgFt35f0VGNsYV6+wEusolRNj5VHPTWGAy94=;
        b=RNayNKfcPSP4uiL3QV0rY9MGPwXy2gcGiMjgZ4lnctDzEbpVl+eF1Xl0dlu/Ac3sSL
         3wPoP+wtIZ7TNwFcxMeslopsYPnPmaJzNI3q85aGzjHhsKZj6voYyNYCq0cqfNJV1gfw
         7qOm0RigVVs+JRnMTuIYw902WDITsQdOkv0WVosJSUUGC0Y0uKp6+DVUjNYccPyFS3ZX
         D1AvY4J3fb1YD+5I90ZKbYwgrdYODOxiw4ogsj9+ODI5e6mac8QdnkeKDWvq448s9CyU
         yHJFwJ2aqMc7zaa2dbUmP/XqmenArD8vx90/SxilI4lld1rcmoxL8jYLneSq66sXL0jn
         kLFA==
X-Gm-Message-State: AOJu0YwyeWJ4YSzNXnb+Xe4YzSz00ZxP7H0EqJGeu2SHGrYKf1GqqO4R
	IpjqOGJadIGM2IvfpoRRJm1jyjeoS6nnI/yjAiZDIsxSbQgU8vl+2Zc9xnUFzA==
X-Gm-Gg: AY/fxX5YSY0M8aDlk3RYEj0fG5xSy0O07a+/55Tj0D7MJ1dHRPBun7uQsE54kvbf7+b
	YZIoq69ZKbODrtfJhUGMRQgPs07VUcc+Xuo7DV1Iw3TMIsML/WoQg0Lz3HMj0zxIOh6KLZyPA0E
	U5zuK+TUxyCcNoJSNI6BiP1Nef7lp98vLQANy+9wLEvdBI0QiZWblcKk/OY2NuVWlenDzvXVhaV
	JgBTkteI0lKBnjOMd1b5lBetfL7ftfj0Uk19Tnzzp5/rAbCNw5Jw9dSD4znBt72Bb6DZbnPB1ZF
	wu6a/twSHVxPaM7CjqWXVGWqyVxMJ9xDRuD0i5vU7VuP8zJLKtUc0IvzP0YkWVYg1i7e8pDuftd
	KDQAFBDIUdD1WWKxDNbm1e/ZOk20P+po6lMjnsSIIdevAtS0zc3t+kPKiPbA80EqzghUSl6mO8s
	r6zabeiAQOHvo10/X185WnwmSQ
X-Google-Smtp-Source: AGHT+IFu2Da4XUEPNk3fHSdYMK34US43+BTlvpcxhV92rAc5ZlkGHQYBAAXB/+CtDudRtVakL+vO2w==
X-Received: by 2002:a05:6a20:244d:b0:366:1e11:11e6 with SMTP id adf61e73a8af0-376a88c865dmr16728228637.4.1766562580636;
        Tue, 23 Dec 2025 23:49:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0b587sm13847084a12.33.2025.12.23.23.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:49:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/6] libiec61850: patch CVE-2024-45969
Date: Wed, 24 Dec 2025 13:19:28 +0530
Message-ID: <20251224074932.1379914-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
References: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 07:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122847

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-45969

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2024-45969.patch    | 32 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch
new file mode 100644
index 0000000000..99caab9cf1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch
@@ -0,0 +1,32 @@
+From 9dfac54daace18d3d3b0ef09d8beecc562e29c1d Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Wed, 27 Mar 2024 12:26:58 +0000
+Subject: [PATCH] - ACSE: added check for minimum message size (LIB61850-438)
+
+CVE: CVE-2024-45969
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/7afa40390b26ad1f4cf93deaa0052fe7e357ef33]
+(cherry picked from commit 7afa40390b26ad1f4cf93deaa0052fe7e357ef33)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mms/iso_acse/acse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/mms/iso_acse/acse.c b/src/mms/iso_acse/acse.c
+index f46b024d..40ecafe0 100644
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
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 20dd447c7e..ea8c16e3dc 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://CVE-2024-26529.patch \
            file://CVE-2024-45970.patch \
            file://CVE-2024-45971.patch \
+           file://CVE-2024-45969.patch \
 "
 
 S = "${WORKDIR}/git"

