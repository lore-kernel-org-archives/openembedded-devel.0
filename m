Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id CC407710C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:29:43 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so834786wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gJEr5J69HEpWud3uO5Q9y49bqGn22wa3l7WaffKXffw=;
	b=KrE2wnNq2azS0ryXC/31mXwWsbitRyUNHGPEqp14o4WYGHQzXjKd1gc8E16SpsMeog
	/7Vn17P5dT0NAGoYv2xpOFtDOzad+BULIh1XDEnaTvqxGi7NJRFc8tnMoU5wm6z/BTo6
	+PR5yiYqUF4fzXuC/qzJTma26IUY0LvvGaJklekwB5/ifWXJNSuV42wOq+HiTeMrRSp3
	VrWg+ZMn4VDf/J2ICehVL96nnyoEhq3mLCuGeoZ2WRalo+0O9hzX+adA751CYIStj62Q
	cMeJGyly17T2zoP9q9H81R7mFBbXc+BGmY/qtsKex/f0lqb6ehN83x1y3axngUpZL8k8
	YniA==
X-Received: by 10.194.118.201 with SMTP id ko9mr5669518wjb.26.1409236181121;
	Thu, 28 Aug 2014 07:29:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au4sm10417712wjc.15.2014.08.28.07.29.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 07:29:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 16:29:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828142950.GE16066@jama>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
	<1409227581-20888-5-git-send-email-pab@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <1409227581-20888-5-git-send-email-pab@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 4/5] gpsd: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 14:29:47 -0000
X-Groupsio-MsgNum: 51899
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline

--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 07:06:20AM -0500, Peter A. Bigot wrote:
> gpsd by default builds with PPS (pulse-per-second) support, but without
> kernel support to capture the edge of the pulse the accuracy is only
> +/-5us.  Under Linux the pps-tools package installs the header required
> for the user-level API to the RFC 2783 KPPS interface.  If gpsd detects
> this header, it will use the API to improve accuracy to +/-1us.
>=20
> See: http://www.catb.org/gpsd/gpsd-time-service-howto.html#_enabling_pps
>=20
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.10.bb
> index d12c7a8..1c2d9eb 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> @@ -20,6 +20,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz=
 \
>  SRC_URI[md5sum] =3D "fc5b03aae38b9b5b6880b31924d0ace3"
>  SRC_URI[sha256sum] =3D "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec40=
7dcbf2f70b854320"
> =20
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[kpps] =3D ",,pps-tools"

Both recipes need some way of explicit disable of pps-tools, so that the
result is the same when building gpsd or ntp before or after pps-tools.

>  inherit scons update-rc.d python-dir pythonnative systemd
> =20
>  INITSCRIPT_NAME =3D "gpsd"
> --=20
> 1.8.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP/PN4ACgkQN1Ujt2V2gBy+qACeIxPWyFxbdPa9K+SdCOgM0fLU
F9AAnR78DySuh5KNe2whX+fzxb7ACEkR
=CquV
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
