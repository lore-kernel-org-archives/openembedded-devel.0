Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.6275.1622029983039204112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X6VXccMs;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so196688pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PwcjOQKCh9cBxbHJ47D95nYWB51p/5PJEUy2PT9wnXE=;
        b=X6VXccMsBbGpIMy37CQYyCSiBigdJuSCqwk7v9MOcgdKL7rQCif74PmYvgTfg9lXwR
         5YqFBwa/gcRDdfWp2Nj2SNEB0NEJUTAUYoA9TqkXFz1g8SluO+BccmUxsjuyPcFYSOM6
         kQW18ZQ3iTrD+3vKstz0A5Ik46zUjugV7GoSgKNLLW2DRxKrfe5qfd1O7xjlNgNWPnbX
         MMQ4JolkSyxtIEqqYx2zGv1rDwnm3o00IRK7aIabITHWcKocCJqkc5d+wa9oGa6qaKPZ
         kcvo6d+EMvFESvcBHlMJ9CVpqFYL+CW/KiKuLmdqh92HdMkvCK0698RyHJJPREKcw865
         JGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PwcjOQKCh9cBxbHJ47D95nYWB51p/5PJEUy2PT9wnXE=;
        b=hlW0wCUovrMqRPVfVKN19H9ANM75+HtAeW3vhhEGGXP9D6EK08WSbGMWQqQaGXQ7hO
         PLqyXXY6dpmtnKvgnCne0zmTluXjlXg5wmNep+yvtrHaa6DLlWVsnia8cbLvCEgY8J2T
         wIwWPu9V6dlH+IxfqF+YRBvDrgna8yKNhZhuO65Azz4PEqEYJUO63EIOQ3m4qaWRH2Zu
         wA9OHnQQBGn6B1p28vQ7I9phLDUO4JvsFy88NLa7ch4duvqrPJLjd+7EbAhDeJ+foj9z
         sePdKiJDMkzLBxWCygY2YHO5EH9wdtWIt4M6vcAQ8MO5mugFv6Ji7tpOsHaQ2ETrUtkt
         xDIQ==
X-Gm-Message-State: AOAM5313Y698qTQFnlyxUBofxNaRTA+uHzrhmrpeJ+l2wyy02hABkTkj
	i0yReyoq4Iqoj8YsrWmRe5QBTftz6RL0CA==
X-Google-Smtp-Source: ABdhPJw6ngFbarJem05qjQEKrY7gfkXcAhD9m2bVuh3aOIp0Q6Me9sKfuj9xyNzhrspPiKC7iept1g==
X-Received: by 2002:a17:90a:6b4f:: with SMTP id x15mr3448323pjl.25.1622029982458;
        Wed, 26 May 2021 04:53:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 16/23] hostapd: fix building with CONFIG_TLS=internal
Date: Wed, 26 May 2021 04:52:31 -0700
Message-Id: <26c88bf3ebcade64e8fe7693da89d9c2d298d90d.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

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

