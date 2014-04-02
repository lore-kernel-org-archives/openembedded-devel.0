Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 88F6F6F9FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:29:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,780,1389740400"; d="scan'208";a="43723630"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 02 Apr 2014 14:29:13 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.02.0328.009; Wed, 2 Apr 2014 14:29:13 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] zsh: upgrade to 5.0.5
Thread-Index: AQHPTm526XnBKQC950+lfFqrnTXxJZr+QS0Q
Date: Wed, 2 Apr 2014 12:29:12 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B575517A5@COSNADEXC13.usr.ingenico.loc>
References: <1396441282-19534-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1396441282-19534-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] zsh: upgrade to 5.0.5
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
X-List-Received-Date: Wed, 02 Apr 2014 12:29:16 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Forget this one, I screwed with content-type.

Content-Type: text/plain; charset=3Dy
Instead of
Content-Type: text/plain; charset=3DUTF-8

Matt


-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Matthieu Crapet
Envoy=E9=A0: mercredi 2 avril 2014 14:21
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: [oe] [meta-oe][PATCH] zsh: upgrade to 5.0.5

Recipe cleanup:
- Add missing license in meta-oe/licenses
- Add DESCRIPTION
- Use ${BP} and ${SOURCEFORGE_MIRROR}

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/licenses/zsh                      | 37 +++++++++++++++++++++++++++=
++++
 meta-oe/recipes-extended/zsh/zsh.inc      | 14 +++++++-----
 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb |  5 -----  meta-oe/recipes-exte=
nded/zsh/zsh_5.0.5.bb |  5 +++++
 4 files changed, 50 insertions(+), 11 deletions(-)  create mode 100644 met=
a-oe/licenses/zsh  delete mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.=
0.bb
 create mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb

diff --git a/meta-oe/licenses/zsh b/meta-oe/licenses/zsh new file mode 1006=
44 index 0000000..1fb1fc4
--- /dev/null
+++ b/meta-oe/licenses/zsh
@@ -0,0 +1,37 @@
+Unless otherwise noted in the header of specific files, files in this=20
+distribution have the licence shown below.
+
+However, note that certain shell functions are licensed under versions=20
+of the GNU General Public Licence.  Anyone distributing the shell as a=20
+binary including those files needs to take account of this.  Search=20
+shell functions for "Copyright" for specific copyright information.
+None of the core functions are affected by this, so those files may=20
+simply be omitted.
+
+--
+
+The Z Shell is copyright (c) 1992-2009 Paul Falstad, Richard Coleman,=20
+Zolt=C3=A1n Hidv=C3=A9gi, Andrew Main, Peter Stephenson, Sven Wischnowsky,=
 and=20
+others.  All rights reserved.  Individual authors, whether or not=20
+specifically named, retain copyright in all changes; in what follows,=20
+they are referred to as `the Zsh Development Group'.  This is for=20
+convenience only and this body has no legal status.  The Z shell is=20
+distributed under the following licence; any provisions made in=20
+individual files take precedence.
+
+Permission is hereby granted, without written agreement and without=20
+licence or royalty fees, to use, copy, modify, and distribute this=20
+software and to distribute modified versions of this software for any=20
+purpose, provided that the above copyright notice and the following two=20
+paragraphs appear in all copies of this software.
+
+In no event shall the Zsh Development Group be liable to any party for=20
+direct, indirect, special, incidental, or consequential damages arising=20
+out of the use of this software and its documentation, even if the Zsh=20
+Development Group have been advised of the possibility of such damage.
+
+The Zsh Development Group specifically disclaim any warranties,=20
+including, but not limited to, the implied warranties of=20
+merchantability and fitness for a particular purpose.  The software provid=
ed hereunder is on an "as is"
+basis, and the Zsh Development Group have no obligation to provide=20
+maintenance, support, updates, enhancements, or modifications.
diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extende=
d/zsh/zsh.inc
index 03201d6..db51f39 100644
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -1,14 +1,16 @@
-DESCRIPTION =3D "UNIX Shell similar to the Korn shell"
-HOMEPAGE=3D"http://www.zsh.org"
+SUMMARY =3D "UNIX Shell similar to the Korn shell"
+DESCRIPTION =3D "Zsh is a shell designed for interactive use, although it =
is also a \
+               powerful scripting language. Many of the useful features of=
 bash, \
+               ksh, and tcsh were incorporated into zsh; many original fea=
tures were added."
+HOMEPAGE =3D "http://www.zsh.org"
 SECTION =3D "base/shell"
=20
-
-LICENSE =3D "ZSH"
-LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dad234d4b46db63491c4a9789da4fb34=
1"
+LICENSE =3D "zsh"
+LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db7bc853894664be455a922db9805288=
e"
=20
 DEPENDS =3D "ncurses bison-native"
=20
-SRC_URI =3D "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/=
${BPN}-${PV}.tar.gz"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
=20
 inherit autotools gettext update-alternatives
=20
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb b/meta-oe/recipes-ex=
tended/zsh/zsh_5.0.0.bb
deleted file mode 100644
index 3421d95..0000000
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require zsh.inc
-DEPENDS =3D "ncurses libcap libpcre gdbm groff-native"
-
-SRC_URI[md5sum] =3D "01df38e4aa34aa227462fdf2f6d4c5cd"
-SRC_URI[sha256sum] =3D "835194ea83abd812b5fdb1d2bfa6427c4c4e95e771c4a75e90=
06037af8efd264"
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-ex=
tended/zsh/zsh_5.0.5.bb
new file mode 100644
index 0000000..a7170dc
--- /dev/null
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -0,0 +1,5 @@
+require zsh.inc
+DEPENDS +=3D "libcap libpcre gdbm groff-native"
+
+SRC_URI[md5sum] =3D "6fb0e3e52a0f8de5ca63138391b81ce0"
+SRC_URI[sha256sum] =3D "b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d150=
23ff291c2894b4"
--
1.8.5.4


