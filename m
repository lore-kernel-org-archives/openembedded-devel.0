Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCEDC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 19:20:43 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.56903.1744053642609336726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 12:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTMdqCzR;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so2743869b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053642; x=1744658442; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggt8dW8kuqhHANwQP0uGbcD30OvbwfP3E+MbYwkJ69U=;
        b=DTMdqCzRR/g1EVrU1C0/85ZTaZAxypdyCpooDcXlWU4O9Tc7RxyjCwaUtPIxxLkMJE
         MzuuS+Mzsfdc4yhQYtT+woxf0lrml2Cwi1uInDpI+a9oDyiE+HovLX/DIPMVn+LeHkkw
         bTgttwz3FaWFdeBY6BfvkN7ENUrZvuNZ4CAOiQgnAcI2sSGA/XSdo058SeeLTv8vhR4s
         eOzdFd3KATchpvUZzockw5jxZhpwmCuxWBUxe1f/EeZ5o6M1r1vsrBFruwVQtl0EDEKg
         gYXMSBniQ9sQwqyLYg1JT70JIol2zpik+MuuxSgNGxY7BmgcYEEMdbg5ZcxxSpXRNpXs
         SJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053642; x=1744658442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggt8dW8kuqhHANwQP0uGbcD30OvbwfP3E+MbYwkJ69U=;
        b=fx8nopiJ49uRcX5SEl1nDY6lnmIMO1oFabOpag9/HfhXZbXPcSS3hW49Fr+6sDnTgq
         K2fXdRPcApOuius/cQhvH3ofWF6eC+VDbLIT7yaw5t1xx30nnzoHGXGk16Z5wR4GTw9J
         l2gEdrzG550fjrZBo02x5GF+yK5CFFIb8+csk3sQaFHZ717vzIhpsNPNFbycISFvHFi7
         Z1p1FhtY5SO//JUQMa9LBMJPtVWMS3eC9N/LIy54VfuUv5+gZWUPYwy+E6DTZbW2OJB3
         TyphwO5xcYWmpE8gDa2Mgt1/Yxiw2Bi8Sa3mvorQ6C5M7AV1tyehXpuu+QNHeujBKhUJ
         NzHQ==
X-Gm-Message-State: AOJu0YyXg2StLK1ftWETaU0KhTtKzFPx7MW/DEkrhK+FI7E1bORlMNET
	lX0IJLxNvnrkhGquFlWVK1d/kTy90r1XhDTOf8jlJAH8k6LzC8v6QDoifvuk5xiBv9wxCfNf9HY
	drZK9KpcgBQiLfqMuaOhFRZbIgmJ6RDerHk0=
X-Gm-Gg: ASbGncsqyX8rH0rUlUGFuFeP0Gk8ECKUKyARctu22vKfa4/x3iFZKa3aFoON0tCNYCe
	OeLhN5c4YmbGPx9gAVFQCq9u8HJYpqULO7BrvLOq4JeV7bbJCVebpp4cfMFaQ2eDe3gVv+UWXHL
	0Vib2+ti0eBLmytFu3/6cTLXRhPakbHPqGr6/5s8C5Bb/uOClhpsLTDwc=
X-Google-Smtp-Source: AGHT+IH3xFv2hLlTYHLyqip6cpD1QujYrefLO4MGywAAx8njKWMlQSnsUbParV84bHLpw6X6Kc3QxX+w+xIsLmVzl9k=
X-Received: by 2002:a05:6808:318b:b0:3f7:d16c:e293 with SMTP id
 5614622812f47-4004653af45mr8567383b6e.2.1744053641889; Mon, 07 Apr 2025
 12:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com> <1744017431-22217-6-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744017431-22217-6-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 12:20:15 -0700
X-Gm-Features: ATxdqUFoZG46obWLIaxcNVyGBsO09G3OwYW2FSVTC755aJjfC0RmyAjMU2JP0Ao
Message-ID: <CAMKF1srhCh56mHBW5PHWShnd_VbmwC_=TbPBGaVpDtZWbZ=eGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 06/30] libspdm: upgrade 3.6.0 -> 3.7.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 19:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116678

this fails when building with lld linker -
https://errors.yoctoproject.org/Errors/Details/851679/

On Mon, Apr 7, 2025 at 2:17=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libspdm/{libspdm_3.6.0.bb =3D> libspdm_3.7.0.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libspdm/{libspdm_3.6.0.bb =3D> libspdm_3.=
7.0.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.7.0.bb
> similarity index 97%
> rename from meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> rename to meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> index 4c0483ebac..5096eb3874 100644
> --- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81=
a88da8e812af43728b72dd7"
>  DEPENDS =3D "openssl"
>
>  SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3D=
https"
> -SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> +SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116631): https://lists.openembedded.org/g/openembedde=
d-devel/message/116631
> Mute This Topic: https://lists.openembedded.org/mt/112129262/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

