Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6E4CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:25:04 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.189.1758655499088685092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HsF4W0hf;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-43d2da52291so113731b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 12:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655498; x=1759260298; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfWOdWPmRfjd8M8zyTCKptkAGyzYusu31bhe0owPWF8=;
        b=HsF4W0hfsNAuhzPItQjz2dnB7Josylh0O9n6FpNLMnLogHX3KoZ3rKW1BZYZ+MoXWu
         sqqRltcI04/+SzcGgtCD0vn5utpdljH19EeApenc4Ie9mPMO4R8HGSE8sfbZ+f75pn26
         d3f/bJjVKVbwX4S6cocIdMCGgB3d5An97Ed5Htiz87iv8w9WNdHltr8qL+zNkiEDpXyN
         veWKBJCLzO1EK2esloFgfFaObhkpQwbgVLqx3rsJl5jjOlHADtquJu5+SQ7VmkS3SrxX
         uYXcohreKuQTqa6x5VLqrLa0pFLCUCBtGIorh1u5G70hy6xpiqW4swyuvFrWdrfFQKJU
         UuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655498; x=1759260298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfWOdWPmRfjd8M8zyTCKptkAGyzYusu31bhe0owPWF8=;
        b=F4BKIAoYdIDdrsYHauHvvaxcdHhtjflFMJLZubK+2DVGXXELUeRpGIUZ4XvVINTqu9
         zbCGV6VmIc/hsmNqxphxY3yOC5us8HAvhRQ2UtW93Ibj7Ud+mAjbKrXn9H7Usoq1HGRw
         +KP72I9/tzmTBWrtvEvKWSizWSc8+8L4zSEQe7dbXLn9DRFQzAJ/EwNNZMy1jTpxxuhF
         /Y721WIMwF7aToTK0yP4GsnddiRrD258lSfMOIAhyGaQNxBtU3D8OzCkdhWRB/yAzuk/
         ++zp5PFB6P7WeuufuUYYg5O6YA4OyEi9toDdefOH+7v84OncO0YHI5NoUjpmbnR+QsPA
         uKzg==
X-Gm-Message-State: AOJu0YwfL7WNQuHg0SZt0kj8ELM+HAjkZoFrDZoEmFkllNDocYeg0BAF
	1YpM+q/CC9Om5cNV2p9GcEezskrIqJW8nhEcS89estaqViEUwLbfURYmbO4+i6x/0P4UGD9zWCW
	ShWWg+WLagO6+6b1hAlVCw7/Vjxw8z+8cpJcr
X-Gm-Gg: ASbGncvRHaQIuBIj2eR22BJRYqEnGdlwhxMD6MhjRryyCFcP0T7i1c9ch1dny9nrjOn
	XPTc4dSlKmTZuO0G3kSnDuqhxkhgiie18uUOqh2u04imO3E5vGJkvCSXLrBtJhTlLSS45G2xL8R
	C5xpiMMbeAl3unOcfl7tezNS9jmecIrJafRJ4EP5gnFCs8NgcsvZdAQMDJ7cIPsT1ztFXMvNMU5
	t14OCP5+12iE8W426Hm
X-Google-Smtp-Source: AGHT+IFFZ1HkugRvxUr/uzdy90uGciD33nE4YSzCHCdn92NG3rzAf7Spgke78feUE5rQbAjkcUkIUfU+3FOM1dfcXDY=
X-Received: by 2002:a05:6808:4f4a:b0:438:3dc7:c2db with SMTP id
 5614622812f47-43f2d2d1147mr2064481b6e.23.1758655498028; Tue, 23 Sep 2025
 12:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250920105615.1616997-1-ankur.tyagi85@gmail.com> <901c7a93-9703-4cf5-9127-45da0967964b@gmail.com>
In-Reply-To: <901c7a93-9703-4cf5-9127-45da0967964b@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 24 Sep 2025 07:24:46 +1200
X-Gm-Features: AS18NWB7fI8Z91cZQpO-PDLnFZuAWzHdaCWEKuz88IGbw1-QZR3137sU0iF6sKw
Message-ID: <CADySD0HyDg1BAqSRh_ZG02bmzu3b7CJ7J=-hqXuA3OP23sVgeA@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH] libssh 0.11.2: Fix CVE-2025-8277
 and CVE-2025-8114
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 19:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119733

On Tue, Sep 23, 2025 at 11:57=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> Suggestion: It looks like the next version, 0.11.3 contains only
> bugfixes and no new features - if you bump the recipe version instead of
> backporting patches, I think that would be also fine. (Though I have no
> problem with this patch either, looks okay to me.)
>

Thanks Gyorgy.
Please drop this patch and I'll send another one to bump the recipe version=
.

> On 9/20/25 12:56, Ankur Tyagi via lists.openembedded.org wrote:
> > CVE: CVE-2025-8277
> > Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/c=
ommit/?h=3Dlibssh-0.11.3&id=3D87db2659ec608a977a63eea529f17b9168388d73]
> >                           [https://git.libssh.org/projects/libssh.git/c=
ommit/?h=3Dlibssh-0.11.3&id=3D266174a6d36687b65cf90174f06af90b8b27c65f]
> >                           [https://git.libssh.org/projects/libssh.git/c=
ommit/?h=3Dlibssh-0.11.3&id=3D8e4d67aa9eda455bfad9ac610e54b7a548d0aa08]
> >                           [https://git.libssh.org/projects/libssh.git/c=
ommit/?h=3Dlibssh-0.11.3&id=3D1c763e29d138db87665e98983f468d2dd0f286c1]
> >
> > CVE: CVE-2025-8114
> > Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/c=
ommit/?h=3Dlibssh-0.11.3&id=3D65f363c9e3a22b90af7f74b5c439a133b1047379]
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  ...cket-Adjust-packet-filter-to-work-wh.patch |  38 ++++++
> >  ...x-memory-leak-of-unused-ephemeral-ke.patch | 110 ++++++++++++++++++
> >  ...dh-Free-previously-allocated-pubkeys.patch |  46 ++++++++
> >  ...8277-mbedtls-Avoid-leaking-ecdh-keys.patch |  46 ++++++++
> >  ...x-NULL-pointer-dereference-after-all.patch |  47 ++++++++
> >  .../recipes-support/libssh/libssh_0.11.2.bb   |   5 +
> >  6 files changed, 292 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-CVE-2025=
-8277-packet-Adjust-packet-filter-to-work-wh.patch
> >  create mode 100644 meta-oe/recipes-support/libssh/libssh/0002-CVE-2025=
-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch
> >  create mode 100644 meta-oe/recipes-support/libssh/libssh/0003-CVE-2025=
-8277-ecdh-Free-previously-allocated-pubkeys.patch
> >  create mode 100644 meta-oe/recipes-support/libssh/libssh/0004-CVE-2025=
-8277-mbedtls-Avoid-leaking-ecdh-keys.patch
> >  create mode 100644 meta-oe/recipes-support/libssh/libssh/0005-CVE-2025=
-8114-Fix-NULL-pointer-dereference-after-all.patch
> >
> > diff --git a/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-8277-p=
acket-Adjust-packet-filter-to-work-wh.patch b/meta-oe/recipes-support/libss=
h/libssh/0001-CVE-2025-8277-packet-Adjust-packet-filter-to-work-wh.patch
> > new file mode 100644
> > index 0000000000..0fc14683a1
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-8277-packet-A=
djust-packet-filter-to-work-wh.patch
> > @@ -0,0 +1,38 @@
> > +From c3a892a972fd2476ec3588dfd12ce81be96bc64a Mon Sep 17 00:00:00 2001
> > +From: Jakub Jelen <jjelen@redhat.com>
> > +Date: Tue, 5 Aug 2025 18:42:31 +0200
> > +Subject: [PATCH] CVE-2025-8277: packet: Adjust packet filter to work w=
hen
> > + DH-GEX is guessed wrongly
> > +
> > +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> > +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> > +(cherry picked from commit 4310a696f2d632c6742678077d703d9b9ff3bc0e)
> > +(cherry picked from commit 87db2659ec608a977a63eea529f17b9168388d73)
> > +
> > +CVE: CVE-2025-8277
> > +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/=
commit/?h=3Dlibssh-0.11.3&id=3D87db2659ec608a977a63eea529f17b9168388d73]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/packet.c | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/packet.c b/src/packet.c
> > +index f15aa2ad..f54b3158 100644
> > +--- a/src/packet.c
> > ++++ b/src/packet.c
> > +@@ -294,6 +294,7 @@ static enum ssh_packet_filter_result_e ssh_packet_=
incoming_filter(ssh_session se
> > +          *   or session_state =3D=3D SSH_SESSION_STATE_INITIAL_KEX
> > +          * - dh_handshake_state =3D=3D DH_STATE_INIT
> > +          *   or dh_handshake_state =3D=3D DH_STATE_INIT_SENT (re-exch=
ange)
> > ++         *   or dh_handshake_state =3D=3D DH_STATE_REQUEST_SENT (dh-g=
ex)
> > +          *   or dh_handshake_state =3D=3D DH_STATE_FINISHED (re-excha=
nge)
> > +          *
> > +          * Transitions:
> > +@@ -313,6 +314,7 @@ static enum ssh_packet_filter_result_e ssh_packet_=
incoming_filter(ssh_session se
> > +
> > +         if ((session->dh_handshake_state !=3D DH_STATE_INIT) &&
> > +             (session->dh_handshake_state !=3D DH_STATE_INIT_SENT) &&
> > ++            (session->dh_handshake_state !=3D DH_STATE_REQUEST_SENT) =
&&
> > +             (session->dh_handshake_state !=3D DH_STATE_FINISHED))
> > +         {
> > +             rc =3D SSH_PACKET_DENIED;
> > diff --git a/meta-oe/recipes-support/libssh/libssh/0002-CVE-2025-8277-F=
ix-memory-leak-of-unused-ephemeral-ke.patch b/meta-oe/recipes-support/libss=
h/libssh/0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemeral-ke.patch
> > new file mode 100644
> > index 0000000000..0ba2edee68
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libssh/libssh/0002-CVE-2025-8277-Fix-memo=
ry-leak-of-unused-ephemeral-ke.patch
> > @@ -0,0 +1,110 @@
> > +From 5377fd08f2818799d3e6107078e2bdb9ec1f9529 Mon Sep 17 00:00:00 2001
> > +From: Francesco Rollo <eferollo@gmail.com>
> > +Date: Thu, 24 Jul 2025 16:30:07 +0300
> > +Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused ephemeral ke=
y pair
> > + after client's wrong KEX guess
> > +
> > +Signed-off-by: Francesco Rollo <eferollo@gmail.com>
> > +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> > +(cherry picked from commit ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)
> > +(cherry picked from commit 266174a6d36687b65cf90174f06af90b8b27c65f)
> > +
> > +CVE: CVE-2025-8277
> > +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/=
commit/?h=3Dlibssh-0.11.3&id=3D266174a6d36687b65cf90174f06af90b8b27c65f]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/dh_crypto.c       |  5 +++++
> > + src/dh_key.c          |  5 +++++
> > + src/ecdh_crypto.c     | 11 +++++++++++
> > + src/ecdh_gcrypt.c     |  6 ++++++
> > + src/ecdh_mbedcrypto.c |  6 ++++++
> > + 5 files changed, 33 insertions(+)
> > +
> > +diff --git a/src/dh_crypto.c b/src/dh_crypto.c
> > +index 4dd9b507..cedfbc81 100644
> > +--- a/src/dh_crypto.c
> > ++++ b/src/dh_crypto.c
> > +@@ -407,6 +407,11 @@ int ssh_dh_init_common(struct ssh_crypto_struct *=
crypto)
> > +     struct dh_ctx *ctx =3D NULL;
> > +     int rc;
> > +
> > ++    /* Cleanup any previously allocated dh_ctx */
> > ++    if (crypto->dh_ctx !=3D NULL) {
> > ++        ssh_dh_cleanup(crypto);
> > ++    }
> > ++
> > +     ctx =3D calloc(1, sizeof(*ctx));
> > +     if (ctx =3D=3D NULL) {
> > +         return SSH_ERROR;
> > +diff --git a/src/dh_key.c b/src/dh_key.c
> > +index 20d24a31..d9743ceb 100644
> > +--- a/src/dh_key.c
> > ++++ b/src/dh_key.c
> > +@@ -237,6 +237,11 @@ int ssh_dh_init_common(struct ssh_crypto_struct *=
crypto)
> > +     struct dh_ctx *ctx =3D NULL;
> > +     int rc;
> > +
> > ++    /* Cleanup any previously allocated dh_ctx */
> > ++    if (crypto->dh_ctx !=3D NULL) {
> > ++        ssh_dh_cleanup(crypto);
> > ++    }
> > ++
> > +     ctx =3D calloc(1, sizeof(*ctx));
> > +     if (ctx =3D=3D NULL) {
> > +         return SSH_ERROR;
> > +diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
> > +index 57c3dc89..a286804f 100644
> > +--- a/src/ecdh_crypto.c
> > ++++ b/src/ecdh_crypto.c
> > +@@ -191,6 +191,17 @@ static ssh_string ssh_ecdh_generate(ssh_session s=
ession)
> > + #endif /* OPENSSL_VERSION_NUMBER */
> > +         return NULL;
> > +     }
> > ++
> > ++    /* Free any previously allocated privkey */
> > ++    if (session->next_crypto->ecdh_privkey !=3D NULL) {
> > ++#if OPENSSL_VERSION_NUMBER < 0x30000000L
> > ++        EC_KEY_free(session->next_crypto->ecdh_privkey);
> > ++#else
> > ++        EVP_PKEY_free(session->next_crypto->ecdh_privkey);
> > ++#endif
> > ++        session->next_crypto->ecdh_privkey =3D NULL;
> > ++    }
> > ++
> > +     session->next_crypto->ecdh_privkey =3D key;
> > +     return pubkey_string;
> > + }
> > +diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
> > +index a52ca84d..8eabfe18 100644
> > +--- a/src/ecdh_gcrypt.c
> > ++++ b/src/ecdh_gcrypt.c
> > +@@ -101,6 +101,12 @@ int ssh_client_ecdh_init(ssh_session session)
> > +         goto out;
> > +     }
> > +
> > ++    /* Free any previously allocated privkey */
> > ++    if (session->next_crypto->ecdh_privkey !=3D NULL) {
> > ++        gcry_sexp_release(session->next_crypto->ecdh_privkey);
> > ++        session->next_crypto->ecdh_privkey =3D NULL;
> > ++    }
> > ++
> > +     session->next_crypto->ecdh_privkey =3D key;
> > +     key =3D NULL;
> > +     session->next_crypto->ecdh_client_pubkey =3D client_pubkey;
> > +diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
> > +index 1d9c8f36..d31bfcc7 100644
> > +--- a/src/ecdh_mbedcrypto.c
> > ++++ b/src/ecdh_mbedcrypto.c
> > +@@ -70,6 +70,12 @@ int ssh_client_ecdh_init(ssh_session session)
> > +         return SSH_ERROR;
> > +     }
> > +
> > ++    /* Free any previously allocated privkey */
> > ++    if (session->next_crypto->ecdh_privkey !=3D NULL) {
> > ++        mbedtls_ecp_keypair_free(session->next_crypto->ecdh_privkey);
> > ++        SAFE_FREE(session->next_crypto->ecdh_privkey);
> > ++    }
> > ++
> > +     session->next_crypto->ecdh_privkey =3D malloc(sizeof(mbedtls_ecp_=
keypair));
> > +     if (session->next_crypto->ecdh_privkey =3D=3D NULL) {
> > +         return SSH_ERROR;
> > diff --git a/meta-oe/recipes-support/libssh/libssh/0003-CVE-2025-8277-e=
cdh-Free-previously-allocated-pubkeys.patch b/meta-oe/recipes-support/libss=
h/libssh/0003-CVE-2025-8277-ecdh-Free-previously-allocated-pubkeys.patch
> > new file mode 100644
> > index 0000000000..57ad4079d8
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libssh/libssh/0003-CVE-2025-8277-ecdh-Fre=
e-previously-allocated-pubkeys.patch
> > @@ -0,0 +1,46 @@
> > +From 14567df40173f55b791d3722bcdf4fadfa7c7699 Mon Sep 17 00:00:00 2001
> > +From: Jakub Jelen <jjelen@redhat.com>
> > +Date: Wed, 6 Aug 2025 11:10:38 +0200
> > +Subject: [PATCH] CVE-2025-8277: ecdh: Free previously allocated pubkey=
s
> > +
> > +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> > +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> > +(cherry picked from commit c9d95ab0c7a52b231bcec09afbea71944ed0d852)
> > +(cherry picked from commit 8e4d67aa9eda455bfad9ac610e54b7a548d0aa08)
> > +
> > +CVE: CVE-2025-8277
> > +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/=
commit/?h=3Dlibssh-0.11.3&id=3D8e4d67aa9eda455bfad9ac610e54b7a548d0aa08]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/ecdh_crypto.c | 1 +
> > + src/ecdh_gcrypt.c | 3 ++-
> > + 2 files changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
> > +index a286804f..fb707c32 100644
> > +--- a/src/ecdh_crypto.c
> > ++++ b/src/ecdh_crypto.c
> > +@@ -230,6 +230,7 @@ int ssh_client_ecdh_init(ssh_session session)
> > +         return SSH_ERROR;
> > +     }
> > +
> > ++    ssh_string_free(session->next_crypto->ecdh_client_pubkey);
> > +     session->next_crypto->ecdh_client_pubkey =3D client_pubkey;
> > +
> > +     /* register the packet callbacks */
> > +diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
> > +index 8eabfe18..5dcd3929 100644
> > +--- a/src/ecdh_gcrypt.c
> > ++++ b/src/ecdh_gcrypt.c
> > +@@ -106,9 +106,10 @@ int ssh_client_ecdh_init(ssh_session session)
> > +         gcry_sexp_release(session->next_crypto->ecdh_privkey);
> > +         session->next_crypto->ecdh_privkey =3D NULL;
> > +     }
> > +-
> > +     session->next_crypto->ecdh_privkey =3D key;
> > +     key =3D NULL;
> > ++
> > ++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
> > +     session->next_crypto->ecdh_client_pubkey =3D client_pubkey;
> > +     client_pubkey =3D NULL;
> > +
> > diff --git a/meta-oe/recipes-support/libssh/libssh/0004-CVE-2025-8277-m=
bedtls-Avoid-leaking-ecdh-keys.patch b/meta-oe/recipes-support/libssh/libss=
h/0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.patch
> > new file mode 100644
> > index 0000000000..fed8ffaa82
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libssh/libssh/0004-CVE-2025-8277-mbedtls-=
Avoid-leaking-ecdh-keys.patch
> > @@ -0,0 +1,46 @@
> > +From 0369e9049bc70ad054b826a844fd9eb19350f49c Mon Sep 17 00:00:00 2001
> > +From: Jakub Jelen <jjelen@redhat.com>
> > +Date: Wed, 6 Aug 2025 15:32:56 +0200
> > +Subject: [PATCH] CVE-2025-8277: mbedtls: Avoid leaking ecdh keys
> > +
> > +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> > +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> > +(cherry picked from commit ffed80f8c078122990a4eba2b275facd56dd43e0)
> > +(cherry picked from commit 1c763e29d138db87665e98983f468d2dd0f286c1)
> > +
> > +CVE: CVE-2025-8277
> > +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/=
commit/?h=3Dlibssh-0.11.3&id=3D1c763e29d138db87665e98983f468d2dd0f286c1]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/ecdh_mbedcrypto.c | 1 +
> > + src/wrapper.c         | 5 ++++-
> > + 2 files changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
> > +index d31bfcc7..860543d6 100644
> > +--- a/src/ecdh_mbedcrypto.c
> > ++++ b/src/ecdh_mbedcrypto.c
> > +@@ -116,6 +116,7 @@ int ssh_client_ecdh_init(ssh_session session)
> > +         goto out;
> > +     }
> > +
> > ++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
> > +     session->next_crypto->ecdh_client_pubkey =3D client_pubkey;
> > +     client_pubkey =3D NULL;
> > +
> > +diff --git a/src/wrapper.c b/src/wrapper.c
> > +index 8996b8ce..62513016 100644
> > +--- a/src/wrapper.c
> > ++++ b/src/wrapper.c
> > +@@ -181,7 +181,10 @@ void crypto_free(struct ssh_crypto_struct *crypto=
)
> > + #endif /* OPENSSL_VERSION_NUMBER */
> > + #elif defined HAVE_GCRYPT_ECC
> > +         gcry_sexp_release(crypto->ecdh_privkey);
> > +-#endif
> > ++#elif defined HAVE_LIBMBEDCRYPTO
> > ++        mbedtls_ecp_keypair_free(crypto->ecdh_privkey);
> > ++        SAFE_FREE(crypto->ecdh_privkey);
> > ++#endif /* HAVE_LIBGCRYPT */
> > +         crypto->ecdh_privkey =3D NULL;
> > +     }
> > + #endif
> > diff --git a/meta-oe/recipes-support/libssh/libssh/0005-CVE-2025-8114-F=
ix-NULL-pointer-dereference-after-all.patch b/meta-oe/recipes-support/libss=
h/libssh/0005-CVE-2025-8114-Fix-NULL-pointer-dereference-after-all.patch
> > new file mode 100644
> > index 0000000000..68db167b0c
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libssh/libssh/0005-CVE-2025-8114-Fix-NULL=
-pointer-dereference-after-all.patch
> > @@ -0,0 +1,47 @@
> > +From a1912d88cf40740f98656a288f8ec6f33369bcc3 Mon Sep 17 00:00:00 2001
> > +From: Andreas Schneider <asn@cryptomilk.org>
> > +Date: Wed, 6 Aug 2025 15:17:59 +0200
> > +Subject: [PATCH] CVE-2025-8114: Fix NULL pointer dereference after all=
ocation
> > + failure
> > +
> > +Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
> > +Reviewed-by: Jakub Jelen <jjelen@redhat.com>
> > +(cherry picked from commit 53ac23ded4cb2c5463f6c4cd1525331bd578812d)
> > +(cherry picked from commit 65f363c9e3a22b90af7f74b5c439a133b1047379)
> > +
> > +CVE: CVE-2025-8114
> > +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/=
commit/?h=3Dlibssh-0.11.3&id=3D65f363c9e3a22b90af7f74b5c439a133b1047379]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/kex.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/src/kex.c b/src/kex.c
> > +index bdfdcab4..29e43571 100644
> > +--- a/src/kex.c
> > ++++ b/src/kex.c
> > +@@ -1487,6 +1487,8 @@ int ssh_make_sessionid(ssh_session session)
> > +     ssh_log_hexdump("hash buffer", ssh_buffer_get(buf), ssh_buffer_ge=
t_len(buf));
> > + #endif
> > +
> > ++    /* Set rc for the following switch statement in case we goto erro=
r. */
> > ++    rc =3D SSH_ERROR;
> > +     switch (session->next_crypto->kex_type) {
> > +     case SSH_KEX_DH_GROUP1_SHA1:
> > +     case SSH_KEX_DH_GROUP14_SHA1:
> > +@@ -1546,6 +1548,7 @@ int ssh_make_sessionid(ssh_session session)
> > +                session->next_crypto->secret_hash);
> > +         break;
> > +     }
> > ++
> > +     /* During the first kex, secret hash and session ID are equal. Ho=
wever, after
> > +      * a key re-exchange, a new secret hash is calculated. This hash =
will not replace
> > +      * but complement existing session id.
> > +@@ -1554,6 +1557,7 @@ int ssh_make_sessionid(ssh_session session)
> > +         session->next_crypto->session_id =3D malloc(session->next_cry=
pto->digest_len);
> > +         if (session->next_crypto->session_id =3D=3D NULL) {
> > +             ssh_set_error_oom(session);
> > ++            rc =3D SSH_ERROR;
> > +             goto error;
> > +         }
> > +         memcpy(session->next_crypto->session_id, session->next_crypto=
->secret_hash,
> > diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb b/meta-oe/=
recipes-support/libssh/libssh_0.11.2.bb
> > index 5baaa49949..eb5b3016e0 100644
> > --- a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
> > +++ b/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
> > @@ -9,6 +9,11 @@ DEPENDS =3D "zlib openssl"
> >  SRC_URI =3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps=
;branch=3Dstable-0.11;tag=3D${BPN}-${PV} \
> >             file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-com=
mands.patch \
> >             file://run-ptest \
> > +           file://0001-CVE-2025-8277-packet-Adjust-packet-filter-to-wo=
rk-wh.patch \
> > +           file://0002-CVE-2025-8277-Fix-memory-leak-of-unused-ephemer=
al-ke.patch \
> > +           file://0003-CVE-2025-8277-ecdh-Free-previously-allocated-pu=
bkeys.patch \
> > +           file://0004-CVE-2025-8277-mbedtls-Avoid-leaking-ecdh-keys.p=
atch \
> > +           file://0005-CVE-2025-8114-Fix-NULL-pointer-dereference-afte=
r-all.patch \
> >            "
> >
> >  SRC_URI:append:toolchain-clang =3D " file://0001-CompilerChecks.cmake-=
drop-Wunused-variable-flag.patch"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119619): https://lists.openembedded.org/g/openembed=
ded-devel/message/119619
> > Mute This Topic: https://lists.openembedded.org/mt/115342484/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

