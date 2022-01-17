Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A8CC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 10:11:36 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web09.9434.1642414294414623252
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 02:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=Lo5Rnroa;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from skn-laptop.hadsten (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id F2100E1D47;
	Mon, 17 Jan 2022 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1642414291; bh=hFjnhBY1WUS8klKCq5r7N6FaVVL9R4tCO2BDOazVlIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lo5RnroaQIISrs+Gd7m9UGSqixnvTUI3r0+xS1tNDYW1A0QRcy1Pbb/nsFq3wEUdk
	 QYVSTtCwQbltZoqBbVdwwKW6ujowGlJH8wvfJi4o7lJ5x8+erjO38qYnGMTldO6if4
	 DPUL42SUy5Cc4swmXq6rk+miS9BM94UoFNyYzRzeFcm+82JJJPjcWnWiTmR6fpNBZY
	 EXw15SMeXu53rNHeGgt8Vk+MJ+gW9gAsqiopVPLPguRPGqfQYsHc751wljGmDEjUW1
	 eXs6AAzsXvqJ/Znkw8JU6ArI1k1EqO7HVkRZRGA8lZQ80CCGt6dl2sLsALvT0njZJx
	 iwe8NgHEq57ug==
Date: Mon, 17 Jan 2022 11:11:29 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Kasper <kasper@krinvent.dk>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
Subject: Re: [oe] [meta-python][PATCH] python3-dacite: Add recipe
Message-ID: <20220117101129.qy3nyvr6qakeqxhb@skn-laptop.hadsten>
References: <20211221093822.10169-1-kasper@krinvent.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211221093822.10169-1-kasper@krinvent.dk>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 10:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94898

On Tue, Dec 21, 2021 at 10:38:22AM +0100, Kasper wrote:
> From: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
>=20
> Signed-off-by: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
> ---
>  .../python/python3-dacite_1.6.0.bb                | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-dacite_=
1.6.0.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-dacite_1.6.0.b=
b b/meta-python/recipes-devtools/python/python3-dacite_1.6.0.bb
> new file mode 100644
> index 000000000..8161370e1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dacite_1.6.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Simple creation of data classes from dictionaries."
> +HOMEPAGE =3D "https://github.com/konradhalas/dacite"
> +AUTHOR =3D "Konrad Ha=C5=82as <halas.konrad@gmail.com>"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D04d9af9bd5749a02eff535dac0=
b254d3"
> +
> +SRC_URI =3D "https://files.pythonhosted.org/packages/f9/bf/3f0912b4cfd=
861cd0fb7278c2b8d5bfb0c613ec1b7922e25e4115287b73a/dacite-1.6.0.tar.gz"
> +SRC_URI[md5sum] =3D "0a471b3df66e3923ce0ce544dc4ac66c"
> +SRC_URI[sha256sum] =3D "d48125ed0a0352d3de9f493bf980038088f45f3f9d7498=
f090b50a847daaa6df"
> +
> +S =3D "${WORKDIR}/dacite-1.6.0"
> +
> +RDEPENDS_${PN} =3D ""
> +
> +inherit setuptools3
> --=20
> 2.27.0
>=20

Hi Khem,

Did you have a look at this one?

/Sean

