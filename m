Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E9F806A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:06:18 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Xroqp-0001rX-TZ from Joe_MacDonald@mentor.com ;
	Fri, 21 Nov 2014 06:06:19 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6;
	Fri, 21 Nov 2014 06:06:19 -0800
Received: by burninator (Postfix, from userid 1000)	id DC23158044A; Fri, 21
	Nov 2014 09:06:18 -0500 (EST)
Date: Fri, 21 Nov 2014 09:06:18 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Message-ID: <20141121140616.GB20204@mentor.com>
References: <20141119154912.GP3315@jama>
	<1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416556558-15428-2-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416556558-15428-2-git-send-email-qianl.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] UMIP: add new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 14:06:20 -0000
X-Groupsio-MsgNum: 52971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH v2 1/2] UMIP: add new recipe] On 14.11.21 (Fri 15:55) Qian Lei=
 wrote:

> UMIP is an open source implementation of Mobile IPv6 and NEMO Basic
> Support for Linux. It is released under the GPLv2 license. It supports
> the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776
> and RFC4877 (IPsec and IKEv2).

I think this recipe also probably belongs in meta-networking.  I'm
catching up on the merges today, so if there's no objection, I'll put it
there in the same place in the hierarchy.

-J.

>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/umip/umip_1.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/reci=
pes-connectivity/umip/umip_1.0.bb
> new file mode 100644
> index 0000000..76901ab
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Mobile IPv6 and NEMO for Linux"
> +DESCRIPTION =3D "UMIP is an open source implementation of Mobile IPv6 an=
d NEMO \
> +Basic Support for Linux. It is released under the GPLv2 license. It supp=
orts \
> +the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776 a=
nd \
> +RFC4877 (IPsec and IKEv2)."
> +HOMEPAGE =3D "http://umip.org/"
> +SECTION =3D "System Environment/Base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D073dc31ccb2ebed70db54f1e8aeb4=
c33"
> +DEPENDS =3D "rpm indent-native"
> +
> +SRC_URI =3D "git://git.umip.org/umip.git"
> +SRCREV =3D "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
> +
> +S =3D "${WORKDIR}/git"
> +EXTRA_OE_CONF =3D "--enable-vt"
> +
> +inherit autotools-brokensep
> --=20
> 1.8.3.1
>=20
--=20
-Joe MacDonald.
:wq

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUb0bYAAoJEEn8ffcsOfaWs6EIAJ0az2bSKIv46S0B2YvNp32X
c8M+SH5wEXTRG42LGQYID4PJNtcnXS92CXPFcdBwCtQ5OprfhrXUsQW4hP/kiIyv
OQM4fDrLlNrFCDikCv5yjke15X3xOajYppR0SgMXdeTYxN705bv2SubOgFf/7PRc
YAddcjQrKP7S6/CHkmez6sv1Xq3dw9KiIZRvfdBI3n2MP0VZdQCWdE3UY4ex050F
Km6ddzZU5TbJMbsRsJ51nQM0q+XgvRNfk9RIZcXfOAuGFhTpY9wTwDdFY3A9sZoa
x5+PNEQhAES0fOQStgdChgjzpPfOmepiY/FdsYWNp6mhzY4vXLBpdABWuVfzBEM=
=NUQo
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
