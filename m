Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqnph-00029i-N5
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 14:21:48 +0200
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 7C57E9400A8;
	Mon,  6 Apr 2009 14:18:52 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 9C41694014B;
	Mon,  6 Apr 2009 14:18:50 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 000461840D9; Mon,  6 Apr 2009 14:18:52 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 14:18:52 +0200
Message-Id: <1239020332-6949-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.1
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] dhclient: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 12:21:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/dhclient/dhclient_2.0pl5.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/dhclient/dhclient_2.0pl5.bb b/recipes/dhclient/dhcli=
ent_2.0pl5.bb
index 20b0dfc..0b1f614 100644
--- a/recipes/dhclient/dhclient_2.0pl5.bb
+++ b/recipes/dhclient/dhclient_2.0pl5.bb
@@ -1,12 +1,14 @@
 SECTION =3D "console/network"
 DESCRIPTION =3D "ISC DHCP Distribution (client and server)."
 LICENSE =3D "BSD"
+PR =3D "r1"
=20
 SRC_URI =3D "ftp://ftp.isc.org/isc/dhcp/dhcp-2.0-history/dhcp-${PV}.tar.=
gz \
 	   file://make.patch;patch=3D1"
 S =3D "${WORKDIR}/dhcp-${PV}"
=20
 export BINDIR =3D "${sbindir}"
+export LFLAGS =3D "${LDFLAGS}"
=20
 do_configure () {
 	./configure ${TARGET_SYS}
--=20
1.6.2.1



