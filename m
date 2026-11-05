Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9308.1793921116968052630
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 15:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Qryrghrb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261105232515cb3c6afc6e00020799-ms2qff@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261105232515cb3c6afc6e00020799
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Nov 2026 00:25:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Rq7JeIjVPY/qhj5rh1HRsxwAKMRBykRPBu/oYnCBzW0=;
 b=Qryrghrb3DJV8F2Nj3f8cQlA0eyUgih5A0GnkuOkN6HIcLX4aQg+5gLN2mDcwXDGZRlq2D
 iXGDMY2pjY64dma9dqbfmeXLMbPZLF7Fb6wvhimQa4laDa1k+seZGNsbmMIZbtgW0UelZozE
 ZtDOE5PnttPn8w9NWWSAw7haZ6SxaQskCqNaQ+jEMb5lRGby5SoGOKe1DHhVezS82+y+qt+l
 VuEqvUyewnCjYY5ccW9UsOFcbpPeJ9i0CmMyF48UB1Fyndr+X+yayZSNvJrHS6TwrHTlSUQk
 EwcHHZwWiKXzC9r9FBxFf2iq0e4zhoYqjBL3JwW5ZaOMLNdc6Y2piPgA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 4/4] nss: patch CVE-2024-7531
Date: Fri,  6 Nov 2026 00:23:14 +0100
Message-ID: <20261105232314.3699451-4-peter.marko@siemens.com>
In-Reply-To: <20261105232314.3699451-1-peter.marko@siemens.com>
References: <20261105232314.3699451-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 23:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131957
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
index 00000000000..38135295a8c
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
index 9bebd1c6c4d..34a24bb74de 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://CVE-2024-11704.patch \
            file://CVE-2024-11705.patch \
            file://CVE-2024-11706.patch \
+           file://CVE-2024-7531.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
