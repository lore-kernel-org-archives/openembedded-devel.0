Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1AA72600
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 20:40:35 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y0yv5-0005ho-UP from Joe_MacDonald@mentor.com ;
	Tue, 16 Dec 2014 12:40:35 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 16 Dec 2014 12:40:30 -0800
Received: by burninator (Postfix, from userid 1000)	id C2D4D581DE4; Tue, 16
	Dec 2014 15:40:34 -0500 (EST)
Date: Tue, 16 Dec 2014 15:40:34 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Message-ID: <20141216204034.GM6113@mentor.com>
References: <1417600930-29201-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417600930-29201-1-git-send-email-sven.ebenfeld@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] stunnel: Update to Version 5.07
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
X-List-Received-Date: Tue, 16 Dec 2014 20:40:39 -0000
X-Groupsio-MsgNum: 53344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iKKZt69u2Wx/rspf"
Content-Disposition: inline

--iKKZt69u2Wx/rspf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sven,

Sorry about the slow response on this, I was completely offline last
week.

[[oe] [meta-networking][PATCH v2] stunnel: Update to Version 5.07] On 14.12=
=2E03 (Wed 11:02) Sven Ebenfeld wrote:

> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 17 -----------=
------
>  meta-networking/recipes-support/stunnel/stunnel_5.07.bb | 15 +++++++++++=
++++
>  2 files changed, 15 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.=
bb
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.07.=
bb
>=20
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_4.56.bb
> deleted file mode 100644
> index 74f2234..0000000
> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> -DESCRIPTION =3D "SSL encryption wrapper between remote client and local =
(inetd-startable) or remote server."
> -SECTION =3D "net"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4d6=
666"
> -DEPENDS =3D "openssl zlib tcp-wrappers"
> -
> -RDEPENDS_${PN} +=3D "perl"
> -
> -SRC_URI =3D "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
> -SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec=
8d2778a01c871293"
> -
> -inherit autotools
> -
> -EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fip=
s"
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.07.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_5.07.bb
> new file mode 100644
> index 0000000..70420bf
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "SSL encryption wrapper between remote client and local (ine=
td-startable) or remote server."

I don't mind this since it's quite short, but any particular reason for
dropping DESCRIPTION and turning the old one into SUMMARY?

> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D45e8e7befe9a0f7e0543b78dfeebd=
e20"
> +
> +DEPENDS =3D "openssl zlib tcp-wrappers"

Do we no longer need the RDEPENDS on perl?  It looks like the issue
Robert identified when he introduced it is still present:

% head ./tmp/work/core2-64-poky-linux/stunnel/5.07-r0/build/src/stunnel3
#!/usr/bin/perl
#
# stunnel3      Perl wrapper to use stunnel 3.x syntax in stunnel >=3D4.05
# Copyright (C) 2004-2012 Michal Trojnara <Michal.Trojnara@mirt.net>
# Version:      2.03
# Date:         2011.10.22

> +SRC_URI =3D "https://www.stunnel.org/downloads/${BP}.tar.gz"

It's better to keep the older SRC_URI format,
"https://www.stunnel.org/downloads/archive/5.x/${BP}.tar.gz", in this
case, as that's likely to survive.  Currently 5.07 has been replaced
with 5.08 due to a new CVE, so the download link is broken.

> +
> +SRC_URI[md5sum] =3D "c10edd84ecbc676a5a48c7e34ab3d1c5"
> +SRC_URI[sha256sum] =3D "505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac=
6ea417afe8065309"
> +
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_INCDIR}' --disable-fips"
--=20
-Joe MacDonald.
:wq

--iKKZt69u2Wx/rspf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUkJjCAAoJEEn8ffcsOfaW1TMH/12vi5z/Qcv/9mS0iJzqueuY
9L9kQGXUIhqVlFdwsY+TtEG/BQY8zq6TprBQbVXSKgL/h/+Txs26mX1Tkwh+xYjv
7NYIlCUFVhuoiA+Mp9Jjx57N/vDgmb6e3/VSxpUXMyB4j+7jFwxZWr8ovJxpSAvV
DapLc46Y/zPHjOAxQcgbnjyajK4HbE4NlTocJ9iPrV7r2YFRrv5T09vg8sCK5IIm
vNua3pQMNa05xcWFhpIueiwDFDhZ6iNsiDMD16Rny5mYNe+4BKv4AbFN0kDk3M1q
7Qo6dokI7l6bqBTmsRATevMvgbtf9VvCnh+8g/XZKkkngzURS94nkd7stTSLrto=
=c8/m
-----END PGP SIGNATURE-----

--iKKZt69u2Wx/rspf--
