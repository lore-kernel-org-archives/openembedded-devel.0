Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10EFC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:04:16 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.87592.1723219451997543370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwbUJSP8;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5b850d969so1257961eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723219451; x=1723824251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdjbmOsL+cfMMuEtpDhQpbpkBnG9HawGNRwk2XQw3x4=;
        b=CwbUJSP8uh7ML6DWWHQgjdJB8Uxt7TdJTY56PmzMrXBMnfXxXRYjn8YoyrAoHfwYQ8
         cbSv/LopW/vd2ObcOk3qDZtX3nsqech27nt9H7PLtvx3LOPG0Jm2mAvQiPrXQlHgI5Xd
         Q464POoylYx9b/vyGnmAzvwJ60YVHLcwuXrCU4uKHOqSDwKBGyCUQtYnlmyn7p2uDj3u
         HrDVYQqFim6xYO+l0QXvbz62YcJo2hg8XSke2jPYXSYWuqJXCf1uMAo3WylQasZRWWW5
         +Jw+nYo8FhWL9e0P75gS1y3UWRmj3MtQdbxokXDvNmHvAp99GRqKfoq5keJlFEnbplLv
         8qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723219451; x=1723824251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdjbmOsL+cfMMuEtpDhQpbpkBnG9HawGNRwk2XQw3x4=;
        b=XbNiJj7tHg5sr4+eU21+9zqt72PIFpWpW1AcLSSkqrYrJhwUsIiPvXtDyDffYIsyTL
         VF+GXpb1MeTymXKNOP+OjfIJ9ii2pmfnXHWGnTwOjBJ6G33nWRUi8HpUOWRlA+bVsmS7
         eG2VCirtdEA/Y4YEnCeY+0gyE4BNyehDStU2+d2f9VAbSD9PjIK7FJwkhEhjdwwCYVdn
         50Jp0wrJTakbfcJDeTHXDJy+NejpI82Ktlv9xRyPCht8o7FM+pU8NsoQ7TJV6lgysr2G
         cXPv7dsYRoGN4DKTRPNgL6gDXGjN0znNJXThlKCeu1QDJuYAStJbcKvg1QdXc2fB73jN
         RVLg==
X-Gm-Message-State: AOJu0Yz1KudJfhiHCbubGPpmBhytQcXzxJlIuZIbvp5jtdpYb9gAwLbD
	2CvOBrLV/LXS4TAau0FKflA2IlwsAcjaDKnfXdin+Ix6ELG7Ru7ghRuUG/mEGAkwjqX7RUJrulM
	GCTb3YCjWMANPqnsaWrutp83wAf8=
X-Google-Smtp-Source: AGHT+IEduKIqKu8Ubu0rtGh7hJvOOFqpF+0geN+VTGatY+9dJmeKma4Nrjvw5excTIyP0kO7nr9fRd/Z8FybV0AIj24=
X-Received: by 2002:a05:6820:1c81:b0:5c6:9320:2df6 with SMTP id
 006d021491bc7-5d873a0b0cemr2140341eaf.7.1723219451128; Fri, 09 Aug 2024
 09:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2024 09:03:44 -0700
Message-ID: <CAMKF1sqVrrAWb1nSvzhFa61zO48T4AUikmxxXnCS6o6i_W8v_g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 01/13] python3-service-identity: switch
 to PEP-517 build backend
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111710

Thanks for the patch series, Can you rebase them on top of master-next
and resend please

On Fri, Aug 9, 2024 at 8:48=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> The project has a proper pyproject.toml which declares the setuptools.bui=
ld.meta PEP-517 backend.
>
> Fix:
>
> WARNING: python3-service-identity-21.1.0-r0 do_check_backend: QA Issue: i=
nherits setuptools3 but has pyproject.toml with setuptools.build_meta, use =
the correct class [pep517-backend]
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../recipes-devtools/python/python3-service-identity_21.1.0.bb  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-service-identity=
_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_2=
1.1.0.bb
> index 006fae290..267bbea13 100644
> --- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0=
.bb
> +++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0=
.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8a0f079f4e6a21=
5d6bd6f9d97cab4d5f"
>  SRC_URI[md5sum] =3D "5e5c195d8fcedc72f9068be2ad9b5a13"
>  SRC_URI[sha256sum] =3D "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da=
090afc9519419d34"
>
> -inherit pypi setuptools3 ptest
> +inherit pypi python_setuptools_build_meta ptest
>
>  SRC_URI +=3D " \
>         file://run-ptest \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111697): https://lists.openembedded.org/g/openembedde=
d-devel/message/111697
> Mute This Topic: https://lists.openembedded.org/mt/107810496/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

