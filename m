Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.34932.1622399681537774935
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XpJff9UM;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id y15so3374665pfl.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PwcjOQKCh9cBxbHJ47D95nYWB51p/5PJEUy2PT9wnXE=;
        b=XpJff9UMfjgXeEJak3YX58gbonj/FRLA29CrNnLqug2gHDYMXxTBhfy3911A9BIOV0
         boIvtpRvEv16jqwnyx6x6lKpb0RM71A1NlsM8WbYjzQuijwqAhjeYT6RrpGX4lx0bbdC
         9u5PsYntWC0YXDvJJFb0g0MbndZvBnmc84LObeHB7Sg1xEXqn/LSniq4s1uPKj/avNfZ
         W6uQCRZ30tzrLIJvY8Ao0X2LuoseHufh63bgGwKOX4dfa2nuxk0ciYg4aMxpE4+5k2pk
         ebDASWcc1ga7k71p1sI28DZh8Fu4sEh63baVsAmCN97vtCy2WRRNBa0u1+gftNyOPVsN
         3HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PwcjOQKCh9cBxbHJ47D95nYWB51p/5PJEUy2PT9wnXE=;
        b=OEWyUog+I1THu1p+p4uQqHbreZqlLfUXJpGMXLJaL6zw2kY7973BlFFu1YD7WuSzMI
         pnSsVps5XZNdbPpcnM0xe0o9/HaaSNVNnP8tBdzUuf4oxOlxm7KbNaGNzQoNR+veAWag
         BX8conQZSImkJbkztyAVSgl1+U6gTmEt85J2EEiSrdm/+Pa+Zb3yQn6aBSRAQ6ht8L9R
         wfL9fLl/oM1muqytmV0myYb5dkTA2E9utzFgQA5MUV96Sl9fXG4slqLb0dcX71S3o+jP
         uMloApJpz+spTVDG0L9XmyUhPuOZRPWL2Qep2GBr77MNo9HkOvJspdq6DWxIioizvhOn
         j8kg==
X-Gm-Message-State: AOAM533TQHDcubbOvCyoTdOL4bzVRP9X2DCogTredc2Y5uEjQ9HNtS+o
	PNOg7kHkEEOPwCownX62NAxZIbBj3LvBWQ==
X-Google-Smtp-Source: ABdhPJwg6rPh6rHbMLBHigBQI2ti+gClPM7FY7PBIgK2QMpbHudNEyfWI9INzqa5dmIJrc0I5dPAwA==
X-Received: by 2002:a62:1796:0:b029:2d5:91b4:642d with SMTP id 144-20020a6217960000b02902d591b4642dmr13330200pfx.7.1622399680969;
        Sun, 30 May 2021 11:34:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:40 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/12] hostapd: fix building with CONFIG_TLS=internal
Date: Sun, 30 May 2021 11:34:19 -0700
Message-Id: <f56fb13a2c5efe0802fca883f321bc6ea064d70f.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: Alexander Vickberg <wickbergster@gmail.com>

The patch recently added for CVE-2021-30004 broke compilation with
CONFIG_TLS=internal. This adds the necessary function to let it
compile again.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d6ef4170747d6668fa940328334055eef3e1e1d6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...001-Prepare-for-CVE-2021-30004.patch.patch | 45 +++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
new file mode 100644
index 0000000000..1bedb4f753
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
index e586018685..a9780bc6db 100644
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
2.17.1

