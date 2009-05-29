Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1M9vrn-0007GH-3W
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 May 2009 08:46:59 +0200
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id F20D4E0813C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 08:38:33 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 18C4BE08026
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 08:38:30 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 136E1184184
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 08:38:11 +0200 (CEST)
Message-ID: <4A1F82D2.6020707@bolloretelecom.eu>
Date: Fri, 29 May 2009 08:38:10 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: libx11 1.2 problems (dolt vs. libtool)
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
X-List-Received-Date: Fri, 29 May 2009 06:46:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Since libx11 was upgraded to 1.2, my libx11 builds are failing with:

| ../../../doltlibtool: line 17:
/home/oebuilder/oe/build/tmp/work/ppce300c3-angstrom-linux/libx11-1_1.2-r=
0/libX11-1.2/modules/im/ximcp/../../../libtool:
No such file or directory
| ../../../doltlibtool: line 17: exec:
/home/oebuilder/oe/build/tmp/work/ppce300c3-angstrom-linux/libx11-1_1.2-r=
0/libX11-1.2/modules/im/ximcp/../../../libtool:
cannot execute: No suchfile or directory

It would seem I am not the only one with this problem:

http://tinderbox.openembedded.net/packages/libx11/

The problem is that the "dolibtool" script (see http://dolt.freedesktop.o=
rg) is trying to
invoke the "libtool" script which it assumes lives in the base directory.=
 However in OE
the libtool script is called ${HOST_SYS}-libtool, so it is not being foun=
d.

For now I am working around the problem with the following patch, but I s=
uspect this is
going to crop up in other packages sooner or later:

diff --git a/recipes/xorg-lib/libx11_1.2.bb b/recipes/xorg-lib/libx11_1.2=
.bb
index a3d000f..8415315 100644
--- a/recipes/xorg-lib/libx11_1.2.bb
+++ b/recipes/xorg-lib/libx11_1.2.bb
@@ -13,6 +13,10 @@ SRC_URI +=3D "file://x11_disable_makekeys.patch;patch=3D=
1 \

 EXTRA_OECONF +=3D "--without-xcb --with-keysymdef=3D${STAGING_INCDIR}/X1=
1/keysymdef.h"

+do_configure_append() {
+       ln -s ${HOST_SYS}-libtool libtool
+}
+
 do_compile() {
        (
                unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


