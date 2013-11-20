Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id C50A66D610
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:38:50 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so4049346eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W6AWbjNAFfQY9+MWWti1KDsqoYMkEc9O3BB1/eos+ww=;
	b=vEgk6lPe2AJKjAX01mayHPHy1YbXb0JhxYZze0KryY/YtGUrffPb8TETvIRR/98Zud
	3ytkKUGD4TNuI6Vc8rqALrQihPEv1PXF1D2ZstBFOOrYIAKSfZCiW91S1HfencecFyR4
	G0snGSI2pgYoB+f/o8KKsY0I3n3ItNdo3ufKClVD+W5GSImwmaFjkFGc1VAezWOdfRuK
	rWoqzJGATYKNsvKbxJm+7epiUAYeJ4oHvafm44iK+cUtQuIeqhwINnA9mzPsQAjVzBZU
	ab6U0C3K1RpMH4S/r5djtyLH9MBWVp46zwvGfrjFB600IUFj08ufkZlgKTMbqYDCeAyx
	q6Xg==
X-Received: by 10.14.251.196 with SMTP id b44mr2185405ees.10.1384965532140;
	Wed, 20 Nov 2013 08:38:52 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm61728169eeh.8.2013.11.20.08.38.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:38:51 -0800 (PST)
Date: Wed, 20 Nov 2013 17:38:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131120163854.GR3708@jama>
References: <1384888696-21678-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
MIME-Version: 1.0
In-Reply-To: <1384888696-21678-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] python-tornado: Updated to version 3.1.1
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
X-List-Received-Date: Wed, 20 Nov 2013 16:38:51 -0000
X-Groupsio-MsgNum: 47210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o99acAvKqrTZeiCU"
Content-Disposition: inline

--o99acAvKqrTZeiCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 07:18:16PM +0000, Dan McDougall wrote:
> The sole patch for this package is no longer necessary and has been
> removed.

Also doesn't apply, meta-oe has 2.2.1 for few months already

commit 14102819f4d748eeb4df43f9e07d369fab3f5e26
Author:     Koen Kooi <koen@dominion.thruhere.net>
AuthorDate: Fri Apr 12 10:04:43 2013 +0000
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Apr 15 16:16:52 2013 +0200

    python-tornado: update to top of 2.2 branch


>=20
> Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> ---
>  .../0001-disable-AI_ADDRCONFIG-flag.patch          | 32 ----------------=
------
>  .../recipes-devtools/python/python-tornado_git.bb  |  9 +++---
>  2 files changed, 4 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-tornado/0001-d=
isable-AI_ADDRCONFIG-flag.patch
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-=
AI_ADDRCONFIG-flag.patch b/meta-oe/recipes-devtools/python/python-tornado/0=
001-disable-AI_ADDRCONFIG-flag.patch
> deleted file mode 100644
> index 3c3ec7c..0000000
> --- a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDR=
CONFIG-flag.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From d7fb0a6ef3f3cbdfc1f21f5a67d54fa9d2c1e183 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Wed, 2 Nov 2011 11:07:24 +0100
> -Subject: [PATCH] disable AI_ADDRCONFIG flag
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> -
> -Upstream-status: unknown
> ----
> - tornado/netutil.py |    6 ------
> - 1 files changed, 0 insertions(+), 6 deletions(-)
> -
> -diff --git a/tornado/netutil.py b/tornado/netutil.py
> -index cfff0ba..c181f24 100644
> ---- a/tornado/netutil.py
> -+++ b/tornado/netutil.py
> -@@ -238,12 +238,6 @@ def bind_sockets(port, address=3DNone, family=3Dsoc=
ket.AF_UNSPEC, backlog=3D128):
> -     if address =3D=3D "":
> -         address =3D None
> -     flags =3D socket.AI_PASSIVE
> --    if hasattr(socket, "AI_ADDRCONFIG"):
> --        # AI_ADDRCONFIG ensures that we only try to bind on ipv6
> --        # if the system is configured for it, but the flag doesn't
> --        # exist on some platforms (specifically WinXP, although
> --        # newer versions of windows have it)
> --        flags |=3D socket.AI_ADDRCONFIG
> -     for res in set(socket.getaddrinfo(address, port, family, socket.SOC=
K_STREAM,
> -                                   0, flags):
> -         af, socktype, proto, canonname, sockaddr =3D res
> ---=20
> -1.7.2.5
> -
> diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta=
-oe/recipes-devtools/python/python-tornado_git.bb
> index 82a94e6..e51ce3c 100644
> --- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
> +++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
> @@ -1,12 +1,11 @@
>  DESCRIPTION =3D "Tornado is an open source version of the scalable, non-=
blocking web server and tools that power FriendFeed."
>  LICENSE =3D "Apache"
> -LIC_FILES_CHKSUM =3D "file://README;md5=3De7fb9954003d7cd93322ccf282210d=
1c"
> +LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Db34308b7b58b086690bf3d59ea=
9f3b28"
> =20
> -PV =3D "2.2"
> +PV =3D "3.1.1"
>  PR =3D "r1"
> -SRCREV =3D "c501917eba46dec30b1f2ef12497dffc4beec505"
> -SRC_URI =3D "git://github.com/facebook/tornado.git;branch=3Dbranch2.2 \
> -           file://0001-disable-AI_ADDRCONFIG-flag.patch \
> +SRCREV =3D "495c94f6329e457bc5678e4aa38c228f8e93a4c8"
> +SRC_URI =3D "git://github.com/facebook/tornado.git;branch=3Dbranch3.1 \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o99acAvKqrTZeiCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKM5Z4ACgkQN1Ujt2V2gByWLACfQTgSxrr5m3wldy998cgr62mf
QUYAn3SEzKodZ/g2CQgj2xOVCLEkoTYV
=v4P7
-----END PGP SIGNATURE-----

--o99acAvKqrTZeiCU--
