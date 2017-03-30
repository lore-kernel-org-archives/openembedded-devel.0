Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB8677C17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:45:19 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id l43so53391855wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=joMkhYwGcX1Ju9hTjwPbSBqTW6OXseRwVrTd7BO9Wj4=;
	b=mRkCJu45VSuMCadTu8pFkmqlIJ8MYb2g2ArGXKzkPOth1SRA6vaEp4HeUBEUTk66NR
	ggkTFFDCA1tmaMSxlR2phVXYLXWnUk8Flts+7fDfmy9dMVuFsZQVXHgMTeQGA3OlZeQ2
	fLz8TnnV5BHNc0ioPki6xB4EtaWObarP/FXxz8eV0p1I7VcR0hBU20/i7vUgN/AZFbMV
	JF8rETcBU/9+cZY/JjOnANKDc9JGCjNdOGe95y6SsMiUAiXc0IHzPZO+ADK1ohB035OU
	NU5cA/jr4MFv3mD7mirjtAaVQwaKO75L/QkjSqCjRm8CLDE8ibjNWDCbp01eWCjOz5bq
	nE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=joMkhYwGcX1Ju9hTjwPbSBqTW6OXseRwVrTd7BO9Wj4=;
	b=KWKdrT4XoEp9MU/C4/fZ565A3gYkhr3PpbG9BN6E4u1Z4uapCldoRTNoQeL95Y5/d3
	E7GnirOYCsp0I6yDuLcQL534rlUGHVqe47bBXLPFZ4/GyMU7qPZeX4OW0VVN+2DLM/sW
	fCKZQ4OpKANWciBCPvDm9jDGZD5g8NHYX7Mdabeuev2AA1X/P4rjdrn3pB8PUonbiBbq
	xafOm4aR0BmNu7UuZZk0M/Nvye1paexgeVIWSvKIrOOlXD6KEYKCYKfUf+L5vUM+UfCo
	o6+a3Uh8tt+SMtyOKTt8hp2t0pRENv9F2ui7JJCtkYveNCgOvjFt20ptWSvpAyLjGikW
	SvxQ==
X-Gm-Message-State: AFeK/H00eJPfAyxznyN5rFmzl/sfxQGjwsBjAcdLdr7gucGEjqiWpAZ74PNBrdIHarj7IA==
X-Received: by 10.28.102.87 with SMTP id a84mr2537230wmc.92.1490867120819;
	Thu, 30 Mar 2017 02:45:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o66sm2506414wmg.33.2017.03.30.02.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Mar 2017 02:45:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Mar 2017 11:45:19 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170330094519.GC3060@jama>
References: <20170320053152.29352-1-raj.khem@gmail.com>
	<20170320053152.29352-12-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170320053152.29352-12-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 12/16] picocom: Upgrade to 2.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 09:45:21 -0000
X-Groupsio-MsgNum: 65981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline

--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2017 at 10:31:48PM -0700, Khem Raj wrote:
> Package has moved to github
> License file got some cosmetic changes see
> https://github.com/npat-efault/picocom/commit/13fd331d410c2e8c39fa041bd54=
c3b0a93df64e1
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb | 22 +++++++++++++++++=
+++++

lcdproc doesn't belong here

>  meta-oe/recipes-support/picocom/picocom_1.7.bb    | 19 -----------------=
--
>  meta-oe/recipes-support/picocom/picocom_git.bb    | 23 +++++++++++++++++=
++++++
>  3 files changed, 45 insertions(+), 19 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb
>  delete mode 100644 meta-oe/recipes-support/picocom/picocom_1.7.bb
>  create mode 100644 meta-oe/recipes-support/picocom/picocom_git.bb
>=20
> diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb b/meta-oe/=
recipes-extended/lcdproc/lcdproc_0.5.7.bb
> new file mode 100644
> index 000000000..96fbd350b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb
> @@ -0,0 +1,22 @@
> +require lcdproc5.inc
> +SRC_URI[md5sum] =3D "2f8e064233ef1d03e98c0b426595750d"
> +SRC_URI[sha256sum] =3D "843007d377adc856529ed0c7c42c9a7563043f06b1b73add=
0372bba3a3029804"
> +
> +PACKAGECONFIG[g15] =3D ",,libg15 g15daemon libg15render,"
> +PACKAGECONFIG[hid] =3D "--enable-libhid,--disable-libhid,libhid"
> +PACKAGECONFIG[png] =3D "--enable-libpng,--disable-libpng,libpng"
> +
> +LCD_DRIVERS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'g15', '',=
 ',!g15', d)}"
> +
> +do_install_append () {
> +    # binaries
> +    install -D -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
> +
> +    # configuration files
> +    install -D -m 0644 ${S}/clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/l=
cdvc.conf
> +}
> +
> +PACKAGES =3D+ "lcdvc"
> +CONFFILES_lcdvc =3D "${sysconfdir}/lcdvc.conf"
> +FILES_lcdvc =3D "${sysconfdir}/lcdvc.conf ${sbindir}/lcdvc"
> +
> diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb b/meta-oe/rec=
ipes-support/picocom/picocom_1.7.bb
> deleted file mode 100644
> index d2a76c0a9..000000000
> --- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY =3D "Lightweight and minimal (~20K) dumb-terminal emulation prog=
ram"
> -SECTION =3D "console/utils"
> -LICENSE =3D "GPLv2+"
> -HOMEPAGE =3D "http://code.google.com/p/picocom/"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D393a5ca445f6965873eca0259=
a17f833"
> -
> -SRC_URI =3D "http://picocom.googlecode.com/files/picocom-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "8eaba1d31407e8408674d6e57af447ef"
> -SRC_URI[sha256sum] =3D "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a849355=
17002b3bc2c1129e"
> -
> -EXTRA_OEMAKE =3D "'CC=3D${CC}' 'LD=3D${LD}' 'VERSION=3D${PV}' \
> -		'CFLAGS=3D${CFLAGS}' 'LDFLAGS=3D${LDFLAGS}' "
> -
> -do_install () {
> -    install -d ${D}${bindir}
> -    install -m 0755 ${BPN} pcasc pcxm pcym pczm ${D}${bindir}/
> -}
> -
> diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/rec=
ipes-support/picocom/picocom_git.bb
> new file mode 100644
> index 000000000..e091094cf
> --- /dev/null
> +++ b/meta-oe/recipes-support/picocom/picocom_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Lightweight and minimal (~20K) dumb-terminal emulation prog=
ram"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2+"
> +HOMEPAGE =3D "http://code.google.com/p/picocom/"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3000e4830620e310fe65c0eb6=
9df9e8a"
> +
> +BASEPV =3D "2.2"
> +PV =3D "${BASEPV}+git${SRCPV}"
> +
> +SRCREV =3D "deffd18c24145bd6f965f44e735a50b65810ccdc"
> +
> +SRC_URI =3D "git://github.com/npat-efault/picocom"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'LD=3D${CC}' 'VERSION=3D${BASEPV}' \
> +		'CFLAGS=3D${CFLAGS}' 'LDFLAGS=3D${LDFLAGS}' "
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${BPN} pcasc pcxm pcym pczm ${D}${bindir}/
> +}
> +
> --=20
> 2.12.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNzTrgAKCRA3VSO3ZXaA
HLNkAJ91yLg7Onrv173fF+E+HXJRE5U2hQCeKzHQDStpoYSGwPRPC9U7yE8B8nE=
=RwBd
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
