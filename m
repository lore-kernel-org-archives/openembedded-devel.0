Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqs21-0007En-Ci
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 18:50:47 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id F034C4C8222;
	Mon,  6 Apr 2009 18:47:51 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id CFC5C4C81FA;
	Mon,  6 Apr 2009 18:47:48 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 52CAD1840D9; Mon,  6 Apr 2009 18:47:51 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 18:47:51 +0200
Message-Id: <1239036471-16287-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.4
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] gsoap: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 16:50:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/gsoap/gsoap/rename_bogus_ldflags.patch |   12 ++++++++++++
 recipes/gsoap/gsoap_2.7.7.bb                   |    5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gsoap/gsoap/rename_bogus_ldflags.patch

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
index dc6ff6e..21a0ace 100644
--- a/recipes/gsoap/gsoap_2.7.7.bb
+++ b/recipes/gsoap/gsoap_2.7.7.bb
@@ -3,9 +3,10 @@ for the development of SOAP Web Services and clients."
 SECTION =3D "devel"
 LICENSE =3D "GPL"
 DEPENDS =3D "gsoap-native"
-PR =3D "r1"
+PR =3D "r2"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
+           file://rename_bogus_ldflags.patch;patch=3D1"
 S =3D "${WORKDIR}/gsoap-2.7"
=20
 inherit autotools
--=20
1.6.2.1



