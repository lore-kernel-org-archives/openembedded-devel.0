Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0402CCF9F6
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 07:11:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.21277.1761808268847276443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 00:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JurMTDl4;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26d0fbe238bso5793285ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 00:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761808268; x=1762413068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEGQlkl5m88ziyflxLSEgyWMSAwkzwuPc+7/UQ/1lmI=;
        b=JurMTDl4vMKSw+YPJnuLARTIjK7gi6lZPlF2ms5BNkwPiI1L9wUNQ6y9M1M6LHwaZ3
         rADrLhZw/pL/NEUt3zPmGF4ecNlly4iHhCdV8G7H5fMgflX9523C/S8z7D4UjiJdb7lI
         esJJj27GFmtZMxwqNAqq2wXxLA3LWoVArm3qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808268; x=1762413068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEGQlkl5m88ziyflxLSEgyWMSAwkzwuPc+7/UQ/1lmI=;
        b=Lka/YRVL9CEIYeM57iDQngYvbRHUWqMr5O7mtpi4hc4MIrbNqm2Je5L+Wb/NiLL0jl
         2hGWdyZzbRwK3kp/Y2C8E32ff0OQQjVfoPhz9PGX11akUg3EggPhqMtNcr9RXD3CNeel
         IisFVl92WOcvZiMbblscmaqpXZivDBslhKK4+GHjUYtu6+LBBytzc+Nkn5UtjLrJnTVy
         /zzhk4IEaNlcBvb4yChC4dZ1vaRz7/LTvxSArvJrQYZNRAoac/F1Ipci4YVq9GGGnNqg
         OuYgZDgvkh4xSxtxIHG942U4b4lqyKHtbfCdUs851z3D1YhUMwCg/m2JRaheDwGGvowv
         8xJg==
X-Gm-Message-State: AOJu0Yyp3gYa5ytDLA4PgA5iwqt8Sbqd8ONPLcvBf3b5x3UZdPSo2+FX
	tcbO4gBcXu2FwrqZ2eVNLhSCx6u9wWDYzILw01EiVTwiwF0qI+NH7y/P/GIH4ftjseyuSJ3odzN
	uGkB3Rao=
X-Gm-Gg: ASbGncsGgfoI1tFNG1+HJEoe3MnrjEvCrY4trMudsf3fOgiNr8hN0rdEY1Z6GUHC7Pw
	J4+BvzU57REOtpQkzfLaZi8ozWdAw5vWTUY32UP9OwlMVPpXFqLfsESxZe+omsCmMWMMHYn9AdC
	dWamYf6AzC+aBjGjBcbkdkKjK1aSTJBur7qf0poExfQrmT7n0orRTDgF54fD0gimT7mzd1p2mSK
	/6qp9QFXFyfuky2Ra9JGWmF7ftDLUlnlnz4ac/HWmIOXX6hyWEa7enot4gZuauuT/GWF9OmBKYW
	XI6ASLH1qL2N8OvXWRUiD6fg1xUXb9raRiS3lIHfTuPJfejF857eosETLHrVK1qTShlwwcKw8be
	YbWOAYHpNzz3kSJfAXL4pFqc/XOpsEXoG3dLYFJPzQCbrKTgUkywMYmRo1c2UJ5mUcSGyX2OXTN
	r/mw==
X-Google-Smtp-Source: AGHT+IHTfRQles++HU+OaC8bjPRTNDsu6WlqNdd2doY0BeT9O78S2uoyYIPXeeDHhgHPqKPLNdYHLw==
X-Received: by 2002:a17:902:db02:b0:267:a95d:7164 with SMTP id d9443c01a7336-294def3e1bfmr63453535ad.60.1761808267612;
        Thu, 30 Oct 2025 00:11:07 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:8fcd:5ea8:a69b:e08f:2a3b:8d02])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d273a2sm173947325ad.60.2025.10.30.00.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:11:07 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch v2] libssh: Fix CVE-2025-8277
Date: Thu, 30 Oct 2025 12:40:58 +0530
Message-ID: <20251030071058.17676-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 07:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121197

Upstream-Commits:
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=87db2659ec608a977a63eea529f17b9168388d73
&
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f
&
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08
& https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1

The changes made to the file src/ecdh_crypto.c are excluded, present in the commit 266174a6d36687b65cf90174f06af90b8b27c65.
The relevant changes in `ecdh_crypto.c` are located within the function `static ssh_string ssh_ecdh_generate`. This function, however, is not present in the `libssh-0.10.6` version. It was introduced in `libssh` version 0.11 by the commit  `https://git.libssh.org/projects/libssh.git/commit/src/ecdh_crypto.c?h=stable-0.11&id=1eb3df5254a4348eae6edbc8a2bf08fef4015897`.

Consequently, these changes cannot be directly applied to the `libssh-0.10.6` version. This aligns with the approach taken by other distributions, as Suse also did not backport the `ecdh_crypto.c` file changes in their `libssh-0.10.6-3.1.src.rpm` package, which is available at `https://cdimage.debian.org/mirror/opensuse.org/distribution/leap-micro/6.0/product/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-0.10.6-3.1.src.rpm`.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2025-8277-1.patch       | 40 ++++++++
 .../libssh/libssh/CVE-2025-8277-2.patch       | 94 +++++++++++++++++++
 .../libssh/libssh/CVE-2025-8277-3.patch       | 48 ++++++++++
 .../libssh/libssh/CVE-2025-8277-4.patch       | 48 ++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  4 +
 5 files changed, 234 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-4.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
new file mode 100644
index 0000000000..7155618271
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
@@ -0,0 +1,40 @@
+From 87db2659ec608a977a63eea529f17b9168388d73 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 5 Aug 2025 18:42:31 +0200
+Subject: CVE-2025-8277: packet: Adjust packet filter to work when DH-GEX is
+ guessed wrongly
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 4310a696f2d632c6742678077d703d9b9ff3bc0e)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=87db2659ec608a977a63eea529f17b9168388d73]
+CVE: CVE-2025-8277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/packet.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/packet.c b/src/packet.c
+index f15aa2ad..f54b3158 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -294,6 +294,7 @@ static enum ssh_packet_filter_result_e ssh_packet_incoming_filter(ssh_session se
+          *   or session_state == SSH_SESSION_STATE_INITIAL_KEX
+          * - dh_handshake_state == DH_STATE_INIT
+          *   or dh_handshake_state == DH_STATE_INIT_SENT (re-exchange)
++         *   or dh_handshake_state == DH_STATE_REQUEST_SENT (dh-gex)
+          *   or dh_handshake_state == DH_STATE_FINISHED (re-exchange)
+          *
+          * Transitions:
+@@ -313,6 +314,7 @@ static enum ssh_packet_filter_result_e ssh_packet_incoming_filter(ssh_session se
+ 
+         if ((session->dh_handshake_state != DH_STATE_INIT) &&
+             (session->dh_handshake_state != DH_STATE_INIT_SENT) &&
++            (session->dh_handshake_state != DH_STATE_REQUEST_SENT) &&
+             (session->dh_handshake_state != DH_STATE_FINISHED))
+         {
+             rc = SSH_PACKET_DENIED;
+-- 
+cgit v1.2.3
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
new file mode 100644
index 0000000000..748d390d63
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
@@ -0,0 +1,94 @@
+From 266174a6d36687b65cf90174f06af90b8b27c65f Mon Sep 17 00:00:00 2001
+From: Francesco Rollo <eferollo@gmail.com>
+Date: Thu, 24 Jul 2025 16:30:07 +0300
+Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused ephemeral key pair
+ after client's wrong KEX guess
+
+Signed-off-by: Francesco Rollo <eferollo@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)
+
+Changes in file 'src/ecdh_crypto.c' excluded.
+The relevant changes in `ecdh_crypto.c` are located within the function `static ssh_string ssh_ecdh_generate`. This function, however, is not present in the `libssh-0.10.6` version. It was introduced in `libssh` version 0.11 by the commit  `https://git.libssh.org/projects/libssh.git/commit/src/ecdh_crypto.c?h=stable-0.11&id=1eb3df5254a4348eae6edbc8a2bf08fef4015897`.
+
+Consequently, these changes cannot be directly applied to the `libssh-0.10.6` version. This aligns with the approach taken by other distributions, as Suse also did not backport the `ecdh_crypto.c` file changes in their `libssh-0.10.6-3.1.src.rpm` package, which is available at `https://cdimage.debian.org/mirror/opensuse.org/distribution/leap-micro/6.0/product/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-0.10.6-3.1.src.rpm`.
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f]
+CVE: CVE-2025-8277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/dh_crypto.c       | 5 +++++
+ src/dh_key.c          | 5 +++++
+ src/ecdh_gcrypt.c     | 6 ++++++
+ src/ecdh_mbedcrypto.c | 6 ++++++
+ 4 files changed, 22 insertions(+)
+
+diff --git a/src/dh_crypto.c b/src/dh_crypto.c
+index 4dd9b507..cedfbc81 100644
+--- a/src/dh_crypto.c
++++ b/src/dh_crypto.c
+@@ -407,6 +407,11 @@ int ssh_dh_init_common(struct ssh_crypto_struct *crypto)
+     struct dh_ctx *ctx = NULL;
+     int rc;
+ 
++    /* Cleanup any previously allocated dh_ctx */
++    if (crypto->dh_ctx != NULL) {
++        ssh_dh_cleanup(crypto);
++    }
++
+     ctx = calloc(1, sizeof(*ctx));
+     if (ctx == NULL) {
+         return SSH_ERROR;
+diff --git a/src/dh_key.c b/src/dh_key.c
+index 20d24a31..d9743ceb 100644
+--- a/src/dh_key.c
++++ b/src/dh_key.c
+@@ -237,6 +237,11 @@ int ssh_dh_init_common(struct ssh_crypto_struct *crypto)
+     struct dh_ctx *ctx = NULL;
+     int rc;
+ 
++    /* Cleanup any previously allocated dh_ctx */
++    if (crypto->dh_ctx != NULL) {
++        ssh_dh_cleanup(crypto);
++    }
++
+     ctx = calloc(1, sizeof(*ctx));
+     if (ctx == NULL) {
+         return SSH_ERROR;
+diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
+index 73fcd50f..b8d983c1 100644
+--- a/src/ecdh_gcrypt.c
++++ b/src/ecdh_gcrypt.c
+@@ -101,6 +101,12 @@ int ssh_client_ecdh_init(ssh_session session)
+         goto out;
+     }
+ 
++    /* Free any previously allocated privkey */
++    if (session->next_crypto->ecdh_privkey != NULL) {
++        gcry_sexp_release(session->next_crypto->ecdh_privkey);
++        session->next_crypto->ecdh_privkey = NULL;
++    }
++
+     session->next_crypto->ecdh_privkey = key;
+     key = NULL;
+     session->next_crypto->ecdh_client_pubkey = client_pubkey;
+diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
+index dda73922..6074b93d 100644
+--- a/src/ecdh_mbedcrypto.c
++++ b/src/ecdh_mbedcrypto.c
+@@ -70,6 +70,12 @@ int ssh_client_ecdh_init(ssh_session session)
+         return SSH_ERROR;
+     }
+ 
++    /* Free any previously allocated privkey */
++    if (session->next_crypto->ecdh_privkey != NULL) {
++        mbedtls_ecp_keypair_free(session->next_crypto->ecdh_privkey);
++        SAFE_FREE(session->next_crypto->ecdh_privkey);
++    }
++
+     session->next_crypto->ecdh_privkey = malloc(sizeof(mbedtls_ecp_keypair));
+     if (session->next_crypto->ecdh_privkey == NULL) {
+         return SSH_ERROR;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
new file mode 100644
index 0000000000..41848b1f0a
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
@@ -0,0 +1,48 @@
+From 8e4d67aa9eda455bfad9ac610e54b7a548d0aa08 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 6 Aug 2025 11:10:38 +0200
+Subject: [PATCH] CVE-2025-8277: ecdh: Free previously allocated pubkeys
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit c9d95ab0c7a52b231bcec09afbea71944ed0d852)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08]
+CVE: CVE-2025-8277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ecdh_crypto.c | 1 +
+ src/ecdh_gcrypt.c | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
+index 069b1372..4a029db3 100644
+--- a/src/ecdh_crypto.c
++++ b/src/ecdh_crypto.c
+@@ -220,6 +220,7 @@ int ssh_client_ecdh_init(ssh_session session){
+   }
+ 
+   session->next_crypto->ecdh_privkey = key;
++  ssh_string_free(session->next_crypto->ecdh_client_pubkey);
+   session->next_crypto->ecdh_client_pubkey = client_pubkey;
+ 
+   /* register the packet callbacks */
+diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
+index b8d983c1..662497e3 100644
+--- a/src/ecdh_gcrypt.c
++++ b/src/ecdh_gcrypt.c
+@@ -106,9 +106,10 @@ int ssh_client_ecdh_init(ssh_session session)
+         gcry_sexp_release(session->next_crypto->ecdh_privkey);
+         session->next_crypto->ecdh_privkey = NULL;
+     }
+-
+     session->next_crypto->ecdh_privkey = key;
+     key = NULL;
++
++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
+     session->next_crypto->ecdh_client_pubkey = client_pubkey;
+     client_pubkey = NULL;
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-4.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-4.patch
new file mode 100644
index 0000000000..d5b43c4d0b
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-4.patch
@@ -0,0 +1,48 @@
+From 1c763e29d138db87665e98983f468d2dd0f286c1 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 6 Aug 2025 15:32:56 +0200
+Subject: [PATCH] CVE-2025-8277: mbedtls: Avoid leaking ecdh keys
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit ffed80f8c078122990a4eba2b275facd56dd43e0)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1]
+CVE: CVE-2025-8277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ecdh_mbedcrypto.c | 1 +
+ src/wrapper.c         | 5 ++++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
+index 6074b93d..351aa655 100644
+--- a/src/ecdh_mbedcrypto.c
++++ b/src/ecdh_mbedcrypto.c
+@@ -116,6 +116,7 @@ int ssh_client_ecdh_init(ssh_session session)
+         goto out;
+     }
+ 
++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
+     session->next_crypto->ecdh_client_pubkey = client_pubkey;
+     client_pubkey = NULL;
+ 
+diff --git a/src/wrapper.c b/src/wrapper.c
+index 43bf2137..0397f96d 100644
+--- a/src/wrapper.c
++++ b/src/wrapper.c
+@@ -193,7 +193,10 @@ void crypto_free(struct ssh_crypto_struct *crypto)
+ #endif
+         crypto->ecdh_privkey = NULL;
+     }
+-#endif
++#elif defined HAVE_LIBMBEDCRYPTO
++    mbedtls_ecp_keypair_free(crypto->ecdh_privkey);
++    SAFE_FREE(crypto->ecdh_privkey);
++#endif /* HAVE_LIBGCRYPT */
+     SAFE_FREE(crypto->dh_server_signature);
+     if (crypto->session_id != NULL) {
+         explicit_bzero(crypto->session_id, crypto->session_id_len);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 602e01fce6..de37719b09 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -18,6 +18,10 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-4878-0002.patch \
            file://CVE-2025-5987.patch \
            file://CVE-2025-8114.patch \
+           file://CVE-2025-8277-1.patch \
+           file://CVE-2025-8277-2.patch \
+           file://CVE-2025-8277-3.patch \
+           file://CVE-2025-8277-4.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.43.0


