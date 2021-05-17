Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.21225.1621267615854995090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 09:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iAWJ985I;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id m11so9613213lfg.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3BN7tbaAy9IW/d9I7p3vMHMzU8tQ5uMdFNLAUVOfmh4=;
        b=iAWJ985InNr1PrITU8V/zGxyqjmVev9SzFp/0Y12gHOcEYZLBt1x2IByC4DzDtpBz8
         bRZlKB8h8ChYifRvrBi7VyPZrQoka2SJeHYB9JS2eFZzvludiZ9Kl8yae8BFI5KIyUQG
         PmbtD7ercQ+qDEenC9tWp1E+QK2w03teS6bbIx48+Z0So1k2ShtaZgMkd3gZ/8m1i7DW
         tRxAvuizBLHQV1R0RlkuJyjs7fSe3qKvm73j4Y9bF1rwxFY0uPG856UYIl+BZMUA/GVg
         FKxE6WxXh0swULWXPMmyvCmFrckdhLNMvSRWY2SyBT4eVmWsajL1DvDbV9lAd9DSkMcA
         9y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3BN7tbaAy9IW/d9I7p3vMHMzU8tQ5uMdFNLAUVOfmh4=;
        b=IEiRAOg+7tUYqdYjZI4LJA6uAMA6OhUMHplK7fG8phQ9iYeCIOm9K+5HEJPO5taVgl
         8fms9t75R2c811rWJTSPYjGw/4pWrUSAxDi5pQDkmsGKNDUr1oH3LjDrXtXYtDOW+wRy
         Jill2YaAmU1oUjJxVXpcHi9acM6FGPb/Y1YPQPYs5fgN1D/s4rPD0eJ8apFvJ9DUNJo4
         AhSAHG4qO2zxvyDnNJgCBvn0v0rP7Gj/6UdQvWaUvlld2NfQIN+6EtR/9OA7YjuDc0mw
         AMEgLhYPtagbpL4SvJNhl9mlflWRmc8SbNFByZvUWcQBVkV2bkMWDMAcbCWmnMPZjc2i
         D/Wg==
X-Gm-Message-State: AOAM531/8p8tGe2KzS36UZt70kitcRUR5jBHNtSDqWGXhNChQfcwoVcS
	3kfj7FVJYN6R+1wAWhk1RVr9dD7Ddmo=
X-Google-Smtp-Source: ABdhPJwgqgZCtfx10uvZ5ugHeQoWMV4RI1135aI4iiq/pCgftaUY8tDq3OtvMsLPdQIVFJNC5IoPjg==
X-Received: by 2002:a05:6512:3ba0:: with SMTP id g32mr448716lfv.552.1621267613779;
        Mon, 17 May 2021 09:06:53 -0700 (PDT)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id x207sm1997942lff.234.2021.05.17.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 09:06:53 -0700 (PDT)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-oe][PATCH] hostapd: fix building with CONFIG_TLS=internal
Date: Mon, 17 May 2021 18:03:48 +0200
Message-Id: <20210517160347.4039330-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch recently added for CVE-2021-30004 broke compilation with
CONFIG_TLS=internal. This adds the necessary function to let it
compile again.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 ...001-Prepare-for-CVE-2021-30004.patch.patch | 45 +++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
new file mode 100644
index 000000000..1bedb4f75
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
@@ -0,0 +1,45 @@
+From 14fab0772db19297c82dd1b8612c9335369dce41 Mon Sep 17 00:00:00 2001
+From: Alexander Vickberg <wickbergster@gmail.com>
+Date: Mon, 17 May 2021 17:54:13 +0200
+Subject: [PATCH] Prepare for CVE-2021-30004.patch
+
+Without this building fails for CONFIG_TLS=internal
+
+Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
+---
+ src/tls/asn1.h       | 6 ++++++
+ src/utils/includes.h | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/src/tls/asn1.h b/src/tls/asn1.h
+index 6bd7df5..77b94ef 100644
+--- a/src/tls/asn1.h
++++ b/src/tls/asn1.h
+@@ -66,6 +66,12 @@ void asn1_oid_to_str(const struct asn1_oid *oid, char *buf, size_t len);
+ unsigned long asn1_bit_string_to_long(const u8 *buf, size_t len);
+ int asn1_oid_equal(const struct asn1_oid *a, const struct asn1_oid *b);
+ 
++static inline bool asn1_is_null(const struct asn1_hdr *hdr)
++{
++	return hdr->class == ASN1_CLASS_UNIVERSAL &&
++		hdr->tag == ASN1_TAG_NULL;
++}
++
+ extern struct asn1_oid asn1_sha1_oid;
+ extern struct asn1_oid asn1_sha256_oid;
+ 
+diff --git a/src/utils/includes.h b/src/utils/includes.h
+index 75513fc..741fc9c 100644
+--- a/src/utils/includes.h
++++ b/src/utils/includes.h
+@@ -18,6 +18,7 @@
+ 
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <stdio.h>
+ #include <stdarg.h>
+ #include <string.h>
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index e58601868..a9780bc6d 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://0001-Prepare-for-CVE-2021-30004.patch.patch \
     file://CVE-2019-16275.patch \
     file://CVE-2019-5061.patch \
     file://CVE-2021-0326.patch \
-- 
2.25.1

