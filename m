Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2PxY-0005k2-Nz
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 16:54:41 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id C34781D363EB;
	Sun,  3 Oct 2010 16:54:21 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 16:54:19 +0200
Message-Id: <1286117659-32674-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] init-scripts: fix save-rtc error with date formatting on uclibc
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
X-List-Received-Date: Sun, 03 Oct 2010 14:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

uClibc's date does support only SUSv3 strptime[1], so the date command in
save-rtc.sh fails with 'date: invalid date '%2m%2d%2H%2M2010'.

1. http://www.opengroup.org/onlinepubs/009695399/functions/strptime.html

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/initscripts/files/save-rtc-uclibc.sh |    5 +++++
 recipes/initscripts/initscripts_1.0.bb       |   14 ++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 recipes/initscripts/files/save-rtc-uclibc.sh

diff --git a/recipes/initscripts/files/save-rtc-uclibc.sh b/recipes/inits=
cripts/files/save-rtc-uclibc.sh
new file mode 100644
index 0000000..8f4e587
--- /dev/null
+++ b/recipes/initscripts/files/save-rtc-uclibc.sh
@@ -0,0 +1,5 @@
+#! /bin/sh
+/etc/init.d/hwclock.sh stop
+
+# Update the timestamp
+date +%m%d%H%M%Y > /etc/timestamp
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts=
/initscripts_1.0.bb
index 8c38d7f..cc60624 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY =3D "required"
 DEPENDS =3D "makedevs"
 RDEPENDS_${PN} =3D "makedevs"
 LICENSE =3D "GPL"
-PR =3D "r123"
+PR =3D "r124"
=20
 SRC_URI =3D "file://functions \
            file://halt \
@@ -31,7 +31,8 @@ SRC_URI =3D "file://functions \
            file://device_table.txt \
            file://populate-volatile.sh \
            file://volatiles \
-           file://save-rtc.sh"
+           file://save-rtc.sh \
+           file://save-rtc-uclibc.sh"
=20
 SRC_URI_append_arm =3D " file://alignment.sh"
=20
@@ -137,3 +138,12 @@ do_install_append_angstrom () {
 do_install_append_hipox () {
 	ln -sf		../init.d/sysfs.sh	${D}${sysconfdir}/rc6.d/S80sysfs
 }
+
+# uclibc's date does support only SUSv3 strptime()
+do_install_append_linux-uclibc() {
+	install -m 0755    ${WORKDIR}/save-rtc-uclibc.sh ${D}${sysconfdir}/init=
.d/save-rtc.sh
+}
+
+do_install_append_linux-uclibceabi() {
+	install -m 0755    ${WORKDIR}/save-rtc-uclibc.sh ${D}${sysconfdir}/init=
.d/save-rtc.sh
+}
--=20
1.7.0.4



