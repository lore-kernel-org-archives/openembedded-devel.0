Return-Path: <joe@deserted.net>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id D2895616F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:28:56 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so913283eaj.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GTagQQOLyFeUUSFmuY/ILHCXzcDRFUDeNWn7SflO59M=;
	b=eC6B3dXapET5eZfdaVho4qzh6bfugh3vaCDt+5EXITQpaXoxJbdZuo6Y/2CB0+7hG9
	5wMjDPE3gABPx6dD+GbqJ4KbVZcBGbnpuPw+9KQaMQuPll+2Fvg/XepuFJjqMpK6qfDR
	qTguhXMgEBZi4OmLYhuvmqg08MsotVRGgdlswp/17b3lOPIFLglTHV7EQvp/eHJOMwRB
	Tp+rwoZZaT1ezatc0fLK3AXDrs4C4aBoaBQDDv6+FBlIO4tLqxOJO9YEO/3gkDhgpo2M
	qSafM7dkzmkIZ/Pmvgt3gO3lEmPhM2rnbKgw1IrhaUlZRf1a0AHSLJ8x2ISWgJ5Ogxb2
	IAmA==
X-Gm-Message-State: ALoCoQmTUb7mKRb7OEAWb4N3Ar0gDpL3bPNhj4SAPBDdOuFL2o+0+tkQ1NjytSEoYumEzapnZLEy
X-Received: by 10.14.99.193 with SMTP id x41mr4295582eef.52.1378387738154;
	Thu, 05 Sep 2013 06:28:58 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id t6sm48689244eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:28:57 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:28:53 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905132851.GM5086@deserted.net>
References: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] quagga: two fixes
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
X-List-Received-Date: Thu, 05 Sep 2013 13:28:58 -0000
X-Groupsio-MsgNum: 46103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n1iI6MeELQa9IOaF"
Content-Disposition: inline

--n1iI6MeELQa9IOaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [PATCH meta-networking] quagga: two fixes] On 13.08.16 (Fri 10:23) ro=
ngqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> 1. quagga should depend on iproute2, since ip from busybox is not suffici=
ent
> 2. fix a typOS(should chmod, not chown)
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga.inc |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index f5489c6..89b9f7a 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -5,7 +5,7 @@ Unix platforms, particularly FreeBSD, Linux, Solaris and =
NetBSD. \
>  Quagga is a fork of GNU Zebra which was developed by Kunihiro \
>  Ishiguro. The Quagga tree aims to build a more involved community \
>  around Quagga than the current centralised model of GNU Zebra."
> -HOMEPAGE =3D "http://www.quagga.net/"
> +HOMEPAGE =3D "http://www.nongnu.org/quagga/"
>  SECTION =3D "network"
>  LICENSE =3D "GPL-2.0 & LGPL-2.0"
>  DEPENDS =3D "readline ncurses perl-native"
> @@ -17,6 +17,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b \
> =20
>  INC_PR =3D "r2"
> =20
> +# the "ip" command from busybox is not sufficient (flush by protocol flu=
shes all routes)
> +RDEPENDS_${PN} +=3D "iproute2"
> +
>  QUAGGASUBDIR =3D ""
>  # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
>  # versions and leave it empty for recent versions.
> @@ -128,11 +131,11 @@ pkg_postinst_${PN} () {
>      if [ "x$D" !=3D "x" ] ; then
>          exit 1
>      fi
> -    for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch =
${sysconfdir}/quagga/$f.conf; done
> +    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do =
touch ${sysconfdir}/quagga/$f.conf; done
>      chown quagga:quaggavty ${sysconfdir}/quagga
>      chown quagga:quagga ${sysconfdir}/quagga/*.conf
>      chmod 750 ${sysconfdir}/quagga
> -    chown 640 ${sysconfdir}/quagga/*.conf
> +    chmod 640 ${sysconfdir}/quagga/*.conf
>      if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>          ${sysconfdir}/init.d/populate-volatile.sh update
>      fi
--=20
-Joe MacDonald.
:wq

--n1iI6MeELQa9IOaF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIohxMACgkQwFvcllog0XzqXwCglvVT+9vc4yFSlchw3amTvsd7
BPIAnAtD5ge9IN3rFy1+oS0wSMsfcywD
=rwuM
-----END PGP SIGNATURE-----

--n1iI6MeELQa9IOaF--
