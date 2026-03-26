Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F0910AB82A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 21:19:57 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58744.1774559989775473237
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 14:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FOhvIQSw;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-46708149af2so859839b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774559989; cv=none;
        d=google.com; s=arc-20240605;
        b=UylC1A4+Bgl0l7/NY3uGmeVS+6hOyc6K/5X2eWKm7HamNdKqiUDVQ7udgIGRV70A7+
         zt8xzkVoeYvEHsTOxrCiXYJloolBMbkh7hSjldzwg58bsHMjVz6lG1CzJ9RAwQw58s4A
         ZFH1s89NhA50yzCoSxbFAhoSm66YoPVTZFoEj4vzf83cAQ9nOJZwDNxoxwD0n/BqXUvf
         cDF/Sr8VAT/pAn+NoBvYAabvQGxYNtO6lvE4l8U0SFnO+ZFe/KvTtS/WUIAbBQpEYjqp
         weMnnVLR/qDZKombVsa3TA/VBZzCEGHcj78CbklFeKYmwH6aSegVBCA08Erul/E6dAKs
         3wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kn8+CdZg6UPwZuh8nxzMvthorrBmCc22hNL7jNt/yYg=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=N5Keh1akYP5MhU89vlEaUtx4zLWua2+v1wJLJj8epawDYFq9DdInhxky8ZGLjFV8eX
         /nx7aVDqMf0mPBMG5t7f3H94x1jh1k/g93hDvCK/MO7HzW0+Rhc4V2Iy4vcF03WlcCdm
         N++rgNgBEgmt2kisFB2gMwsdLuSONFJ3CqNadood2BITmcHOzRTVuPfTBBcR0h67XdEy
         jBscx68Gaiswm1D2gt/poO99dtOC/n+sdf1sKup8Z6RpcgEus3lBt0FndKYfCjF0+o0d
         3uDRoNgQ2u/Ibsf//l0jQuQeh916sVWfudTe8Y+AxGuRSXeRFmIEw1Y6Yy4TfBAy/jqL
         WN+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774559989; x=1775164789; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn8+CdZg6UPwZuh8nxzMvthorrBmCc22hNL7jNt/yYg=;
        b=FOhvIQSwu7Xxed92wdmxTI31RI3DfqeSp/vlH7B+G1QKZlNZE8XdlraEa75s3+p917
         B6nnMQsswE+3utTKJ1jJXA0Rrt1WDq9aTpZE+ZLpWAged3lRF/eaEzI6VUrOxUxGygjZ
         iivqNLbGCeJNokJ8yU51LX/dkzNJp3tTELBa/QuYLuk2H5ZuT1hwn8cgAC4GGX5e9PJZ
         mIU1HvqHKJLUDMZqGcxlwx605iq3tyj3pc/Zdx2Mxi4+JQZ5VRSpsV25rGU1uro3MH+g
         9s5dMtJpBzwRXDqAOhyqDhgeQ+IigqNyk3fc2hkJQ5PeEaBKaJ/ocpDSTTQH6QnirI5R
         a92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774559989; x=1775164789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kn8+CdZg6UPwZuh8nxzMvthorrBmCc22hNL7jNt/yYg=;
        b=q7q3HcLqK1GQ7trHakjO60NRNAt+HSKyARFfmhuY69h6j7y4Ho3YvQoNZGPXxu2nvV
         BsMs7WHkt3j2S12RodeW8xnMhnVsvLBPqz5cdkJpVIhsGlllXi1fwAuoFOUAA3nWgMO0
         xZQuhk9cLdEELG2qEIJdNu/jWx6x2BX289XxjHyUmWQNZ3G737sGTnEtLb5C4/zJGIIF
         aa/8T5uHKAwLJIcvkyLXM0QPX6QycVHIzPG1qGGT5Uo8rbkqEk9wxsymldDXMOB9fyni
         PgCNf99BsltaWbEIRe6iB+ikKR8S4+iJOaYl5oPQMG189lX0BRIavnSJ/udRgkuBGUe1
         +gdg==
X-Gm-Message-State: AOJu0YzB5/9mXwLUW51zpbQ4zTsIsQrgGJhOXgHNI4i4g72a3H8CaW4n
	XCJ3WkxlgOh2iMqYh89xR2WeAPSJsX/xjqCgGYmT9b+VbRVwVxRjzEVBw+hirlKrAY3mJD9OXVC
	F1+0Vbq8rW13K/ijWfTOwFmNYlLZRnuc=
X-Gm-Gg: ATEYQzwhO0tiuey+2iKAqoxUSXWm5z0CPjuudN+r36PTkS1zuJ0Il7sBVqjwhvHdsmj
	9A1hnWLwNt21l20SNr8JbP3t9rcpPkYE2VRldTlKmW004hIJH+1jFEVhwbhPaiu7YuQ5YQVN/KC
	UBnZLiJPKkGTJqJHz+MU6zNoduAUM7pGBKE08TytyKqcFWdHJ+Kken/4HEfswCQEB/3laPMf+HT
	wy+OyCogpNOry/qgVrE4MOz4Sa4ZNG6LXnoSg0MjgYLjZt1YaEx12exBFQkLs+vaWdVTwrBTyZk
	LUmgox+Q
X-Received: by 2002:a05:6808:4feb:b0:467:2418:cee2 with SMTP id
 5614622812f47-46a5c7d046amr4361754b6e.56.1774559988973; Thu, 26 Mar 2026
 14:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260326115634.1199-1-wangmy@fujitsu.com> <20260326115634.1199-53-wangmy@fujitsu.com>
In-Reply-To: <20260326115634.1199-53-wangmy@fujitsu.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 27 Mar 2026 10:19:37 +1300
X-Gm-Features: AQROBzBF-2OdDdflpBiJcJ32bExuXdqe9kuYCx324MMXdMgwwFnhwOHrpoUpBe4
Message-ID: <CADySD0EoJtnQEGgouaAhYboVP-g_oViEBNujzpCtsD=Thej=yg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 53/63] python3-ujson: upgrade 5.11.0 -> 5.12.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 21:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125772

On Fri, Mar 27, 2026 at 12:58=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-ujson_5.11.0.bb =3D> python3-ujson_5.12.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-ujson_5.11.0.bb =3D>=
 python3-ujson_5.12.0.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb =
b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
> index 95199de839..a1539d5c49 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "UltraJSON is an ultra fast JSON encoder =
and decoder written in pu
>  LICENSE =3D "BSD-3-Clause"

I think license should be updated to "BSD-3-Clause & TCL"
https://github.com/ultrajson/ultrajson/pull/693/changes/675d9e18e14270c5db1=
17b6b55c466645fe85cdc

>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1e3768cfe2662fa77c49c9c2d=
3804d87"
>
> -SRC_URI[sha256sum] =3D "e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c1=
2eb8b991fe2010e0"
> +SRC_URI[sha256sum] =3D "14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e85=
67c9675b8b13bcf4"
>
>  inherit pypi ptest-python-pytest python_setuptools_build_meta
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125708): https://lists.openembedded.org/g/openembedde=
d-devel/message/125708
> Mute This Topic: https://lists.openembedded.org/mt/118516717/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

