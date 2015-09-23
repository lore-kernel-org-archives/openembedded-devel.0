Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB23D76FE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:09:47 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so240371233wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nER4hFPM6NwzE0bt0lRUwfWPaxo3aqc9uoGaZXdcPTw=;
	b=YOj8puzsjWoSFwvu90CFWfmx03deRYOA5HkZeL8jhHpghVdopRV5Ti6ejBmNeJexo0
	cuwvJiV6isSMdtTr/oqOsoIk4UrOm8uIO5SYtPyy84rN45vFBJbc05wcZaOH+mdSAAMJ
	CS9Y1LE/knCcfYtj4E464vsnyJec2R80HQ2lA/JR+il1NJ2NPdOkiKbty2ncA2w/C0/8
	RX9bpqAtUg+1gtb3+HzpxGvgYNMctO4KWJVzPDxBp2G6NsCIgG3HIGmI5hJtpUq2wSUE
	AvDqqs1xx9AhCqF2yX6Bxf/15O9qZ7I36wQ1N/j58fcnisBZ4XIQColPL4eBCxfKAgDO
	PtkA==
X-Received: by 10.180.37.232 with SMTP id b8mr4539319wik.46.1443017388070;
	Wed, 23 Sep 2015 07:09:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cx3sm7459548wjc.27.2015.09.23.07.09.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 07:09:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2015 16:09:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150923140957.GG2384@jama>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
	<1442450491-14912-6-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1442450491-14912-6-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 05/19] cdrkit: initial add 1.1.11
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
X-List-Received-Date: Wed, 23 Sep 2015 14:09:48 -0000
X-Groupsio-MsgNum: 57519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline

--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 02:41:17AM +0200, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 18 ++++++++
>  ...te-a-run-test-to-determine-order-of-bitfi.patch | 53 ++++++++++++++++=
++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
>  create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-c=
reate-a-run-test-to-determine-order-of-bitfi.patch

I've skipped this one, please add PACKAGECONFIG/dependency on bzip2:

cdrkit-1.1.11: cdrkit rdepends on libbz2, but it isn't a build
dependency? [build-deps]

>=20
> diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe=
/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> new file mode 100644
> index 0000000..310a7b9
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "CD/DVD command line tools"
> +HOMEPAGE =3D "http://cdrkit.org/"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db30d3b2750b668133fc17b401e1b9=
8f8"
> +
> +# While writing download from cdrkit.org was broken so get sources from =
debian
> +SRC_URI =3D " \
> +    ${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
> +    file://0001-do-not-create-a-run-test-to-determine-order-of-bitfi.pat=
ch \
> +"
> +SRC_URI[md5sum] =3D "efe08e2f3ca478486037b053acd512e9"
> +SRC_URI[sha256sum] =3D "d1c030756ecc182defee9fe885638c1785d35a2c2a297b46=
04c0e0dcc78e47da"
> +
> +inherit cmake
> +
> +DEPENDS =3D "libcap file"
> +RDEPENDS_${PN} =3D "perl"
> diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a=
-run-test-to-determine-order-of-bitfi.patch b/meta-oe/recipes-multimedia/cd=
rkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch
> new file mode 100644
> index 0000000..c9725cb
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-te=
st-to-determine-order-of-bitfi.patch
> @@ -0,0 +1,53 @@
> +From a702cd1bb5eba5a05d1098862b5b863a3f6dd558 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Thu, 10 Sep 2015 09:39:13 +0200
> +Subject: [PATCH] do not create a run test to determine order of bitfields
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +taken from [1]
> +
> +Upstream-Status: Inappropriate [cross compile specific]
> +
> +[1] http://cgit.openembedded.org/openembedded/tree/recipes/cdrkit/cdrkit=
/xconfig.patch
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + include/CMakeLists.txt | 2 --
> + include/xconfig.h.in   | 6 +++++-
> + 2 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
> +index 99a69fd..e5ba8a7 100644
> +--- a/include/CMakeLists.txt
> ++++ b/include/CMakeLists.txt
> +@@ -35,8 +35,6 @@ endif(VA_LIST_IS_ARRAY)
> + INCLUDE(TestBigEndian)
> + TEST_BIG_ENDIAN(WORDS_BIGENDIAN)
> +=20
> +-TRY_RUN(BITFIELDS_HTOL TEST_DUMMY ${CMAKE_BINARY_DIR} ${CMAKE_CURRENT_S=
OURCE_DIR}/test_BITFIELDS_HTOL.c)
> +-
> + INCLUDE(CheckIncludeFiles)
> +=20
> + #SET(CMAKE_REQUIRED_INCLUDES "/usr/include;/usr/local/include")
> +diff --git a/include/xconfig.h.in b/include/xconfig.h.in
> +index c130600..476c00b 100644
> +--- a/include/xconfig.h.in
> ++++ b/include/xconfig.h.in
> +@@ -233,7 +233,11 @@
> + /* If using network byte order             */
> + #cmakedefine WORDS_BIGENDIAN
> + /* If high bits come first in structures   */
> +-#cmakedefine BITFIELDS_HTOL
> ++#ifdef WORDS_BIGENDIAN
> ++#define BITFIELDS_HTOL
> ++#else
> ++#define BITFIELDS_LTOH
> ++#endif
> + #define	HAVE_C_BIGENDIAN	/* Flag that WORDS_BIGENDIAN test was done */
> + #define	HAVE_C_BITFIELDS	/* Flag that BITFIELDS_HTOL test was done  */
> +=20
> +--=20
> +2.1.0
> +
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYCsrQACgkQN1Ujt2V2gByB8wCfYvPDvWEEwm6NT+Mm0bnBz0zr
PBQAoJ9ouwZpX3S/Lu5UQZPLqNvb6jTi
=6yej
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
