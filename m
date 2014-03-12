Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4286C716
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:27:05 +0000 (UTC)
Received: from [216.82.241.196:61745] by server-3.bemta-8.messagelabs.com id
	11/6F-10150-9CC70235; Wed, 12 Mar 2014 15:27:05 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-46.messagelabs.com!1394638024!29764643!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22123 invoked from network); 12 Mar 2014 15:27:04 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-6.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	12 Mar 2014 15:27:04 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 12 Mar 2014 10:27:14 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Wed, 12 Mar 2014 10:27:03 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.342.0; Wed, 12 Mar 2014 16:27:00 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2014 16:27:00 +0100
Message-ID: <1394638020-27867-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] crda: fix udev rule
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2014 15:27:10 -0000
Content-Type: text/plain

The SBINDIR variable in makefile's install rule needs to have a trailing
slash so the path to the 'crda' binary in the udev rule is correct.

Otherwise the udev rule has a wrong path:

KERNEL=="regulatory*", ACTION=="change", SUBSYSTEM=="platform", RUN+="/usr/sbincrda"

and at runtime udev complains:

failed to execute '/usr/sbincrda'

when a regulatory domain event is triggered.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-networking/recipes-connectivity/crda/crda_1.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
index bee3e826d9a8..0bb899860bc4 100644
--- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
@@ -24,7 +24,7 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake SBINDIR=${sbindir} install
+    oe_runmake SBINDIR=${sbindir}/ install
 
     install -d ${D}${libdir}/crda/
 

