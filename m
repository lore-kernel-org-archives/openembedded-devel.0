Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECECFF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18129.1777208661928522020
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QIKoH2xl;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad617d5b80so54462455ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208661; x=1777813461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbzV6gIqRzK2VF370Bt9+VenCzbfyuQjn5lO9PVVt6M=;
        b=QIKoH2xlg1g9GWASqueaIyZrcp07yC6lThtgIFKe6FWHN3o1mwuAeAQOJ9KMQg6drH
         8V1w3c2x2zKkcFjQVGhiUTaGAul4lzr8gNpZWi4DiPFEQj1oP4M+0TdNCM8t+if2ydkI
         KgWayW+0Pix674PSeBvb64IuJjJtP+B00pq6QekiO83TrKMnQEd/n/UrwvUV10JYW2jf
         b2nwV/ru3OY9RRMPRYFXsX58RPlX5kKFoE/DPjJA0zyfXSo9pbB+hHQUhxCKIfu3wphP
         uHvG9psbKO2masp5v4LUH+uD7bSzI3l+sPkiCOLuztmjLbXJ+gYnal9nsbv1nhumalD+
         157A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208661; x=1777813461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbzV6gIqRzK2VF370Bt9+VenCzbfyuQjn5lO9PVVt6M=;
        b=F1JgLtsTWvYQ88EJL5p6cLTdqETZ7qbEce9qfXSK2LumdIyrY/OyIlf0mZiNHLQiyE
         PgcbfVW4vzI1jTkrBA1rYwnzrpBFhru2f7PAj6m6df9RN6gsV7ctGeAB3eiGnjpOSvWa
         UGTsUaGmPdHgLK86qqu3nvhxd3byehaVqH1/SfSoMh5GirGT+8ulJ4wemK6xHxsgudpa
         4L7AKEhEZUzzBXEEw8+SkF+DZ/ITBeTEjxBRT6DW15vOwBtC9+RziyXmJPh1lg2dsc/y
         Cgt1US5Cn7THzEGTWAcDtC9TaJHU4s9haOErDRQcfg9L4VLlvW5zdHWBGybWDLkKo6kv
         R/SA==
X-Gm-Message-State: AOJu0YyQ3XMgPM40IW6516Y4LYlgB7F9qsWIbe81aNndUUVVfk/2wi/Q
	rIoXLKubvJAQmAj5PmV5FkeykTXeSy4nRwupVU5L/sN64+DvbjV67HEK94QlX1uz
X-Gm-Gg: AeBDievTXUKSHRWgYUG04pxkk8XYOS5B3L7sdqH9+2/Qw6q7a7ydP3Xn0A7Ad7j7slD
	953f9pKFiyfmW7Z97fVetU3XwVluT0Gc9228EQhatpAD88VcltcE5oKq9HAcloxXK+mOx50d6Q2
	tdcRhAYl8IAXGSwtS9J9Gb+KkO/akydTcrQqm8mVFLzAipR85JGv8QV6BOYTR7O4Vlyi2+Zt25J
	h3yD47Bz1sNT+ZFdGsxIS2UytKffD13LUKgmIuzYEupyhxxXnj0m0Gm7SJKJHxxRn5iJwSEE249
	FjqRCE3EXyg9YFONpk0ZR6oZgApat929bfHp+Fi5lXWypArOqVkNtbxhOX5AWtZyG3wrQ3zaKOW
	HdsU/pQhX4Vq0+ndOKuGX/UloddttKTP49pgJrB/ChkoXubBYTJEABWhdtGzCo2/9Uw2lLd54+m
	7k68ewxuxWzQ1kWWETAREk00/PRRSV8ihkN7i1o6hSwtxEIH59fhjL/Xkcdw==
X-Received: by 2002:a17:903:88e:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b5f9f79455mr278981495ad.31.1777208660966;
        Sun, 26 Apr 2026 06:04:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 7/9] opensc: patch CVE-2025-66037
Date: Mon, 27 Apr 2026 01:03:49 +1200
Message-ID: <20260426130351.793052-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126623

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-66037

Backport the patch referenced by the wiki[1] mentioned in the nvd.

[1] https://github.com/OpenSC/OpenSC/wiki/CVE-2025-66037

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opensc/files/CVE-2025-66037.patch         | 35 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.25.1.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66037.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-66037.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-66037.patch
new file mode 100644
index 0000000000..91ffe53373
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-66037.patch
@@ -0,0 +1,35 @@
+From b1a6f86298af7dfbaa1110b86662a9d1393a7678 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 25 Nov 2025 15:58:02 +0100
+Subject: [PATCH] pkcs15: Avoid buffer overrun on invalid data
+
+Invalid data can contain zero-length buffer, which after copying
+was dereferenced without length check
+
+Credit: Aldo Ristori
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+(cherry picked from commit 65fc211015cfcac27b10d0876054156c97225f50)
+
+CVE: CVE-2025-66037
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/65fc211015cfcac27b10d0876054156c97225f50]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/pkcs15-pubkey.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libopensc/pkcs15-pubkey.c b/src/libopensc/pkcs15-pubkey.c
+index a759efa45..48fb08cac 100644
+--- a/src/libopensc/pkcs15-pubkey.c
++++ b/src/libopensc/pkcs15-pubkey.c
+@@ -1328,6 +1328,10 @@ sc_pkcs15_pubkey_from_spki_fields(struct sc_context *ctx, struct sc_pkcs15_pubke
+ 	       "sc_pkcs15_pubkey_from_spki_fields() called: %p:%"SC_FORMAT_LEN_SIZE_T"u\n%s",
+ 	       buf, buflen, sc_dump_hex(buf, buflen));
+ 
++	if (buflen < 1) {
++		LOG_TEST_RET(ctx, SC_ERROR_INVALID_DATA, "subjectPublicKeyInfo can not be empty");
++	}
++
+ 	tmp_buf = malloc(buflen);
+ 	if (!tmp_buf) {
+ 		r = SC_ERROR_OUT_OF_MEMORY;
diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
index bcdf5900ea..999ae34b12 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https \
            file://CVE-2024-8443-0001.patch \
            file://CVE-2024-8443-0002.patch \
            file://CVE-2025-49010.patch \
+           file://CVE-2025-66037.patch \
          "
 DEPENDS = "virtual/libiconv openssl"
 

