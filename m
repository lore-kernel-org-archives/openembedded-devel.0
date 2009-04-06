Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqs2U-0007FR-FE
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 18:51:16 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 0EBE14C8186;
	Mon,  6 Apr 2009 18:48:20 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 2B9634C80DC;
	Mon,  6 Apr 2009 18:48:18 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id A138A1840D9; Mon,  6 Apr 2009 18:48:20 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 18:48:20 +0200
Message-Id: <1239036500-32115-1-git-send-email-jeremy.laine@bolloretelecom.eu>
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
Subject: [STABLE][PATCH] gsoap: actually stage headers and libraries..
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
X-List-Received-Date: Mon, 06 Apr 2009 16:51:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/gsoap/gsoap_2.7.7.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/gsoap/gsoap_2.7.7.bb b/recipes/gsoap/gsoap_2.7.7.bb
index 21a0ace..83c7cbb 100644
--- a/recipes/gsoap/gsoap_2.7.7.bb
+++ b/recipes/gsoap/gsoap_2.7.7.bb
@@ -3,7 +3,7 @@ for the development of SOAP Web Services and clients."
 SECTION =3D "devel"
 LICENSE =3D "GPL"
 DEPENDS =3D "gsoap-native"
-PR =3D "r2"
+PR =3D "r3"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
            file://rename_bogus_ldflags.patch;patch=3D1"
@@ -23,5 +23,9 @@ do_install_append() {
 	done
 }
=20
+do_stage() {
+	autotools_stage_all
+}
+
 PACKAGES =3D "${PN}-dbg ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
 FILES_gsoap-dev =3D "${bindir}/wsdl2h ${bindir}/soapcpp2 ${libdir}"
--=20
1.6.2.1



