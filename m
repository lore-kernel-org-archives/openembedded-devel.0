Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6385E60EFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 14:58:11 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so893679eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qKF+adHfmS6KcHZpMlF/B6C73llVxUZcIzRH205uNuk=;
	b=IgP1RYBLonEPQ1uGr0n0z7vkXmRo8lC4GoAMtc008vjdgB59amX5jFMNRTiJPWSaWO
	b1HGL/IzfOlqDlhJSTSdhhbkzhmyPcgEUnqx51f+dVW+MrIMrHWiNo3W+TbJg3AH9o+a
	n01X6C/H4cXV5ya5ks8ApGWx1RcZjdirDKRq4ujmfestCW8+Acb1GZ4pd7k/XZcaOtY/
	o1huF/K/rBqMWs+LXtCmV3Z/dOJ1DvYLsvk2DRKir5AakrzxuHn3uetOGskaxLcV0IXA
	0g22NGnnSYoxz+NOJCRjO1OQ7X03RPJAiIoM0eakPe64h0t2BIni26xiDHJ8oMRnZDMV
	EQbg==
X-Received: by 10.15.52.195 with SMTP id p43mr18949332eew.72.1398265092173;
	Wed, 23 Apr 2014 07:58:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm6973278eep.14.2014.04.23.07.58.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Apr 2014 07:58:11 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Apr 2014 16:58:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140423145819.GJ2486@jama>
References: <1398258576-21567-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1398258576-21567-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] ntp : Convert libcap use from PACKAGECONFIG to hard DEPEND.
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
X-List-Received-Date: Wed, 23 Apr 2014 14:58:15 -0000
X-Groupsio-MsgNum: 49453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rRbIS5PUI9wLpAeF"
Content-Disposition: inline

--rRbIS5PUI9wLpAeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 06:09:36AM -0700, Philip Balister wrote:
> If ntp is built without libcap, it refuses to start with the following
> message:
>=20

Why don't you just add cap to default PACKAGECONFIG? someone can add
PACKAGECONFIG for clockctl later and use that instead of linuxcaps.

> Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- b=
uilt
> without --enable-clockctl or --enable-linuxcaps
> ntpd - NTP daemon program - Ver. 4.2.6p5
> USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=3D| }<val>] ]...
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 9c3e0d1..b8e9853 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -29,20 +29,21 @@ inherit autotools update-rc.d useradd systemd
> =20
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
> -EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv_=
header_readline_history_h=3Dno --with-binsubdir=3Dsbin"
> +EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv_=
header_readline_history_h=3Dno --with-binsubdir=3Dsbin --enable-linuxcaps"
>  CFLAGS_append =3D " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM_${PN} =3D "--system --home-dir /var/lib/ntp \
>                         --shell /bin/false --user-group ntp"
> =20
> +DEPEND =3D "libcap"
> +
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
>                            --with-openssl-incdir=3D${STAGING_INCDIR} \
>                            --with-crypto, \
>                            --without-openssl --without-crypto, \
>                            openssl"
> -PACKAGECONFIG[cap] =3D "--enable-linuxcaps,--disable-linuxcaps,libcap"
>  PACKAGECONFIG[readline] =3D "--with-lineeditlibs,--without-lineeditlibs,=
readline"
> =20
>  do_install_append() {
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rRbIS5PUI9wLpAeF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNX1QsACgkQN1Ujt2V2gByA1wCdHADbDIFxfEFanEThEJPcZoXf
my4An0EvRyf5TOUbEp2+xJPBK1e1GkNF
=DUNQ
-----END PGP SIGNATURE-----

--rRbIS5PUI9wLpAeF--
