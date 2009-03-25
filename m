Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LmX0l-0005Zg-Od
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 18:35:32 +0100
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 4FE334B0264
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 18:33:53 +0100 (CET)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 5D3454B022D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 18:33:51 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id E2E9127844C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 18:33:54 +0100 (CET)
Message-ID: <49CA6B02.9070600@bolloretelecom.eu>
Date: Wed, 25 Mar 2009 18:33:54 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49C9FEFF.2010802@bolloretelecom.eu> <1237985345.8711.6.camel@opal>
In-Reply-To: <1237985345.8711.6.camel@opal>
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
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
X-List-Received-Date: Wed, 25 Mar 2009 17:35:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Michael 'Mickey' Lauer wrote:
> +1. Better have one maintained version than dozens of unmaintained ones=
.

OK, done. This has allowed me to start consolidating the patches and rule=
s so that Qt/X11
and Qt/Embedded are kept in sync. In the process, I have introduced a "qt=
4-tools-native"
package which is meant to replace qmake2-native and uicmoc4-native. This =
brings up another
round of questions:

* does anyone have a good reason to keep qmake2-native and uicmoc4-native=
?

* what are qmake2-sdk and uicmoc4-sdk? The package using this is "meta-to=
olchain-neuros".

* who is the maintainer for the neuros-* packages? They are in a really s=
ad state (staging
rules are only half-writtent so they mostly don't build), and they keep c=
oming up when I
grep for Qt-related stuff. I am wondering whether they don't belong in "n=
onworking"..

> It's also better for PyQt which usually only works with one of the
> versions.

Ah, speaking of PyQt I suggest we apply something like the patch below, a=
s the qreal-api
patches break the build for anything but arm and mips architectures:

diff --git a/recipes/python/python-pyqt_4.4.3.bb b/recipes/python/python-=
pyqt_4.4.3.bb
index 08a8fc6..261cb2c 100644
--- a/recipes/python/python-pyqt_4.4.3.bb
+++ b/recipes/python/python-pyqt_4.4.3.bb
@@ -16,13 +16,21 @@ SRC_URI =3D "\
   file://cross-compile.patch;patch=3D1 \
   file://01_configure.dpatch;patch=3D1 \
   file://02_htmllinks.dpatch;patch=3D1 \
-  file://03_qreal.dpatch;patch=3D1 \
-  file://04_qreal_api_fixes-for-4.4.3.dpatch;patch=3D1 \
   \
   file://assistantclient-fix.patch;patch=3D1 \
 "
 S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"

+# arm and mips machines need some extra patches
+
+SRC_URI_append_arm =3D "\
+  file://03_qreal.dpatch;patch=3D1 \
+  file://04_qreal_api_fixes-for-4.4.3.dpatch;patch=3D1"
+
+SRC_URI_append_mipsel =3D "\
+  file://03_qreal.dpatch;patch=3D1 \
+  file://04_qreal_api_fixes-for-4.4.3.dpatch;patch=3D1"
+
 inherit qt4x11 sip distutils-base

 PARALLEL_MAKE =3D ""

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


