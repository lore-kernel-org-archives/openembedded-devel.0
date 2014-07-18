Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 467137069E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:34:38 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so1293933wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6r/UcaImwBjCU1xazb4nYP+T+s8cnqRb7+yRQs3nNjA=;
	b=Tn8uUHiY+4Pp+SqPE2qzrFGpZGzkkWEeCZ7XWTVSQjDP8Vfmx8Ma97NxfA1mEfkqb2
	siPXardFLZoWCcstcZjctltLPGb7MYE9YZ19omzgUJNpoUqdn7ZcsOUli54DTr0rDnkB
	5vuBJXqmRigz/HC8U7zDcq9iiWRY5eX36BiKGQz/8dcceaOLhlkK1TFr2z9r2HLz3goJ
	2n8fawXO6/Zj/UEFXtFFqwPvm7G6Icz1JNZSnR6tbf69ru2FkxcJP3czFDwgMX/wTFaJ
	HE6AdH5/uFgm64YDybPpjgL0YrBD7l9or33ozCx3VE3JmQ7cogs2Ag4myQDkQw7PGVl4
	iyYA==
X-Received: by 10.180.210.132 with SMTP id mu4mr10138618wic.18.1405708479639; 
	Fri, 18 Jul 2014 11:34:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei3sm9378937wib.13.2014.07.18.11.34.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:34:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 20:34:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140718183450.GS2433@jama>
References: <1405697872-23392-1-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <1405697872-23392-1-git-send-email-ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] openvpn: update and enable iproute2 support
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
X-List-Received-Date: Fri, 18 Jul 2014 18:34:40 -0000
X-Groupsio-MsgNum: 51095
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4yjA7FEVET1dX9yT"
Content-Disposition: inline

--4yjA7FEVET1dX9yT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 10:37:52AM -0500, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>=20
> - Added .bb for version 2.3.4.
> - The download URL was broken; it's changed to reflect where the website
>   points to.
> - Force use of iproute2, which is generally recommended when running
>   OpenVPN as an unprivileged user. Ref:
>   http://community.openvpn.net/openvpn/wiki/UnprivilegedUser
> - Explicitly add libpam to DEPENDS if pam is enabled, and disable the
>   auth-pam plugin if pam is not enabled.

Fails to build on host without "ip"

| checking git checkout... no
| configure: error: ip utility is required but missing
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed
| WARNING: /OE/build/shr-core/tmp-eglibc/work/i586-oe-linux/openvpn/2.3.4-r=
0/temp/run.do_configure.15551:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at /OE/build/sh=
r-core/tmp-eglibc/work/i586-oe-linux/openvpn/2.3.4-r0/temp/log.do_configure=
=2E15551)
NOTE: recipe openvpn-2.3.4-r0: task do_configure: Failed
ERROR: Task 3911 (/OE/build/shr-core/meta-openembedded/meta-networking/reci=
pes-support/openvpn/openvpn_2.3.4.bb, do_configure) failed with exit code '=
1'


When resending with fix, please use -M

>=20
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  .../recipes-support/openvpn/openvpn_2.1.3.bb       | 27 ----------------=
---
>  .../recipes-support/openvpn/openvpn_2.3.4.bb       | 30 ++++++++++++++++=
++++++
>  2 files changed, 30 insertions(+), 27 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/openvpn/openvpn_2.1.3=
=2Ebb
>  create mode 100644 meta-networking/recipes-support/openvpn/openvpn_2.3.4=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> deleted file mode 100644
> index 9ef0fbf..0000000
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY =3D "A full-featured SSL VPN solution via tun device"
> -HOMEPAGE =3D "http://openvpn.sourceforge.net"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5aac200199fde47501876cba7263c=
b0c"
> -DEPENDS =3D "lzo openssl"
> -
> -inherit autotools
> -
> -SRC_URI =3D "http://openvpn.net/release/openvpn-${PV}.tar.gz \
> -           file://openvpn"
> -
> -SRC_URI[md5sum] =3D "7486d3e270ba4b033e311d3e022a0ad7"
> -SRC_URI[sha256sum] =3D "5185181df2e6043bd667377bc92e36ea5a5bd7600af20965=
4f109b6403ca5b36"
> -
> -CFLAGS +=3D "-fno-inline"
> -
> -# I want openvpn to be able to read password from file (hrw)
> -EXTRA_OECONF +=3D "--enable-password-save"
> -
> -do_install_append() {
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -d ${D}/${sysconfdir}/openvpn
> -    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
> -}
> -
> -RRECOMMENDS_${PN} =3D "kernel-module-tun"
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> new file mode 100644
> index 0000000..282befe
> --- /dev/null
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "A full-featured SSL VPN solution via tun device."
> +HOMEPAGE =3D "http://openvpn.sourceforge.net"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5aac200199fde47501876cba7263c=
b0c"
> +DEPENDS =3D "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'p=
am', 'libpam', '', d)}"
> +
> +inherit autotools
> +
> +SRC_URI =3D "http://swupdate.openvpn.org/community/releases/openvpn-${PV=
}.tar.gz \
> +           file://openvpn"
> +
> +SRC_URI[md5sum] =3D "04d47237907faabe9d046970ffe44b2e"
> +SRC_URI[sha256sum] =3D "af506d5f48568fa8d2f2435cb3fad35f9a9a8f263999ea6d=
f3ba296960cec85a"
> +
> +CFLAGS +=3D "-fno-inline"
> +
> +# I want openvpn to be able to read password from file (hrw)
> +EXTRA_OECONF +=3D "--enable-password-save --enable-iproute2"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'pam', '', '--dis=
able-plugin-auth-pam', d)}"
> +
> +do_install_append() {
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -d ${D}/${sysconfdir}/openvpn
> +    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
> +}
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-tun"
> +
> +FILES_${PN}-dbg +=3D "/usr/lib/openvpn/plugins/.debug"
> --=20
> 2.0.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4yjA7FEVET1dX9yT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPJaMoACgkQN1Ujt2V2gBzz6ACfX9v9FDnrdKdRbaTfRAg50h1Y
IBcAn1i8IbEecuNKeudq3HpwohYT5IuJ
=JDaX
-----END PGP SIGNATURE-----

--4yjA7FEVET1dX9yT--
