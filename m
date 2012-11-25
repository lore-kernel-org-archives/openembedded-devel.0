Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcvbS-0006GM-6P
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:07:50 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 0D28BD1988F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 00:13:44 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 3CF9BA6185
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 00:13:39 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 00:13:38 +0100
Message-Id: <1353885218-5623-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntp: fix checksum
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
X-List-Received-Date: Mon, 26 Nov 2012 10:07:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recipe to
a newer version but didn't update the checksum so fetch is failing.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.6p5.bb
index f7c5b68..0fce5ce 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -8,8 +8,8 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp=
4/ntp-4.2/ntp-${PV}.tar.g
         file://ntpdate \
 "
=20
-SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
-SRC_URI[sha256sum] =3D "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8=
a02e78be85a7c40e"
+SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
+SRC_URI[sha256sum] =3D "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23e=
a25ac1405432f91c"
=20
 EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"=20
=20
--=20
1.7.11.7



