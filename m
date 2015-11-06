Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1E64F60124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:04:58 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so32611678wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hpMS88Rfm/+035x7yiOM3pFbJ1HVKKCR8F8i3cu5nPI=;
	b=RB3rHPgCZ6c+8BZAwYfMQ9v2QIl8gW87go4byHR6qGLBA3nqkMaDPsQQ1oGzpQYln4
	NtrbTwCLGrpMmr4n/+h64ckfLngYiHbNzIpTVDHpPGZNtJugny2QonWzyGlg8QyFlre4
	W9wPwdspK1hGvN5PIF9PmmhzF5EDI9wztkzldGHoQ5PmyTQa9gCoFtZvyWVDUL0krYWB
	u1LCWvj9rXoSgIzV24xotqNWiDjMsEzsTFq4wnIbhhfXzLCmBdjIkQNl7ncCRxALeAVX
	knYtOCNiG60DkEYjTICzFJ5djmGm+UnnaMc1f0rc+lG8CKeMu9dDwF5InNef7CCoawFE
	pVsw==
X-Received: by 10.194.76.9 with SMTP id g9mr15786926wjw.47.1446829498519;
	Fri, 06 Nov 2015 09:04:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l186sm3902502wmg.19.2015.11.06.09.04.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 09:04:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 18:05:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151106170516.GD2550@jama>
References: <1446630396-14149-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1446630396-14149-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] libsmi: add configure file
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
X-List-Received-Date: Fri, 06 Nov 2015 17:04:59 -0000
X-Groupsio-MsgNum: 58385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline

--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2015 at 05:46:36PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Add configure file duplicated from file smi.conf-example in source code
> and replace paths with mibs files directories.
>=20
> Then set libsmi-mibs as runtime recommend package to provide mibs files.
>=20
> Add homepage and update SRC_URI as well.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/libsmi/libsmi/smi.conf | 48 ++++++++++++++++++++=
++++++
>  meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb | 12 ++++++-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/libsmi/libsmi/smi.conf
>=20
> diff --git a/meta-oe/recipes-support/libsmi/libsmi/smi.conf b/meta-oe/rec=
ipes-support/libsmi/libsmi/smi.conf
> new file mode 100644
> index 0000000..7e4da86
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsmi/libsmi/smi.conf
> @@ -0,0 +1,48 @@
> +#
> +# smi.conf - Global/User SMI configuration file. (EXAMPLE)
> +#
> +# Copyright (c) 2000 Frank Strauss, Technical University of Braunschweig.
> +#
> +# See the file "COPYING" for information on usage and redistribution
> +# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
> +#
> +# @(#) $Id: smi.conf-example 1134 2001-06-11 09:59:13Z strauss $
> +#
> +#
> +# See smi_config(3) for detailed information on configuration files.
> +#
> +
> +# Extend (note the semicolon) the libsmi default module search path.
> +path :/usr/share/mibs/iana
> +path :/usr/share/mibs/ietf
> +path :/usr/share/mibs/irtf
> +path :/usr/share/mibs/tubs
> +
> +# EXPERIMENTAL: Add a caching method (works only on UNIX systems).
> +# NOTE: the cache directory must exist and permissions must be
> +# handled appropriately. A simple but insecure way is to apply
> +# a tmp flag to the directory (chmod 1777 /usr/local/share/mibs/cache).
> +#cache /usr/local/share/mibs/cache /usr/local/bin/smicache -d /usr/local=
/share/mibs/cache -p http://www.ibr.cs.tu-bs.de/projects/libsmi/smicache/
> +
> +# Don't show any errors by default.
> +level 0
> +
> +# Preload some basic SMIv2 modules.
> +load SNMPv2-SMI
> +load SNMPv2-TC
> +load SNMPv2-CONF
> +
> +# Make smilint shout loud to report all errors and warnings.
> +smilint: level 9
> +
> +# But please don't claim about any names longer than 32 chars.
> +# (note: this is the prefix of errors `namelength-32-module,
> +#  -type, -object, -enumeration, and -bit)
> +smilint: hide namelength-32
> +
> +# Preloading some more modules for special applications.
> +tcpdump: load DISMAN-SCRIPT-MIB
> +tcpdump: load IF-MIB
> +
> +smiquery: load IF-MIB
> +
> diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb b/meta-oe/rec=
ipes-support/libsmi/libsmi_0.4.8.bb
> index 2b036f9..e1af636 100644
> --- a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
> +++ b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
> @@ -1,16 +1,26 @@
>  SUMMARY =3D "A Library to Access SMI MIB Information"
> +HOMEPAGE =3D "https://www.ibr.cs.tu-bs.de/projects/libsmi"
> =20
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3ad3076f9332343a21636cfd351f0=
5b7"
> =20
> -SRC_URI =3D "ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/${BP}.tar.gz"
> +SRC_URI =3D "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.=
tar.gz \
> +           file://smi.conf \

4 spaces

> +          "

Closing quote should be first character.

> =20
>  SRC_URI[md5sum] =3D "760b6b1070738158708649ed2c63425e"
>  SRC_URI[sha256sum] =3D "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaa=
a87c462f49d74849"
> =20
>  inherit autotools
> =20
> +do_install_append () {
> +	install -d ${D}${sysconfdir}
> +	install -m 0644 ${WORKDIR}/smi.conf ${D}${sysconfdir}/smi.conf

Sane layers are using consistent indentation with 4 spaces.

I've fixed this when cherry-picking to master.

> +}
> +
>  PACKAGES +=3D "${PN}-mibs ${PN}-pibs"
> =20
>  FILES_${PN}-mibs +=3D "${datadir}/mibs"
>  FILES_${PN}-pibs +=3D "${datadir}/pibs"
> +
> +RRECOMMENDS_${PN} =3D "${BPN}-mibs"
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY83csACgkQN1Ujt2V2gByNCgCfQJ+inCUQUdRnuiLsckt2A5UN
XsAAoKU8kteHuVKIwYBVQxXJ2N/LpH82
=bMvl
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
