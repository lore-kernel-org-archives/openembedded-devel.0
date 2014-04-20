Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8689E65DED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:47:19 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2952744eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aJHkI1T+86eheJJ/vDXHS5YDU/92uBHMoLX4Tc4uhyw=;
	b=F8ixShyfalf062/8qPgClF0J5HKTiZa6Uy+1kMK6P0AMxUGynHHoHWz+kYYAqztpfy
	BuV8J5ApKOUxfV8n52FZEIu+t6R97jktkHTIN0TVJIPbFfzW/0GOCqJsYWONsAEEZ0o6
	FW8EyKsxc/VDakSSxWW6sB86vKh9Bsmb5RyJUwlydJlPwU8WVen9BwVjaXFUmM/d76ne
	gCdvktpSaM4ERirJb1PO6UbMy8niEZUDba6sf2misjPKIRSC9bqmV87b5Qk4eF08UPc/
	9RdBDdUGxUftxSQq//thmaWFyuIm8tF74o4lKuWkbth3rMr3opWoVT+FFyvgSaoRodsT
	9sow==
X-Received: by 10.14.251.204 with SMTP id b52mr38068316ees.36.1397994439976;
	Sun, 20 Apr 2014 04:47:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm93954728eex.31.2014.04.20.04.47.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:47:18 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:47:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114724.GE2486@jama>
References: <1397539505-24157-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397539505-24157-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] eventlog: update version to 0.2.13
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
X-List-Received-Date: Sun, 20 Apr 2014 11:47:19 -0000
X-Groupsio-MsgNum: 49338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fu91DVUlTfSgBfJt"
Content-Disposition: inline

--Fu91DVUlTfSgBfJt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2014 at 01:25:05PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - Add DESCRIPTION
> - Change PN to BPN to fix multilib builds

Merged, thanks!

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../{eventlog_0.2.12.bb =3D> eventlog_0.2.13.bb}     |   16 ++++++++++++=
+---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/eventlog/{eventlog_0.2.12.bb =3D> eventlo=
g_0.2.13.bb} (16%)
>=20
> diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-o=
e/recipes-support/eventlog/eventlog_0.2.13.bb
> similarity index 16%
> rename from meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
> rename to meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
> index e31c194..349507d 100644
> --- a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
> +++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
> @@ -1,10 +1,20 @@
>  SUMMARY =3D "Replacement syslog API"
> +DESCRIPTION =3D "The EventLog library aims to be a replacement of the \
> +              simple syslog() API provided on UNIX systems. The \
> +              major difference between EventLog and syslog is that \
> +              EventLog tries to add structure to messages. EventLog \
> +              provides an interface to build, format and output an \
> +              event record. The exact format and output method can \
> +              be customized by the administrator via a configuration \
> +              file. his package is the runtime part of the library. \
> +"
> +
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db8ba8e77bcda9a53fac0fe39fe957=
767"
> =20
> -SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-ng/sources/3.=
2.2/source/${PN}_${PV}.tar.gz"
> +SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-ng/open-sourc=
e-edition/3.4.2/source/${BPN}_${PV}.tar.gz"
> =20
>  inherit autotools pkgconfig
> =20
> -SRC_URI[md5sum] =3D "f9c32814f78ea2629850f0440de5ff34"
> -SRC_URI[sha256sum] =3D "f78c218faa6b6b378f25c640a5d1188b1ecbd57d3a527432=
263fd44b17bbd1c9"
> +SRC_URI[md5sum] =3D "68ec8d1ea3b98fa35002bb756227c315"
> +SRC_URI[sha256sum] =3D "7cb4e6f316daede4fa54547371d5c986395177c12dbdec74=
a66298e684ac8b85"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fu91DVUlTfSgBfJt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs8wACgkQN1Ujt2V2gBwQvgCfaxoejZC4b23ao8taAO3J5BOP
CjYAni0uEA+Es1f8haEJYqCTrc4R4aOR
=NWre
-----END PGP SIGNATURE-----

--Fu91DVUlTfSgBfJt--
