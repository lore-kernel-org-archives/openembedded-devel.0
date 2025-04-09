Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9FAC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 12:41:23 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.7453.1744202481660001694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 05:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oa1WBNpB;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b159c84cso4818365e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744202480; x=1744807280; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oHjTYtBytzB3+r8fWLeucVici1DgQJzjYXBAd+7HjQ=;
        b=Oa1WBNpBtqOaeoAu//Ua1j1QVGeOUyOT0FJ68RG3JodO0NcFR1NkqU9lZ0rnWQYMVd
         ipclN2phfGMGUQgk9c5X7xFaaGRe+XkuDhy0ESBYTmgllN3c2yxxkRBhKpGI4gq1iAG7
         LxYKndI6/5FSnG1BrKpwd4SHLgs8mMKnIza8sJHETKhfvhWzvKhF/PJy1TOTqq3Bj8Sr
         dARe9rV4xT9ZT2xXt69xNV+Xdr8fndcBgXpWipxgjow1qDzpQWMW/+XeUGPpPLJ4Ic36
         +Ksj6M5FsAMiwFQAhkCVKZG0kqlRfu+g+laWy6qrKBKkd1CuxIvJhYOg4uLyI3hLjB4Y
         0N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202480; x=1744807280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oHjTYtBytzB3+r8fWLeucVici1DgQJzjYXBAd+7HjQ=;
        b=b3eX/0XYJ5yVcEH2Vaw8bRzhzf43ShS5T2Q2EgXhyBDrwKBBj4NsvI/UUV3icaPISm
         ipgDqv/wnNcSqxIYZ3GBb5LmG9xyjsIPVoMpwwvKc8KJAK/yDIoekBJXMqO2XS+E59gs
         /gXm6aUAdYxqPQbaNwX5Rn50/lGfG/qjJZmOUMYEfF9Xe/gzMrF+IGkGdjpF4wtyxFlG
         9O6sYnN3UJHenG3+kvbKlU5O2eBPpsCt8RwDzMtXbEXuaw2gJE2DMCTxBBXkZAOEx//N
         z0Ps6JOe0YQZnWnaw/thKl0AIDuNYaI/SNSgcFJsZnfmjX7qwwQiB+joquoS7VaYL/RY
         GY1w==
X-Gm-Message-State: AOJu0Yxu0zEcL/BUR10fbevtZSSMyTwIOi3TbiDebPyi8qOWb4woF2h4
	XiEZVlVzTGba/lhbbXQCOi099PNqutZj0z3nY59k5BqwvvMuX9SeHJnais4QeJHJY60WDmplesI
	JRDfitlKo9OPw/1zoSkpJjEI7sC8=
X-Gm-Gg: ASbGncs9DTNF8jU0mqzYYZSZTng67YuEi/pMU02gL5UX33ht32k4F/2Hk1+JBlpHXGs
	2FbDMdf+ibJbUOUkngwtjp2agdogQwcQHJ+aq723ajMJCVrEmJinhEjP44q7eX4YaDEh+ZWN/ha
	tapB1UuglMHEHLDNwSzKa2x/S3
X-Google-Smtp-Source: AGHT+IGt4CtmhK6d8E4fkigYU8vyzMCLrMu8RCN9ZVp6QiGtuhJfo8ycB7A/x7kvnwiYqo0jkWT8vFORYPKP9Ivhl7U=
X-Received: by 2002:a05:6512:1386:b0:546:2fde:d2d9 with SMTP id
 2adb3069b0e04-54c444fb77emr714023e87.28.1744202479543; Wed, 09 Apr 2025
 05:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com> <1744017431-22217-26-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744017431-22217-26-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Apr 2025 14:41:07 +0200
X-Gm-Features: ATxdqUHJTI6cfCrw2Irx3M-KcPOUff8iXaEddg2v0oLCc2kFWgxslxbPO43gECU
Message-ID: <CA+chaQfPYDyFGk2sm1HhzZAN2XmX888+b-QzwyF4tK0g=UR8zA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/30] python3-snagboot: upgrade 2.2 -> 2.3
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 12:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116739

With this update applied I'm seeing build failures like:

ValueError: invalid pyproject.toml config: `project.license`.
configuration error: `project.license` must be valid exactly by one
definition (2 matches found):

    - keys:
        'file': {type: string}
      required: ['file']
    - keys:
        'text': {type: string}
      required: ['text']

DESCRIPTION:
    `Project license <https://peps.python.org/pep-0621/#license>`_.

GIVEN VALUE:
    "GPL-2.0-only"

OFFENDING RULE: 'oneOf'

DEFINITION:
    {
        "oneOf": [
            {
                "properties": {
                    "file": {
                        "type": "string",
                        "$$description": [
                            "Relative path to the file (UTF-8) which
contains the license for the",
                            "project."
                        ]
                    }
                },
                "required": [
                    "file"
                ]
            },
            {
                "properties": {
                    "text": {
                        "type": "string",
                        "$$description": [
                            "The license of the project whose meaning
is that of the",
                            "`License field from the core metadata",

"<https://packaging.python.org/specifications/core-metadata/#license>`_."
                        ]
                    }
                },
                "required": [
                    "text"
                ]
            }
        ]
    }

license was changed in
https://github.com/bootlin/snagboot/commit/a648d6dc554f631ba34a6cfeab8c1972=
5bb3816b

It doesn't fail for you?

On Mon, Apr 7, 2025 at 11:18=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-snagboot_2.2.bb =3D> python3-snagboot_2.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-snagboot_2.2.bb =3D>=
 python3-snagboot_2.3.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb =
b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
> rename to meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> index 07b9a5208c..dc57dfc105 100644
> --- a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Snagboot intends to be an open-source replac=
ement vendor-specific too
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -SRC_URI[sha256sum] =3D "00f4933cb52fb73dcf61a0723d77d9d6bc509affb7cd5d5d=
cd875d2c333e8b08"
> +SRC_URI[sha256sum] =3D "c6a97ea0c83a2d7eea639741b2f667c75e95d50278eeb6a8=
adbce5d1a7cf65fa"
>
>  inherit pypi python_setuptools_build_meta
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116655): https://lists.openembedded.org/g/openembedde=
d-devel/message/116655
> Mute This Topic: https://lists.openembedded.org/mt/112129288/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

