Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 280FA6FC96
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 08:08:24 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so627762wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vFPj1oHPE0PDQu75FaaBQ/s4sn2m82r3HAQKxE5bsNU=;
	b=Xykb5MymY7ZV9FExc3l3Ece2a0WRElBGdm3XZAX9ldTA+LnmZkwVPEhi/YBvCwfrZb
	bSusIgU8BcraGAMhaI0RtCW2foC6kNLvWUjDxyyZe2dPAG2gFEqfa/w4UMwA483Fl9/x
	0Ewn8iLFY8TNp7GKp79bMAgtziZ28VCEiRvhh44o96iWuy6CGLAusRGPCW5zV9u6ynQZ
	rhrJ+9I6nJwU+RuYQxcDCn9/CBNBUoYEwd3qeXaeaDQYgC8ugu1lVA/duMxSJIH/FLas
	Zb64vcn1eudJnDDUnb8hQoj9Hs+tTdMc+QCHVrf5sifoM8V9DyQFgA5luLR8s9O5+ty6
	00Ng==
X-Received: by 10.195.18.8 with SMTP id gi8mr22544008wjd.75.1403078904094;
	Wed, 18 Jun 2014 01:08:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id w9sm3782205eev.4.2014.06.18.01.08.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jun 2014 01:08:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Jun 2014 10:08:23 +0200
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20140618080823.GG2117@jama>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jun 2014 08:08:31 -0000
X-Groupsio-MsgNum: 50386
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Content-Disposition: inline

--1giRMj6yz/+FOIRq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2014 at 09:44:09PM +0200, Steffen Sledz wrote:
> live.2013.04.30.tar.gz is no longer available at original live555 url
> and the url of the FreeBSD mirror has changed according to[1].
>=20
> [1] <http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/README.txt>

The same problem is in master branch, I'll cherry-pick it there first.

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  meta-oe/recipes-multimedia/live555/live555.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/rec=
ipes-multimedia/live555/live555.inc
> index a36177d..0c8208a 100644
> --- a/meta-oe/recipes-multimedia/live555/live555.inc
> +++ b/meta-oe/recipes-multimedia/live555/live555.inc
> @@ -7,13 +7,13 @@ HOMEPAGE =3D "http://live.com/"
>  LICENSE =3D "LGPLv3"
>  SECTION =3D "devel"
> =20
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
> =20
>  URLV =3D "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVa=
r('PV',1)[6:8]}"
>  SRC_URI =3D "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz=
 \
>             file://config.linux-cross"
>  # only latest live version stays on http://www.live555.com/liveMedia/pub=
lic/, add mirror for older
> -MIRRORS +=3D "http://www.live555.com/liveMedia/public/ http://ftp.freebs=
d.org/pub/FreeBSD/ports/distfiles/ \n"
> +MIRRORS +=3D "http://www.live555.com/liveMedia/public/ http://distcache.=
FreeBSD.org/ports-distfiles/ \n"
> =20
>  S =3D "${WORKDIR}/live"
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> --=20
> 1.9.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOhSPcACgkQN1Ujt2V2gBxgiQCfQ5Flg34NIxWeFnxUxvKQITzZ
GEMAmgMmzdGxPGP0qfa9wOlYQdGlivbj
=CIBO
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
