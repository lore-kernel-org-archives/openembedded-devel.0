Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 17:11:51 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 24B7661123
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 17:11:51 +0000 (UTC)
IronPort-SDR: wyDa4ujASw9jqHS7HBwmyUSVkLiRWV1VPl4SOeJe0sUw2Ml/DUlxFNTeCDUZKS2wkNNudEEEai
	pEr6tiZUNaiRerYudsWzmjrKb5NgcsWhf0CUI7qKl/aSgxcXM4D/Dh3NTf/7vRMAQLek/tcfy1
	1NIzCopMSq6ejVHLutqkCFQbKnisr040yJ1qVp6GTTReVdpetBJ08g6vp05Xl9oExWVP/s9TXM
	16j9NZsQ0X4ZZNd8gtj6I2rbzRr/DeOKJBHKwzoawPJ4ZC2a9TFdoxkFJ0vr7fpZsRhFCWAXlW
	3o0=
X-IronPort-AV: E=Sophos;i="5.70,402,1574118000"; 
   d="scan'208";a="4918247"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Asmitha Karunanithi <asmithakarun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] Library to aid multi-part form data parsing
Thread-Index: AQHV2zyGlsK6bpIlPUapS6YhiJhlmqgLQZQA
Date: Tue, 4 Feb 2020 17:04:40 +0000
Message-ID: <9dec3ef6aecd46c0a01fe5524e1cc1aa@XBOX03.axis.com>
References: <20200204092126.19209-1-asmithakarun@gmail.com>
In-Reply-To: <20200204092126.19209-1-asmithakarun@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] Library to aid multi-part form data parsing
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
X-List-Received-Date: Tue, 04 Feb 2020 17:11:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Asmitha Karunanithi
> Sent: den 4 februari 2020 10:21
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] Library to aid multi-part form data parsin=
g

The commit subject should be prefixed by the name of the recipe, i.e.:

libmimetic: Add library to aid multi-part form data parsing

> From: asmitha <asmithakarun@gmail.com>
>=20
> Mimetic library helps parsing the multi-part form data. This library
> can be used for scenarios that includes multi-part form data file uploads
> to the BMC.

What is BMC?

> The patch file (config.patch) includes:
> i) addition of a compilation flag - "no-narrowing" since this has been
> treated as warning in earlier versions of c++ and now with the higher
> versions, this is treated as errors.
> ii) the test directory is removed as there were errors (relocation errors=
)
> since the shared object files of libc++ and libc were not taken from the
> sysroot path but from the system's library path where the required
> version of the .so is not present.
>=20
> Signed-off-by: asmitha <asmithakarun@gmail.com>
> ---
>  .../libmimetic/libmimetic/config.patch        | 25 +++++++++++++++++++
>  .../libmimetic/libmimetic_0.9.8.bb            | 19 ++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic/config.=
patch
>  create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.b=
b
>=20
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/config.patch b=
/meta-oe/recipes-support/libmimetic/libmimetic/config.patch

There should be an Upstream-Status in the patch. You might as well=20
regenerate the patch using git format-patch to keep a description=20
with the patch why it is needed.

> new file mode 100644
> index 000000000..52bf7b450
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic/config.patch
> @@ -0,0 +1,25 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index 634bd4c..c7cbae7 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,6 +1,6 @@
> + MAINTAINERCLEANFILES =3D Makefile Makefile.in config.cache
> + EXTRA_DIST=3DLICENSE m4
> +-SUBDIRS =3D mimetic doc examples test win32
> ++SUBDIRS =3D mimetic doc examples win32
> + INCLUDES=3D-I$(top_srcdir)
> + ACLOCAL_AMFLAGS=3D-I m4
> +
> +diff --git a/configure.in b/configure.in
> +index 5e8f3d4..af1018e 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -30,7 +30,7 @@ debug_enabled=3Dfalse
> + dnl CFLAGS and CXXFLAGS default to -O2 -g
> +
> + dnl CXXFLAGS=3D"$CXXFLAGS -DNDEBUG -fno-exceptions"
> +-CXXFLAGS=3D"$CXXFLAGS -DNDEBUG"
> ++CXXFLAGS=3D"$CXXFLAGS -DNDEBUG -Wno-narrowing"

Do this in the recipe instead. Just add:

CXXFLAGS +=3D "-Wno-narrowing"

at the end of the recipe.

> +
> + AC_ARG_ENABLE(debug,
> +   [  --enable-debug[=3DLEVEL]  enables debug symbols [default=3D2]],
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/met=
a-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> new file mode 100644
> index 000000000..a0a704188
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> @@ -0,0 +1,19 @@
> +# Released under the MIT license.
> +
> +SUMMARY =3D "Mimetic Library for multi-part parsing"
> +DESCRIPTION =3D "Email library (MIME) written in C++ designed to be easy=
 to use and integrate but yet fast and efficient."
> +AUTHOR =3D "Stefano Barbato <stefano@codesink.org>"
> +HOMEPAGE =3D "http://www.codesink.org/mimetic_mime_library.html"
> +BUGTRACKER =3D "https://github.com/LadislavSopko/mimetic/issues"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db49da7df0ca479ef01ff7f2d799ea=
bee"
> +
> +SRCREV =3D "50486af99b4f9b35522d7b3de40b6ce107505279"
> +SRC_URI +=3D "git://github.com/LadislavSopko/mimetic/ \
> +            file://config.patch \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> --
> 2.21.0

//Peter


