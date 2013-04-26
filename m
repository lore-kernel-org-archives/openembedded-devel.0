Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVdnw-0004FG-Pq
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 10:14:53 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz1so2363786pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=q0pRHGeSBPi+cxX4nsw7ww3Kwt5cor71NGjbeugZB3I=;
	b=YyGFx1VvdF099UQx2vjpst62XuSg32qS2x6LUyJ66LyrHsWd78XdNmI7ZLEGwWkI+x
	6uobWKWXklnXJoL1vc40T4rayf66bXVAdGupP9ghdcEASQa2QH0Hz+A7AevjBVyoR2Qm
	vU6Gxrr4JdJ/wgoH3q2VkI6z1r+ISIwFCUCJk/1qLs/6bWBSfOnJN3tUAAv3Jk41UQxF
	opZWcxxXupozJTnDoxZalp9K3CD29yy0asn0Nim6zgLfOMKUN8cZsp14e2d+rwqUrxMI
	eqVWnCWLoO1kDJazna77hAEcpWTi7CT/iG2Brfb/v72STt/s55e7MnRaY3h7BPmPHhNP
	rPlg==
X-Received: by 10.66.163.129 with SMTP id yi1mr12180132pab.93.1366963027655;
	Fri, 26 Apr 2013 00:57:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	xl10sm11688707pac.15.2013.04.26.00.57.04 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 00:57:06 -0700 (PDT)
Date: Fri, 26 Apr 2013 09:57:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130426075717.GK5538@jama.dyndns-home.com>
References: <1366946315-19589-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1366946315-19589-1-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Chunrong Guo <B40290@freescale.com>, B19537@freescale.com
Subject: Re: [OE-core][PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 08:14:53 -0000
X-Groupsio-MsgNum: 44429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4wkndigzIeYF6Hbg"
Content-Disposition: inline

--4wkndigzIeYF6Hbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2013 at 11:18:35AM +0800, Chunrong Guo wrote:
>     connman build for powerpc 64bit boards were producing errors like thi=
s:
>     | make[1]: *** [plugins/plugins_tist_la-tist.lo] Error 1
>     | make[1]: *** Waiting for unfinished jobs....
>     | make: *** [all] Error 2
>     | ERROR: oe_runmake failed

wrong ML, resend to oe-core ML

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index 589ece8..5389f3a 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,10 +20,11 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>              "
> =20
> -INC_PR =3D "r19"
> +INC_PR =3D "r20"
> =20
>  TIST =3D "--enable-tist"
>  TIST_powerpc =3D ""
> +TIST_powerpc64 =3D ""
> =20
>  EXTRA_OECONF +=3D "\
>      ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
> --=20
> 1.7.5.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4wkndigzIeYF6Hbg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6M10ACgkQN1Ujt2V2gBw1lgCdEEH1UbdH60PoQX6s5KPbbf31
bBMAn2eiP51gdhTDn1WjglQhh2jbfPjm
=AStK
-----END PGP SIGNATURE-----

--4wkndigzIeYF6Hbg--
