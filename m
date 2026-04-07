Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32859EDB7E7
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:52:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77697.1775555569783456295
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GJTkd15u;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so18652925e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775555568; x=1776160368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8auPaXD6IunLJ5fKvH07hvgkO1N5f2P0iNJINWkhf7U=;
        b=GJTkd15uT2vLtusYUEeZir/haCu2tkwCHuc/PEwXg0VdUsyhOfI5Vs951N9nVZs/2d
         MCZUsPXSLb6zGx5llUwREuYXOfuHfOVlT5FXk7qIgTCxys37Ipag6V0gJx9udTBvdtGt
         TFP34uyekyzVs2SnNc3KffNJYwQGmrC0BumyQcM+c5AtSEFanE/T2h3q1Fbcgad003H/
         60poLLesLyKirTkLi5dPUZQ+IgZPssFD4d81pDUqTdf+uBJahuTvQ8Q1chhSYG6dNu/j
         ky15aYu8Y+q2iGUlLFOE0aueBBwa8gCws/XyMqpwH3wMR9gqN9RactBDrz7N7MDl4smT
         Ttpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555568; x=1776160368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8auPaXD6IunLJ5fKvH07hvgkO1N5f2P0iNJINWkhf7U=;
        b=j1yCFmfmeOha7uKuypES1OX0PK0t3p4wsTAprUviKZsV9rDZcxq4NRyz8gnMK/UIpE
         HzmpNprVXRwuhloRNwdkJTADH4PWUzjBtVu4iFBMBGVMyZ61kKsNdfzTFj9h3z6DyGJR
         ELcJ8qB4rtGZbzYbpx57+4cbkAc4lppenjmu9hL+2xQ/XKabxgbsOYvCmxJ88PISAA6N
         vm8rA0QHG/1IiCf0zbCsod1Z6NxjE2obNqG8GV3Gzj88dd455Phpz8j9mEJtRqmpEDEu
         FaCvFGg8Udo+XUQF1iVvD/lxPS0UiJO2Dtruh0lTYRKi+E1Ou8sEsmoLuXYGs9MzXIoA
         SdYw==
X-Gm-Message-State: AOJu0Yz5aYQAXQoi/5d+y2wtWFLg6xHrtenBx9kn8jvSu0aEw4NhTlVj
	FdxXJOxCDLCEpVIyIC4TE64x4LF++8JzNw9xMr3xOhj9H9yPB4C3uqatUbVSzw==
X-Gm-Gg: AeBDiesw7WbOvkYt+3RvB0mclLmIxJkenfDfjO7Hxghn20DKkzbQdyPOJJ7cnqaANsK
	GVWhvv2RcPBUGhwFAQVzUX4xj2Xdydz19bQuxYcnAVD7EURxfSJTPH7Bu3RTzdcWKw88xgDQjIL
	JHDZYWSpjts9hWV4dE92+SVuMIVVpNA4AEODrXCm+hoh1ULZRmQQPGNg4RJNwM3MaBXUoXQzzFN
	IJZA75fjjkaZnzEa9rv3qXvQDqgCvFrZtNFtQgoaAjdmIeHpHvbh/dwjN1IMScze+Jhmj8Pc0b2
	OrMZaAUIMqtfiYYsBvY3Tf5rAsIU6xq+x7SkOMgonCMJ00eg2q+FoA10m2rfRW/DY8oO2ApZHJP
	SoBYbt0n3GlOwg+CC05rXrULFi43mA7+zkUyrYo6gqlCWGprup8EdjkhrO7tTzN+fjqr5bgM44v
	cmUMzCrWWnKeHP0e7CuDgX
X-Received: by 2002:a05:600c:4743:b0:487:219e:42d with SMTP id 5b1f17b1804b1-4889970642emr226225055e9.11.1775555568009;
        Tue, 07 Apr 2026 02:52:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eccecasm113877725e9.34.2026.04.07.02.52.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:52:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/3] opensc: patch CVE-2025-66037
Date: Tue,  7 Apr 2026 11:52:44 +0200
Message-ID: <20260407095245.3971755-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407095245.3971755-1-skandigraun@gmail.com>
References: <20260407095245.3971755-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 09:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126083

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-66037

Backport the patch that is referenced by the upstream wiki
page[1] that is related to this vulnerability.

[1]: https://github.com/OpenSC/OpenSC/wiki/CVE-2025-66037

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../opensc/opensc/CVE-2025-66037.patch        | 34 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.26.1.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.patch
new file mode 100644
index 0000000000..2c0fcab23e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.patch
@@ -0,0 +1,34 @@
+From 29fce41f0b65e8467745b385b0bafbb79e72d33d Mon Sep 17 00:00:00 2001
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
+
+CVE: CVE-2025-66037
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/65fc211015cfcac27b10d0876054156c97225f50]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libopensc/pkcs15-pubkey.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libopensc/pkcs15-pubkey.c b/src/libopensc/pkcs15-pubkey.c
+index 83f3feb26..e6bf803f4 100644
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
diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
index 3aed590347..ce982c4aa9 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
@@ -14,6 +14,7 @@ DEPENDS = "openssl"
 SRCREV = "043343d2df7b09d1938bc3dc313d86a96be457cc"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https \
            file://CVE-2025-49010.patch \
+           file://CVE-2025-66037.patch \
            "
 
 CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"

