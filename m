Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US4qK-0005sV-Ko
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 14:18:37 +0200
Received: by mail-da0-f46.google.com with SMTP id y19so220119dan.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gTRV6kA8HvB/S+PU2pgPNOuunaETT6a00q94d74F39U=;
	b=rRonBRsyXGBGsB9gpvOR0bSQTvx3Dk8Y4K+kNqTEiwloZyE4VHP+XPdaERiuU7rwV0
	dz01W12PkED02UIOkuNjlpbgVavIkhftdTt07SnxjT2drQ3xEIVqAV5HTW4dyy4ktWfP
	n5UEKhe8MJej++g8RFQ72RXWtc74q3hzD+eUAZlqV5hwgccJ1/drMSdX6H8pczJvAtca
	2CSpkOchjxctAn2MzKc/ZcU6HlsV91IQqFGRaVPbDq3jYTcp7Bazo5uYWdVn1HT3BnFn
	pUEK9vkjnoUDLLN/aQDEyouJQuDwz2y1219JQH8Wlf2tUKnOuqxqEk0KiasYbCNFi+PL
	3HBQ==
X-Received: by 10.67.3.74 with SMTP id bu10mr3257836pad.146.1366113665407;
	Tue, 16 Apr 2013 05:01:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b3sm1871049pbw.4.2013.04.16.05.01.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 05:01:04 -0700 (PDT)
Date: Tue, 16 Apr 2013 14:01:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416120102.GK10628@jama.dyndns-home.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<f2ef961d7b4e3bf58116e1599a8902d2d6528123.1366109533.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <f2ef961d7b4e3bf58116e1599a8902d2d6528123.1366109533.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking, meta-oe][PATCH 3/9] openvpn: move to meta-networking and tweak
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
X-List-Received-Date: Tue, 16 Apr 2013 12:18:37 -0000
X-Groupsio-MsgNum: 44240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aziWXe2aaRGlkyg3"
Content-Disposition: inline

--aziWXe2aaRGlkyg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 11:53:57AM +0100, Paul Eggleton wrote:
> * Move SRC_URI checksums next to SRC_URI
> * Move packaging definitions to the end
> * Set SUMMARY instead of DESCRIPTION
> * Drop unused inc file
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../recipes-support}/openvpn/openvpn/openvpn       |    0
>  .../recipes-support}/openvpn/openvpn_2.1.3.bb      |    9 ++++----
>  meta-oe/recipes-connectivity/openvpn/openvpn.inc   |   22 --------------=
------

This assumes that there isn't any layer with different openvpn version
using openvpn.inc, but as we weren't using it I guess it's OK to remove
it. (it looks like I've accidentally included it commit importing
openvpn from OE-classic after merging .inc to .bb).

>  3 files changed, 5 insertions(+), 26 deletions(-)
>  rename {meta-oe/recipes-connectivity =3D> meta-networking/recipes-suppor=
t}/openvpn/openvpn/openvpn (100%)
>  rename {meta-oe/recipes-connectivity =3D> meta-networking/recipes-suppor=
t}/openvpn/openvpn_2.1.3.bb (92%)
>  delete mode 100644 meta-oe/recipes-connectivity/openvpn/openvpn.inc
>=20
> diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn/openvpn b/meta-=
networking/recipes-support/openvpn/openvpn/openvpn
> similarity index 100%
> rename from meta-oe/recipes-connectivity/openvpn/openvpn/openvpn
> rename to meta-networking/recipes-support/openvpn/openvpn/openvpn
> diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb b/meta=
-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> similarity index 92%
> rename from meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb
> rename to meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> index 594b266..f58756e 100644
> --- a/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
> @@ -1,16 +1,18 @@
> -DESCRIPTION =3D "A full-featured SSL VPN solution via tun device."
> +SUMMARY =3D "A full-featured SSL VPN solution via tun device."
>  HOMEPAGE =3D "http://openvpn.sourceforge.net"
>  SECTION =3D "console/network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5aac200199fde47501876cba7263c=
b0c"
>  DEPENDS =3D "lzo openssl"
> -RRECOMMENDS_${PN} =3D "kernel-module-tun"
> =20
>  inherit autotools
> =20
>  SRC_URI =3D "http://openvpn.net/release/openvpn-${PV}.tar.gz \
>             file://openvpn"
> =20
> +SRC_URI[md5sum] =3D "7486d3e270ba4b033e311d3e022a0ad7"
> +SRC_URI[sha256sum] =3D "5185181df2e6043bd667377bc92e36ea5a5bd7600af20965=
4f109b6403ca5b36"
> +
>  CFLAGS +=3D "-fno-inline"
> =20
>  # I want openvpn to be able to read password from file (hrw)
> @@ -22,5 +24,4 @@ do_install_append() {
>      install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
>  }
> =20
> -SRC_URI[md5sum] =3D "7486d3e270ba4b033e311d3e022a0ad7"
> -SRC_URI[sha256sum] =3D "5185181df2e6043bd667377bc92e36ea5a5bd7600af20965=
4f109b6403ca5b36"
> +RRECOMMENDS_${PN} =3D "kernel-module-tun"
> diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn.inc b/meta-oe/r=
ecipes-connectivity/openvpn/openvpn.inc
> deleted file mode 100644
> index 61f91a3..0000000
> --- a/meta-oe/recipes-connectivity/openvpn/openvpn.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION =3D "A full-featured SSL VPN solution via tun device."
> -HOMEPAGE =3D "http://openvpn.sourceforge.net"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPLv2"
> -DEPENDS =3D "lzo openssl"
> -RRECOMMENDS_${PN} =3D "kernel-module-tun"
> -
> -INC_PR =3D "r2"
> -
> -SRC_URI =3D "http://openvpn.net/release/openvpn-${PV}.tar.gz \
> -    file://openvpn"
> -S =3D "${WORKDIR}/openvpn-${PV}"
> -
> -CFLAGS +=3D "-fno-inline"
> -
> -inherit autotools
> -
> -do_install_append() {
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -d ${D}/${sysconfdir}/openvpn
> -    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
> -}
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aziWXe2aaRGlkyg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtPX4ACgkQN1Ujt2V2gBxcHQCfXNG97iP7i9yS+/pw0YWkRqL4
xzkAn0oTXFC91JNor+qxvJVlV+6EqoCG
=p2zs
-----END PGP SIGNATURE-----

--aziWXe2aaRGlkyg3--
