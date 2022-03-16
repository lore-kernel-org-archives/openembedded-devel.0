Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B6FC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 10:26:15 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.23412.1647426374336239861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 03:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a2iyrTLZ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C895100002
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647426372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jz4DMOTVGXJnEw0uTBARjJZmpTHYRsYFLVBRb3/L8ys=;
	b=a2iyrTLZkcAa3uYv4AbGr6UHm0hwulM2Q905IjNdff5bc4uARzfV5xHRmlVd90cTEKXJEc
	fo5FG2yE24OO+OU39K5CJQ/U04Sd72E6RmlPd81Xh6/lfq+pSIYNyWeiGfxudvAElPNg1g
	NBNifTnX5TjSVQNNFgkzp3kzq9wCRVFFqhbt3hT6xt+vaOGHclm2zqZa9F90l3hJdZ6ttV
	/98jaGXof1yp/Vh6lxqNCYIljekg/WyHjcghenrTEw9w2+anZsX7B9/oaO25fG7ePmU7hz
	ZM66dUuJsKol6n2FfE5x3p1XUzDvcZtyNUnwbu2BWnuay+6woPwTNAAjQeaBKQ==
Message-ID: <35860958917df2790158b57d17fd841fc178c936.camel@bootlin.com>
Subject: Re: [oe][meta-oe][honister][PATCH] breakpad: fix branch for gtest
 in SRC_URI
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2022 11:26:10 +0100
In-Reply-To: <20220209134023.1102164-1-thomas.perrot@bootlin.com>
References: <20220209134023.1102164-1-thomas.perrot@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-JahtM/S8gd97cBGhcDT/"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 10:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96021


--=-JahtM/S8gd97cBGhcDT/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This patch has been applied on the master branch, could it be
backported to all other branches still maintained?

Kind regards,
Thomas

On Wed, 2022-02-09 at 14:40 +0100, Thomas Perrot wrote:
> The commit 4fe018038f87 is in the main branch, so the do_fetch task
> failed.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> =C2=A0meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> index fabf59d4b29b..c752a100831f 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> @@ -29,7 +29,7 @@ SRCREV_lss =3D
> "fd00dbbd0c06a309c657d89e9430143b179ff6db"
> =C2=A0SRCREV_gyp =3D "324dd166b7c0b39d513026fa52d6280ac6d56770"
> =C2=A0
> =C2=A0SRC_URI =3D
> "git://github.com/google/breakpad;name=3Dbreakpad;branch=3Dmain;protocol=
=3D
> https \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> git://github.com/google/googletest.git;destsuffix=3Dgit/src/testing/gte
> st;name=3Dgtest;branch=3Dmaster;protocol=3Dhttps \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> git://github.com/google/googletest.git;destsuffix=3Dgit/src/testing/gte
> st;name=3Dgtest;branch=3Dmain;protocol=3Dhttps \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> git://github.com/protocolbuffers/protobuf.git;destsuffix=3Dgit/src/thir
> d_party/protobuf/protobuf;name=3Dprotobuf;branch=3Dmaster;protocol=3Dhttp=
s
> \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://=
chromium.googlesource.com/linux-syscall-
> support;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/src/third_party/l=
ss
> ;name=3Dlss \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> git://chromium.googlesource.com/external/gyp;protocol=3Dhttps;destsuffi
> x=3Dgit/src/tools/gyp;name=3Dgyp;branch=3Dmaster \

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-JahtM/S8gd97cBGhcDT/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmIxu0IACgkQn8ALBXH+
Cu20dwv+LfEvyX/0rljiz79qLZsfBOeDrlzwexFOnupnDE8ica9H3mdA9uRvLvC3
IJOvpJSqOi+tXcgIyC5XH+U1Q1Q+oBO9oTzbpy/KkKNGKEq+PMLjkya3qcbcg1xn
rMbLO6pmg9SRdoSD15YWxnzz/qsS0y/6tNmxpd97BQ6rN+DTuvj+m0IFqCUWY32p
uHIdm8cmDp29dxOUrIkDJj0iv8gHEwcEhCfBkXx03XezPLskUL0d8Qh/GGSZDLlA
5SKQeOQGln581DWn4HYyPEioiG5WcXJ7UEtomhaLvXuRAMfDHKgA73NNjyLSYHkf
pBGzAVKtNdHjnZPB8j3S5FzNBU5encV8kusHOX4p7rYUxrVCk6Icn2i6rfjdVEFr
XdlJW8CLure6KpuNlLr7SM79WbXupQAuuC5QAZdT7EERAF3WSo2Xabicm279efWl
HjpiB+aLGnHpJ5Rx2P0o2ygLAR+xnwR8LU/BmKZQM90qQ8W1Qw4w2ceznIoZzcFD
vC1pe2A7
=8P/E
-----END PGP SIGNATURE-----

--=-JahtM/S8gd97cBGhcDT/--

