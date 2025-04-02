Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B062C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 04:49:27 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.709.1743569351110997558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 21:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ey+W3s1K;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c173211feso2114643a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 21:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743569350; x=1744174150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq1LLdcxTN0v3/mxAdAefowkxaBYLoaU7AvOckK9zE4=;
        b=ey+W3s1KQPxTssBBBd14TFqBCXWxrXJba6+9vxVmaIh7Gulykp02VgyHQZoFO99/5O
         j4I2RLbuztneshkySrWreFHyeblMCcFw0x0qQRlXzI/j6vBjltdxw+gQ+992tu3HsGL7
         t3XSPrx6/KaC+4hrWXVdq1Uo137226RbDFRx3HiEiLGMfyqlRLjbFGZs4RjyD4/n55ST
         8Zzw9io62CkDN2FUmwkrR1jlAeZPI3TAiTwC+fXruZ0LSZ5yYcCNdr2QqeKNgpWPZVTo
         qscdu6N4zn0cBIG/bhjGTU+RnVtUFErIPFLlZUJ+5zY7UsBwO4XnAvwrVxVkmqSHRDig
         HwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743569350; x=1744174150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nq1LLdcxTN0v3/mxAdAefowkxaBYLoaU7AvOckK9zE4=;
        b=JjaQ5KR6Iklzk3POv4wgeuihCgOsh74s1Lw9Unm1Q3GD5NIPXqnIcsStwIh4z8HBWI
         0lq+aqTz68ZqZA7ptgeE8r9STsyA02fiMOgvNpSqs6YzQValmjoLt0T1D6v7fO5A2n6t
         ouXrklJlb+RUSw5uvRDbXc0GbtMbrkaQifoJaAERD7EElGF8y6TEYHdOpN2U1LcXcrPg
         NF/5DiGkI1S6Z6hAY7AfVdwRsToqAhDnNuoaAM6PNhnL6Q8kQX30Z7+MjUor7EmnhbCn
         i0t7sCOvTC6Gcq7oT5k5gfT/kQ/oguLkHIRFh+uzh94sVKAoJO8w3WbhiPEXSkLROG7J
         bH/w==
X-Gm-Message-State: AOJu0YyUrYgKeaXR8Ox4BSmHZrnKmD//b6ft67dknO593zoaUOdfTGVx
	YGzMeah1HObE3Ymfa9lI8kQ+0JfpGrwCIqslL60qRIKuVLEcTt6mHNAiK2oNjA9HMH4wrJz34Gj
	6topkxfWa2fWD92DuJ18PXlrTHxU=
X-Gm-Gg: ASbGnctLCLpxKJkHLW8ggfVAN5OINYKMF+XY3VPHT8te6DEy+dIy76hoJYFTjzHjcHM
	9xPbCygWSw38DXb+tL54ymFRzl7Cz94HeniEkqbgMwZ2sApt1E4xNVIHDu311+fEAzl+Q2fFCjP
	89D7MOWYaD539T2CEtVoblTbn1vsfPr+jCJBuKsqZ2
X-Google-Smtp-Source: AGHT+IGyizDNZ838Lje9WWbKkBN62iyVdddh3rzrSxtNgDKFec0OWQoKRBiso9zML+TSOH4sdPJcuI8p+iPRnI8VF5o=
X-Received: by 2002:a05:6808:168a:b0:3fa:6d13:8cf4 with SMTP id
 5614622812f47-3ff0f50ed9dmr8071242b6e.16.1743569350102; Tue, 01 Apr 2025
 21:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250401185718.2447415-1-jan.vermaete@gmail.com> <20250401185718.2447415-4-jan.vermaete@gmail.com>
In-Reply-To: <20250401185718.2447415-4-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 21:48:44 -0700
X-Gm-Features: AQ5f1Jq41FiihEYQuL_sQLDX6JGiyEEX5iGvNayIVZDwtvaeLazz6fKVbWvupvY
Message-ID: <CAMKF1srwsSkCs6sCpBTWpe5Cw1ZnN6iCaHemgDPsLk8K3SphOA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-mdit-py-plugins: new recipe
 vesion 0.4.2
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 04:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116499

fails to fetch

ERROR: python3-mdit-py-plugins-0.4.2-r0 do_fetch: Bitbake Fetcher
Error: FetchError('Unable to fetch URL from any source.',
'https://files.pythonhosted.org/packages/source/m/mdit-py-plugins/mdit-py-p=
lugins-0.4.2.tar.gz;downloadfilename=3Dmdit-py-plugins-0.4.2.tar.gz')
ERROR: Logfile of failure stored in:
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/python3-mdit-py-plugins=
/0.4.2/temp/log.do_fetch.810

On Tue, Apr 1, 2025 at 11:58=E2=80=AFAM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../python/python3-mdit-py-plugins_0.4.2.bb        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-mdit-py-p=
lugins_0.4.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_=
0.4.2.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.=
2.bb
> new file mode 100644
> index 0000000000..f83543d320
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.4.2.b=
b
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Collection of plugins for markdown-it-py"
> +HOMEPAGE =3D "https://github.com/executablebooks/mdit-py-plugins"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da38a1697260a7ad7bf29f44b362db=
1fc"
> +
> +SRC_URI[sha256sum] =3D "5f2cd1fdb606ddf152d37ec30e46101a60512bc0e5fa1a70=
02c36647b09e26b5"
> +
> +inherit pypi python_flit_core
> +
> +RDEPENDS:${PN} +=3D "python3-markdown-it-py"
> +
> +PYPI_PACKAGE =3D "mdit-py-plugins"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116487): https://lists.openembedded.org/g/openembedde=
d-devel/message/116487
> Mute This Topic: https://lists.openembedded.org/mt/112032806/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

