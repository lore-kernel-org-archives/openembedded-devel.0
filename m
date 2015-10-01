Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1C73E770A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:22:38 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so32454949wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s8XOePE+EEB57O+HZcJWS9WC6/jZafc343iKmF4pC7g=;
	b=xHHd3WpgWrEsSXpQ4hSvhhGwTvn1kmx0uj7/OIph7JrwvFupsLrbuDV+cG86RObuDe
	d7uPdmvmuGlYQz0Htnbuc3JZ90qNXklXxBVJdilgdBpW6NUuvHaXOq/hsntnb7p8iZtt
	8ncF/1VYM+fK9gngFwnG1NT5CC6kJMUv9GJtwic5iX30wjYzR1vK+FV56RTl0D24hb8x
	ySu82yoYBc4zCinnR0tKiVHaSy+SKn4yDdm8jsg1z8RMByltf2x7V6atdIDrXkpRIutr
	FaHmQkJMamPUkX2cLaEQyIk6CR0qQ4JLC734b+A+8xqZ6odvsKhsAbLLQ6xykAfgLR4m
	Zatw==
X-Received: by 10.180.101.138 with SMTP id fg10mr3807554wib.1.1443709358617;
	Thu, 01 Oct 2015 07:22:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nf15sm3433485wic.22.2015.10.01.07.22.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 07:22:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 Oct 2015 16:23:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151001142337.GB2403@jama>
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
	<1443708517-27056-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1443708517-27056-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V3] meta-oe: recipes-devtools: add libubox recipe
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
X-List-Received-Date: Thu, 01 Oct 2015 14:22:45 -0000
X-Groupsio-MsgNum: 57624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 05:08:37PM +0300, Ioan-Adrian Ratiu wrote:
> libubox contains C utility functions used by OpenWrt projects
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../libubox/libubox/0001-version-libraries.patch   | 28 ++++++++++++++++=
++++
>  meta-oe/recipes-devtools/libubox/libubox_git.bb    | 30 ++++++++++++++++=
++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/libubox/libubox/0001-version=
-libraries.patch
>  create mode 100644 meta-oe/recipes-devtools/libubox/libubox_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-version-librar=
ies.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries=
=2Epatch
> new file mode 100644
> index 0000000..02117fa
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.pat=
ch
> @@ -0,0 +1,28 @@
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 57804cf..1aa7f27 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -18,6 +18,7 @@ ENDIF()
> + SET(SOURCES avl.c avl-cmp.c blob.c blobmsg.c uloop.c usock.c ustream.c =
ustream-fd.c vlist.c utils.c safe_list.c runqueue.c md5.c kvlist.c ulog.c b=
ase64.c)
> +=20
> + ADD_LIBRARY(ubox SHARED ${SOURCES})
> ++SET_TARGET_PROPERTIES(ubox PROPERTIES VERSION 1.0.1 SOVERSION 1)
> + ADD_LIBRARY(ubox-static STATIC ${SOURCES})
> + SET_TARGET_PROPERTIES(ubox-static PROPERTIES OUTPUT_NAME ubox)
> +=20
> +@@ -46,6 +47,7 @@ find_library(json NAMES json-c)
> + IF(EXISTS ${json})
> + 	ADD_LIBRARY(blobmsg_json SHARED blobmsg_json.c)
> + 	TARGET_LINK_LIBRARIES(blobmsg_json ubox ${json})
> ++	SET_TARGET_PROPERTIES(blobmsg_json PROPERTIES VERSION 1.0.1 SOVERSION =
1)
> +=20
> + 	ADD_LIBRARY(blobmsg_json-static STATIC blobmsg_json.c)
> + 	SET_TARGET_PROPERTIES(blobmsg_json-static
> +@@ -55,6 +57,7 @@ IF(EXISTS ${json})
> + 	TARGET_LINK_LIBRARIES(jshn blobmsg_json ${json})
> +=20
> + 	ADD_LIBRARY(json_script SHARED json_script.c)
> ++	SET_TARGET_PROPERTIES(json_script PROPERTIES VERSION 1.0.1 SOVERSION 1)
> + 	TARGET_LINK_LIBRARIES(json_script ubox)
> +=20
> + 	INSTALL(TARGETS blobmsg_json blobmsg_json-static jshn json_script
> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/re=
cipes-devtools/libubox/libubox_git.bb
> new file mode 100644
> index 0000000..d16bbcf
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "C utility functions for OpenWrt"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "\
> +    file://avl.c;endline=3D39;md5=3D00810155fed3d604816ec5814523d60a \
> +    file://avl-cmp.c;endline=3D15;md5=3D1603e6094b432a5f3f320877a06f41b5=
 \
> +    file://base64.c;endline=3D61;md5=3D51fdff010d45b0086ac0a6e035693dc0 \
> +    file://blobmsg.c;endline=3D15;md5=3D7ed64c1570e8c9b46c4fc6fbd16c489e=
 \
> +    file://list.h;endline=3D28;md5=3D2d5f5475fbd0f08741354c5a99c2e983 \
> +    file://md5.h;endline=3D39;md5=3D048bf9f68963c207a0c2b3a94c9d2aaa \
> +    file://md5.c;endline=3D51;md5=3D0a448eea0bcbc89e3c7e6608f2d119a0 \
> +    file://usock.h;endline=3D18;md5=3Df0dfdc8de858e66d66d74036611bba14 \
> +"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"

This isn't needed, it's included in default FILESPATHS.

> +
> +SRC_URI =3D "\
> +    git://git.openwrt.org/project/libubox.git \
> +    file://0001-version-libraries.patch \
> +"
> +
> +SRCREV =3D "136a5196266d03d537f822c4e67d2fde2ed59505"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +DEPENDS =3D "json-c"
> +
> +EXTRA_OECMAKE =3D "-DBUILD_EXAMPLES=3DOFF -DBUILD_LUA=3DOFF"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYNQegACgkQN1Ujt2V2gBx/kACcCakkE8qk3DNVdhFuTQZjQ00U
1NAAoLvq00dOahe7DKhmunNxbqtSBk4K
=YJf3
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
