Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LrU1g-0004CK-C1
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 11:25:17 +0200
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id DD72FE0814D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 11:21:52 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id EED37E081F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 11:21:49 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 9F792184007
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 11:21:53 +0200 (CEST)
Message-ID: <49DC6CB1.7080205@bolloretelecom.eu>
Date: Wed, 08 Apr 2009 11:21:53 +0200
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239036500-32115-1-git-send-email-jeremy.laine@bolloretelecom.eu>
	<20090408004514.GI11203@denix.org>
In-Reply-To: <20090408004514.GI11203@denix.org>
X-SA-Exim-Connect-IP: 212.27.42.6
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gsoap: actually stage headers	and	libraries..
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
X-List-Received-Date: Wed, 08 Apr 2009 09:25:30 -0000
Content-Type: multipart/mixed; boundary="------------040406000200070605050904"

--------------040406000200070605050904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> inherit autotools_stage?

Quite right. Attached is a better patch against stable which includes the=
 LDFLAGS fixes
and the staging fix.

--=20
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris

--------------040406000200070605050904
Content-Type: text/x-patch;
 name="gsoap_fixes.patch"
Content-Disposition: inline;
 filename="gsoap_fixes.patch"
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>

Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>

diff --git a/recipes/gsoap/gsoap/rename_bogus_ldflags.patch b/recipes/gso=
ap/gsoap/rename_bogus_ldflags.patch
new file mode 100644
index 0000000..5e4a01c
--- /dev/null
+++ b/recipes/gsoap/gsoap/rename_bogus_ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN gsoap-2.7.orig/soapcpp2/wsdl/Makefile.am gsoap-2.7/soapcpp2/ws=
dl/Makefile.am
+--- gsoap-2.7.orig/soapcpp2/wsdl/Makefile.am	2005-07-15 21:04:42.0000000=
00 +0000
++++ gsoap-2.7/soapcpp2/wsdl/Makefile.am	2009-04-06 14:22:23.000000000 +0=
000
+@@ -6,7 +6,7 @@
+ AUTOMAKE_OPTIONS =3D foreign 1.4
+=20
+ INCLUDES=3D-I$(top_builddir)/soapcpp2
+-LDFLAGS=3D$(INCLUDES)
++AM_LDFLAGS=3D$(INCLUDES)
+ SOAP=3D$(top_builddir)/soapcpp2/src/soapcpp2
+ SOAP_CPP_LIB=3D$(top_builddir)/soapcpp2/libgsoap++.a
+ SOAP_CPP_SRC=3DwsdlC.cpp
diff --git a/recipes/gsoap/gsoap_2.7.7.bb b/recipes/gsoap/gsoap_2.7.7.bb
index dc6ff6e..19f5751 100644
--- a/recipes/gsoap/gsoap_2.7.7.bb
+++ b/recipes/gsoap/gsoap_2.7.7.bb
@@ -3,12 +3,13 @@ for the development of SOAP Web Services and clients."
 SECTION =3D "devel"
 LICENSE =3D "GPL"
 DEPENDS =3D "gsoap-native"
-PR =3D "r1"
+PR =3D "r4"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
+           file://rename_bogus_ldflags.patch;patch=3D1"
 S =3D "${WORKDIR}/gsoap-2.7"
=20
-inherit autotools
+inherit autotools_stage
=20
 PARALLEL_MAKE =3D ""
=20

--------------040406000200070605050904--
