Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDdaH-0003d5-E9
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 17:22:22 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so469347pbc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yedkDGSZGh61Y3ctV8M35OUFxXVk0STA/2g1SX2pSdY=;
	b=G/HFSmwHco62EK+iGVRIZOdqo3MoJ9asULnYoz91ch8TzIvwgUaSPLQOfVoJmzj6Jt
	ymZByZWvODurB5XWg2CcMqaaE9SJLFdChkv/iFKRTGPIECxVjwMf3u74pEV6jr2zIeDF
	U14fbfPgU+tg9ElMcUIslutcB7HC/mbSwyCcf+1x+zgyd+4i0WVkYqTPKA/m/S4II0A8
	lEzSKZv1X+QlgtTDryIezAah7jc0Ypufeb41YRHoUitspYBd4jZvyJz3MqN+w9aI2g/K
	IER+ufF62Qr1AMLSZoy03j3yx0+xMjp1fDZ9hiP74SqFlQ3ZbmrZ/n4LLPvDwG+A3pkP
	Uzyg==
X-Received: by 10.68.136.138 with SMTP id qa10mr26219865pbb.20.1362672348363; 
	Thu, 07 Mar 2013 08:05:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm2132768pbc.20.2013.03.07.08.05.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 08:05:46 -0800 (PST)
Date: Thu, 7 Mar 2013 17:05:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Amy Fong <amy.fong@windriver.com>
Message-ID: <20130307160542.GR32228@jama.dyndns-home.com>
References: <20130213190804.GA11672@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130213190804.GA11672@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-selinux] policycoreutils dependency issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 16:22:23 -0000
X-Groupsio-MsgNum: 43445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3gk1bTGVZuaU9V5/"
Content-Disposition: inline

--3gk1bTGVZuaU9V5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2013 at 02:08:04PM -0500, Amy Fong wrote:
> policyutilutils: needs some dependencies unconditionally
>=20
> policycoreutils will fail to compile if selinux isn't in the DISTROFEATUR=
ES.
> We move these packages out of @target_selinux.
>=20
> Signed-off-by: Amy Fong <amy.fong@windriver.com>

Where is this meta-selinux layer?

I don't see it on
http://www.openembedded.org/wiki/LayerIndex

or policycoreutils.inc file in meta-oe repo or any layer I've checkouted
here.

Was this meant for openembedded-devel@lists.openembedded.org?

And BTW: use better syntax for PRINC to allow multiple .bbappends.. hmm
well you're having PRINC in .inc.. interesting.


> --
>=20
>  policycoreutils.inc |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-security/selinux/policycoreutils.inc b/recipes-secur=
ity/selinux/policycoreutils.inc
> index cc54b36..9869a83 100644
> --- a/recipes-security/selinux/policycoreutils.inc
> +++ b/recipes-security/selinux/policycoreutils.inc
> @@ -1,4 +1,4 @@
> -PRINC =3D "2"
> +PRINC =3D "3"
> =20
>  SUMMARY =3D "SELinux policy core utilities"
>  DESCRIPTION =3D "policycoreutils contains the policy core utilities that=
 are required \
> @@ -16,9 +16,10 @@ PAM_SRC_URI =3D "file://pam.d/newrole \
>                "
> =20
>  DEPENDS +=3D "libsepol libselinux libsemanage"
> +DEPENDS +=3D "libcap-ng libcgroup libpam"
> =20
>  inherit selinux
> -DEPENDS +=3D "${@target_selinux(d, 'libcap-ng libcgroup libpam audit')}"
> +DEPENDS +=3D "${@target_selinux(d, 'audit')}"
> =20
>  RDEPENDS_${BPN} +=3D "\
>  	libselinux-python \
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3gk1bTGVZuaU9V5/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4utYACgkQN1Ujt2V2gBx3mwCffyMN+niNqQciy278IXYwmqXy
b9UAn14gk7OnSXX9K110iiBz3m84qgk9
=JwOW
-----END PGP SIGNATURE-----

--3gk1bTGVZuaU9V5/--
