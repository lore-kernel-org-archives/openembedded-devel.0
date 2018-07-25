Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id ADF90789C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:23:15 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id u21-v6so5783899qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FFw8/fHj1soJfrhubd14867/hp96ZWgFT+9pgLcvKXg=;
	b=dDu2ly2tHhNq8AsLq/Zamki5iHGBmvi5kaLtew/j3VGlb5a178ej+FzldmPn0lxt6g
	BEUr0G0CcJynIlj3SJUISaxkElrVdRBy2mxJKAjbGoDga4AaHReFvNqFneNtOLPAav7s
	dKPEAToJ5qjzoHRCLc5Jeb7oCkKd5Un8ONvxoUQJtxXg4o/Ky3aS52r1Ck+JLgiEJU4Z
	o/MhopRg1xXMDGuYD0mmo2T87kLpHQoN87z1hpsIKOfjU6OEOPwPihkV9M5APQ4nk4Us
	Q9lSQRn+C44QgiGsPPzcmgw+JpjnumquMGno1zwICIOAONd276iCdaMowbq0y0ltqEml
	pwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FFw8/fHj1soJfrhubd14867/hp96ZWgFT+9pgLcvKXg=;
	b=ftGgVxCJdQrLKhftNU4Z2gMRsVKzzs4x2qjiJYuV7xLC8/jMa5n1ehOhcj3zzqX6pU
	pbCT5U7l0XuMMcheUZgSNYT+wTLd/7IgJOMTzNy39aqBBX+xXYCmeUnKpZR9SDGieJGa
	YybpltRFWOTHm7PlRjtR2mBc6/GFLNsER4qkNBTDIjXbnxn+iyl+6LSpZwkfBXhSDgEL
	FoNsuNQItK83WHmAR4X5n2ByPRG6HghMnGv2KYnq1zNdIf/SuRYkf4Xci2tTYo6Jz/+5
	9i+UeC4mt+tiFWCW8HDOiKH5LLUY4agNf6jdXERRtw9MUjZfu+WdAAHOPKpu91k25Gok
	K3oA==
X-Gm-Message-State: AOUpUlGA/kfDZNRE3323fbOUC07AT3XAyCfIRdaJ0rpJpW5cHXIoZ4b0
	n2z3Pgs17Sntui9OJoz2xuFSV4IrAnkCbfL8KAInvA==
X-Google-Smtp-Source: AAOMgpfspF6jmn51LSUYbVCcqOkVHPFdzkCu/yo5J3pgB/gjY6Va+nK6vVCW7ad4X7VuOkwssxlDYUCwti03cRetOQs=
X-Received: by 2002:a37:8f41:: with SMTP id
	r62-v6mr21330385qkd.412.1532550196506; 
	Wed, 25 Jul 2018 13:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <1532501104-18601-1-git-send-email-lukaszgardon555@gmail.com>
In-Reply-To: <1532501104-18601-1-git-send-email-lukaszgardon555@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jul 2018 13:22:50 -0700
Message-ID: <CAMKF1sqG151xO1RvQ_k1cdyW2WuG0Uccycn+1futb2CZN67L0A@mail.gmail.com>
To: lukaszgardon555@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-tornado: upgrade to version 5.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2018 20:23:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 11:45 PM =C5=81ukasz Gardo=C5=84
<lukaszgardon555@gmail.com> wrote:
>
> License-Update: Checksum changed due to updation in documentation. There
> are no changes in the license terms.

why are we checksumming documentation portions if they are not
contributing to License terms
can you take a look and may be limit the checksum to the lines which matter=
 ?

>
> Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-tornado.inc              | 6 =
+++---
>  .../python/{python-tornado_4.5.3.bb =3D> python-tornado_5.1.bb}       | =
0
>  .../python/{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.bb}     | =
0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =3D>=
 python-tornado_5.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb =3D=
> python3-tornado_5.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/met=
a-python/recipes-devtools/python/python-tornado.inc
> index 29d10da..b40d091 100644
> --- a/meta-python/recipes-devtools/python/python-tornado.inc
> +++ b/meta-python/recipes-devtools/python/python-tornado.inc
> @@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to=
 tens of thousands of ope
>  polling, WebSockets, and other applications that require a long-lived co=
nnection to each user."
>  HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=3D8=
d463fc66ff8f275354ffe88d1896e12"
> +LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=3Da=
ff6d41a5e0da5827d1494624bbd683d"
>
> -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
> -SRC_URI[sha256sum] =3D "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2b=
d7ce644287685f0a"
> +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
> +SRC_URI[sha256sum] =3D "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470dd=
bbd9317fd0801582"
>
>  RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYT=
HON_PN}-email \
>                     ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-j=
son ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb =
b/meta-python/recipes-devtools/python/python-tornado_5.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python-tornado_5.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb=
 b/meta-python/recipes-devtools/python/python3-tornado_5.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_5.1.bb
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

