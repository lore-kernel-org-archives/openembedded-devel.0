Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1Nokx1-0005pW-0N
	for openembedded-devel@openembedded.org; Mon, 08 Mar 2010 22:57:27 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id B272B1D360F6;
	Mon,  8 Mar 2010 22:54:23 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Mar 2010 22:54:22 +0100
Message-Id: <1268085262-29850-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1268085262-29850-1-git-send-email-ynezz@true.cz>
References: <1268085262-29850-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-led-config: Add LED setup for the ts72xx and bump PR
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
X-List-Received-Date: Mon, 08 Mar 2010 21:57:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/angstrom/angstrom-led-config.bb          |    2 +-
 recipes/angstrom/angstrom-led-config/ts72xx/leds |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)
 create mode 100644 recipes/angstrom/angstrom-led-config/ts72xx/leds

diff --git a/recipes/angstrom/angstrom-led-config.bb b/recipes/angstrom/a=
ngstrom-led-config.bb
index a0373ed..2213a76 100644
--- a/recipes/angstrom/angstrom-led-config.bb
+++ b/recipes/angstrom/angstrom-led-config.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Configuration files for runtime LED configuration"=20
=20
 #PV =3D "${DISTRO_VERSION}"
-PR =3D "r7"
+PR =3D "r8"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit update-rc.d
diff --git a/recipes/angstrom/angstrom-led-config/ts72xx/leds b/recipes/a=
ngstrom/angstrom-led-config/ts72xx/leds
new file mode 100644
index 0000000..03fedd8
--- /dev/null
+++ b/recipes/angstrom/angstrom-led-config/ts72xx/leds
@@ -0,0 +1,3 @@
+#file format: name trigger
+platform:grled nand-disk
+platform:rdled heartbeat
--=20
1.6.3.3



