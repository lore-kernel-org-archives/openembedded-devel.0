Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3F3CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:52:07 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.17120.1758289836136999231
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQzXfSpi;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7482cb1d520so2570946d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758289835; x=1758894635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hai8JI9ac9s91EIiKKD5c2ZuMzgDRCOIMT5duPJ8kkg=;
        b=mQzXfSpiXnfpHBQKBxtHLD4BTnJa5c1f6oVpEIoVJIMOa3DuSTzCxDIwUvhZw3jmB/
         b4fU2upCo99ACtZfEDZ1wmVztsJBxLfvGGwnR8LM9EaM3zWSGMi24voJjSIC50FfvOkR
         vYv1WfjLBeIPpKXRVaN488ZWCcPmnP5mlGBFCvkouAiY6oJUt/46sm+KWzEsZC2ZvGdp
         B7LLvMAkP9tNOjuH8L41YsVaxOk5GJ6vCJXWLL81E+jt0tA4q1V55vjJWsmpjODcfVql
         lYx2IhA6YvkyL4QB6qeELHQkrRiHQICMB0CjIpkjuSIn8vfgzQ4l4bfoHMgwPtzgv3b4
         o4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758289835; x=1758894635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hai8JI9ac9s91EIiKKD5c2ZuMzgDRCOIMT5duPJ8kkg=;
        b=cZ5V20YINxqZ6OXwN45yU6sVb1JLxJwbUr9RHMbGCsm2tZaNgGEzSFXYnmKXa+Y5QG
         bRJzumOUqmf7f8t+0kAviWJxAVC1GjgYOiRQx0o61MXYkMH08p+D5crkh1KkZaVmtV72
         /006IPY76NFWD2vMmM7WL/twhOyna/nPEF7mPq8cMq8QW5WLj6tKhSC0tQTKYhpGZ9Pi
         inszRzxSwQIuuZm8HQxSrQRIDzjPe6poGgz5VwC5L0qhN8jPc8B2wuqoxMN9Cps5TExD
         RPq/DmxAg7jpygOZ5Ar0JBi5ylt/uQxRW1BMtsKSRLexPjUUmiY2zUGdM9U91zdSY4Ke
         rE+Q==
X-Gm-Message-State: AOJu0Yx3zb/PI8zubs76bqXLgdbeev9avFxH2/j2yLxVGJ+UfwmxId+8
	chQ7gHxhhYeR3ZpGKHT0nvBZ97fzyb54JVCH22vESnzhF6Qk8DUX/DDVPFZraw==
X-Gm-Gg: ASbGnctTsZTN2syaGkEc8+w9T7QAh9Zr6ueXx6Hic0Ppmq1iy/MhYtwRFNm4SnEIp2t
	uuDo0hUM+gKkFsc3js+yPLdydNySP6PBz2fwVPFj4HwJdOGR+hCaZN0JTDNvtKzfgIT6SB/uKKA
	IkyL5ZZEO+nsRshKaPojBBjAHtfnhCLltaUiq1q2BhBa0Ol/QnaAIG4S7/0FeVcyhijhLjm15dH
	2j0AExaZoIvRdOjs8MABSVZfreI8xL+WzXySVbGdho1R2FKUwYV65Lpc1yUKnswMFuZJhKA0dpr
	MOxYN7ykDytr7qGzMXu2GqB6u6be/ej6YNAsbgqnKNHPgOdA/R1tDGevl/7o/aWx+kIox11L4ui
	OVfr5ghPulFxKcTgyfo9eI2D+tw5WMcgpzPR62PiI
X-Google-Smtp-Source: AGHT+IHk0zTEVgsEbHlfFt4SC0xOuqBdC9rS9NAfEtjBGbypaKb2ShXdc1FteSKpmg4SgmeyV6CNEg==
X-Received: by 2002:a17:902:dad2:b0:261:83d2:9d9f with SMTP id d9443c01a7336-269ba445fbamr27656555ad.4.1758289406730;
        Fri, 19 Sep 2025 06:43:26 -0700 (PDT)
Received: from LL-3324L.kpit.com ([223.233.80.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deb53sm56515915ad.65.2025.09.19.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:43:26 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [PATCH] iperf3: Fix CVE-2025-54349
Date: Fri, 19 Sep 2025 19:14:53 +0530
Message-Id: <20250919134453.2008042-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119597

From: Nitin Wankhade <nitin.wankhade@kpit.com>

This commit fix heap overflow for iperf3 package

Reference: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54349.patch        | 55 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
new file mode 100644
index 0000000000..f60267bb57
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
@@ -0,0 +1,55 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54349
+CVE: CVE-2025-54349
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf]
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


