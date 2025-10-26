Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EED0CCD1A5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 15:06:56 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.11959.1761491212233668118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 08:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MkrISKc6;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7849c889ac8so70247687b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761491211; x=1762096011; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT/AqNyZBbuOmX8Fy6ISe5Nidc70FWrePJg6/j5IQYY=;
        b=MkrISKc6zqs+qpS6SgQ/xS79xM/XESnJGlKQrDscHHpsjzMfpgT2cAsuombBJzw0x/
         Rle1O5TumbUkEz5KR3PiKyXPGttk6ZDIW0PvN/Ph2/v4Ob6VFw+1sXv8XOX2NUUevuv6
         cUCUn20lDa5R3e+vnFuYAEjXdQ5f9/72ltFNTbsSXoUZHNw9ibNaI8INaRg53k7u8P2z
         pxGnWVpog1vtQXrHFtmWS9aUjEHi+niHHwXDSRXRcBpbrMJa1emvoOFzioEGoEDMbqas
         K37re8PHiIMPCs4llww9WRzG3AEHfwO1mW2VV3k7Djlcqp9II3sgWuFTm1120Z1BGkBq
         EShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761491211; x=1762096011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT/AqNyZBbuOmX8Fy6ISe5Nidc70FWrePJg6/j5IQYY=;
        b=vs5k9i/zmWUP1x6c/apJx1FYU3xD7F5ZJIfOXP474QDeskI9hvSo/mb8mDfSSqht6l
         5DkIWZqZ8ljx0u5JIUpjh+dsbQF/NPyqJYHHxW+PF2eqpYjxCjwm2+f9g3IPF1p90Ij3
         cDxRYYSMi0eUm//T5gMieNMVMEabzo46cJgqCd+TMIPR8ke+FVovu4HLefzV7pCA722X
         nwm2/avtwBA5gWWikthrchiUfsrv9G2RvH9j0RASwzFygwkTTPiRcHGal/reMwtb50oe
         gcZC+bdR1s32QJ6RnHOFTH12Um67xIZQwGGOntSgfUoI9EVBpYu4mG944e/yfyXUnatG
         mVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUhH5ql4nuP0bqN9tkal5IF+oIAC2jYrO783BhkvyAj2krlvlraVd2bX2ObEqWEvKaDAJfnUgPTplFcaLtE4ptKaU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUf2AZJL6HKTOZbz5Jc4BaXUDE7QFnJlg1a5hnsrOH15lNEMsY
	pJPtLU0VJhqWLh9HDNfnVo2gbPNJXe/ZYIa74IlMrdhxQQRQy98FkrZG3XTdN9H1dAdosOrwVsI
	AQAVQLOLOJR0wL9VobM6Wyytg80xOYtM=
X-Gm-Gg: ASbGnct/U6BJGIMnxArmQhRINbT9wZ2qI7IKI66uBvt8p13tfaKJRvyeAzFagw10Yr0
	RGJnioevQcpMkrM//fi+EcjWEC4qnGBEdMvJhF3JAN2DwmBO49cs5npuTb3PxvXOHbfQoiUXpi3
	133Ag0m74TsRff+qAJygGBjxeRY3mXXf7wkZSRKUFcF6LlNJQ71Iv/nAHCUlCnUWug7htoeiw8f
	DdeBN0uwH9LtU+FjtrhCJrMRPchDDVs3NX4sTqDCXEKGcGhzBldkIyROUqefUddQz+X/zUZbw2W
	2ztVZjunOR9Nu6zE1h5w2iWjZ0fEIDH08Aauc4hT9jft0nhO3GfRy4/gHPl2
X-Google-Smtp-Source: AGHT+IHameUK5ZKMQ7pHcaFs4EiEKqD4ddz2HNzK9Peq+o33IuiF9u/H9cGKA3kGDWasgCT30Dsc0anZwLhtjacG84g=
X-Received: by 2002:a05:690e:4087:b0:63e:2b9e:1462 with SMTP id
 956f58d0204a3-63f42b7bb9bmr6447779d50.22.1761491211311; Sun, 26 Oct 2025
 08:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251026145444.7355-1-brgl@bgdev.pl>
In-Reply-To: <20251026145444.7355-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Oct 2025 08:06:24 -0700
X-Gm-Features: AWmQ_bmEUHQBJi5p-2BxW4gcsNOczf3C21xiPVN_L6fTi-Osv0TFycVRmOzhGS8
Message-ID: <CAMKF1soGnzmbXvT_qBK=kpAqXDLkggsa=soaV1_1RQHLwg5WEQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-gpiod: update to v2.4.0
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 15:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121014

On Sun, Oct 26, 2025 at 7:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Changelog:
> - make request and reconfigure behavior for lines requested by names
>   consistent with that of lines requested by offsets
> - fix parsing non-tuple keys when requesting a line
> - disable UP045 linter check
> - use quoted types when casting
> - generate wheels for CPython 3.14
> - issue a warning when reconfiguring a line not in the original request
> - update dependencies for wheel generation
> - update licensing information

Please describe this a bit more in commit under License-Update: tag

> - coding style fixes
> - minor performance improvements
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../python/{python3-gpiod_2.3.0.bb =3D> python3-gpiod_2.4.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-gpiod_2.3.0.bb =3D> =
python3-gpiod_2.4.0.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb b=
/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> index cd05b40010..405951fe0c 100644
> --- a/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> @@ -3,11 +3,11 @@ SUMMARY =3D "Python bindings for libgpiod."
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
>  # The actual license files live in the upstream libgpiod from which the =
pypi
>  # package is spun out.
> -LIC_FILES_CHKSUM =3D "file://pyproject.toml;beginline=3D13;endline=3D13;=
md5=3Dfca786987ac89b59c767e55467de581e"
> +LIC_FILES_CHKSUM =3D "file://pyproject.toml;beginline=3D13;endline=3D13;=
md5=3D0fbc720d3e48432ee239eedb6adb0f07"
>
>  SRC_URI +=3D "file://run-ptest"
>
> -SRC_URI[sha256sum] =3D "daa840ed5b691e7078a9cf21c79fe813b9a91c3ed0bdbafa=
e0181c7b98b80300"
> +SRC_URI[sha256sum] =3D "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f53=
35460175143c3aa1"
>
>  inherit python_setuptools_build_meta python_pep517 ptest pypi
>
> --
> 2.48.1
>

