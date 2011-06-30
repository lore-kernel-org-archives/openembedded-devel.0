Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QcHqM-0002LV-OU
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 16:03:47 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p5UDvKYV000643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 08:57:20 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p5UDvKKg011349
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 08:57:20 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p5UDvKVg027978
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 08:57:20 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 30 Jun 2011 08:57:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jun 2011 08:57:19 -0500
Thread-Topic: [oe] [PATCH v3 1/1] am-benchmarks: Remove platform dependencies
Thread-Index: Acw3K14JwVHDqLRiT6CWtQ+GEfn1ZwAAiVgw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B4D8FFC@dlee06.ent.ti.com>
References: <1309441088-15753-1-git-send-email-j-lance1@ti.com>
In-Reply-To: <1309441088-15753-1-git-send-email-j-lance1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Lance, Jeff" <j-lance1@ti.com>
Subject: Re: [PATCH v3 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Thu, 30 Jun 2011 14:03:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Jeff Lance
> Sent: Thursday, June 30, 2011 8:38 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Lance, Jeff
> Subject: [oe] [PATCH v3 1/1] am-benchmarks: Remove platform
> dependencies
>=20
> * Remove platform dependencies and use architecture dependencies
> instead
> * Use OE BASE_PACKAGE_ARCH to determine architecture
> * Update the SRCREV to revision 66
> * Update the recipe revision to 1.3
> * Removed INSANE_SKIP
> NOTE - architecture dependency can be removed once CFLAGS can be passed
> into CCSv5 project makefile
>=20
> Signed-off-by: Jeff Lance <j-lance1@ti.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
> Update in version 3:
>   Fix "sed" commands to apply to all dhrystone projects
> ---
>  .../{am-benchmarks_1.2.bb =3D> am-benchmarks_1.3.bb} |   27 ++++++++++--
> -------
>  1 files changed, 14 insertions(+), 13 deletions(-)
>  copy recipes/ti/{am-benchmarks_1.2.bb =3D> am-benchmarks_1.3.bb} (61%)
>=20
> diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-
> benchmarks_1.3.bb
> similarity index 61%
> copy from recipes/ti/am-benchmarks_1.2.bb
> copy to recipes/ti/am-benchmarks_1.3.bb
> index 21e62a7..6070fe8 100644
> --- a/recipes/ti/am-benchmarks_1.2.bb
> +++ b/recipes/ti/am-benchmarks_1.3.bb
> @@ -8,30 +8,31 @@ LICENSE =3D "BSD"
>  SECTION =3D "system"
>  PRIORITY =3D "optional"
>=20
> -SRCREV =3D "61"
> +SRCREV =3D "66"
>  PR =3D "r2+svnr${SRCPV}"
>=20
> -COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x|ti814x)"
> -
> -ARCHITECTURE_dm365 =3D "arm9"
> -ARCHITECTURE_omapl138 =3D "arm9"
> -ARCHITECTURE_omap3 =3D "cortex-a8"
> -ARCHITECTURE_ti816x =3D "cortex-a8"
> -ARCHITECTURE_ti814x =3D "cortex-a8"
> -
> -INSANE_SKIP_${PN} =3D "True"
> -
>  SRC_URI =3D
> "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;user=
=3Da
> nonymous;pswd=3D''"
>=20
> -S =3D "${WORKDIR}/trunk/${ARCHITECTURE}"
> +S =3D "${WORKDIR}/trunk"
> +
> +do_configure() {
> +    # Find all the objects.mk files for the Release target
> +    files=3D`find ${BASE_PACKAGE_ARCH} -name "objects.mk" | grep
> Release`
> +    for f in $files
> +    do
> +        sed -i -e 's|LIBS :=3D|LIBS :=3D ${LDFLAGS} |' $f
> +    done
> +}
>=20
>  do_compile() {
>  	# don't build debug version
>  	touch debug
>  	export CROSS_COMPILE=3D${TARGET_PREFIX}
> -	make release
> +	export ARCH=3D${BASE_PACKAGE_ARCH}
> +	make release
>  }
>=20
>  do_install() {
> +	export ARCH=3D${BASE_PACKAGE_ARCH}
>  	make DESTDIR=3D${D} install
>  }
> --
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


