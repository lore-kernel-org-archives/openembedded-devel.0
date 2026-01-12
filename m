Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B946D2503C
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 06:45:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28229.1768200298461973358
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 22:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lexI7a5+;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775ae77516so67019945e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 22:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768200297; x=1768805097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zcLkWFOWEo1f0xUrse4d+VH4Wo9zUNPuynrgDVwXYE=;
        b=lexI7a5+JGEFzmKMne0RTlHhp6Aw1sE/ScYDkdU+Au+OdNzmNrLJqebM36WXzjyBEd
         itv0SLJQD2BDFqkoFH6xJnrQLhPu4FW91vH/ZvhPmwLxWKs+zOf3uC+VHRPVcd8iIn1K
         /AVb4n75fruU3rzlQ5hHxZE/S4wDxATpJZ1RQ+zrWiGW3Lrz9kgdnnkh8EevzlYuJN+W
         bReytbxvsIsuSPAQmr6YmOqL1UQtFzkZ8lLlIMg3U5EhPjpZgLDUlnDvtuHhAA7Ueh/v
         99zkHx6FQIwMnRc5YwahOWm+wutl9S30u7r6oYkANiSgYlx39loC7NLl8/fEWzFMX2eA
         Bcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768200297; x=1768805097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zcLkWFOWEo1f0xUrse4d+VH4Wo9zUNPuynrgDVwXYE=;
        b=gO0OOyH2gmuP7dDceK82UGfrMeoRjaphV77zNWksIy/y6z+dCDvJDzB6za8gx2YOPt
         9vy9TnfDAQd3McRdcjNGILnuxhVEzOCKtgrbqfv5pyDJKumib/OiIj2JpZqKEDjyNiMf
         4S3NsOKR9AMJT4XsWJDSIY6W4RXi9l4BhH26eP5yyhepK/u1K6ikGf2kayHnQQ8+qIt0
         9GI9cVbosIukju6zEO8fYqJpN0mL2tpUHXGYnTKbr3/lfRoz20eogOyGOKqi4/EmKreV
         GBMf2lLnMZWlcTxcnoAALfTg76j9oX7DynAp+ZOXKv+gHlANMyjIX9GyAByqilII4Htf
         zoUw==
X-Gm-Message-State: AOJu0YxiFtZ1thjhA8bv18YRo6Y3bHhK4RYFxP4GJ5bfN34U+iROWdwe
	cINfOeD5lYPXWY+AHPM/Whfl1bMHSkSDq/24L6IFbUdHc/vICyN/xd0ykYklhg==
X-Gm-Gg: AY/fxX4GsEzCyOhvYNRV4969u34qoe8EF6KEy1+V5ogCggmYylPZ9QsYP9nX3RattJo
	Tg1PIRIkY5u8QJ7X1vavauqEIz4K7YTXeU9el1SPiukVJR6DkjgdlrDEFGPh0QHu5oZCj4BS3mq
	98ymb2pXeopuM4hIvpwGR4guex7h7S/OAn+k3SUM4UDy/0TMPinIpGOhJ0V1Tj1RP7t7E54q4kx
	McGt+vcC26Dco9joYfJ7iuE/b9CRtYqcfiNMeOd9bbPihRwbeNQfDr2h1PeCPCvt2ict04VmUx2
	UIYkRWuw4rEdbt57YjFyi6/sgDl/RBB8trqzWIZtMPzT5MTHveFP2Vkm42yaqPHBDN8mJOcaHmz
	Iyu684Yn+dOMexbF0Dfak+8EQxiRWcgF+eWWL0px49/I0EbuK9wZww2vHnnedo9ROeSTaZwREad
	zfwAj/4I1S
X-Google-Smtp-Source: AGHT+IFfbaasYHIVoHNkPjWRLyCGGURlexqy7Jh9sD2FWbzF3v02HmtYPanESHJA5dGNen/uIrk2Fw==
X-Received: by 2002:a05:600c:5490:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47d84b34819mr178616805e9.20.1768200296106;
        Sun, 11 Jan 2026 22:44:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184e1sm328817195e9.4.2026.01.11.22.44.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 22:44:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] freerdp3: drop CVE-2025-68118 patch
Date: Mon, 12 Jan 2026 07:44:54 +0100
Message-ID: <20260112064454.100076-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 06:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123357

The CVE is also ignored in the same recipe, because it is a Windows-
only vulnerability. Due to this, the patch isn't required.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2025-68118.patch     | 57 -------------------
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 -
 2 files changed, 58 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch
deleted file mode 100644
index 8077d61292..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 054ff633bb1eac3d165a501d5eb691af1faf0538 Mon Sep 17 00:00:00 2001
-From: akallabeth <akallabeth@posteo.net>
-Date: Sat, 13 Dec 2025 17:28:43 +0100
-Subject: [PATCH] [crypto,certificate_data] add some hostname sanitation
-
-CVE: CVE-2025-68118
-Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/83d96a81f320cb8a047fd4ef059a6fe4016dbeec]
-(cherry picked from commit 83d96a81f320cb8a047fd4ef059a6fe4016dbeec)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libfreerdp/crypto/certificate_data.c | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/libfreerdp/crypto/certificate_data.c b/libfreerdp/crypto/certificate_data.c
-index a48beb448..6408d5d3c 100644
---- a/libfreerdp/crypto/certificate_data.c
-+++ b/libfreerdp/crypto/certificate_data.c
-@@ -33,6 +33,8 @@
- #include <freerdp/crypto/certificate_data.h>
- 
- #include "certificate.h"
-+#include <freerdp/log.h>
-+#define TAG FREERDP_TAG("crypto.certificate_data")
- 
- #include <freerdp/log.h>
- #define TAG FREERDP_TAG("crypto")
-@@ -64,8 +66,9 @@ static BOOL freerdp_certificate_data_load_cache(rdpCertificateData* data)
- 	WINPR_ASSERT(data);
- 
- 	freerdp_certificate_data_hash_(data->hostname, data->port, data->cached_hash,
--	                               sizeof(data->cached_hash));
--	if (strnlen(data->cached_hash, sizeof(data->cached_hash)) == 0)
-+	                               sizeof(data->cached_hash) - 1);
-+	const size_t len = strnlen(data->cached_hash, sizeof(data->cached_hash));
-+	if ((len == 0) || (len >= sizeof(data->cached_hash)))
- 		goto fail;
- 
- 	data->cached_subject = freerdp_certificate_get_subject(data->cert);
-@@ -97,6 +100,11 @@ static rdpCertificateData* freerdp_certificate_data_new_nocopy(const char* hostn
- 
- 	if (!hostname || !xcert)
- 		goto fail;
-+	if (strnlen(hostname, MAX_PATH) >= MAX_PATH)
-+	{
-+		WLog_ERR(TAG, "hostname exceeds length limits");
-+		goto fail;
-+	}
- 
- 	certdata = (rdpCertificateData*)calloc(1, sizeof(rdpCertificateData));
- 
-@@ -251,5 +259,5 @@ char* freerdp_certificate_data_hash(const char* hostname, UINT16 port)
- {
- 	char name[MAX_PATH + 10] = { 0 };
- 	freerdp_certificate_data_hash_(hostname, port, name, sizeof(name));
--	return _strdup(name);
-+	return strndup(name, sizeof(name));
- }
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 6e27efb5ce..55cb356be2 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32661.patch \
            file://CVE-2024-32662.patch \
            file://CVE-2025-4478.patch \
-           file://CVE-2025-68118.patch \
            "
 
 S = "${WORKDIR}/git"

