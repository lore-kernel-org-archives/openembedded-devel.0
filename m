Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 87EC76BD4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 05:38:44 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so3332231eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 22:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZRIifkU/A10iWIx8i2Li+Df2yByQ/ooLb3DM3jZgVn4=;
	b=LrSOW60Qfazx9AsSSFJj9bbLowNrFtxfaBpJ5bVNj2wiwIAlIzda39aM5ufwRARLoX
	rRtyn7LujX1fhArZe+Dvh4aQP+Ih2Nf9TLtj/9zs/Tgw3w1hafWf6OQHcqvALma1Pgel
	zaykCzZLn7pwYZVP/Ji/ewaq0p1brr4bOW3WyMAxlCYsxAhw6r0s69Drkj+5O6XT1aHP
	5zZx6CffXIvOg+qj+3tfrke1i++9kWmgzFn/sf0NhiekQ/NrGdqsmQCEHPSLF+h6vD3/
	zaECgTrnhew9j7YfnqnRim9MvlWU671lIxHNAdInsE5tTkn18pf++q0HN/DBR1QPnKVq
	lgYQ==
X-Received: by 10.14.115.133 with SMTP id e5mr2226566eeh.27.1377754724613;
	Wed, 28 Aug 2013 22:38:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm42961869eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 22:38:44 -0700 (PDT)
Date: Thu, 29 Aug 2013 07:39:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130829053956.GL3544@jama>
References: <1377503059-30534-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1377503059-30534-1-git-send-email-b40290@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2 ] daq: add recipe
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
X-List-Received-Date: Thu, 29 Aug 2013 05:38:45 -0000
X-Groupsio-MsgNum: 45888
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrl7g2KojMNQ8tYq"
Content-Disposition: inline

--lrl7g2KojMNQ8tYq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 03:44:19PM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
>    *The dump DAQ test the various inline mode features
>    *snort depends daq
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/recipes-connectivity/daq/daq_2.0.0.bb      |   17 ++++++++++++++=
+++
>  .../daq/files/disable-check-pcap-version.patch     |   19 ++++++++++++++=
+++++
>  2 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.0.bb
>  create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-check-=
pcap-version.patch
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.0.bb b/meta-oe/reci=
pes-connectivity/daq/daq_2.0.0.bb
> new file mode 100644
> index 0000000..0a71894
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "The dump DAQ test the various inline mode features "
> +HOMEPAGE =3D "http://www.snort.org"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21c4=
0e0"
> +
> +
> +DEPENDS =3D "libpcap libpcre "
> +
> +SRC_URI[md5sum] =3D "a00855a153647df76d47f1ea454f74ae"
> +SRC_URI[sha256sum] =3D "fbafc8e362a96fcadc69731f91203ef90845507aae0a4774=
d5c2825e9d2c1c38"
> +
> +SRC_URI =3D "http://fossies.org/linux/misc/daq-2.0.0.tar.gz\
> +           file://disable-check-pcap-version.patch "

Fails to fetch:

ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://fossies.org/linux/misc/daq-2.0.0.tar.gz:
2013-08-28 19:37:00 ERROR 410: Gone.

> +
> +
> +inherit autotools
> +
> diff --git a/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-ve=
rsion.patch b/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-ver=
sion.patch
> new file mode 100644
> index 0000000..05f4031
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.p=
atch
> @@ -0,0 +1,19 @@
> +Upstream-Status:Inappropriate [embedded specific]
> +
> +fix the below error:
> +checking for libpcap version >=3D "1.0.0"... configure
> +configure: error: cannot run test program while cross compiling
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +--- a/configure.ac	2013-08-22 02:37:02.453253534 -0500
> ++++ b/configure.ac	2013-08-22 02:37:53.008254362 -0500
> +@@ -179,7 +179,7 @@
> +               [enable_pcap_module=3D"$enableval"], [enable_pcap_module=
=3D"$DEFAULT_ENABLE"])
> + if test "$enable_pcap_module" =3D yes; then
> +     AC_CHECK_HEADER([pcap.h], [], [enable_pcap_module=3Dno])
> +-    AC_CHECK_PCAP_VER("1.0.0")
> ++    #AC_CHECK_PCAP_VER("1.0.0")
> +     if test "$enable_pcap_module" =3D yes; then
> +         STATIC_LIBS=3D"${STATIC_LIBS} -lpcap"
> +     fi
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrl7g2KojMNQ8tYq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIe3qwACgkQN1Ujt2V2gBy/LQCfSp1FYEdSgMy4vnwwTL6KB8bX
+BcAnjuQa/8j9bOgd9wgYJ5iBb9q/Vv1
=vCw+
-----END PGP SIGNATURE-----

--lrl7g2KojMNQ8tYq--
