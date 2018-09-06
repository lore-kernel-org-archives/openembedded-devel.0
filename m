Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0A379723
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:37 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id e11-v6so5292288plb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RGlELFjQyF7fVPIzlQ8r4HCIkBSrirR4GmEc7XWdHsc=;
	b=sTODr2sCJoao5uYzkrmycIl8KnZxr3BNq+YesGWYs1roI1xrwCMHMJc+U33rN6G+9Q
	XSRiTdveb13Vz0hf65OBn6nXqpFhIe1zhnk6/0ylEwWy4M1jrwf4bT0IjKenDsTeInmL
	VjHlKvUO62X3REzvObUzm8f7Y8jlCPs+BmbFiSTJyRso68E19HSnLGKxQmNSJXfR79vl
	fHUuX7O/aM60J5hqjun4wpHbtz+JIAgDgZg4dj+F/doxgu5lv7fhsxAguxA5kSssUERS
	Ql8bUnqgkYBbdalAPi2XyNqwqfjolFSin8Gv11oFG8qC5dTCJA2vgj5t4voLEJHsbc6T
	4U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RGlELFjQyF7fVPIzlQ8r4HCIkBSrirR4GmEc7XWdHsc=;
	b=YLxHW3JHriB7ZREdFK5qHmqoAB7wwai4X4a3h8v0CGfvhs2UgJf2SHirG3SwM2y9ZU
	6sQWSBlTe77A8MuKD7JaKgmN72zZudnpegscvxEnczvUXth8h9D2id6xGkAWtJ8CUQ64
	DPJy8hsOt3SgMqW9T2adiGypWTrT3slLCo4LMVVSnt5Uyq3O+q6MqV0Q//0Ne+RqkOPM
	LzgTQSbba6EvhTLPERCo7cryQHDXiu9DIINiu8PFU5Cxp9t+ZxQ2AsjM5mVpb9YcqZ0P
	hYlMj/9q+WSr/clhxcJhM8HH6gPTBNOQC5G1PiIxxyAJdv4DjqvZhULhI46qODHehCzo
	1U1w==
X-Gm-Message-State: APzg51Awx/HRQ5WHG+1cVl6zK55YLK5+8nemJ9qLljt73wQAJFYJX2/E
	0/4RAh7L8Gd72XnjkuQccORByLEh
X-Google-Smtp-Source: ANB0VdaDgogKWA0ZJIjFgX3B2fQxhyRpy8ncd85eHEDvdmKdU/PlEJ5iUVrVxGLH4Rsy9Fo/rfiRcw==
X-Received: by 2002:a17:902:163:: with SMTP id
	90-v6mr3759570plb.322.1536254558192; 
	Thu, 06 Sep 2018 10:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:08 -0700
Message-Id: <20180906172210.42551-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/17] ipmitool: Fix build with OpenSSL 1.1.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 17:22:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Migrate-to-openssl-1.1.patch         | 152 ++++++++++++++++++
 .../ipmitool/ipmitool_1.8.18.bb               |   4 +-
 2 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
new file mode 100644
index 0000000000..394aa16adc
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
@@ -0,0 +1,152 @@
+From c9dcb6afef9c343d070aaff208d11a997a45a105 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Sep 2018 22:19:38 -0700
+Subject: [PATCH] Migrate to openssl 1.1
+
+Upstream-Status: Backport [https://sourceforge.net/p/ipmitool/source/ci/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1/]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/plugins/lanplus/lanplus_crypt_impl.c | 50 ++++++++++++++----------
+ 1 file changed, 29 insertions(+), 21 deletions(-)
+
+diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
+index d5fac37..9652a5e 100644
+--- a/src/plugins/lanplus/lanplus_crypt_impl.c
++++ b/src/plugins/lanplus/lanplus_crypt_impl.c
+@@ -164,11 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint8_t       * output,
+ 							uint32_t        * bytes_written)
+ {
+-	EVP_CIPHER_CTX ctx;
+-	EVP_CIPHER_CTX_init(&ctx);
+-	EVP_EncryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
+-	EVP_CIPHER_CTX_set_padding(&ctx, 0);
+-	
++	EVP_CIPHER_CTX *ctx = NULL;
+ 
+ 	*bytes_written = 0;
+ 
+@@ -182,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 		printbuf(input, input_length, "encrypting this data");
+ 	}
+ 
++	ctx = EVP_CIPHER_CTX_new();
++	if (ctx == NULL) {
++		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
++		return;
++	}
++	EVP_CIPHER_CTX_init(ctx);
++	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
++	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+ 	/*
+ 	 * The default implementation adds a whole block of padding if the input
+@@ -191,28 +195,28 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
+ 
+ 
+-	if(!EVP_EncryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
++	if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
+ 	{
+ 		/* Error */
+ 		*bytes_written = 0;
+-		return;
+ 	}
+ 	else
+ 	{
+ 		uint32_t tmplen;
+ 
+-		if(!EVP_EncryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
++		if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
+ 		{
++			/* Error */
+ 			*bytes_written = 0;
+-			return; /* Error */
+ 		}
+ 		else
+ 		{
+ 			/* Success */
+ 			*bytes_written += tmplen;
+-			EVP_CIPHER_CTX_cleanup(&ctx);
+ 		}
+ 	}
++	/* performs cleanup and free */
++	EVP_CIPHER_CTX_free(ctx);
+ }
+ 
+ 
+@@ -239,11 +243,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint8_t       * output,
+ 							uint32_t        * bytes_written)
+ {
+-	EVP_CIPHER_CTX ctx;
+-	EVP_CIPHER_CTX_init(&ctx);
+-	EVP_DecryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
+-	EVP_CIPHER_CTX_set_padding(&ctx, 0);
+-
++	EVP_CIPHER_CTX *ctx = NULL;
+ 
+ 	if (verbose >= 5)
+ 	{
+@@ -252,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 		printbuf(input, input_length, "decrypting this data");
+ 	}
+ 
+-
+ 	*bytes_written = 0;
+ 
+ 	if (input_length == 0)
+ 		return;
+ 
++	ctx = EVP_CIPHER_CTX_new();
++	if (ctx == NULL) {
++		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
++		return;
++	}
++	EVP_CIPHER_CTX_init(ctx);
++	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
++	EVP_CIPHER_CTX_set_padding(ctx, 0);
++
+ 	/*
+ 	 * The default implementation adds a whole block of padding if the input
+ 	 * data is perfectly aligned.  We would like to keep that from happening.
+@@ -266,33 +274,33 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
+ 
+ 
+-	if (!EVP_DecryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
++	if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
+ 	{
+ 		/* Error */
+ 		lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
+ 		*bytes_written = 0;
+-		return;
+ 	}
+ 	else
+ 	{
+ 		uint32_t tmplen;
+ 
+-		if (!EVP_DecryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
++		if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
+ 		{
++			/* Error */
+ 			char buffer[1000];
+ 			ERR_error_string(ERR_get_error(), buffer);
+ 			lprintf(LOG_DEBUG, "the ERR error %s", buffer);
+ 			lprintf(LOG_DEBUG, "ERROR: decrypt final failed");
+ 			*bytes_written = 0;
+-			return; /* Error */
+ 		}
+ 		else
+ 		{
+ 			/* Success */
+ 			*bytes_written += tmplen;
+-			EVP_CIPHER_CTX_cleanup(&ctx);
+ 		}
+ 	}
++	/* performs cleanup and free */
++	EVP_CIPHER_CTX_free(ctx);
+ 
+ 	if (verbose >= 5)
+ 	{
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
index 9f73d2799b..b7f1aa9145 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
 
 DEPENDS = "openssl readline ncurses"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
+           file://0001-Migrate-to-openssl-1.1.patch \
+           "
 SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
 SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
 
-- 
2.18.0


