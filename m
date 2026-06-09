Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556C1CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:32:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74582.1780993949725082652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qanSbIcz;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b78532b0dso507921a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993949; x=1781598749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwlxk9QoTrf+wgxy/iYDAqkCF+dNrz13GEjgxsuSW78=;
        b=qanSbIczdxFWCEQiGMw9dE/DlQ/uLtiinTlZq+WMFUmNuyAIy1a2Ylkw3GqbvzIaMO
         CHD6CxkxCVUGv+thLh6lzG6DTd/RvCj4dCbRDWHrT2bUkMO7NkXZqkFtgtHv7Oqn5EGQ
         YwGT2pUKPUl/VehKVz3xkN+5gUm8LbRXRg4Zqv7ZoXVHr2iNj2ObdxqX1cimcaHwzOyx
         WnpQYXc33htaZtYoCBy3KJXVGFhFz/wjZwYFmO7wsMR/vpEY8Nd/+970DCZsPEkNzyMK
         wjgYNUkgPGxYROP9hQ2E9W1OOw2RZRmfdYj6xyUfJDIeL2nlRHIZaRi5PiauC8QDivDm
         akeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993949; x=1781598749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fwlxk9QoTrf+wgxy/iYDAqkCF+dNrz13GEjgxsuSW78=;
        b=OWKDsM5EbV4V0jgg/QraxbzIyK8k2SmsaUFhVfff9RkJ0t3tRIzN2UygR+GMlKO08b
         fWOXrX2QFJIdMTnlbXHBOZ2ZoDmmLtzNIRSro/SOBlrLwJKG7S4kca8QuLfxM/+T1h13
         8Jp3WDfts0Z/1UAsI1eqCV4AtIFNHIYLRRgg/+edH49E6JQjNuc8QZ5/iKSuXMKE4lfb
         LgaFJO9NISNpUcbUjkB0SHlow+fuL8rM2sVB2rNnnBSEp0yUM1YbCLomiKWZEU/sviqV
         qpY9XtlOkoGX2znTN99ySm5snwVTFPRFr/MOZbb/Tzt95/ZSXqypNuY1gflZfYYKvJlg
         YUCQ==
X-Gm-Message-State: AOJu0YxhaY9SKN/wk2vc62A3XDGl9/wf1zhIhTzGLGi8ht48zE2yJAag
	Si8rFVVO6yivHUYBXEOigGSmxL9VHxgMVmgzggLC9YtLxfaIMJrQ0WjGDeZ2Yq5tBU+TZw==
X-Gm-Gg: Acq92OGmGdOjKXy69wkz+CKdn/RTdHvCr2uNmxb0f9bdYDZryGPjYrIbANTxRw2Ru5w
	Hq4ovHYT1oKY4wYeGhCT87/H+fZ2yrqaDUF1Ked7mxcOb5N1W79esN8ePjKYnIujNNU4e7Vkyo+
	9Lzye56u/FdFCVqGegROgup2eZbZuRylETDkAzogP54aaJcuOJUgBttXL5M0pUhzxfXMMAQkTcN
	5HSGvAzaU8nIFJXF8de+eXTDTGOje0epHil7m27UE9ihL9jTpIGMAijs0C3TnaFi7X9T7WpPCW0
	8aOlrsWqVqtPl3R+7mATNktfy5E/eUTQ24eFByw54sy6GPchevxZM5a7x33YIe29N1TIgXtI3kU
	X0Vtb+1hzTfpWyX8+gq8YW13R+yH4j5AdQkkElpR1pC9GeWztAOUSU1C/XrF0R6wwpPfA5TjYg3
	xxhJkblcr7P1+6tPcC/TJh+bMp0UHdkxZqrLjGZtmT+a6n13432I/Ky5M01xfj0g==
X-Received: by 2002:a17:90b:554b:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-370ee351f6fmr9760665a91.2.1780993948937;
        Tue, 09 Jun 2026 01:32:28 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18196212a91.2.2026.06.09.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:32:28 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH 2/6] strongswan: Fix CVE-2026-35329
Date: Tue,  9 Jun 2026 14:01:00 +0530
Message-Id: <20260609083104.869512-2-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
References: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127439

Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...d-NULL-pointer-dereference-when-veri.patch | 57 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch b/meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch
new file mode 100644
index 0000000000..0b4c498fbd
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch
@@ -0,0 +1,57 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 25 Mar 2026 10:28:45 +0100
+Subject: pkcs5/pkcs7: Avoid NULL pointer dereference when verifying padding
+
+Can be triggered via empty PKCS#7 encrypted- or enveloped-data content
+in IKEv1 CERT payload.
+
+Fixes: 4076e3ee9121 ("Extract PKCS#5 handling from pkcs8 plugin to separate helper class")
+Fixes: d7aa09104f08 ("Implement PKCS#7 enveloped-data parsing and decryption")
+Fixes: CVE-2026-35329
+
+CVE: CVE-2026-35329
+Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]
+Patch is refreshed as per the source code version 5.9.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libstrongswan/crypto/pkcs5.c b/src/libstrongswan/crypto/pkcs5.c
+index e48a9ad..134ccd3 100644
+--- a/src/libstrongswan/crypto/pkcs5.c
++++ b/src/libstrongswan/crypto/pkcs5.c
+@@ -113,6 +113,11 @@ static bool verify_padding(crypter_t *crypter, chunk_t *blob)
+ {
+ 	uint8_t padding, count;
+ 
++	if (!blob->len)
++	{
++                return FALSE;
++       }
++
+ 	padding = count = blob->ptr[blob->len - 1];
+ 
+ 	if (padding > crypter->get_block_size(crypter))
+diff --git a/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c b/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c
+index 8b26bad..3d601d6 100644
+--- a/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c
++++ b/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c
+@@ -182,10 +182,17 @@ static bool decrypt(private_key_t *private, chunk_t key, chunk_t iv, int oid,
+  */
+ static bool remove_padding(private_pkcs7_enveloped_data_t *this)
+ {
+-	u_char *pos = this->content.ptr + this->content.len - 1;
+-	u_char pattern = *pos;
+-	size_t padding = pattern;
++	u_char *pos, pattern;
++	size_t padding;
+ 
++	if (!this->content.len)
++       {
++		return FALSE;
++	}
++
++	pos = this->content.ptr + this->content.len - 1;
++	pattern = *pos;
++	padding = pattern;
+ 	if (padding > this->content.len)
+ 	{
+ 		DBG1(DBG_LIB, "padding greater than data length");
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 6fbc345923..ac4bc5380b 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-25075.patch \
            file://CVE-2026-35334.patch \
            file://tls-server-Prevent-infinite-loop-if-supported-versio.patch \
+           file://pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


