Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 251BE6B25F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 13:27:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,772,1389740400"; d="scan'208";a="43655865"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 01 Apr 2014 15:27:50 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC22.usr.ingenico.loc ([10.31.4.222]) with mapi id
	14.02.0318.001; Tue, 1 Apr 2014 15:27:49 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] open-vcdiff: add new recipe for version 0.8.3
Thread-Index: AQHPTayYBTTSyK03jEGs1XiAwwFVPpr8wCwQ
Date: Tue, 1 Apr 2014 13:27:49 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B57550F94@COSNADEXC13.usr.ingenico.loc>
References: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1396358092-9738-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1396358092-9738-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [OE-core][PATCH v2] open-vcdiff: add new recipe for version 0.8.3
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
X-List-Received-Date: Tue, 01 Apr 2014 13:27:55 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

This discards and replaces the patch already in master-next:
http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D7720023d0e69215746753cb3dea2ec9e61408a15

Regards,
Matthieu


-----Message d'origine-----
De=A0: Matthieu CRAPET=20
Envoy=E9=A0: mardi 1 avril 2014 15:15
=C0=A0: openembedded-devel@lists.openembedded.org
Cc=A0: Matthieu CRAPET
Objet=A0: [OE-core][PATCH v2] open-vcdiff: add new recipe for version 0.8.3

From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>

This is Google's implementation of VCDIFF (RFC 3284) delta compression.
It's more flexible than Xdelta3 (as a developer point of view).

v2 patch:
State of bitbake world, Failed tasks 2014-03-29 reported a do_configure err=
or:

| aclocal: error: non-option arguments are not accepted: '\'.

configure.ac file is quite out of date. Submitted patch upstream:
http://code.google.com/p/open-vcdiff/issues/detail?id=3D43
Note: autoupdate could be considered later...

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../open-vcdiff/files/aclocal-amflags-fix.patch    | 33 ++++++++++++++++++=
++++
 .../open-vcdiff/open-vcdiff_0.8.3.bb               | 19 +++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vcdiff/files/aclocal-amfla=
gs-fix.patch
 create mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.b=
b

diff --git a/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.=
patch b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
new file mode 100644
index 0000000..cd1efd7
--- /dev/null
+++ b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patc
+++ h
@@ -0,0 +1,33 @@
+Fix this error:
+
+| aclocal: error: non-option arguments are not accepted: '\'.
+
+Starting from commit v1.11-662-g52246cc, when given non-option arguments, =
aclocal rejects them, instead of silently ignoring them.
+
+Declare ACLOCAL_AMFLAGS as a single line because autoreconf can't handle m=
ultiline.
+
+Notice that ACLOCAL_AMFLAGS is deprecated.
+In configure.ac, AC_CONFIG_MACRO_DIRS should be used (instead of AC_CONFIG=
_MACRO_DIR) but requires automake 1.13+.
+
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5c765c7..f4295a6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,7 @@
+ ## Process this file with automake to produce Makefile.in
+=20
+ # Make sure that when we re-make ./configure, we get the macros we=20
+need -ACLOCAL_AMFLAGS =3D -I m4 \
+-                  -I gflags/m4
++ACLOCAL_AMFLAGS =3D -I m4 -I gflags/m4
+=20
+ # This is so we can #include <google/vcencoder.h> or <gtest/gtest.h> =20
+AM_CPPFLAGS =3D -I$(top_srcdir)/src \
+--
+1.8.5.4
+
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb b/met=
a-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
new file mode 100644
index 0000000..c6af25d
--- /dev/null
+++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "An encoder/decoder for the VCDIFF (RFC3284) format"
+DESCRIPTION =3D "A library with a simple API is included, as well as a \
+               command-line executable that can apply the encoder and \
+               decoder to source, target, and delta files. \
+               A slight variation from the draft standard is defined \
+               to allow chunk-by-chunk decoding when only a partial \
+               delta file window is available."
+HOMEPAGE =3D "http://code.google.com/p/open-vcdiff/"
+SECTION =3D "console/utils"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2c8309843bc5297cfb4dc84f43f3cc=
c"
+
+SRC_URI =3D "http://open-vcdiff.googlecode.com/files/${BPN}-${PV}.tar.gz \
+           file://aclocal-amflags-fix.patch"
+SRC_URI[md5sum] =3D "5f848e4916b407879f55e0ca74c3f6af"
+SRC_URI[sha256sum] =3D "b7e47db78866082e9e8b5782f5491092c8414f0acc0440aea0=
3b14c7d1d3c371"
+
+inherit autotools
--
1.8.5.4


