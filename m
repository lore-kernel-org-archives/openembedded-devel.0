Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6D10861485
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:16:25 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so6001588eak.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8JakY0bzXycmevQ8lv+Cy3G3U7vFWvTaWMUaowi0lK8=;
	b=y7XdDkWObLY+Bv5jw+QTgRmeTDmKnOje2POWs8chYkcX3vuevEL/xPVyrHl1t6h5u8
	EOV7XuFJRThbU3OVQCEUOPTCRRtXGu5D/eUp1gVJUQUXBtrIntKNQQazdllMzNsCDzQW
	hiuQVP7RLF93ALHM2aIWASDCarKhM3qsPbvtDOyeXRetsDuhek8zUqaw40v7SZJC5bYN
	qRZR4JZLklQs6J86bTbgd3kEhrRMXPreWguLPMRonIFRQHQzV8CEqszEgrZ52TvzGDss
	zWh8VYql1N/qhrLaM4z5t81TEOUixIIBsEH6tziKc84nRLT8akhS45ViMdBOG4HRetgy
	amrA==
X-Received: by 10.14.110.194 with SMTP id u42mr23638198eeg.128.1372061785650; 
	Mon, 24 Jun 2013 01:16:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm26478082eeh.15.2013.06.24.01.16.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 01:16:24 -0700 (PDT)
Date: Mon, 24 Jun 2013 10:17:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130624081700.GL14021@jama>
References: <cover.1371984424.git.paul.eggleton@linux.intel.com>
	<df55c6cbc892939729f0713513dc8dba6f5b9751.1371984424.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <df55c6cbc892939729f0713513dc8dba6f5b9751.1371984424.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] pinpoint: fix and update
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
X-List-Received-Date: Mon, 24 Jun 2013 08:16:26 -0000
X-Groupsio-MsgNum: 45204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAzLNm1y1mIRgolD"
Content-Disposition: inline

--iAzLNm1y1mIRgolD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2013 at 11:49:00AM +0100, Paul Eggleton wrote:
> * Fix for update and PN change of clutter in OE-Core
> * Fix SRC_URI
> * Use +git instead of +gitr in PV

isn't version going backwards because of that? I think so, you should
bump PE if you really hate +gitr so much.

We still have more +gitr then +git:
OE @ ~/meta-openembedded $ git grep 'gitr${SRCPV}' | wc -l
24
OE @ ~/meta-openembedded $ git grep 'git${SRCPV}' | wc -l
21

> * Update to latest upstream git revision
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnom=
e/recipes-apps/pinpoint/pinpoint_git.bb
> index 4949570..7cb40c3 100644
> --- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
> +++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
> @@ -7,14 +7,14 @@ LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24 \
>                      file://pinpoint.c;beginline=3D6;endline=3D17;md5=3D2=
01d438283607da393fae6aca085454c"
> =20
> -DEPENDS =3D "gnome-common glib-2.0 gdk-pixbuf clutter-1.8 clutter-gst-1.=
8"
> +DEPENDS =3D "gnome-common glib-2.0 gdk-pixbuf clutter-1.0 clutter-gst-1.=
0"
> =20
>  inherit autotools gettext
> =20
> -SRC_URI =3D "git://git.gnome.org/browse/pinpoint;protocol=3Dhttp"
> +SRC_URI =3D "git://git.gnome.org/pinpoint"
> =20
> -SRCREV =3D "5b22660f5b247023ca409403f1c2cc834d8ce632"
> -PV =3D "0.1.4+gitr${SRCPV}"
> +SRCREV =3D "80a056c57e819d0b75035424638813b0670830e1"
> +PV =3D "0.1.4+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iAzLNm1y1mIRgolD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHIAHwACgkQN1Ujt2V2gBz1YgCfaUYAaYS0lpEohFeTCqdcoI9h
xZcAn28F4pYsri89bFvFkWOJTUIcajL/
=uMlr
-----END PGP SIGNATURE-----

--iAzLNm1y1mIRgolD--
