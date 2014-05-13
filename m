Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id F28AC60196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:08:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,1042,1389740400"; d="scan'208";a="51109523"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 13 May 2014 10:08:19 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.100]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.02.0328.009; Tue, 13 May 2014 10:08:19 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/7] bdftopcf: add recipe
Thread-Index: AQHPbg77cYufVzidO0y3w87b7Cagsps+KG5A
Date: Tue, 13 May 2014 08:08:18 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA112C7DD@COSNADEXC13.usr.ingenico.loc>
References: <cover.1399914295.git.ben.shelton@ni.com>
	<139978ea7125a5ffb15a583faef889b1409e3987.1399914295.git.ben.shelton@ni.com>
In-Reply-To: <139978ea7125a5ffb15a583faef889b1409e3987.1399914295.git.ben.shelton@ni.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/7] bdftopcf: add recipe
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
X-List-Received-Date: Tue, 13 May 2014 08:08:24 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Did you reused this recipe:
https://www.mail-archive.com/openembedded-devel%40lists.openembedded.org/ms=
g35721.html
If so, you could give some credits to the original author.

Regards,
M

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Ben Shelton
Envoy=E9=A0: lundi 12 mai 2014 19:32
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: [oe] [meta-oe][PATCH 1/7] bdftopcf: add recipe

The bdftopcf tool is necessary to build the core X fonts, which ship in BDF=
 format.  Adapted from a recipe in OE-Classic and from an earlier mailing l=
ist post by Trevor Woerner.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-oe/=
recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
new file mode 100644
index 0000000..5009d54
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY =3D "bdftopcf is a tool to convert BDF fonts to PCF fonts"
+HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
+SECTION =3D "x11/app"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9a35333adf75edd1eaef84bca65a49=
0"
+DEPENDS =3D "libxfont"
+
+SRC_URI[md5sum] =3D "96a648a332160a7482885800f7a506fa"
+SRC_URI[sha256sum] =3D "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb3e=
16946e5ffd2798"
+
+BBCLASSEXTEND =3D "native"
--
1.9.3

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

