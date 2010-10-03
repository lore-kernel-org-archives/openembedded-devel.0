Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NSS-00047j-1Q
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:14:32 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 3121B1D363EB;
	Sun,  3 Oct 2010 14:14:02 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:14:03 +0200
Message-Id: <1286108043-10905-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] netbase: add interface file for ts72xx machine and bump PR
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
X-List-Received-Date: Sun, 03 Oct 2010 12:14:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/netbase/netbase/ts72xx/interfaces |    7 +++++++
 recipes/netbase/netbase_4.21.bb           |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/ts72xx/interfaces

diff --git a/recipes/netbase/netbase/ts72xx/interfaces b/recipes/netbase/=
netbase/ts72xx/interfaces
new file mode 100644
index 0000000..1ba6e02
--- /dev/null
+++ b/recipes/netbase/netbase/ts72xx/interfaces
@@ -0,0 +1,7 @@
+auto lo
+iface lo inet loopback
+
+auto eth0
+iface eth0 inet static
+	address 192.168.1.1
+	netmask 225.255.255.0
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.=
21.bb
index ddd186e..ed5bcdd 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION =3D "base"
 LICENSE =3D "GPLv2"
-PR =3D "r47"
+PR =3D "r48"
=20
 inherit update-rc.d
=20
--=20
1.7.0.4



