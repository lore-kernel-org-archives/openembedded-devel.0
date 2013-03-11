Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UFCsD-0005um-BG
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 01:15:21 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 77D29D1B201
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:58:43 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 83280A622B;
	Tue, 12 Mar 2013 00:58:38 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Mar 2013 00:58:33 +0100
Message-Id: <1363046313-22867-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][PATCH] net-snmp: EXTENDPV is now EXTENDPKGV
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
X-List-Received-Date: Tue, 12 Mar 2013 00:15:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-extended/net-snmp/net-snmp.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/rec=
ipes-extended/net-snmp/net-snmp.inc
index eb355ab..11b81ad 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -7,8 +7,8 @@ RDEPENDS_${PN}-server-snmpd +=3D "net-snmp-mibs"
 RDEPENDS_${PN}-server-snmptrapd +=3D "net-snmp-server-snmpd"
 RDEPENDS_${PN}-server +=3D "net-snmp-server-snmpd net-snmp-server-snmptr=
apd"
 RDEPENDS_${PN}-client +=3D "net-snmp-mibs"
-RDEPENDS_${PN}-dev =3D "net-snmp-client (=3D ${EXTENDPV}) net-snmp-serve=
r (=3D ${EXTENDPV})"
-RRECOMMENDS_${PN}-dbg =3D "net-snmp-client (=3D ${EXTENDPV}) net-snmp-se=
rver (=3D ${EXTENDPV})"
+RDEPENDS_${PN}-dev =3D "net-snmp-client (=3D ${EXTENDPKGV}) net-snmp-ser=
ver (=3D ${EXTENDPKGV})"
+RRECOMMENDS_${PN}-dbg =3D "net-snmp-client (=3D ${EXTENDPKGV}) net-snmp-=
server (=3D ${EXTENDPKGV})"
 INC_PR =3D "r3"
=20
 inherit autotools update-rc.d siteinfo
--=20
1.7.11.7



