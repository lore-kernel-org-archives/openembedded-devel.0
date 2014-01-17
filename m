Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id BA1546204F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:32:46 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2169311eei.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 07:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KnVKHVUpCR1VlrwzeGT1YaCCTnGf9yT+EZPej92mPnY=;
	b=mIktxZunlMjbVkqS03yFMiwzB9bl1W/4nDU4zEqnYD9vDBRcqsdpXBevfq2lqDdTuW
	ozlQs/rDwOeQawU88fGc51XxCq1Z9ddY58pr3p4Oeb4ssBWqq+C5aSkEB6PL8fBwwJYi
	4KMd+9S43iM86fzmHC9LlGSKttUIKy2dJ8DIO0G3XuiLD1phuSTL2IhqppbyYIwhjIpT
	GpoO6pxpl4V75ekvabwFY4SARQxH27RoULw/HN83ZTA9V7jauFAFQiOwSPTopLm7f2Bd
	xf5iQwpoz+q2Rrv7eiXo6oleBk9CeY1w8GqNg6zuNDJy36f/HpeYWIDMPZWgd5zO1bab
	ua5Q==
X-Received: by 10.15.94.201 with SMTP id bb49mr3167067eeb.45.1389972767413;
	Fri, 17 Jan 2014 07:32:47 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	l41sm27758661eep.17.2014.01.17.07.32.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 07:32:46 -0800 (PST)
Date: Fri, 17 Jan 2014 16:33:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140117153310.GM3742@jama>
References: <1389970758-23207-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1389970758-23207-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qttools: add target build
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
X-List-Received-Date: Fri, 17 Jan 2014 15:32:48 -0000
X-Groupsio-MsgNum: 47801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MSd2ShuMixI0uVaZ"
Content-Disposition: inline

--MSd2ShuMixI0uVaZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 03:59:18PM +0100, Andreas M=FCller wrote:
> this does not build much yet but I was looking for qdbus

Do you want me to merge it now or should I wait a bit more? "build much"
means that it builds OK, but only some tools, right?
=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qttools.inc                         | 12 ++++++++
>  ...t-help-fix-linking-of-dependent-libraries.patch | 32 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qttools_5.2.0.bb                    |  5 ++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 recipes-qt/qt5/qttools.inc
>  create mode 100644 recipes-qt/qt5/qttools/0002-assistant-help-fix-linkin=
g-of-dependent-libraries.patch
>  create mode 100644 recipes-qt/qt5/qttools_5.2.0.bb
>=20
> diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
> new file mode 100644
> index 0000000..e96a678
> --- /dev/null
> +++ b/recipes-qt/qt5/qttools.inc
> @@ -0,0 +1,12 @@
> +DEPENDS +=3D "qtbase"
> +
> +QT_MODULE =3D "qttools"
> +
> +require qt5.inc
> +
> +SRC_URI +=3D " \
> +	file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
> +"
> +
> +FILES_${PN}-examples =3D "${datadir}/${QT_DIR_NAME}/examples"
> +
> diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-de=
pendent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-li=
nking-of-dependent-libraries.patch
> new file mode 100644
> index 0000000..0f95333
> --- /dev/null
> +++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent=
-libraries.patch
> @@ -0,0 +1,32 @@
> +From 26228d3ed02a4a244d01b3cc2bf3633f25797bb7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Fri, 17 Jan 2014 14:33:19 +0100
> +Subject: [PATCH] assistant/help: fix linking of dependent libraries
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +else we get:
> +| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not fo=
und (try using -rpath or -rpath-link)
> +| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'

This looks familiar, IIRC I was getting similar issues before disabling
other parts of qttools-native (as we were interested only in l* tools)

0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch

> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + src/assistant/help/help.pro | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
> +index ed75c37..a2c55c7 100644
> +--- a/src/assistant/help/help.pro
> ++++ b/src/assistant/help/help.pro
> +@@ -70,3 +70,5 @@ HEADERS +=3D qhelpenginecore.h \
> + # access to clucene
> + HEADERS +=3D qhelpsearchindexwriter_clucene_p.h \
> +     qhelpsearchindexreader_clucene_p.h
> ++
> ++LIBS +=3D -lQt5CLucene
> +--=20
> +1.8.3.1
> +
> diff --git a/recipes-qt/qt5/qttools_5.2.0.bb b/recipes-qt/qt5/qttools_5.2=
=2E0.bb
> new file mode 100644
> index 0000000..0effa1b
> --- /dev/null
> +++ b/recipes-qt/qt5/qttools_5.2.0.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "76a0992967b6d02220ecb69a5ba04ef1"
> +SRC_URI[sha256sum] =3D "ff331510ecb776b3059953e216e9fa7a4c0736eeb148c4cf=
11acc8150811b7f0"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MSd2ShuMixI0uVaZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLZTTYACgkQN1Ujt2V2gBwBMQCgsEqZxO1zMSd+gRbUFNNsrvi7
/jwAoIsN3DxsOQaFIADvJXEl30LK8rFA
=9xkW
-----END PGP SIGNATURE-----

--MSd2ShuMixI0uVaZ--
