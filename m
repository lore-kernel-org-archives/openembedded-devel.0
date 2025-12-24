Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DC3E7491C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 06:02:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115564.1766556120781980620
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 22:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ext8OF4Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f30233d8aso69380325ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 22:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766556120; x=1767160920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOOgPvQCwCLGsyLUUVIR6lgfFFMhtib5zbfCF6NBw/0=;
        b=ext8OF4Zhhaw5OD7OhtJ2oN7t/7Iwi66uNYyJDYVFysdX4fXQKC9QVToBRSCD/+Jrq
         hqzoT1fat6FKwiu6lDvN33g1eGu0Rjb4F9yaqim1eGittDBEzB9qlUyT4iMEapv1LRjC
         GIemsr4yn/WOfJu6ZNESU02q/h5UW6A+LObizEUL00PQTjP3aLQUlWz6rFixjmBc64D+
         evP36PPBjMtSARb3Q5YzENYdLVanD8KM+PFYnpxYvZodoE7WCynKkyxFR6XwvGHiPWZ0
         UjBbKrxvYOYaT9xWIeBuWX7HxN01kEZ9dW+I+16Rp12AYGNdsfs41lnQq/Gn6iaXvyLj
         +Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766556120; x=1767160920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOOgPvQCwCLGsyLUUVIR6lgfFFMhtib5zbfCF6NBw/0=;
        b=i11iHjHRVy0rZiRp/NYOrAzW+iZrphZsCK53h+yIAiQR+1mS8SO/YGfCJLprRIMNJw
         tHHnqZcwKe6qxdet89lJ7LrU9GUh+pyYpNelLXDpk50wNxVZGLW55qjSiM0A/wz3evN0
         2psKXLmUsfxx9lTXchhuQt0XDuQHpgKQN5NhVwdQeij4B2u2OcLbua5IP+uFUpc206Ar
         8IMUPWI9rCvGyrDCzZHpLb6nrX3LUXNpBGf8v/Z5WiK91P8Nk0p8X+lwIKPO3FUvrQXE
         HAPOzQ1I0Lk14Q+V3dOI8Lsa0/LGmC6/uMJGfoRYoUbsHcRiyNHG866OCtuku5U2Po8C
         ghXA==
X-Gm-Message-State: AOJu0YyYXGByzir0xV4PYi6fbDI7LAiAyitHu7/y+faPGAoCxL8lKHJJ
	07yFXxxGa8nYBPYqMr6/P9AmjhEtH25mITPGofleQR5yD3QsovrgZ1SFu3EvLw==
X-Gm-Gg: AY/fxX5Wk1twgjncma9wkN3pGdA2PNtmGMqq0jLTTNRcRUgeufYup75jzJYP+3rS5gD
	7osv9Y/9phy1pEmsdRi0My8xbbaF7oOi95/idzvzCLOrhlq/UWK+4cowt4G+1k+ZAuEEz/ZT2kj
	Rk7qkjku1dNE9/RC437OFEWvB8rfDXghqAh3rNa2jTYgELRasgkCN7RgtwpaTNZsvvpqaiOhzi5
	jTD5yGbs46W260PT799H1STNgwV0/QTu7dOmMB2UwJZiIqRzJYWTGczTlz9smAVB8HbXOjTO18+
	1v/MeIMutv9hl+sYgQ9g+xDetRau5XAL1vnB88tgxggXaincjtkiWzRlQ2YILvIkhXwbqbvh4WS
	dJ+tFijXEjEPMHha04sG5GWIgU5dnXOgL6dYfriy+S/aIFsOVRmYf1ihrsHUj4i4Atyg0NXxs6A
	2EULnDV9jP0cjE3NWYJ8+gUimn
X-Google-Smtp-Source: AGHT+IEsn7jl2qkTwjgCIJD/WoA446HraYf4YITa7wrrRR+5ZDjOuxuPqxv0TLYsobh5yvPXFp0UEg==
X-Received: by 2002:a17:902:d4cd:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2a2f2830566mr162979615ad.41.1766556119781;
        Tue, 23 Dec 2025 22:01:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb9csm142554555ad.47.2025.12.23.22.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:01:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/2] freerdp3: patch CVE-2025-68118
Date: Wed, 24 Dec 2025 11:31:50 +0530
Message-ID: <20251224060150.1294484-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224060150.1294484-1-ankur.tyagi85@gmail.com>
References: <20251224060150.1294484-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 06:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122844

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-68118

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2025-68118.patch     | 57 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch
new file mode 100644
index 0000000000..8077d61292
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch
@@ -0,0 +1,57 @@
+From 054ff633bb1eac3d165a501d5eb691af1faf0538 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sat, 13 Dec 2025 17:28:43 +0100
+Subject: [PATCH] [crypto,certificate_data] add some hostname sanitation
+
+CVE: CVE-2025-68118
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/83d96a81f320cb8a047fd4ef059a6fe4016dbeec]
+(cherry picked from commit 83d96a81f320cb8a047fd4ef059a6fe4016dbeec)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/crypto/certificate_data.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/libfreerdp/crypto/certificate_data.c b/libfreerdp/crypto/certificate_data.c
+index a48beb448..6408d5d3c 100644
+--- a/libfreerdp/crypto/certificate_data.c
++++ b/libfreerdp/crypto/certificate_data.c
+@@ -33,6 +33,8 @@
+ #include <freerdp/crypto/certificate_data.h>
+ 
+ #include "certificate.h"
++#include <freerdp/log.h>
++#define TAG FREERDP_TAG("crypto.certificate_data")
+ 
+ #include <freerdp/log.h>
+ #define TAG FREERDP_TAG("crypto")
+@@ -64,8 +66,9 @@ static BOOL freerdp_certificate_data_load_cache(rdpCertificateData* data)
+ 	WINPR_ASSERT(data);
+ 
+ 	freerdp_certificate_data_hash_(data->hostname, data->port, data->cached_hash,
+-	                               sizeof(data->cached_hash));
+-	if (strnlen(data->cached_hash, sizeof(data->cached_hash)) == 0)
++	                               sizeof(data->cached_hash) - 1);
++	const size_t len = strnlen(data->cached_hash, sizeof(data->cached_hash));
++	if ((len == 0) || (len >= sizeof(data->cached_hash)))
+ 		goto fail;
+ 
+ 	data->cached_subject = freerdp_certificate_get_subject(data->cert);
+@@ -97,6 +100,11 @@ static rdpCertificateData* freerdp_certificate_data_new_nocopy(const char* hostn
+ 
+ 	if (!hostname || !xcert)
+ 		goto fail;
++	if (strnlen(hostname, MAX_PATH) >= MAX_PATH)
++	{
++		WLog_ERR(TAG, "hostname exceeds length limits");
++		goto fail;
++	}
+ 
+ 	certdata = (rdpCertificateData*)calloc(1, sizeof(rdpCertificateData));
+ 
+@@ -251,5 +259,5 @@ char* freerdp_certificate_data_hash(const char* hostname, UINT16 port)
+ {
+ 	char name[MAX_PATH + 10] = { 0 };
+ 	freerdp_certificate_data_hash_(hostname, port, name, sizeof(name));
+-	return _strdup(name);
++	return strndup(name, sizeof(name));
+ }
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 3558697d42..b9ec75236b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32661.patch \
            file://CVE-2024-32662.patch \
            file://CVE-2025-4478.patch \
+           file://CVE-2025-68118.patch \
            "
 
 S = "${WORKDIR}/git"

