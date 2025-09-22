Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A19ACAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:53:48 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.42880.1758512188197370859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 20:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fYRxV9DW;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b5235737aedso367356a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 20:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758512187; x=1759116987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XuiIS4kK0mojrtcSGg27INzIgglGKcbx0DVw5e6zd3w=;
        b=fYRxV9DWFU/EOMEEWCmmwvmeC0zjEeA9+ed/ZG/kex21pX7VIb9d95dDrp3GPO2QG4
         D6tkX0gQeNvLNG0rrYfYk9tslgZP4fFy3T3XcVDkMTe9q6I4mINnkYxCYBjr4u6V7CZR
         xaiNmgmiZiwxhNGsSuYVJxAODx7Fvwz6bbQAXJXhGwJgay9zrVmmNiYuM5gF+u5JPte9
         nBQ92bECMRpLA6sVJj4T1Vx+N7Dr7oTsBGY+jawVVFkJr0nzphC2El5Px8cHQQWGqWRm
         +6eBDSG9+pmgH6ume53TK7F4ayt+JrKFNJ0DArpCcdy3QWAom9kw5aT0t+Juxv/73b2E
         5D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758512187; x=1759116987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuiIS4kK0mojrtcSGg27INzIgglGKcbx0DVw5e6zd3w=;
        b=AP3Bp9fJSMtOWL9+NWaUuUFIvd8J2qnxYRmLcqDz2Cdl4kHuVPS8WrDi2Wwi+XbQ/8
         hZ4OLVP3z4vb/5OT6jBV8X5CqjCKEPncYovardSQRByjDVeuwHtvWvgEmaVn8yUMu4ih
         uSFNtMUrY4IyJZ5dQQjiPtfd6bNUfosSqyn+nrDV4FwIVhdZypi/az0ggkinYasp9kwK
         tZTzDRhhgbPBQYJSr0quchsm84MSf7MWQSV7yTAoWZmwombGh2jIPfmF2vnNT6bKxGTu
         1hlqqj/JRd4KGOGLTPtflncBfrXCtTlNCflJAcTDJd3PwnlRgt6s/CBeEBNiEs3Cvzt/
         G/bA==
X-Gm-Message-State: AOJu0YzJEFM439CllY7wT+HVln7QyuwIRf80ZQXHYndvVkUVhYEBNvPr
	jUZ8S6KJNrSFE4pWFTmfNMoI5aCWdnzzd1TMPxvwDGR5y7tt90vY+O+eKpIBDA==
X-Gm-Gg: ASbGnctM+NlOznpi/CZeDFOqxNkFdqO2hwsi0tIqaFi7gpL2paFT1qbKKRof1SXlimZ
	p8gE5bWljLDiJJ1YuRzBiG3FExYMv23xMbqEgJfFt2pma2SLKkFmj9uI7SJXfOoPNyKEJKW1k0f
	7P93poflZJgby69htpP9FQ9MWvyxpw7NMnmLKD3V/6BgzRvsPkbrCVx1xLNu/D6SpOIHonbgk7+
	DHuxHr8+1HFr9tS+ewCXRWZxURyVPGFUIMRFrQp5t+ENwdxHMPCa5/9zxrgVNnWnLH7Zion43P4
	aX908jqaFato8TG1oNmkr6NGD3KstOzoFKWmNMzsV1OkN0+22ximGjnaH/+bDuizfQ4/YhWt/Fr
	Lw6NSiKlSm+9T1q695HDAth7u76unMS93Nh6v1w==
X-Google-Smtp-Source: AGHT+IGE+CiWalxRwwZe7aRieekuGHt1sWVC2oAbEe1dtHptMAr0rDlqBDMfA4plhnj7o5ejQZ8DYA==
X-Received: by 2002:a17:90b:33c8:b0:330:68e3:ce7e with SMTP id 98e67ed59e1d1-33097fd43a8mr7544218a91.2.1758512187135;
        Sun, 21 Sep 2025 20:36:27 -0700 (PDT)
Received: from LL-3324L.kpit.com ([223.233.85.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607b1fccsm11624384a91.14.2025.09.21.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 20:36:26 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [OE-core][kirkstone][PATCH] iperf3: Fix CVE-2025-54349
Date: Mon, 22 Sep 2025 09:08:19 +0530
Message-Id: <20250922033819.2113258-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119641

From: Nitin Wankhade <nitin.wankhade@kpit.com>

This commit fix heap overflow for iperf3 package

Reference: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54349.patch        | 56 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
new file mode 100644
index 0000000000..a8d3bf9cef
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
@@ -0,0 +1,56 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54349
+CVE: CVE-2025-54349
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf]
+Comment: Patch is refreshed as per codebase of 3.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+---
+--- a/src/iperf_auth.c	2025-08-19 12:02:47.706337000 +0530
++++ b/src/iperf_auth.c	2025-09-15 12:50:47.933400511 +0530
+@@ -264,7 +264,8 @@
+ 
+     keysize = RSA_size(rsa);
+     rsa_buffer  = OPENSSL_malloc(keysize * 2);
+-    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
++    // Note: +1 for NULL
++    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+@@ -274,7 +275,7 @@
+     OPENSSL_free(rsa_buffer);
+     BIO_free(bioBuff);
+ 
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+       /* We probably shouldn't be printing stuff like this */
+       fprintf(stderr, "%s\n", ERR_error_string(ERR_get_error(), NULL));
+     }
+@@ -320,7 +321,7 @@
+     int plaintext_len;
+     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext);
+     free(encrypted_b64);
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         return -1;
+     }
+     plaintext[plaintext_len] = '\0';
+@@ -328,16 +329,19 @@
+     char *s_username, *s_password;
+     s_username = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_username == NULL) {
++	OPENSSL_free(plaintext);
+ 	return -1;
+     }
+     s_password = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_password == NULL) {
++	OPENSSL_free(plaintext);
+ 	free(s_username);
+ 	return -1;
+     }
+ 
+     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
+     if (rc != 3) {
++	OPENSSL_free(plaintext);
+ 	free(s_password);
+ 	free(s_username);
+ 	return -1;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index d181eb3b02..831e854982 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://CVE-2025-54349.patch \
            "
 
 SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
-- 
2.34.1


