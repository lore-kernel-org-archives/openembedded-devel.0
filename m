Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O6rmj-0001XX-FU
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 22:53:38 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O6rj9-0004M2-Rh from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 13:49:55 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 27 Apr 2010 13:49:55 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 27 Apr 2010 20:49:54 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	27 Apr 2010 13:49:46 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Tue, 27 Apr 2010 13:49:45 -0700
Message-ID: <1272401386.3865.719.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 27 Apr 2010 20:49:55.0650 (UTC)
	FILETIME=[313D0A20:01CAE64B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Remove scsi headers from linux-libc-headers
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
X-List-Received-Date: Tue, 27 Apr 2010 20:53:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

linux-libc-headers: Go and delete include/scsi when it exists

With 2.6.31, the kernel started exporting SCSI headers again.  After
talking with Christoph Hellwig and James Bottemley (scsi maintainer),
these really should be removed.  A patch to the kernel to do so will be
happening shortly, but for now fixup the broken recipes we have.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
index 2e4041f..c2cf5d4 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r3"
+PR =3D "r4"
=20
 DEFAULT_PREFERENCE =3D "-1"
=20
@@ -44,6 +44,7 @@ do_compile () {
 do_install() {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_prefix} ARCH=3D
$ARCH
+	rm -rf ${D}${exec_prefix}/include/scsi
 }
=20
 SRC_URI[md5sum] =3D "84c077a37684e4cbfa67b18154390d8a"
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
index d82a749..b8b109e 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r3"
+PR =3D "r4"
=20
 DEFAULT_PREFERENCE =3D "-1"
=20
@@ -44,6 +44,7 @@ do_compile () {
 do_install() {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_prefix} ARCH=3D
$ARCH
+	rm -rf ${D}${exec_prefix}/include/scsi
 }
=20
 SRC_URI[md5sum] =3D "260551284ac224c3a43c4adac7df4879"



--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


