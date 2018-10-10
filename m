Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3E879870
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7EB18183A9;
	Wed, 10 Oct 2018 10:05:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id w0ZvVAWaJZBx; Wed, 10 Oct 2018 10:05:13 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id BB32F1834A;
	Wed, 10 Oct 2018 10:05:13 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93E941A084;
	Wed, 10 Oct 2018 10:05:13 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C651A081;
	Wed, 10 Oct 2018 10:05:13 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 10 Oct 2018 10:05:13 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 7CF0628F7;
	Wed, 10 Oct 2018 10:05:13 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 10 Oct 2018 10:05:13 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1365.000;
	Wed, 10 Oct 2018 10:05:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: James Feist <james.feist@linux.intel.com>
Thread-Topic: [oe] [meta-oe][PATCH] valijson: Add recipe
Thread-Index: AQHUYAyLdEA9T33u5kmxeNBEojUaDKUYG4gw
Date: Wed, 10 Oct 2018 08:05:13 +0000
Message-ID: <6ccd915131f249b5b197f18e3af0aa2b@XBOX02.axis.com>
References: <20181009201152.4057-1-james.feist@linux.intel.com>
In-Reply-To: <20181009201152.4057-1-james.feist@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] valijson: Add recipe
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
X-List-Received-Date: Wed, 10 Oct 2018 08:05:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of James Feist
> Sent: den 9 oktober 2018 22:12
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] valijson: Add recipe
>=20
> valijson is a header only c++ library for JSON
> schema validation.
>=20
> Signed-off-by: James Feist <james.feist@linux.intel.com>
> ---
>  .../recipes-devtools/valijson/valijson_git.bb | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb b/meta-oe/=
recipes-devtools/valijson/valijson_git.bb
> new file mode 100644
> index 000000000..bcceb6884
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/valijson/valijson_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Header-only C++ library for JSON Schema validation"
> +HOMEPAGE =3D "https://github.com/tristanpenman/valijson"
> +LICENSE =3D "BSD"

Change "BSD" to "BSD-2-Clause".

> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D015106c62262b2383f6c72063f099=
8f2"
> +
> +SRC_URI =3D "git://github.com/tristanpenman/valijson.git"
> +PV =3D "0.1+git${SRCPV}"
> +
> +SRCREV =3D "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DINSTALL_HEADERS=3D1 -DBUILD_TESTS=3D0"
> +
> +# valijson is a header only C++ library, so the main package will be emp=
ty.
> +

I suggest removing this empty line to make it more clear that=20
the comment above relates to the RDEPENDS line below.

> +RDEPENDS_${PN}-dev =3D ""
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +# valijson expects json.hpp where nlohmann-json_git.bb installs
> +# nlohmann/json.hpp, this allows usage via json.hpp
> +do_install_append() {
> +    ln -rs ${D}${includedir}/nlohmann/json.hpp ${D}${includedir}/json.hp=
p

Since the prefix is the same in both cases, you can avoid the -r=20
option by using:

    ln -s nlohmann/json.hpp ${D}${includedir}/json.hpp

> +}
> --
> 2.17.1

//Peter


