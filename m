Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AEDCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:50:20 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.1326.1758300612139223718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVNBW0xP;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d60504bf8so24224157b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758300610; x=1758905410; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFmW24eV2SUrHYvkJdxbIwHFbKW4ycFhyt2IH81X5EM=;
        b=EVNBW0xPTuxdtMdkCmVd+D60nBqwEDd1VhS7+sgZpSv34WOmsreFShhuv1kvznrbg6
         SHYmTGNsMxP9rg4t9DKkM73cOPVsWixW1JwZxyYeDyBS/hIGaDgMoktw5TRpBl0gf7x/
         r/vgQCKRl9Fx9fKqCdLG+ReAFrhp9i044C5unTQ0sGh2eimYoscBhRkQ9sX5l2kSsuve
         wSOJ7ICSbjgEcyJulFrTB1xNBXGXweX2tzbnKL8Reww42oSKnn49+Sa+fHbiCvYf2NMt
         lDjVtqRd9tyimzJtx12SwrSL4MCLUTPH++pUYiOGTO6qFnAJ4yIBGfjOtOTgsSRPEs1r
         xZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300610; x=1758905410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFmW24eV2SUrHYvkJdxbIwHFbKW4ycFhyt2IH81X5EM=;
        b=Nmsg4C9HBNYhZ0SdkiD5mQG2GvGAYOQ48rUrizz2Q5Oby56oLCVP8cHjJsszv7KpUD
         Xe2as9aQkTHfufVyGEQZzvH/3azw9pL7Re/np3l7ierwO7RPGul0Uuu+1DJE2s0gXq4U
         VVtf6yIOc5NAiO/2Qrxyi9SUC/oX0/DI2wudKGAKdihvnZxbaAHGx8UqUJ0IJBgTN3p6
         1rBIZ9B9KvbSH1Ws3GdQdnEm31jibnqLtvbqDzdpqUdNyRLaWmsjpWWM9zrNj40FdmzW
         qI4j/WMX2CYJfJXj7sj/WG624BzUY0he1/HYUZ+vMUouTKCn/t7EA0vdzkLU/mvdHXM0
         5emg==
X-Gm-Message-State: AOJu0YzIRDJhE3L0KoQNnBkew6FOEH7YQqB8j9k44W/e33wDyovad4eo
	wU6JnjsgkAu5dsLCXWjXvEVR1H+rGm7VjwvCAyCCBqpPqXDzcqgSOVq+Ljd8W+pQg8ePBmoSoZZ
	HZGDkgLcZ8Yr2RZsyTJ53Tq3AojYkY1E3goIL
X-Gm-Gg: ASbGncs6LrVD4O31JrYtXWOElUY+zDeI2eOE/zQnK4X+ZH+VbVxXHUkRTemcCumDxdP
	K0Nw4dZL5QWPh2MC9OEdrVxXntzXvD3YUnLKNdtuD3/R3jhlAnFSz+8Rr9RVp/8YA/jk+jPRl49
	XHGziMGGucmd0Sv1fU95yIbfGc2dPRfII9fFcGvn2VfB0ix3L26bFsHp+7zRuQeSOj6mfvuFAfu
	3AjFsJC5bTI+M6XifxJQqPfFL9dOVM65X/VrEvRZLtSX1IayaFvyK0pfJ3FZ2DDb4rYN8uebqDY
	5VGLqeyTTq0+4XpelrBBWiE=
X-Google-Smtp-Source: AGHT+IGun6VcqgK6oonY4t0FjbuFylu14q884hmzPkXFMrVLaiHDmFAC78PiSr5lVVtqWQNPmVGs+dOxAfJdI46+4v4=
X-Received: by 2002:a05:690c:64c1:b0:729:5655:3444 with SMTP id
 00721157ae682-73d3b0b646cmr37103627b3.25.1758300609962; Fri, 19 Sep 2025
 09:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250919134453.2008042-1-nitin.wankhade333@gmail.com>
In-Reply-To: <20250919134453.2008042-1-nitin.wankhade333@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Sep 2025 09:49:43 -0700
X-Gm-Features: AS18NWDcRkRS4jxZX9cjw3cpxtOPMgKXfd6oD2Go98jz5g2tpU4xM15nBDObCs4
Message-ID: <CAMKF1spYWiKWA8YDaxaudGjymQ6D5U6Lu=RwMkqLMzZann=qeg@mail.gmail.com>
Subject: Re: [oe] [PATCH] iperf3: Fix CVE-2025-54349
To: nitin.wankhade333@gmail.com
Cc: openembedded-devel@lists.openembedded.org, nitin.wankhade@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 16:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119609

On Fri, Sep 19, 2025 at 6:52=E2=80=AFAM Nitin Wankhade via
lists.openembedded.org
<nitin.wankhade333=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Nitin Wankhade <nitin.wankhade@kpit.com>
>
> This commit fix heap overflow for iperf3 package
>
> Reference: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab5=
4f722c8a3e4b7bdf
>

Please add the branch name it's intended for as prefix to the subject
line, so it gets the right attention.

> Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
> ---
>  .../iperf3/iperf3/CVE-2025-54349.patch        | 55 +++++++++++++++++++
>  .../recipes-benchmark/iperf3/iperf3_3.14.bb   |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-5434=
9.patch
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch=
 b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
> new file mode 100644
> index 0000000000..f60267bb57
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
> @@ -0,0 +1,55 @@
> +Subject: [PATCH] iperf3: Fix CVE-2025-54349
> +CVE: CVE-2025-54349
> +Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313b=
ab0b9b3fe03513ab54f722c8a3e4b7bdf]
> +Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
> +---
> +--- a/src/iperf_auth.c 2025-08-19 12:02:47.706337000 +0530
> ++++ b/src/iperf_auth.c 2025-09-15 12:50:47.933400511 +0530
> +@@ -264,7 +264,8 @@
> +
> +     keysize =3D RSA_size(rsa);
> +     rsa_buffer  =3D OPENSSL_malloc(keysize * 2);
> +-    *plaintext =3D (unsigned char*)OPENSSL_malloc(keysize);
> ++    // Note: +1 for NULL
> ++    *plaintext =3D (unsigned char*)OPENSSL_malloc(keysize + 1);
> +
> +     BIO *bioBuff   =3D BIO_new_mem_buf((void*)encryptedtext, encryptedt=
ext_len);
> +     rsa_buffer_len =3D BIO_read(bioBuff, rsa_buffer, keysize * 2);
> +@@ -274,7 +275,7 @@
> +     OPENSSL_free(rsa_buffer);
> +     BIO_free(bioBuff);
> +
> +-    if (plaintext_len < 0) {
> ++    if (plaintext_len <=3D 0) {
> +       /* We probably shouldn't be printing stuff like this */
> +       fprintf(stderr, "%s\n", ERR_error_string(ERR_get_error(), NULL));
> +     }
> +@@ -320,7 +321,7 @@
> +     int plaintext_len;
> +     plaintext_len =3D decrypt_rsa_message(encrypted_b64, encrypted_len_=
b64, private_key, &plaintext);
> +     free(encrypted_b64);
> +-    if (plaintext_len < 0) {
> ++    if (plaintext_len <=3D 0) {
> +         return -1;
> +     }
> +     plaintext[plaintext_len] =3D '\0';
> +@@ -328,16 +329,19 @@
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
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.14.bb
> index d181eb3b02..831e854982 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc6301c8256c=
eb8f71c9e3c2ae9096b9"
>  SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3Dmaster;protocol=
=3Dhttps \
>             file://0002-Remove-pg-from-profile_CFLAGS.patch \
>             file://0001-configure.ac-check-for-CPP-prog.patch \
> +           file://CVE-2025-54349.patch \
>             "
>
>  SRCREV =3D "a0be85934144bc04712a6695b14ea6e45c379e1d"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119597): https://lists.openembedded.org/g/openembedde=
d-devel/message/119597
> Mute This Topic: https://lists.openembedded.org/mt/115328076/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

