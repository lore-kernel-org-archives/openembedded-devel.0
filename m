Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LYxls-0001oh-Jb
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 08:20:04 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 4145F16E122
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 08:31:07 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 5F7AE2A4225
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 08:18:15 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 16 Feb 2009 08:18:16 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF66E@hiob.intern.dresearch.de>
In-Reply-To: <gn9fjn$4rj$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] subversion libtool problem
Thread-Index: AcmPjolDXnnw2nhuR+2TWB/D5Y58VgAd7Bcg
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF642@hiob.intern.dresearch.de><69E6C70090A0A14498CC98FAE5E06B6E3CF664@hiob.intern.dresearch.de>
	<gn9fjn$4rj$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: subversion libtool problem
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
X-List-Received-Date: Mon, 16 Feb 2009 07:20:05 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Did you fix http://bugs.openembedded.net/show_bug.cgi?id=3D4830 when=20
> "patching neon for myself"?  I tried a DEPENDS =3D "gnutls=20
> (<2.0)" but the=20
> only thing which worked was a direct reference to a 1.x version.

I've tried another way. But as long as i can't build and test subversion =
i'm not sure if this is working. :(

$ git diff --cached packages/neon/
diff --git a/packages/neon/files/gnutls-2.patch =
b/packages/neon/files/gnutls-2.patch
new file mode 100644
index 0000000..2b37dfc
--- /dev/null
+++ b/packages/neon/files/gnutls-2.patch
@@ -0,0 +1,11 @@
+diff -Nurd neon-0.25.5/macros/neon.m4 =
neon-0.25.5-patched/macros/neon.m4
+--- neon-0.25.5/macros/neon.m4 2009-02-03 16:23:40.000000000 +0100
++++ neon-0.25.5-patched/macros/neon.m4 2009-02-03 16:24:00.000000000 =
+0100
+@@ -895,6 +895,7 @@
+    1.0.?|1.0.1?|1.0.20|1.0.21)=20
+       AC_MSG_ERROR([GNU TLS version $ne_gnutls_ver is too old -- =
1.0.22 or later required]) ;;
+    1.*) ;;
++   2.*) ;;
+    *) AC_MSG_ERROR([GNU TLS version $ne_gnutls_ver is not supported]) =
;;
+    esac
+=20
diff --git a/packages/neon/neon_0.25.5.bb b/packages/neon/neon_0.25.5.bb
index f935fdb..bec9262 100644
--- a/packages/neon/neon_0.25.5.bb
+++ b/packages/neon/neon_0.25.5.bb
@@ -4,10 +4,11 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL"
 DEPENDS =3D "zlib libxml2 expat time gnutls"
=20
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "http://www.webdav.org/${PN}/${P}.tar.gz \
-       file://gnutls-force-and-detect.patch;patch=3D1"
+       file://gnutls-force-and-detect.patch;patch=3D1 \
+       file://gnutls-2.patch;patch=3D1"
=20
 inherit autotools binconfig lib_package pkgconfig


