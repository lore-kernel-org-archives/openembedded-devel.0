Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1PLctM-0001Xq-WA
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 15:33:45 +0100
X-Virus-Scanned: amavisd-new at gattei.com
Received: from [10.16.100.80] (89-96-49-192.ip10.fastwebnet.it [89.96.49.192])
	by ns1.gatteins.it (Postfix) with ESMTPA id 6E139DEF24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 15:32:36 +0100 (MET)
Message-ID: <4CEE737B.4050703@sirius-es.it>
Date: Thu, 25 Nov 2010 15:32:27 +0100
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 193.58.239.94
X-SA-Exim-Mail-From: matteo.facchinetti@sirius-es.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: sysvinit modify for usb_serial_console
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
X-List-Received-Date: Thu, 25 Nov 2010 14:33:45 -0000
X-Groupsio-MsgNum: 26578
Content-Type: multipart/mixed; boundary="------------010201070500010106080200"

--------------010201070500010106080200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

There are many evaluationboard that use mini-usb port like as a serial 
port + power supply.
Using it as serial console have to force getty with no need for carrier 
detect.
For these boards have to use USB_SERIAL_CONSOLE variabile in config file 
instead of SERIAL_CONSOLE and getty runs with -L parameter.
By this way is simple to use usb serial port unless know in depth getty 
manpage.

Can you merge this patch in mainline?

Regards
Matteo Facchinetti
Sirius Electronic Systems

--------------010201070500010106080200
Content-Type: text/x-diff;
 name="0001-sysvinit_2.86.bb-add-possibility-to-use-USB-Serial-C.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-sysvinit_2.86.bb-add-possibility-to-use-USB-Serial-C.pa";
 filename*1="tch"

From 5b691f51009458385f24913e39acc698c523dbe5 Mon Sep 17 00:00:00 2001
From: Matteo Facchinetti <engineering@sirius-es.it>
Date: Thu, 25 Nov 2010 15:21:08 +0100
Subject: sysvinit_2.86.bb: add possibility to use USB Serial Console with only rx/tx.

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


--------------010201070500010106080200--
