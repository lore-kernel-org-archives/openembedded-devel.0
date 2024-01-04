Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEB3C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 04:53:09 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.47908.1704343987391114495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 20:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PNwhmVuC;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-594cb19c5d9so444747eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 20:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704343986; x=1704948786; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8iqWwi0lUoWWpbKZoVQbj3dr8XopM4VftbeHBRTxvg=;
        b=PNwhmVuCPJ1Hrs5TZmRcDb6B1qQIOc1Xoo/NBPvkoIMOZgaAllq9HrOmFdCUU5l69P
         LQnhJp6+N2IYyoacXo2Ch0Oul0J7qHXBusBalhCQ+A0LdtX73O+X+csfKI4YJUzYJgPa
         btYIdbN+n0/f2OHKRNYRcNUXqZmYqHZ3ZmZKgHL+8vOjf1iA/g79WduhBoqUOdm5SfDh
         bWQN4manlkJQP1hBaOeV4Y7Lp3ZEw08xXGKF+n2IIDrT/fK3W1dvtxWK/6E2R8dw7z/D
         18ZafX25Z2GIAUXGvFHKbHsaRLL1b3ryB/PeEKc1XBg6UZjS7AF+Ja1FEBbKkVwfGqWg
         XGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704343986; x=1704948786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8iqWwi0lUoWWpbKZoVQbj3dr8XopM4VftbeHBRTxvg=;
        b=wLOJ97SAeywyQ6mi0ESVnliq+HE1vP9yzb5qs7e+RdAIVUQznZsxJNVAP7ort1ENYs
         nC3sUt5D/U3+pg5O5Zjv8GSSTMR3zLS/mZoXJaZrD9jv2EkQU3j9AB7CuQ8c1+8gm3Aq
         TEUWMsim/GNNo4fFm7tZ/5dsEhPGEjwsCMLSPpajVl8i0vAg81PSbE4gvCHPfe38jGBj
         MLRbNm/Hwkz92NavFz63Cf9FUZj3K0I0hPko2++tPYDhxL33uh43hA67WpUCnKzNKDX3
         v7P+odOcmA4lezc+JF+ukfGjGPhACcmi3HsmRa9oUSiSqqa7vfD9k74FeDIUpLZKvVxG
         /nCQ==
X-Gm-Message-State: AOJu0Yzc6DFZbATDucCjDtyB5tRpnIDuW8HLC7+4zw0Xvp0EPyr0eYim
	9Btlz2teu5R+MTsZ7qwe2T2QkwAsqXSHpZ0T1bA=
X-Google-Smtp-Source: AGHT+IHgGcmVSBGpiO7Cvju6LFF0mPuwS/pmitXn9hHPbZi+/jsl4sE3IjUnka3b4ssknglVf1BFscRRAwVhS1aQ8rw=
X-Received: by 2002:a05:6870:d18a:b0:204:3777:3399 with SMTP id
 a10-20020a056870d18a00b0020437773399mr821538oac.44.1704343986385; Wed, 03 Jan
 2024 20:53:06 -0800 (PST)
MIME-Version: 1.0
References: <1704271107-17682-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1704271107-17682-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jan 2024 20:52:40 -0800
Message-ID: <CAMKF1spTjsewEiC-WSQiU=OmJz=T=gW-kocrDuDB=tHvcnK4yg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libtinyxml2: upgrade 9.0.0 -> 10.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 04:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108036

This is failing ptests

   AssertionError:- [2/3]
    Failed ptests:
    {'libtinyxml2': ['xmltest']}

You can run the ptest with

bitbake meta-oe-image-ptest-libtinyxml2
bitbake -ctestimage meta-oe-image-ptest-libtinyxml2

On Wed, Jan 3, 2024 at 12:38=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> remove non-existent files from install.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{libtinyxml2_9.0.0.bb =3D> libtinyxml2_10.0.0.bb}            | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_9.0.0.bb =3D> li=
btinyxml2_10.0.0.bb} (85%)
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/m=
eta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
> similarity index 85%
> rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
> index 7ef4d89ce..af5a994d2 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>  LICENSE =3D "Zlib"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D135624eef03e1f1101b9ba9ac=
9b5fffd"
>
> -SRCREV =3D "1dee28e51f9175a31955b9791c74c430fe13dc82"
> +SRCREV =3D "321ea883b7190d4e85cae5512a12e5eaa8f8731f"
>  SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;branch=3Dmaster;p=
rotocol=3Dhttps \
>             file://run-ptest"
>
> @@ -19,7 +19,6 @@ CXXFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
>  do_install_ptest() {
>      install -Dm 0755 ${B}/xmltest ${D}${PTEST_PATH}/xmltest
>      install -d ${D}${PTEST_PATH}/resources/out
> -    install -Dm 0644 ${B}/resources/*.xml ${D}${PTEST_PATH}/resources/
>  }
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108025): https://lists.openembedded.org/g/openembedde=
d-devel/message/108025
> Mute This Topic: https://lists.openembedded.org/mt/103498655/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

