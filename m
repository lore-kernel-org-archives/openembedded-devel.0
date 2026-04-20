Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D18F36C5C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:51:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17708.1776685865856384848
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R57Ak7bd;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so45487945e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 04:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776685864; x=1777290664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1V0jiVYKdpeeocu9lwB4UeNV9TS4ItCp4s54U2Lv2xg=;
        b=R57Ak7bdpGdBFxQgs4aG4um6OwTxdDQV/D1aHBr6RfVK+Er7+jTMox4QGjO+1y4fA9
         nwkT1bBxWDgR7QnxX8UAYvrznvtbR6nscSURAtOiFd09dSkVCx8OAzgBKy6fX81RUiE3
         ZomSj2b9/dUv+bCLY9TeyhttF4mYGfhZimkObdADY1vwoIToYsjVD8u27waHIEeSwI95
         whAI6mCv9Eemts4EE35k1e+NcQLklPB0ZqADX2iJ6axXR5jHd4PnEUrtaCQO7aEd3/xn
         nYi+P2qeujtQcoTz8PmJUJ0EyL9aWUlhkys092JKld/AhuMKNpcRh4g8UN6jW3y84MSj
         zqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685864; x=1777290664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1V0jiVYKdpeeocu9lwB4UeNV9TS4ItCp4s54U2Lv2xg=;
        b=KpFxpuPCcR1OJUm3/MoLNI3YUwtsak8kv0hJ+I008EbT/4IBouT5h+olGGvAXYQsCf
         jJR+9wmCwD0heB7Mvt7hvoBmem0KPpLAx0dRmkhVy5HA23KtfxFZ+ThWtJapRwLb29B1
         XlZD1w4iT8sELUr82j8as+TMO9AxDLkINApAxW/pN1zA0yV1PZ8Fbw3h0iNVZ2QnzNlV
         0TkxH6i6uBUwOzaFXwUlTXOzp6K0vLfQ0wZ7mLKAixhAF3qzixv5j2CBr7X7m1tgkDgX
         ClQkV+akleQZ8h5G5nbSCMloGDkW3aodb9cNBlYkh9U2W7WMHbko/DpHFuKT+KhhL6xC
         hATQ==
X-Gm-Message-State: AOJu0YxTuJydCnm/BYa0ZS35mPzwSsyOr+/WmAFYugo11qnqsmpEpnsB
	AYifmqSmUpqAC1wsJydhLMSZ29zHgW3IzueUva+x+Do4YwRaM3htsla+3GZ4hg==
X-Gm-Gg: AeBDievJioYfBq9Gi3OFVqagHM+xLZSjrE5skC4puZg9TGtwwYnGJXdYBN7Bchqfmi2
	fv9dv002E6YIak+50rKZLsTtn8rRc8JOojEmIfWrUu+dy8BgEknGLr7Pfkvst2JKGRXu2aZh2jr
	KHTA9DU9Xt5/5rIu7+2Pi+33NBejSDL49iuV9VCBvLRJ6Bwh6zFeR/tiiFeOMSBZcUJgk4r2mp+
	gNklLwz3WyqUcHM7vkFD9Fp4u8SGlpeYllSgeucaSdVjKW3uVhrIes6FlTdQ80dvLTv4Ruesf6f
	NCEyBsOfN7ZdOBZx5ns0n1AV7ZQXnLDXkX3+fPpUZKs2mmSFJFeF9+TWQBD4qj0owrUN+JnnVmH
	jLRpTJLJOGsUQ041ln9TwAOWOxq/XlYHl5HjHD5wkmvET0ZZ7puu8+xwCciMHd9VnQ5umGyHyL+
	0W8uPX+QTcOCcweeA8ecpjjObCa3IkY4U=
X-Received: by 2002:a05:600c:c085:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-488fb765b04mr140690535e9.17.1776685864043;
        Mon, 20 Apr 2026 04:51:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm314595715e9.12.2026.04.20.04.51.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:51:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] botan: patch CVE-2026-34582
Date: Mon, 20 Apr 2026 13:50:58 +0200
Message-ID: <20260420115102.428743-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126500

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-34582

Debian has identified[1] the PR that fixes this, however the url seems to have a
typo - it was PR number 5499[2], and not 5599[3]. (The backported commit's description matches
the CVE's description)

[1]: https://security-tracker.debian.org/tracker/CVE-2026-34582
[2]: https://github.com/randombit/botan/pull/5499
[3]: https://github.com/randombit/botan/pull/5599

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../botan/botan/CVE-2026-34582.patch          | 28 +++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.patch
new file mode 100644
index 0000000000..c7a09eae3b
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.patch
@@ -0,0 +1,28 @@
+From daf4c8c148165a7c316d816d2bcdc25ba1f6887d Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sun, 29 Mar 2026 08:25:18 -0400
+Subject: [PATCH] In TLS 1.3 require that the handshake is completed prior to
+ application data
+
+CVE: CVE-2026-34582
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/4190398599413373f55b1073ac06fefd494af8c6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/tls/tls13/tls_channel_impl_13.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/lib/tls/tls13/tls_channel_impl_13.cpp b/src/lib/tls/tls13/tls_channel_impl_13.cpp
+index 82a8e38..eee9bad 100644
+--- a/src/lib/tls/tls13/tls_channel_impl_13.cpp
++++ b/src/lib/tls/tls13/tls_channel_impl_13.cpp
+@@ -163,6 +163,10 @@ size_t Channel_Impl_13::from_peer(std::span<const uint8_t> data) {
+          } else if(record.type == Record_Type::ChangeCipherSpec) {
+             process_dummy_change_cipher_spec();
+          } else if(record.type == Record_Type::ApplicationData) {
++            BOTAN_ASSERT_NONNULL(m_cipher_state);
++            if(!m_cipher_state->can_decrypt_application_traffic()) {
++               throw Unexpected_Message("Application data received before handshake completion");
++            }
+             BOTAN_ASSERT(record.seq_no.has_value(), "decrypted application traffic had a sequence number");
+             callbacks().tls_record_received(record.seq_no.value(), record.fragment);
+          } else if(record.type == Record_Type::Alert) {
diff --git a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
index 0986a76557..bedc49f714 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://CVE-2026-32877.patch \
            file://CVE-2026-32883.patch \
            file://CVE-2026-32884.patch \
+           file://CVE-2026-34582.patch \
            "
 SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
 

