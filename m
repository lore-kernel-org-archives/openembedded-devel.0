Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7068.1795733438388487803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 14:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Rx42qRkO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611262250404c793cf36d00020725-_fzp6u@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611262250404c793cf36d00020725
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 26 Nov 2026 23:50:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Guh3CV9zyNRj1jAzkglDQpRxqN4j8pd0qSQvhT7Iv8M=;
 b=Rx42qRkO+QudEUa9h/mqfQOHwPXadhnckehpHId+GOwywajE5zw/geExwODwN1+I22Ai2e
 fO/BTOowcs3j/rC3QeFPwa+yVRNKusWbonsO6RuDtQVC8Sx1t6DvSTjOSOXBYHXhCL/vPdUJ
 Vqcr4aumUgDuYP/iCRnOXbHijKzm1o+u76XBuM2RXvjQBq6GFmVDRXfolW3aiRtZP2aLRZsq
 u86rmaJ3sXj1iJauBwIs+b01ZCY3DBRibqLH8DJIVhBDHZ7aOlBk6q1FeYD85Z6fMRraJdiq
 hct/JSwMB1tBP7na0eSzJzVGobb0T6cKmsYf3/jKbMS0WQHKAY4FSyqg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 4/4] nss: patch CVE-2024-7531
Date: Thu, 26 Nov 2026 23:50:10 +0100
Message-ID: <20261126225010.31859-4-peter.marko@siemens.com>
In-Reply-To: <20261126225010.31859-1-peter.marko@siemens.com>
References: <20261126225010.31859-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 22:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133097
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing [1].

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=1905691

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-7531.patch               | 69 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-7531.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-7531.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-7531.patch
new file mode 100644
index 0000000000..38135295a8
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-7531.patch
@@ -0,0 +1,69 @@
+From e9e4ca24ff6f8b118853db8fc1f9dd4d7653e229 Mon Sep 17 00:00:00 2001
+From: Anna Weine <anna.weine@mozilla.com>
+Date: Wed, 17 Jul 2024 16:16:57 +0000
+Subject: [PATCH] Bug 1905691 - ChaChaXor to return after the function
+ r=nss-reviewers,jschanck
+
+Differential Revision: https://phabricator.services.mozilla.com/D215892
+
+--HG--
+extra : moz-landing-system : lando
+
+CVE: CVE-2024-7531
+Upstream-Status: Backport [https://github.com/mozilla/nss/commit/e9e4ca24ff6f8b118853db8fc1f9dd4d7653e229]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/lib/freebl/chacha20poly1305.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/nss/lib/freebl/chacha20poly1305.c b/nss/lib/freebl/chacha20poly1305.c
+index a83f76df0..47aa18ba8 100644
+--- a/nss/lib/freebl/chacha20poly1305.c
++++ b/nss/lib/freebl/chacha20poly1305.c
+@@ -210,12 +210,14 @@ ChaCha20Xor(uint8_t *output, uint8_t *block, uint32_t len, uint8_t *k,
+ #ifndef NSS_DISABLE_AVX2
+     if (avx2_support()) {
+         Hacl_Chacha20_Vec256_chacha20_encrypt_256(len, output, block, k, nonce, ctr);
++        return;
+     }
+ #endif
+ 
+ #ifndef NSS_DISABLE_SSE3
+     if (ssse3_support() && sse4_1_support() && avx_support()) {
+         Hacl_Chacha20_Vec128_chacha20_encrypt_128(len, output, block, k, nonce, ctr);
++        return;
+     }
+ #endif
+ 
+@@ -223,10 +225,12 @@ ChaCha20Xor(uint8_t *output, uint8_t *block, uint32_t len, uint8_t *k,
+     !defined(NSS_DISABLE_ALTIVEC) && !defined(NSS_DISABLE_CRYPTO_VSX)
+     if (ppc_crypto_support()) {
+         chacha20vsx(len, output, block, k, nonce, ctr);
+-    } else
++        return;
++    }
+ #endif
+     {
+         Hacl_Chacha20_chacha20_encrypt(len, output, block, k, nonce, ctr);
++        return;
+     }
+ }
+ #endif /* NSS_DISABLE_CHACHAPOLY */
+@@ -446,8 +450,6 @@ ChaCha20Poly1305_Encrypt(const ChaCha20Poly1305Context *ctx,
+         goto finish;
+     }
+ #endif
+-
+-    else
+ #elif defined(__powerpc64__) && defined(__LITTLE_ENDIAN__) && \
+     !defined(NSS_DISABLE_ALTIVEC) && !defined(NSS_DISABLE_CRYPTO_VSX)
+     if (ppc_crypto_support()) {
+@@ -455,7 +457,7 @@ ChaCha20Poly1305_Encrypt(const ChaCha20Poly1305Context *ctx,
+             (uint8_t *)ctx->key, (uint8_t *)nonce, adLen, (uint8_t *)ad, inputLen,
+             (uint8_t *)input, output, outTag);
+         goto finish;
+-    } else
++    }
+ #endif
+     {
+         Hacl_Chacha20Poly1305_32_aead_encrypt(
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index 9bebd1c6c4..34a24bb74d 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://CVE-2024-11704.patch \
            file://CVE-2024-11705.patch \
            file://CVE-2024-11706.patch \
+           file://CVE-2024-7531.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
