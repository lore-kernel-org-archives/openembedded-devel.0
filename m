Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 008256BE26
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:57:11 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3177258eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0rLNrEHeA0/3w3rof2NQ2qYN9DfgnsBr7VqeM7zBv9M=;
	b=RVCdWYLedQI7m9jvVSYEtztvfn8XP2PeEuq+GaTTBzVClD4CgsuqpBPM8pOFoRgUEJ
	iyOyt2K8Hqti0PM3JxVQkBZKtvRw2cb0IENF5DsUA1LPBKgBqHRHdd82rtJ0gzpYovpZ
	UoAlKfjOM0h3O+NDcCWGtPTczE065XmIY6bYzIOEM5qLnB0WmpcFA14AR/Ip5DCGrBI0
	bLfXjnxOIwdYoarIIo492IL16OEiiKx5jxOTvtjCD2jSMQ4aSdRlQynA9hgxrA0Xmhzb
	XYmJS/+WY9rcIzh1Q2y9akvvZdlkk2wv5tQcZISfGpzEdZkV6C6i9G9jM1oSUSYbYFRI
	YQIQ==
X-Received: by 10.14.209.133 with SMTP id s5mr236053eeo.104.1378231032202;
	Tue, 03 Sep 2013 10:57:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm33426268eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:57:11 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:58:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175830.GE3553@jama>
References: <1377268912-8340-1-git-send-email-eren@hambedded.org>
MIME-Version: 1.0
In-Reply-To: <1377268912-8340-1-git-send-email-eren@hambedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] omgps: add libcap dependency
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
X-List-Received-Date: Tue, 03 Sep 2013 17:57:12 -0000
X-Groupsio-MsgNum: 46048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline

--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 05:41:52PM +0300, Eren T=FCrkay wrote:
> http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082=
530.html
>=20
> Omgps links against libcap without checking the library. If it cannot
> find it as in the minimal build, it emits an error in the linking stage.
> Add the dependency explicitly.

Applied, thanks!

>=20
> Signed-off-by: Eren T=FCrkay <eren@hambedded.org>
> ---
>  meta-oe/recipes-navigation/omgps/omgps_svn.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/reci=
pes-navigation/omgps/omgps_svn.bb
> index 1a79df4..625377d 100644
> --- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
> +++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://omgps.googlecode.com"
>  SECTION =3D "openmoko/applications"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> -DEPENDS =3D "gtk+ python-pygobject dbus-glib"
> +DEPENDS =3D "gtk+ python-pygobject dbus-glib libcap"
>  SRCREV =3D "109"
>  PV =3D "0.1+svnr${SRCPV}"
>  PR =3D "r2"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImI0YACgkQN1Ujt2V2gBwW9wCff+xEN/AztZQHJiW9phcTq2fs
ZuAAnR0B56I12wX9J/m9QhVO8BEIS/fy
=Wp0W
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
