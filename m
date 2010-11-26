Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1PM0j9-00086M-Gu
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 17:00:48 +0100
X-Virus-Scanned: amavisd-new at gattei.com
Received: from localhost.localdomain (89-96-49-192.ip10.fastwebnet.it
	[89.96.49.192])
	by ns1.gatteins.it (Postfix) with ESMTPA id A8893DEF25;
	Fri, 26 Nov 2010 16:59:40 +0100 (MET)
From: matteo.facchinetti@sirius-es.it
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 16:59:18 +0100
Message-Id: <1290787158-26726-1-git-send-email-matteo.facchinetti@sirius-es.it>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 193.58.239.94
X-SA-Exim-Mail-From: matteo.facchinetti@sirius-es.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Matteo Facchinetti <engineering@sirius-es.it>
Subject: sysvinit_2.86.bb: add possibility to use USB Serial Console with only rx/tx.
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
X-List-Received-Date: Fri, 26 Nov 2010 16:00:48 -0000

From: Matteo Facchinetti <engineering@sirius-es.it>

There are many evaluationboard that use mini-usb port like as
a serial port + power supply. Using it as serial console have
to force getty with no need for carrier detect.
---
 recipes/sysvinit/sysvinit_2.86.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
index 6ab5290..c34cbc9 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -65,6 +65,11 @@ do_install () {
 	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
 	if [ ! -z "${SERIAL_CONSOLE}" ]; then
 		echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
+	else
+		 
+		if [ ! -z "${USB_SERIAL_CONSOLE}" ]; then
+			echo "S:2345:respawn:${base_sbindir}/getty -L ${USB_SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
+		fi
 	fi
 	if [ "${USE_VT}" = "1" ]; then
 		cat <<EOF >>${D}${sysconfdir}/inittab
-- 
1.7.0.4



