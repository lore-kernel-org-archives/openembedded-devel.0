Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A74CAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:46 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.6896.1758954752955003407
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDMKq1Yl;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-42480cb4127so33425255ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954752; x=1759559552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m/LECvka53R12+fNUK8SykYifzloCQCkaF5sR+osZY=;
        b=iDMKq1YlbeLnmHsyVThpLFceCRDIzqo0o3DzdIR3XmGRYB0UFriWEqvTChmZqrDoNL
         YuRme0HQqMtdFe4rhnYH6H+yBg2kuRLX1zOYsizq+1txLjeKnmV3kDyspagBNqQ9dCYN
         uOVrbKrA+yF4st6M7wLxy+5Gx+omdfOl+ZuSX4/3B2VgM8bLAjeqUNux7MVHu8one7wj
         Ym4Ezauge3of34dQGnsKk+Cj5hUvn1d9ua8pbavk0xGBKUXKVBSSQKcP3qsyfUoiHokM
         CP9F7PmsRYs3kaT/jJ6db1kckZU+Q7KYkM9QUUDovba7BDKbZISUDEwYGQ6zgYJzRU1B
         oQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954752; x=1759559552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6m/LECvka53R12+fNUK8SykYifzloCQCkaF5sR+osZY=;
        b=bMIozZzMP+09nxCBVJnjinCjsUz6cwAZv6gFmZcqTUwb21ae0g9Kj9Dqk5YH0+yiSG
         4hO0ic/tA+LRLBIY+JGnEjtYORHVpKxgmd/G4BJg/8wZLmdCkmBHbhO47hi/8u8A86lO
         gnQOGW6UedaXE1jQPQWY7u/Eo7aHkW+YLpv04o9vhRwiwuB4sHgm5n3/qdr2ffA69q4s
         qL3mKmAQ2DwOfvgu/OjGstXfPg0uUnhkF/K3VZwYKCjywZ+tdhruhQbCUEu83zcpuY3M
         78ioZQLXP9aZHTenxRrM5anEuXEgI/A/kSWOw1EpA4cmXJOt2uT582J/H5f5NrqWClDa
         u9zA==
X-Gm-Message-State: AOJu0YxPKkgyGvHZhpj2Ph5hxN+mBoDWN862TFMW9IUZrdgpbnqQZ+zm
	pDl+cvwvi6q9CW6OGcnoMaexJOxVz/Ub0XrMutPjVya/ChCSyBdDfYEphExKXw==
X-Gm-Gg: ASbGncsIoghfcR7kKOPjSJhEsfFHg1JIfZqsnyW09fm47lcapm3H27hpFz+9T9wStxB
	y5EzdCTZzTyWCbMcaWL0iysgnZ4TVGP4q+rl0FgUaPmsnQsEWOHgEQNlMFxXcuGo3hlYZIvJPT0
	CMR4wFIxtg/P9LLpVKFkOCGMQeMSfQP+Bw6hY+cKOSbdFRH+GyFdQ99dvKtn0A0vwoexujgkDmu
	PRVTohK8/IYK6l3mwuQP4rt/9gR77S6sEn6Ws4t5AUz4SZRr+BZYYQ9rHKt6UpuJMIpFKvfLBIC
	OlnHT2uUqxV8dsEnNm92A60vHqkilbaqWpq0fMKuSYRfAjmqIaodEaUaJJqce3fvzqk3g06vu9T
	o9FFNHw2TzbIfnVw8fIMNxYv5IDPAttpnLrZ7JjjseeDVOnfym+w=
X-Google-Smtp-Source: AGHT+IHdU8QYB5WUciSjHHrkqVYn130HfJ6K8A73YEt5Aoxd5gQ7cwMuTjJY9KOsXxAa7T4Qrg6epA==
X-Received: by 2002:a05:6e02:2293:b0:427:364b:2201 with SMTP id e9e14a558f8ab-427364b2240mr79775615ab.30.1758954751859;
        Fri, 26 Sep 2025 23:32:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:31 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 03/21] hostapd: Backport a patch to build SAE-PK correctly
Date: Sat, 27 Sep 2025 18:31:58 +1200
Message-ID: <20250927063216.1865627-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119957

From: Peter Kjellerstedt <pkj@axis.com>

SAE-PK needs base64_decode(), but if no other feature is enabled that
needs base64 support, then it is missing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c9922073e4fab54b5b743947b68bda75dc72b064)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 +++++++++++++++++++
 .../hostapd/hostapd_2.11.bb                   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
new file mode 100644
index 0000000000..e790e8e0f2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
@@ -0,0 +1,40 @@
+From 430bc89b9a29537d9d22bb42406f3d14072a01d4 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 22 Dec 2024 18:53:12 +0200
+Subject: [PATCH] Include base64 for hostapd CONFIG_SAE_PK builds
+
+CONFIG_SAE_PK=y needs base64 functionality, so set NEED_BASE64
+automatically for it.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=430bc89b9a29537d9d22bb42406f3d14072a01d4]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ hostapd/Android.mk | 1 +
+ hostapd/Makefile   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/hostapd/Android.mk b/hostapd/Android.mk
+index e6c2fbf18..6e0d77d28 100644
+--- a/hostapd/Android.mk
++++ b/hostapd/Android.mk
+@@ -260,6 +260,7 @@ OBJS += src/common/sae.c
+ ifdef CONFIG_SAE_PK
+ L_CFLAGS += -DCONFIG_SAE_PK
+ NEED_AES_SIV=y
++NEED_BASE64=y
+ OBJS += src/common/sae_pk.c
+ endif
+ NEED_ECC=y
+diff --git a/hostapd/Makefile b/hostapd/Makefile
+index fa0d366a8..c3419c10e 100644
+--- a/hostapd/Makefile
++++ b/hostapd/Makefile
+@@ -299,6 +299,7 @@ OBJS += ../src/common/sae.o
+ ifdef CONFIG_SAE_PK
+ CFLAGS += -DCONFIG_SAE_PK
+ NEED_AES_SIV=y
++NEED_BASE64=y
+ OBJS += ../src/common/sae_pk.o
+ endif
+ NEED_ECC=y
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index 693afe6c53..daaf2dcd55 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -8,6 +8,7 @@ DEPENDS = "libnl openssl"
 
 SRC_URI = " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
+    file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
     file://defconfig \
     file://init \
     file://hostapd.service \

