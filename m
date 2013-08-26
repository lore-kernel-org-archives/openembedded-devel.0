Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id D07936A9E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:05:00 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so1382049eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 00:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i1kRywRy7UHDC8DdTrCEVz6snRBfLpi3A/yq3i6Ha5E=;
	b=TzxYQduoT28R2HGqSHFR3Rdxt3bqpuvIT60aLGnekoOk+YcjUwuG0ybdNrvSDHXp8q
	VQjOloMuuOLd/23RYo3Fn0d7/GkfSG3c0aAjD4Kxb5KyaFkgE6uogCh+0M/IkXeWJjlX
	h09Zu2+Uiju6uWpnjzcZLvBsfSzKrLzZabdUTgudfzRAIj4yRTpxKBzdTGNss9uxl5zk
	asNv7NcCYsFfsit84wUppbDOy7YYyavUam/qg0cO0a+bwVmVyjePryIacEsnN3AgQsZ+
	l41WNiMmZVF1JbeAJzDTsWRzqItjFEjk1Yy1FNpcchppewNAyFkeMVKP8wkXixpn19K/
	4t0A==
X-Received: by 10.14.8.72 with SMTP id 48mr23803339eeq.25.1377500700864;
	Mon, 26 Aug 2013 00:05:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm19064590eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 00:05:00 -0700 (PDT)
Date: Mon, 26 Aug 2013 09:06:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130826070610.GL3544@jama>
References: <1377487327-31367-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1377487327-31367-1-git-send-email-b40290@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 3/4] daq: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2013 07:05:01 -0000
X-Groupsio-MsgNum: 45839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Content-Disposition: inline

--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 11:22:07AM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
>   *The dump DAQ test the various inline mode features
>   *snort depends daq
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/recipes-connectivity/daq/daq_2.0.0.bb      |   17 ++++++++++++++=
+++
>  .../daq/files/disable-check-pcap-version.patch     |   11 +++++++++++
>  2 files changed, 28 insertions(+), 0 deletions(-)
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
> +
> +
> +inherit autotools
> +
> diff --git a/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-ve=
rsion.patch b/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-ver=
sion.patch
> new file mode 100644
> index 0000000..416ef65
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.p=
atch

Please add header explaining why this patch is needed.

> @@ -0,0 +1,11 @@
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

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIa/mIACgkQN1Ujt2V2gBy5tgCeIVf5Th5PkN05Sm9vb0pT1ueI
TLgAmweJ1lkH1xyqXu34ha3YJ/iEjL9x
=Cqoy
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--
