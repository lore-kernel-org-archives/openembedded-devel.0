Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE46C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 17:56:03 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.3323.1710266160524421283
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 10:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcwRaL56;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e513700636so1471390a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 10:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710266159; x=1710870959; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vd4XULFMRWVItw9gw+s3w0E+XuyaSf+PuhfZXaA4Bo=;
        b=KcwRaL56OQKSypgdRwVLSrtghtsTpA09k7jZTTmm5EOfZdHsd72NrL6dhXd1O1vN4a
         iLCIN6n0PGFuaMz/vr3z13+637LnHLcFrLIn0PXNGY8PEHevxpvSrXA98Jdc+5eSzfz6
         czXuyQCXNMrrBZKleFm5fi3ekCIcFhAJd6WyFT3u2KVOXmeElklOWLUDPMmuu6xGHfmw
         04OJZhIdPcb6itowb1/z5ohOHBGiLeOiSmvyywBJQ0/INkajSPJWTCn1rtklGdmWbbkF
         hskaKQ0O4f1Rd7enUfDd03pszJ57TPJPHxWH1bMn0WbMAkeg+G6eTeRxP4d6h4h4SrDg
         8L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710266159; x=1710870959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vd4XULFMRWVItw9gw+s3w0E+XuyaSf+PuhfZXaA4Bo=;
        b=h1H5QMAlVxMWdLmezt7krjIFmVZdTCjedycaFC/dHqQOP1Dnb7q+cQQ07kSBw9IeCJ
         5lt5JX/m8sNace/2vr9HdQm09JOfJ8GvP5FNcUS6vBi5ZAIbV1w/gRFXGFXjBayk87c/
         tI5O4V2L2Pi++tWJpisW7UoEH51aqxPjqH8UP/xNxq8i/B0/17vQqFFTFHO4Y3kAu1SW
         c9I0+HV1s1qaExML9hG94xOI6oswtiPhyIW9z5bpd+c0LXf0Ez00bLISzvpXXxGTqQYg
         9gKyEbSP5F9Ih+ymsExyZW+ecvfL/GLna2dPrWq0x2UBzm//UVWitOE+Cs9ElPe4HdnO
         DmSw==
X-Gm-Message-State: AOJu0YznymM8vl2ox1nycYGXhl15tbIMiMy7VzPB2wXdH9kJISJR/piC
	xc0rxmOCBTskjM6CUghI5VoYwR/gWCSwVTblLRF0cgig+GEos90Na9XioRHJvvcrugF5kyCenMf
	2YwEnQwDpycV3UjHuhN8fbDgdOUE=
X-Google-Smtp-Source: AGHT+IHRLc+i1wTDnQfc44HCBZaWHL0cikmUVoIpagFTlhAsx1B5/6vZj1DhWwxy+xPaEjryuqjiRsQ6+m6USGViQ4Q=
X-Received: by 2002:a05:6871:826:b0:221:ab60:da45 with SMTP id
 q38-20020a056871082600b00221ab60da45mr9408198oap.11.1710266159609; Tue, 12
 Mar 2024 10:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240312164815.1638743-1-dan.mcgregor@vecima.com>
In-Reply-To: <20240312164815.1638743-1-dan.mcgregor@vecima.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Mar 2024 10:55:33 -0700
Message-ID: <CAMKF1srF_rpRpEea0TeZJO2W3VaAYc1vDE+QQ9xhdkSFHjOe2g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pylint: Update to 3.1.0
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 17:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109279

I am seeing one ptest failure

FAIL: tests/test_functional.py:test_functional[wrong_import_order]
you can run the recipe ptest on qemu machines with

bitbake meta-python-image-ptest-python3-pylint

On Tue, Mar 12, 2024 at 9:48=E2=80=AFAM Dan McGregor <danismostlikely@gmail=
.com> wrote:
>
> PyLint needs to be comapatible with Astroid. It was recently updated
> to version 3.1.0, so follow suit with pylint.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> ---
>  .../{python3-pylint_3.0.3.bb =3D> python3-pylint_3.1.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pylint_3.0.3.bb =3D>=
 python3-pylint_3.1.0.bb} (95%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb =
b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> similarity index 95%
> rename from meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> index eb4b9e897ff..49f0b3eb6e4 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> @@ -3,10 +3,10 @@ HOMEPAGE=3D "http://www.pylint.org/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e=
9c9"
>
> -SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.=
0.x;protocol=3Dhttps \
> +SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.=
1.x;protocol=3Dhttps \
>             file://run-ptest \
>             "
> -SRCREV =3D "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
> +SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
>
>  inherit python_setuptools_build_meta ptest
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109278): https://lists.openembedded.org/g/openembedde=
d-devel/message/109278
> Mute This Topic: https://lists.openembedded.org/mt/104888348/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

