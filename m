Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id F25607EEE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:21:23 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id j6so5088864ioa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0UiltRYcTf9dTmraqqxT3U1Ml9TxpxoQ+nTuKOXrMwM=;
	b=SZcsvAs9sp7xp9U7B1RrZzaayfyICZdiEa4kgmNlO3kVHi+bAxouerMLw/qsbPtwfT
	TBaStWZI41MRXh2ORUoU4qqzBUsT1wZRdRdyNMnofpQQCIPo8y124gfYE4qnBb+kR5UO
	EEnLbmxwzU3SEE7fvjnFnAEWY0DbodnqeUVLpmo62m3vxrM2NNDGK78MkBLesZJDpkNL
	JBVjw0S23VcYawHsV3xE1m1VAt8+gnUoXb8aNQrnwvzZ0K1M7QlV43+aGqEc2eQEYpdf
	5gg0A/FelanUUHrms4Mww38xSSxdpiiu84K6Lyz0IbjXsMnX9DnngZUs4l/az0vTV2v1
	+1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0UiltRYcTf9dTmraqqxT3U1Ml9TxpxoQ+nTuKOXrMwM=;
	b=uf5v0KHthAahwzjaNmomhViiGsniBXIT8i0pUcq8uyRp6W06xTnfFMja+jpmQkZ9oU
	HGAr8aOh84LYuLW5+WdrlKA4U5k4wVEIAJWrsnBWKP0yDeJRqpV2oWNxXWXsuJJ4OwIE
	kt3MeACsbOrA7tMkuaKsW76101iGZqLWOkVSwe/sIwmQKS1F4zhiptLePePxtNATYAZ5
	ewJuL8eBbmKOExdLC8yzYtRQuciQngeJYDJQWzX2UOCDo3tKQssYJBOP1Ltpg2P6O6cI
	nYLuUDD9NVa5rkDdGXW+wUJ7dX23UOGBy/L5vwTYFAtr4R4iD2eF6yYh9IHGe1V3uXjx
	GBSA==
X-Gm-Message-State: APjAAAW8VjHE4kiwLIJL8VgrTZTB1Wb73QMy53amf8nUJaDgNyljVW8c
	Ha2Vv+PRJG7LVp1MBGzBA7L50+DtTII2Z6V51Vs=
X-Google-Smtp-Source: APXvYqw9xVqH6bZ8o2nBYHMIqDzs9s+kl6gK4mtfHR5NsZEXBm91vsdkIeBYzEimPtYitLJEe7/lgR3lXHUyu1tJEFA=
X-Received: by 2002:a6b:7208:: with SMTP id n8mr4229613ioc.151.1562768484807; 
	Wed, 10 Jul 2019 07:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190709082035.14898-1-windel.bouwman@gmail.com>
In-Reply-To: <20190709082035.14898-1-windel.bouwman@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 10 Jul 2019 07:21:13 -0700
Message-ID: <CANx9H-AaFZV+vy0e0X6=B9eNANEetG76PpWUGwMCCO8Psruz_g@mail.gmail.com>
To: Windel Bouwman <windel.bouwman@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python-humanfriendly: Add recipe for the humanfriendly package.
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
X-List-Received-Date: Wed, 10 Jul 2019 14:21:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2019 at 1:21 AM Windel Bouwman <windel.bouwman@gmail.com>
wrote:

> Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
> ---
>  .../python/python-humanfriendly.inc           | 25 +++++++++++++++++++
>  .../python/python-humanfriendly_4.18.bb       |  2 ++
>  .../python/python3-humanfriendly_4.18.bb      |  2 ++
>  3 files changed, 29 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-humanfriendly.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python-humanfriendly_4.18.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-humanfriendly_4.18.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc
> b/meta-python/recipes-devtools/python/python-humanfriendly.inc
> new file mode 100644
> index 000000000..94f7f8b81
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-humanfriendly.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Human friendly output for text interfaces using Python"
> +HOMEPAGE =3D "https://humanfriendly.readthedocs.io/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D690da298a43805797a4fa7bbe180b3c6"
> +
> +PYPI_PACKAGE =3D "humanfriendly"
> +
> +SRC_URI[md5sum] =3D "9573f9f37a5454d8205cfd1b9b8db9d2"
> +SRC_URI[sha256sum] =3D
> "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN}_class-target +=3D " \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-fcntl \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-stringold \
> +"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/
> python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/
> python-humanfriendly_4.18.bb
> new file mode 100644
> index 000000000..2ca5fe36f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
>

This should be =E2=80=9Cinherit setuptools=E2=80=9D (which means build for =
 python2)

+require python-humanfriendly.inc
> diff --git a/meta-python/recipes-devtools/python/
> python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/
> python3-humanfriendly_4.18.bb
> new file mode 100644
> index 000000000..2ca5fe36f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-humanfriendly.inc
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

