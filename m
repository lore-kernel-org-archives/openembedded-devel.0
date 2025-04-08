Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EA5C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 16:15:33 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.97.1744128929121489291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 09:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aC1xeim6;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-603f54a6c8aso2936458eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744128928; x=1744733728; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dZwDCUx9Un1bCofAMYKqoNS4VUcBGWnFPxsyAp7K8Y=;
        b=aC1xeim6itizjz5McsvBVRAHKRE8MOd/GAlcfsHEKVd8erqiaqLR/fwKO03tSAmlZn
         GvYFnmBRztRAm7PQ4bkwdQ6cJejaH2hDSz9GkRw9zruHEvcrHp6nA8Cxm8ufkvtEiqzH
         3CFe0mAGBavcMXl+W8jjCPVWRD2Wwl8p1IgyEgjARAkw5F3Nwp8lakRBHMckM7gV7jut
         qwjeIpKeYmeNt+ZSYdk8GF3hPS3L8VFfxDIkLGfb6PN7csPY/En+Iyv30UK4dn/hjksn
         mQko2aDy3vGLJrZDzJEQVLmLvTRvpQuZGstTWpD3PrUd1UGgJES/sLHuB88nQSiELodt
         IK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128928; x=1744733728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dZwDCUx9Un1bCofAMYKqoNS4VUcBGWnFPxsyAp7K8Y=;
        b=Xv2+wwFNukDEM8ZsrnHFukjIxnm/98brV8m/HXE6+7ffEB8bay3je8rgu+M+qHByuV
         DoBu0Of+39vHX9K3NEIlayyBQLko/qFW5L91xOCgH4SEUDNdlahQLlRxfoW058zX9oUb
         /KM+TOobsL3/EAA5vhXNkLnsgiuBEG2perPw1QmpHHnsJioY+iWuCw5zqXFFSaRi9obu
         TVIiN0nRFKy8wI4eQ6R90be/TskyxFA3lhTvjobgn41kb8VataJmqcgR44CR2d4Sv2tu
         4WhMimMqjR5OmDn+8jNgMRkIRGuqEiH3LxNPUUXcgEFs+5gjRiPT5wYOGqHsvzJgXWtN
         ggZg==
X-Gm-Message-State: AOJu0YydmMEPo3FWutHJlDSCFRRJXxnnRaVS2Ag+qtHd+uvnwa/FGU2t
	7j41wvkPefcSS/fmKWgJ/TxMTHWB41OY2Eg7HXvwr/LBKd4k0zMx7/GNt1sdX6FWCV577jOaBt/
	WGAiLatFVkJPoMOHArLl38012BP4=
X-Gm-Gg: ASbGncvEU3JU/XSwjXQnZKO1bqB6rT6rmiK1KM7DwWYOD981Pngy1btwr6cszFo7WP7
	oFA+QQmMH3skObv9pnHpQvbrheXFVR2NZYqyLcIxfjFrN0TmyEO4qBWk9lpWXnwVsqIhx45oOcT
	/M6lKTCp8RAe2If+XzHSFoVDV+elTYukvxzhQ=
X-Google-Smtp-Source: AGHT+IHJAoyLbAjeHWTjGTT0sOTDAUUO+cy9OGL96i3ZplJOLy4GPsbPULKU36+G8iRpiqdsWCaNtcFECEBxYOHIwC4=
X-Received: by 2002:a4a:e90e:0:b0:603:f526:ce1 with SMTP id
 006d021491bc7-604166bc7dcmr8729291eaf.8.1744128928110; Tue, 08 Apr 2025
 09:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com> <1744017431-22217-17-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744017431-22217-17-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2025 09:15:00 -0700
X-Gm-Features: ATxdqUG5HvYtWL9M9vugZoKRT0aL1Ws4gg34hBYl2OoQXsGZZcD6erWM1-uG1UU
Message-ID: <CAMKF1sqLef9z8tRJPoV=zYZRGyY3RqzP2d3OuqeDu7qnqYaMNg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 17/30] python3-multidict: upgrade 6.2.0
 -> 6.3.2
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 16:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116711

This failed ptests

   Failed ptests:
=E2=94=82   {'python3-multidict':
['tests/test_leaks.py:test_leak[multidict_extend_dict.py]',
=E2=94=82
'tests/test_leaks.py:test_leak[multidict_extend_multidict.py]',
=E2=94=82
'tests/test_leaks.py:test_leak[multidict_extend_tuple.py]',
=E2=94=82
'tests/test_leaks.py:test_leak[multidict_update_multidict.py]']}
=E2=94=82

I would encourage to run ptests for recipes when doing upgrades etc. e.g.
for python3-multidict one would do
bitbake meta-python-image-ptest-python3-multidict

using qemux86-64 target machine.

On Mon, Apr 7, 2025 at 2:17=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-multidict_6.2.0.bb =3D> python3-multidict_6.3.2.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-multidict_6.2.0.bb =
=3D> python3-multidict_6.3.2.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.=
bb b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-multidict_6.2.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
> index 8b30574020..4e4d69bbd4 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-py=
test
>
>  PV .=3D "+git"
>
> -SRCREV =3D "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
> +SRCREV =3D "0d667589cd02c8ce8251226f8f64fd86afd7ffa3"
>  PYPI_SRC_URI =3D "git://github.com/aio-libs/multidict;branch=3Dmaster;pr=
otocol=3Dhttps"
>  S =3D "${WORKDIR}/git"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116642): https://lists.openembedded.org/g/openembedde=
d-devel/message/116642
> Mute This Topic: https://lists.openembedded.org/mt/112129274/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

