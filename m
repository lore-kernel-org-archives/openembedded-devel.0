Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3F0D2F7EF
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 13:11:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5119.1764940265609912933
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 05:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OgPuewlF;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29ba9249e9dso29067585ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764940265; x=1765545065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts97EXZ8kAh9wKj/hQvMlUwgw7Vp/ICdUDIbAx+DaTo=;
        b=OgPuewlFUB0m0RIOZOK63l6PISzsp1ETX4RgZwne1jXWn9OWWjQdM7RFHsA+NAPhOs
         AsBe/RARTlRFvdDjr9C2EGaE7/c31r7avaUof/blKRKpE0EPq3JIQrdH0rfpBwTucJBZ
         VaYPDUuFNWrd9vm40/yufbkSww9up+wIBCe9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940265; x=1765545065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts97EXZ8kAh9wKj/hQvMlUwgw7Vp/ICdUDIbAx+DaTo=;
        b=Az/IfejNBCtMgDKXgg/llb/QnVE1xAyi0jvKUgMf7S9h0x9xDEKBqJOzWRU0f7nhaO
         6obgPVTfuFt1xo0yFShFwja/6WhiFE75v1chlbiUPjf18MoAmwLhZnK6F9Hhzvg8ZVYt
         9uobnCT3wy10E5XodCZ5i48MjNDtNLoVFDXeFOqox/astM01dEGaAMT65HOhDf8mueYr
         YNuy5KAWIKfZXA+PWdNEQkhtb9zOe7HKtYTe8Cb/VdwmA/llO2RjmIZeqF/HptKIOKwx
         /DjIa6TZAiWwPNJGjh4DvYiNhZOQMH66Akcs7JBbIbR6oBqFzAaIaku8HV9bFnwbMU/N
         ttwA==
X-Gm-Message-State: AOJu0Ywmd2xOUYlLVDRiG3uBn/lqHSr6ihyYgMCAqLc5NqhYPWAibLZU
	27Yjl0VPFp4mYjxFvoB9o4KRFgjSG8ay8GaQbFnQfIBq+x0CbHbrlOGkbj0st2TxzenYIIe51zU
	zs4ZEGSI=
X-Gm-Gg: ASbGncv1DblTJws6FkLFZUwB/81ZsaNVkBRpsgPD+Uqwi5JX+jnYleENzV3GClL0g8N
	k6el/b482L/QxubN0MSa4ns9HNceRTKw9ad2zNc6sF72C+ESh8KxzLS8GMNcdYzDh44DQ57xxDi
	81yDmmH/2z3Hf0Y07TsXopnY8Jwq0RPuXZDvHDQ/krghHRykS9HBU9PxEjGEUkgKk0O7Y0ZBnCs
	2fqPAb72rU5XZZWzRZfTNs646RO5Ob8kf9LNGAzkzp07/Hvx1DLh7jCu1dz3kcS4YQLxyKK95bx
	JEA3HRNR4IH/8eDVq9SOjeRDD0JT5jcAMidaaqxRyzKRr8BBMCWjpJBJWhYjTwlXZjZfD0ERtkg
	qIhqar6FR74m+LtOr1huRY3YEwhcdFZpMyhWucEsDTYN1+XHyxM/ZOeU9BVL1C7Nvc2S3Z0Ypwj
	GXdKv+mkQdVBb1ZyWonYAiwj66cLOuJa5Iwl0=
X-Google-Smtp-Source: AGHT+IE3oHA/h2aQxczF7zMtXOS6V78IaTxHU1NelAas4+NfuPDtesKGlKlkNu/aBtYgRxPLrDAAug==
X-Received: by 2002:a17:903:11c8:b0:269:4759:904b with SMTP id d9443c01a7336-29d6848df81mr125922365ad.58.1764940264807;
        Fri, 05 Dec 2025 05:11:04 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf996sm50064375ad.30.2025.12.05.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 05:11:04 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] wireshark: fix CVE-2025-13499
Date: Fri,  5 Dec 2025 18:40:55 +0530
Message-ID: <20251205131055.914442-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 13:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122346

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e180152d3dae668249f78c72a55a4ba436b57af7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2025-13499.patch      | 45 +++++++++++++++++++
 .../wireshark/wireshark_4.2.12.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
new file mode 100644
index 0000000000..b713cea8c4
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
@@ -0,0 +1,45 @@
+From e180152d3dae668249f78c72a55a4ba436b57af7 Mon Sep 17 00:00:00 2001
+From: Darius Davis <darius-wireshark@free-range.com.au>
+Date: Sat, 25 Oct 2025 15:01:34 +1000
+Subject: [PATCH] Kafka: Fix decompress_snappy with no xerial chunks.
+
+Instead of returning true without setting outputs, report a failure to
+decompress and return false to the caller.
+
+Fix #20823
+
+(cherry picked from commit 49137f8ce93c9f7ac55b69c8e089ba6a422f633e)
+
+CVE-2025-13499
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/e180152d3dae668249f78c72a55a4ba436b57af7]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-kafka.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-kafka.c b/epan/dissectors/packet-kafka.c
+index 482a670..e537013 100644
+--- a/epan/dissectors/packet-kafka.c
++++ b/epan/dissectors/packet-kafka.c
+@@ -1788,6 +1788,7 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinfo, int offset, guint32 length,
+             count++;
+             DISSECTOR_ASSERT_HINT(count < MAX_LOOP_ITERATIONS, "MAX_LOOP_ITERATIONS exceeded");
+         }
++        ret = composite_tvb != NULL;
+ 
+     } else {
+ 
+@@ -1810,9 +1811,8 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinfo, int offset, guint32 length,
+ 
+         *decompressed_tvb = tvb_new_child_real_data(tvb, decompressed_buffer, (guint)out_size, (gint)out_size);
+         *decompressed_offset = 0;
+-
++	ret = TRUE;
+     }
+-    ret = TRUE;
+ end:
+     if (composite_tvb) {
+         tvb_composite_finalize(composite_tvb);
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
index ab6160b767..ed488a3555 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
+           file://CVE-2025-13499.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.50.1


