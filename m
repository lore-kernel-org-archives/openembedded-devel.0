Return-Path: <Anders.Montonen@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013AFC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 08:39:09 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.24416.1640594346874517986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 00:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=wKK4TpPi;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.25, mailfrom: antime@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	 s=20161220; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=RVBTgIpB4JmrggZAtoP/cqz3wgjHb3J1I9zjWwbywY8=; b=wKK4TpPiZ+B7qAVQquc/RBS1pD
	OL1MohQzgMRvViWFDoB4jAToGV+uEDD9wf2dTkZ2XuBtsNZSPwaLpRQhv3hasSXMqH2UxZYRohHfM
	3j5Le94QMQa4jo2GWYKP+Ynqp4wkFFFHdFlAuEEdwRXaXV+Q+lsxkg/2z8WcqyhcrwnEuy54MDdOL
	/kZy3oD7RJdzS/fxnYxL7al1rG555L2R478SAriK1747n+Y2TptA52H6FCX3ALz8Kj2pD73HV0U1s
	sbboz1fhdNCDdQikUmENhU9hNvSTtxb8ajiJqyWcFO9ya+Xn7FfoR7EO2FXoUI1PMpUFPrDlx5Gsl
	7u6PXr5Q==;
Received: from 89-27-79-167.bb.dnainternet.fi ([89.27.79.167]
 helo=[192.168.1.137])
	by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <Anders.Montonen@iki.fi>)
	id 1n1lX5-0004NA-KH; Mon, 27 Dec 2021 10:39:03 +0200
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [oe] [meta-networking][PATCH 1/4] strongswan: provide
 PACKAGECONFIG for cureve25519
From: Anders Montonen <Anders.Montonen@iki.fi>
In-Reply-To: <20211227025025.1211176-1-akuster808@gmail.com>
Date: Mon, 27 Dec 2021 10:39:02 +0200
Cc: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD07CF53-4F41-48B0-BE6A-2BCAAF3CD96F@iki.fi>
References: <20211227025025.1211176-1-akuster808@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-SA-Exim-Connect-IP: 89.27.79.167
X-SA-Exim-Mail-From: Anders.Montonen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 08:39:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94505

Hi,

s/cureve25519/curve25519/g

-a

> On 27 Dec 2021, at 4:50, Armin Kuster <akuster808@gmail.com> wrote:
>=20
> Not everyone wants this to be installed by default. Enable to remove
> cureve25519 is someone wants to.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
> .../recipes-support/strongswan/strongswan_5.9.4.bb            | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git =
a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb =
b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> index 45500df01..a031c54f5 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> @@ -23,7 +23,7 @@ EXTRA_OECONF =3D " \
>=20
> EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'--with-systemdsystemunitdir=3D${systemd_unitdir}/system/', =
'--without-systemdsystemunitdir', d)}"
>=20
> -PACKAGECONFIG ?=3D "curl gmp openssl sqlite3 swanctl \
> +PACKAGECONFIG ?=3D "curl gmp openssl sqlite3 swanctl cureve25519\
>         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd-charon', 'charon', d)} \
> "
> PACKAGECONFIG[aesni] =3D =
"--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
> @@ -41,6 +41,7 @@ PACKAGECONFIG[soup] =3D =
"--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-sou
> PACKAGECONFIG[sqlite3] =3D =
"--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
> PACKAGECONFIG[stroke] =3D =
"--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
> PACKAGECONFIG[swanctl] =3D =
"--enable-swanctl,--disable-swanctl,,libgcc"
> +PACKAGECONFIG[cureve25519] =3D =
"--enable-curve25519,--disable-curve25519,, ${PN}-plugin-curve25519"
>=20
> # requires swanctl
> PACKAGECONFIG[systemd-charon] =3D =
"--enable-systemd,--disable-systemd,systemd,"
> @@ -130,7 +131,6 @@ RDEPENDS:${PN} +=3D "\
>     ${PN}-plugin-x509 \
>     ${PN}-plugin-xauth-generic \
>     ${PN}-plugin-xcbc \
> -    ${PN}-plugin-curve25519 \
>     "
>=20
> RPROVIDES:${PN} +=3D "${PN}-systemd"
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94500): =
https://lists.openembedded.org/g/openembedded-devel/message/94500
> Mute This Topic: https://lists.openembedded.org/mt/87972450/3618057
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Anders.Montonen@iki.fi]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


