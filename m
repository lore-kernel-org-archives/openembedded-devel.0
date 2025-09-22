Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC55CCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 15:24:40 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.54917.1758554674294765822
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 08:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1mioDFT;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d60528734so33242867b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758554673; x=1759159473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qv2/Cf6Hxrdg4E51tLW6kq4zaKDHHbGxnscW5ZQX5RI=;
        b=c1mioDFTaqIki7Tz9jTit7DKzkDMklOWAjLNyjYiUlzT9TEl/prSJN4QRRficfOjAY
         gpr+sDl2TnPdM1GLcaH4XjpYxXgd/r1HlQzrb7ZWKZLK8Py7Fp9+GbJsQrdfmUILZedA
         8TJyQyik2r8JJALSeSxQUb5xK9+TrcUHUSEGnY4D8jyyiPiFJozmzHGTizzARNJi5hJG
         eDqUvzZmJ7oxmYdK/2ratCoREweRW+c4EpFUimSZdJNSOMgRwvJYUaJBB/Xk88WR2n/7
         n/BRXOrn4XOeK0EFOEUsDPELffiYrU/JV/qEJDh94P8taqRisQQP7iWfKsvu/E0iPjbn
         6rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758554673; x=1759159473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qv2/Cf6Hxrdg4E51tLW6kq4zaKDHHbGxnscW5ZQX5RI=;
        b=ZgJ0zWeWH52YpIXHS7g/prO/I/f0FneSjkCYtPCp7jGfdsqX/RksFew99DFmtpFSB2
         GjOYOUDYnvvIygZFNjS19x3c6jYyC4NBto8OefSghx0zwbJ+Fe2JjlFTsXFRwaK2GT2j
         rEiWdRZxy2/DJ1TvO2A15App7yPLivBBvymUw33V0kdIzWtpfiAoEZH0m+urr3iYjwO6
         TGAOAE5YakQexR1xV35RrgrcR6V02jbCNA9zOltYo+Hd097DKs2/yh1/Aq6OxJq3CDn7
         bQXvk7q2YbgIlmKepMxi03D2CHWSgJx7aJ86m+qXk0xTSbIzIEY2WI4r8DnhIrBTAizb
         +Lsg==
X-Gm-Message-State: AOJu0Yyab5kI6eXglQ1Cx8J7rBn79DB9c78UIlksXl2GbzPCi2HEwDFb
	E/yVdWs9bumUFSx2fKGtm4X25cfRje5YNrNKWG2hnEoVawacPm7G8S4xrah6cU1Gc6hZ7yboPxi
	83oioIG3dZnhytOXGnuRfSjvgNP+iMSU=
X-Gm-Gg: ASbGncsN2Awotr6skZqBd/aCe+wGGjCXuszldwIb2f3haSRc+cbxAyZLZs2npi63jAm
	eIlk0Pk98B/Qht8hqFm5fwHIuiAsZEtA9CL4/mzkNY9d3IS9y2Nl4IONDHk+ERDCWGdBho6y1t6
	arYXGLl4l1AXL4VxmC0pBZBctE0zvukayX25+Iv8o+Cgj9Kc18bRdTOO8ZrElS92noUNA8eshWx
	8w2AK5q8qLIQfoI0vDFK8RhRZEKCZthMkS6qsLNIzIudhBjo8qq58N7dz61mxj16QfcATaC1wO/
	ZExIBAxno7KCLfHVx46A3gM=
X-Google-Smtp-Source: AGHT+IGZooODW8cwZ//7fPAKyn1p+nr+g23kRxF+Xrwn2zGC+3OZuwJaqpa1vE84hZU84dxkJ+53bCHAUqMHCwnvVoE=
X-Received: by 2002:a05:690c:6893:b0:71f:b419:8f73 with SMTP id
 00721157ae682-73d338ab2fbmr113129637b3.20.1758554673209; Mon, 22 Sep 2025
 08:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250922040301.2149568-1-nitin.wankhade333@gmail.com>
In-Reply-To: <20250922040301.2149568-1-nitin.wankhade333@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Sep 2025 08:24:07 -0700
X-Gm-Features: AS18NWBUo7x11YNIdxQQ__4bWKrcm72WBLYtsdqWCA_-AmxbwhNtXPZvkeTg4eQ
Message-ID: <CAMKF1spLPu9-YX5caOeFa5dEHcesWr7PFXcZJxJOVTjWaOdoaA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] iperf3: Fix CVE-2025-54349
To: nitin.wankhade333@gmail.com
Cc: openembedded-devel@lists.openembedded.org, nitin.wankhade@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119645

There are two patches applied to a branch and expected to be in a
sequence. Its better to send both the patches as a single series. So
the indented order is
conveyed as well.

On Mon, Sep 22, 2025 at 1:53=E2=80=AFAM Nitin Wankhade via
lists.openembedded.org
<nitin.wankhade333=3Dgmail.com@lists.openembedded.org> wrote:
>
> This commit fix heap overflow for iperf3 package
>
> Reference: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab5=
4f722c8a3e4b7bdf
>
> Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
> ---
>  .../iperf3/iperf3/CVE-2025-54349.patch        | 80 +++++++++++++++++++
>  .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 +-
>  2 files changed, 82 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-5434=
9.patch
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch=
 b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
> new file mode 100644
> index 0000000000..61e1888685
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
> @@ -0,0 +1,80 @@
> +Subject: [PATCH] iperf3: Fix CVE-2025-54349
> +CVE: CVE-2025-54349
> +Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313b=
ab0b9b3fe03513ab54f722c8a3e4b7bdf]
> +Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
> +---
> +diff --git a/iperf_auth.c b/iperf_auth.c
> +index 72e85fc..91c4133 100644
> +--- a/src/iperf_auth.c
> ++++ b/src/iperf_auth.c
> +@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_P=
KEY *public_key, unsigned ch
> + }
> +
> + int decrypt_rsa_message(const unsigned char *encryptedtext, const int e=
ncryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use=
_pkcs1_padding) {
> ++    int ret =3D0;
> + #if OPENSSL_VERSION_MAJOR >=3D 3
> +     EVP_PKEY_CTX *ctx;
> + #else
> +@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encrypt=
edtext, const int encryptedt
> +     keysize =3D RSA_size(rsa);
> + #endif
> +     rsa_buffer  =3D OPENSSL_malloc(keysize * 2);
> +-    *plaintext =3D (unsigned char*)OPENSSL_malloc(keysize);
> ++    // Note: +1 for NULL
> ++    *plaintext =3D (unsigned char*)OPENSSL_malloc(keysize + 1);
> +
> +     BIO *bioBuff   =3D BIO_new_mem_buf((void*)encryptedtext, encryptedt=
ext_len);
> +     rsa_buffer_len =3D BIO_read(bioBuff, rsa_buffer, keysize * 2);
> +@@ -322,11 +324,12 @@ int decrypt_rsa_message(const unsigned char *encry=
ptedtext, const int encryptedt
> + #if OPENSSL_VERSION_MAJOR >=3D 3
> +     plaintext_len =3D keysize;
> +     EVP_PKEY_decrypt_init(ctx);
> +-    int ret =3D EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
> ++
> ++    ret =3D EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
> +     if (ret < 0){
> +         goto errreturn;
> +     }
> +-    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_b=
uffer_len);
> ++    ret =3D EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffe=
r, rsa_buffer_len);
> +     EVP_PKEY_CTX_free(ctx);
> + #else
> +     plaintext_len =3D RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *=
plaintext, rsa, padding);
> +@@ -337,7 +340,7 @@ int decrypt_rsa_message(const unsigned char *encrypt=
edtext, const int encryptedt
> +     BIO_free(bioBuff);
> +
> +     /* Treat a decryption error as an empty string. */
> +-    if (plaintext_len < 0) {
> ++    if (plaintext_len <=3D 0) {
> +         plaintext_len =3D 0;
> +     }
> +
> +@@ -386,7 +389,7 @@ int decode_auth_setting(int enable_debug, const char=
 *authtoken, EVP_PKEY *priva
> +     int plaintext_len;
> +     plaintext_len =3D decrypt_rsa_message(encrypted_b64, encrypted_len_=
b64, private_key, &plaintext, use_pkcs1_padding);
> +     free(encrypted_b64);
> +-    if (plaintext_len < 0) {
> ++    if (plaintext_len <=3D 0) {
> +         return -1;
> +     }
> +     plaintext[plaintext_len] =3D '\0';
> +@@ -394,16 +397,19 @@ int decode_auth_setting(int enable_debug, const ch=
ar *authtoken, EVP_PKEY *priva
> +     char *s_username, *s_password;
> +     s_username =3D (char *) calloc(plaintext_len, sizeof(char));
> +     if (s_username =3D=3D NULL) {
> ++      OPENSSL_free(plaintext);
> +       return -1;
> +     }
> +     s_password =3D (char *) calloc(plaintext_len, sizeof(char));
> +     if (s_password =3D=3D NULL) {
> ++      OPENSSL_free(plaintext);
> +       free(s_username);
> +       return -1;
> +     }
> +
> +     int rc =3D sscanf((char *) plaintext, auth_text_format, s_username,=
 s_password, &utc_seconds);
> +     if (rc !=3D 3) {
> ++      OPENSSL_free(plaintext);
> +       free(s_password);
> +       free(s_username);
> +       return -1;
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.18.bb
> index 08f29937c0..265611e533 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> @@ -16,7 +16,8 @@ SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3D=
master;protocol=3Dhttps \
>             file://0002-Remove-pg-from-profile_CFLAGS.patch \
>             file://0001-configure.ac-check-for-CPP-prog.patch \
>             file://0001-fix-build-with-gcc-15.patch \
> -           "
> +           file://CVE-2025-54349.patch \
> +          "
>
>  SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119643): https://lists.openembedded.org/g/openembedde=
d-devel/message/119643
> Mute This Topic: https://lists.openembedded.org/mt/115372270/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

