Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F207CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:32 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.15017.1758628643488654217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T3eLqJSt;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b2e66a300cbso311315966b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758628642; x=1759233442; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xLP1y8vGqAE8N6NOstVSqzQFdxQEpp8YN5aoF1a13c=;
        b=T3eLqJStZqx+6pFXJVrOAmBVHxqbOwP9XHzD/N8M5SaqlWcxPnZ2QRj5UkutN2bUyG
         KMFILGQfvFNDH04OSmQUVEUMMLY34NMZuxqtHz9iVCISUWUvsEgtLncpiT01TIl8JSYv
         qiCfQ4HgmYpLrTgndfDtaq97HgFYnhTd3307p1p+OgbpJbJaDWMpJRT3lP1rd+9kI0av
         xZIfq6o9jbknG8z9ennxYBUy/KGesenhGKfAxguUlVx3QMUk5RcSwk4bLlJOsM1gRQZR
         IuSvx7QGeujpI9PaZ4302+GmuSb96lCgQCpZu4F9VYODbKcBUFU8UWWPJezIL8PI8fwf
         WT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758628642; x=1759233442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xLP1y8vGqAE8N6NOstVSqzQFdxQEpp8YN5aoF1a13c=;
        b=STtj57zxb5lU0wEg4be83DQ2sq4qPEt8x5M/NyjT3Qh9uKn2Zp7DxvSFGrBGgC4B+n
         nQBymZwaAf/2Rg3hbwbQN8g3uMCpYxJZufjkvsrmUusHKkt+7Pkn250Ms2H2CWJGfDE/
         6QAO1wf3SROANCB8++h1bhEjw40P0owD6nl5BMW5UNBmcG+YVrW4cOuMTyfmAzVd9QHM
         p6bL3YMzHA1dPcZEY+8m0S/0+U4TBGJB0g1wd455IXcjJt5uUyD5p4VOeQkIU1jgHApM
         mQkVYnmrZPZnywBD+YQk/LpGdvHs17ujPzYoyxc19VxpY+NOK6bwpz3rUAvV/ovAxKvk
         PanA==
X-Forwarded-Encrypted: i=1; AJvYcCV3922sAOuDc0eOBWwlSQmlpt2d17BLUx67oIl9AygLGEq8kipdOcf76L+WTo14Z1xJYiEoTODzOCEGFVaSpj2Vero=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFWMQh+pSf+xUO+9VRGG2a6uoNL6KAnYZMQlhAnsxyM89Oy//B
	y/siZXJbSNJTCM2AM3Bh6PnrukuViTg8w8LGaDnirGzdJcpQHgWg6LcB
X-Gm-Gg: ASbGnctPlte8gt8EXEguVODNNREwdugzOGBi0sQ0ecvq1N6Eqm63ufBsV62U6QTvH7Y
	SLWpA3luCG3t4tsjNxMjblv9zVEmMm/nhofObcUQFxU5T1zmbZz4PjKAsJpefCNtWhpM1I1Ify6
	b/1uBCgJzNOPbsis6y+Fb0/SfFFl7XYyhJUTaQk63uaKn5xxCWafgixuPsOk+vgCp3iHHEYahpd
	sq17rfO6GjZl3Ko+kmCOsiQd+X0e7Fa+AZStZzpJvniDLcYiuyvX7sVP+PQ5UllyxpvZg5eDRhD
	rS77R1jYYpJMcU3Q4YPp33/iF0T0KB/b+tDPnXDw2vsfhAGAGwJk/F/mQNMc9rumYylU+FJFNxb
	Cr+9HjnYJmwBGuEAnldZWS/JPi7SfPfun2MNri7ljKw==
X-Google-Smtp-Source: AGHT+IHs/sQWwGRqfKbZ0yJgJ/B3qd5iPVBzczMa0SftU+G02JISdyNGA+1lnOK2Rtg5dqRxMQTRTQ==
X-Received: by 2002:a17:907:26c4:b0:b2b:a56f:541a with SMTP id a640c23a62f3a-b3027260835mr220925866b.7.1758628641578;
        Tue, 23 Sep 2025 04:57:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a66073884sm645466466b.83.2025.09.23.04.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 04:57:20 -0700 (PDT)
Message-ID: <901c7a93-9703-4cf5-9127-45da0967964b@gmail.com>
Date: Tue, 23 Sep 2025 13:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH] libssh 0.11.2: Fix CVE-2025-8277
 and CVE-2025-8114
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250920105615.1616997-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250920105615.1616997-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119688

Suggestion: It looks like the next version, 0.11.3 contains only
bugfixes and no new features - if you bump the recipe version instead of
backporting patches, I think that would be also fine. (Though I have no
problem with this patch either, looks okay to me.)

On 9/20/25 12:56, Ankur Tyagi via lists.openembedded.org wrote:
> CVE: CVE-2025-8277
> Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=87db2659ec608a977a63eea529f17b9168388d73]
>                           [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=266174a6d36687b65cf90174f06af90b8b27c65f]
>                           [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08]
>                           [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=1c763e29d138db87665e98983f468d2dd0f286c1]
>
> CVE: CVE-2025-8114
> Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=65f363c9e3a22b90af7f74b5c439a133b1047379]
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...cket-Adjust-packet-filter-to-work-wh.patch |  38 ++++++
>  ...x-memory-leak-of-unused-ephemeral-ke.patch | 110 ++++++++++++++++++
>  ...dh-Free-previously-allocated-pubkeys.patch |  46 ++++++++
>  ...8277-mbedtls-Avoid-leaking-ecdh-keys.patch |  46 ++++++++
>  ...x-NULL-pointer-dereference-after-all.patch |  47 ++++++++
>  .../recipes-support/libssh/libssh_0.11.2.bb   |   5 +
>  6 files changed, 292 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-8277-packet-Adjust-packet-filter-to-work-wh.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/0003-CVE-2025-8277-ecdh-Free-previously-allocated-pubkeys.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/0005-CVE-2025-8114-Fix-NULL-pointer-dereference-after-all.patch
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-8277-packet-Adjust-packet-filter-to-work-wh.patch b/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-8277-packet-Adjust-packet-filter-to-work-wh.patch
> new file mode 100644
> index 0000000000..0fc14683a1
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-8277-packet-Adjust-packet-filter-to-work-wh.patch
> @@ -0,0 +1,38 @@
> +From c3a892a972fd2476ec3588dfd12ce81be96bc64a Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Tue, 5 Aug 2025 18:42:31 +0200
> +Subject: [PATCH] CVE-2025-8277: packet: Adjust packet filter to work when
> + DH-GEX is guessed wrongly
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> +(cherry picked from commit 4310a696f2d632c6742678077d703d9b9ff3bc0e)
> +(cherry picked from commit 87db2659ec608a977a63eea529f17b9168388d73)
> +
> +CVE: CVE-2025-8277
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=87db2659ec608a977a63eea529f17b9168388d73]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/packet.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/packet.c b/src/packet.c
> +index f15aa2ad..f54b3158 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -294,6 +294,7 @@ static enum ssh_packet_filter_result_e ssh_packet_incoming_filter(ssh_session se
> +          *   or session_state == SSH_SESSION_STATE_INITIAL_KEX
> +          * - dh_handshake_state == DH_STATE_INIT
> +          *   or dh_handshake_state == DH_STATE_INIT_SENT (re-exchange)
> ++         *   or dh_handshake_state == DH_STATE_REQUEST_SENT (dh-gex)
> +          *   or dh_handshake_state == DH_STATE_FINISHED (re-exchange)
> +          *
> +          * Transitions:
> +@@ -313,6 +314,7 @@ static enum ssh_packet_filter_result_e ssh_packet_incoming_filter(ssh_session se
> + 
> +         if ((session->dh_handshake_state != DH_STATE_INIT) &&
> +             (session->dh_handshake_state != DH_STATE_INIT_SENT) &&
> ++            (session->dh_handshake_state != DH_STATE_REQUEST_SENT) &&
> +             (session->dh_handshake_state != DH_STATE_FINISHED))
> +         {
> +             rc = SSH_PACKET_DENIED;
> diff --git a/meta-oe/recipes-support/libssh/libssh/0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch b/meta-oe/recipes-support/libssh/libssh/0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch
> new file mode 100644
> index 0000000000..0ba2edee68
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch
> @@ -0,0 +1,110 @@
> +From 5377fd08f2818799d3e6107078e2bdb9ec1f9529 Mon Sep 17 00:00:00 2001
> +From: Francesco Rollo <eferollo@gmail.com>
> +Date: Thu, 24 Jul 2025 16:30:07 +0300
> +Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused ephemeral key pair
> + after client's wrong KEX guess
> +
> +Signed-off-by: Francesco Rollo <eferollo@gmail.com>
> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> +(cherry picked from commit ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)
> +(cherry picked from commit 266174a6d36687b65cf90174f06af90b8b27c65f)
> +
> +CVE: CVE-2025-8277
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=266174a6d36687b65cf90174f06af90b8b27c65f]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/dh_crypto.c       |  5 +++++
> + src/dh_key.c          |  5 +++++
> + src/ecdh_crypto.c     | 11 +++++++++++
> + src/ecdh_gcrypt.c     |  6 ++++++
> + src/ecdh_mbedcrypto.c |  6 ++++++
> + 5 files changed, 33 insertions(+)
> +
> +diff --git a/src/dh_crypto.c b/src/dh_crypto.c
> +index 4dd9b507..cedfbc81 100644
> +--- a/src/dh_crypto.c
> ++++ b/src/dh_crypto.c
> +@@ -407,6 +407,11 @@ int ssh_dh_init_common(struct ssh_crypto_struct *crypto)
> +     struct dh_ctx *ctx = NULL;
> +     int rc;
> + 
> ++    /* Cleanup any previously allocated dh_ctx */
> ++    if (crypto->dh_ctx != NULL) {
> ++        ssh_dh_cleanup(crypto);
> ++    }
> ++
> +     ctx = calloc(1, sizeof(*ctx));
> +     if (ctx == NULL) {
> +         return SSH_ERROR;
> +diff --git a/src/dh_key.c b/src/dh_key.c
> +index 20d24a31..d9743ceb 100644
> +--- a/src/dh_key.c
> ++++ b/src/dh_key.c
> +@@ -237,6 +237,11 @@ int ssh_dh_init_common(struct ssh_crypto_struct *crypto)
> +     struct dh_ctx *ctx = NULL;
> +     int rc;
> + 
> ++    /* Cleanup any previously allocated dh_ctx */
> ++    if (crypto->dh_ctx != NULL) {
> ++        ssh_dh_cleanup(crypto);
> ++    }
> ++
> +     ctx = calloc(1, sizeof(*ctx));
> +     if (ctx == NULL) {
> +         return SSH_ERROR;
> +diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
> +index 57c3dc89..a286804f 100644
> +--- a/src/ecdh_crypto.c
> ++++ b/src/ecdh_crypto.c
> +@@ -191,6 +191,17 @@ static ssh_string ssh_ecdh_generate(ssh_session session)
> + #endif /* OPENSSL_VERSION_NUMBER */
> +         return NULL;
> +     }
> ++
> ++    /* Free any previously allocated privkey */
> ++    if (session->next_crypto->ecdh_privkey != NULL) {
> ++#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++        EC_KEY_free(session->next_crypto->ecdh_privkey);
> ++#else
> ++        EVP_PKEY_free(session->next_crypto->ecdh_privkey);
> ++#endif
> ++        session->next_crypto->ecdh_privkey = NULL;
> ++    }
> ++
> +     session->next_crypto->ecdh_privkey = key;
> +     return pubkey_string;
> + }
> +diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
> +index a52ca84d..8eabfe18 100644
> +--- a/src/ecdh_gcrypt.c
> ++++ b/src/ecdh_gcrypt.c
> +@@ -101,6 +101,12 @@ int ssh_client_ecdh_init(ssh_session session)
> +         goto out;
> +     }
> + 
> ++    /* Free any previously allocated privkey */
> ++    if (session->next_crypto->ecdh_privkey != NULL) {
> ++        gcry_sexp_release(session->next_crypto->ecdh_privkey);
> ++        session->next_crypto->ecdh_privkey = NULL;
> ++    }
> ++
> +     session->next_crypto->ecdh_privkey = key;
> +     key = NULL;
> +     session->next_crypto->ecdh_client_pubkey = client_pubkey;
> +diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
> +index 1d9c8f36..d31bfcc7 100644
> +--- a/src/ecdh_mbedcrypto.c
> ++++ b/src/ecdh_mbedcrypto.c
> +@@ -70,6 +70,12 @@ int ssh_client_ecdh_init(ssh_session session)
> +         return SSH_ERROR;
> +     }
> + 
> ++    /* Free any previously allocated privkey */
> ++    if (session->next_crypto->ecdh_privkey != NULL) {
> ++        mbedtls_ecp_keypair_free(session->next_crypto->ecdh_privkey);
> ++        SAFE_FREE(session->next_crypto->ecdh_privkey);
> ++    }
> ++
> +     session->next_crypto->ecdh_privkey = malloc(sizeof(mbedtls_ecp_keypair));
> +     if (session->next_crypto->ecdh_privkey == NULL) {
> +         return SSH_ERROR;
> diff --git a/meta-oe/recipes-support/libssh/libssh/0003-CVE-2025-8277-ecdh-Free-previously-allocated-pubkeys.patch b/meta-oe/recipes-support/libssh/libssh/0003-CVE-2025-8277-ecdh-Free-previously-allocated-pubkeys.patch
> new file mode 100644
> index 0000000000..57ad4079d8
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/0003-CVE-2025-8277-ecdh-Free-previously-allocated-pubkeys.patch
> @@ -0,0 +1,46 @@
> +From 14567df40173f55b791d3722bcdf4fadfa7c7699 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Wed, 6 Aug 2025 11:10:38 +0200
> +Subject: [PATCH] CVE-2025-8277: ecdh: Free previously allocated pubkeys
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> +(cherry picked from commit c9d95ab0c7a52b231bcec09afbea71944ed0d852)
> +(cherry picked from commit 8e4d67aa9eda455bfad9ac610e54b7a548d0aa08)
> +
> +CVE: CVE-2025-8277
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/ecdh_crypto.c | 1 +
> + src/ecdh_gcrypt.c | 3 ++-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
> +index a286804f..fb707c32 100644
> +--- a/src/ecdh_crypto.c
> ++++ b/src/ecdh_crypto.c
> +@@ -230,6 +230,7 @@ int ssh_client_ecdh_init(ssh_session session)
> +         return SSH_ERROR;
> +     }
> + 
> ++    ssh_string_free(session->next_crypto->ecdh_client_pubkey);
> +     session->next_crypto->ecdh_client_pubkey = client_pubkey;
> + 
> +     /* register the packet callbacks */
> +diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
> +index 8eabfe18..5dcd3929 100644
> +--- a/src/ecdh_gcrypt.c
> ++++ b/src/ecdh_gcrypt.c
> +@@ -106,9 +106,10 @@ int ssh_client_ecdh_init(ssh_session session)
> +         gcry_sexp_release(session->next_crypto->ecdh_privkey);
> +         session->next_crypto->ecdh_privkey = NULL;
> +     }
> +-
> +     session->next_crypto->ecdh_privkey = key;
> +     key = NULL;
> ++
> ++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
> +     session->next_crypto->ecdh_client_pubkey = client_pubkey;
> +     client_pubkey = NULL;
> + 
> diff --git a/meta-oe/recipes-support/libssh/libssh/0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.patch b/meta-oe/recipes-support/libssh/libssh/0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.patch
> new file mode 100644
> index 0000000000..fed8ffaa82
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.patch
> @@ -0,0 +1,46 @@
> +From 0369e9049bc70ad054b826a844fd9eb19350f49c Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Wed, 6 Aug 2025 15:32:56 +0200
> +Subject: [PATCH] CVE-2025-8277: mbedtls: Avoid leaking ecdh keys
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> +(cherry picked from commit ffed80f8c078122990a4eba2b275facd56dd43e0)
> +(cherry picked from commit 1c763e29d138db87665e98983f468d2dd0f286c1)
> +
> +CVE: CVE-2025-8277
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=1c763e29d138db87665e98983f468d2dd0f286c1]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/ecdh_mbedcrypto.c | 1 +
> + src/wrapper.c         | 5 ++++-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
> +index d31bfcc7..860543d6 100644
> +--- a/src/ecdh_mbedcrypto.c
> ++++ b/src/ecdh_mbedcrypto.c
> +@@ -116,6 +116,7 @@ int ssh_client_ecdh_init(ssh_session session)
> +         goto out;
> +     }
> + 
> ++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
> +     session->next_crypto->ecdh_client_pubkey = client_pubkey;
> +     client_pubkey = NULL;
> + 
> +diff --git a/src/wrapper.c b/src/wrapper.c
> +index 8996b8ce..62513016 100644
> +--- a/src/wrapper.c
> ++++ b/src/wrapper.c
> +@@ -181,7 +181,10 @@ void crypto_free(struct ssh_crypto_struct *crypto)
> + #endif /* OPENSSL_VERSION_NUMBER */
> + #elif defined HAVE_GCRYPT_ECC
> +         gcry_sexp_release(crypto->ecdh_privkey);
> +-#endif
> ++#elif defined HAVE_LIBMBEDCRYPTO
> ++        mbedtls_ecp_keypair_free(crypto->ecdh_privkey);
> ++        SAFE_FREE(crypto->ecdh_privkey);
> ++#endif /* HAVE_LIBGCRYPT */
> +         crypto->ecdh_privkey = NULL;
> +     }
> + #endif
> diff --git a/meta-oe/recipes-support/libssh/libssh/0005-CVE-2025-8114-Fix-NULL-pointer-dereference-after-all.patch b/meta-oe/recipes-support/libssh/libssh/0005-CVE-2025-8114-Fix-NULL-pointer-dereference-after-all.patch
> new file mode 100644
> index 0000000000..68db167b0c
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/0005-CVE-2025-8114-Fix-NULL-pointer-dereference-after-all.patch
> @@ -0,0 +1,47 @@
> +From a1912d88cf40740f98656a288f8ec6f33369bcc3 Mon Sep 17 00:00:00 2001
> +From: Andreas Schneider <asn@cryptomilk.org>
> +Date: Wed, 6 Aug 2025 15:17:59 +0200
> +Subject: [PATCH] CVE-2025-8114: Fix NULL pointer dereference after allocation
> + failure
> +
> +Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
> +Reviewed-by: Jakub Jelen <jjelen@redhat.com>
> +(cherry picked from commit 53ac23ded4cb2c5463f6c4cd1525331bd578812d)
> +(cherry picked from commit 65f363c9e3a22b90af7f74b5c439a133b1047379)
> +
> +CVE: CVE-2025-8114
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.11.3&id=65f363c9e3a22b90af7f74b5c439a133b1047379]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/kex.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/kex.c b/src/kex.c
> +index bdfdcab4..29e43571 100644
> +--- a/src/kex.c
> ++++ b/src/kex.c
> +@@ -1487,6 +1487,8 @@ int ssh_make_sessionid(ssh_session session)
> +     ssh_log_hexdump("hash buffer", ssh_buffer_get(buf), ssh_buffer_get_len(buf));
> + #endif
> + 
> ++    /* Set rc for the following switch statement in case we goto error. */
> ++    rc = SSH_ERROR;
> +     switch (session->next_crypto->kex_type) {
> +     case SSH_KEX_DH_GROUP1_SHA1:
> +     case SSH_KEX_DH_GROUP14_SHA1:
> +@@ -1546,6 +1548,7 @@ int ssh_make_sessionid(ssh_session session)
> +                session->next_crypto->secret_hash);
> +         break;
> +     }
> ++
> +     /* During the first kex, secret hash and session ID are equal. However, after
> +      * a key re-exchange, a new secret hash is calculated. This hash will not replace
> +      * but complement existing session id.
> +@@ -1554,6 +1557,7 @@ int ssh_make_sessionid(ssh_session session)
> +         session->next_crypto->session_id = malloc(session->next_crypto->digest_len);
> +         if (session->next_crypto->session_id == NULL) {
> +             ssh_set_error_oom(session);
> ++            rc = SSH_ERROR;
> +             goto error;
> +         }
> +         memcpy(session->next_crypto->session_id, session->next_crypto->secret_hash,
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
> index 5baaa49949..eb5b3016e0 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
> @@ -9,6 +9,11 @@ DEPENDS = "zlib openssl"
>  SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
>             file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
>             file://run-ptest \
> +           file://0001-CVE-2025-8277-packet-Adjust-packet-filter-to-work-wh.patch \
> +           file://0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch \
> +           file://0003-CVE-2025-8277-ecdh-Free-previously-allocated-pubkeys.patch \
> +           file://0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.patch \
> +           file://0005-CVE-2025-8114-Fix-NULL-pointer-dereference-after-all.patch \
>            "
>  
>  SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119619): https://lists.openembedded.org/g/openembedded-devel/message/119619
> Mute This Topic: https://lists.openembedded.org/mt/115342484/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


