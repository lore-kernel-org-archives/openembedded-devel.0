Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4CAC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 12:52:20 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.10658.1642423938073041282
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 04:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=Yy8wWauw;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: esben@geanix.com)
Received: from localhost (87-49-44-216-mobile.dk.customer.tdc.net
 [87.49.44.216])
	by first.geanix.com (Postfix) with ESMTPSA id 63C5FE0205;
	Mon, 17 Jan 2022 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1642423934; bh=BfDCK7pyCLKRfLhi2uu9GFpR0UXjfHbL+I/yIFVFpU4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=Yy8wWauw9VkIs/+MTA3mKOl9IlQRiQYvM6N597UuKSYHRRf+NDqmaAYYzHCWievlB
	 54vaLNiqGbkK0qRt00tuZOhR3oPO2Z4jmYuJTACyFLI5rFpEYcSu0wzIbKNOFSiQxB
	 dO0Bbx5PPRHFxBAJiSyZMRRW+wUTX+9x2aBd2RSiD3Gdk2i8hizEZuT2UvnsrEFdwU
	 aoMuVRmlGiHO3pUu7wZY1++NcfblH4ERfSnuXWI3ZOxEiQbf+EjYykJ7/693DOUb5X
	 gIKSG7RqzNCxEbqK1ZR1Dkgqrmhw/bsnDkzBiA8db1AxeVS1dci7gE71FR+Kafz6j4
	 3XW+hFSmJz/kg==
From: Esben Haabendal <esben@geanix.com>
To: "Kasper" <kasper@krinvent.dk>
Cc: openembedded-devel@lists.openembedded.org,  Kasper Revsbech
 <kasper.revsbech.ext@siemensgamesa.com>
Subject: Re: [oe] [meta-python][PATCH] python3-dacite: Add recipe
References: <20211221093822.10169-1-kasper@krinvent.dk>
Date: Mon, 17 Jan 2022 13:52:13 +0100
In-Reply-To: <20211221093822.10169-1-kasper@krinvent.dk> (kasper@krinvent.dk's
	message of "Tue, 21 Dec 2021 10:38:22 +0100")
Message-ID: <87a6fu1q4i.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 12:52:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94900

"Kasper" <kasper@krinvent.dk> writes:

> From: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
>
> Signed-off-by: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
> ---
>  .../python/python3-dacite_1.6.0.bb                | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-dacite_1.=
6.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dacite_1.6.0.bb =
b/meta-python/recipes-devtools/python/python3-dacite_1.6.0.bb
> new file mode 100644
> index 000000000..8161370e1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dacite_1.6.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Simple creation of data classes from dictionaries."
> +HOMEPAGE =3D "https://github.com/konradhalas/dacite"
> +AUTHOR =3D "Konrad Ha=C5=82as <halas.konrad@gmail.com>"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D04d9af9bd5749a02eff535dac0b2=
54d3"
> +
> +SRC_URI =3D "https://files.pythonhosted.org/packages/f9/bf/3f0912b4cfd86=
1cd0fb7278c2b8d5bfb0c613ec1b7922e25e4115287b73a/dacite-1.6.0.tar.gz"
> +SRC_URI[md5sum] =3D "0a471b3df66e3923ce0ce544dc4ac66c"
> +SRC_URI[sha256sum] =3D "d48125ed0a0352d3de9f493bf980038088f45f3f9d7498f0=
90b50a847daaa6df"
> +
> +S =3D "${WORKDIR}/dacite-1.6.0"
> +
> +RDEPENDS_${PN} =3D ""
> +
> +inherit setuptools3

Did you try using pypi.bbclass instead of manually setting SRC_URI, S
and HOMEPAGE variables?

/Esben

