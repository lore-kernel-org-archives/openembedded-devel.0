Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.103])
	by mail.openembedded.org (Postfix) with ESMTP id BCAED6B05F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 15:55:37 +0000 (UTC)
Received: from [216.82.254.211:58128] by server-7.bemta-7.messagelabs.com id
	B3/39-27376-A7B31E25; Thu, 23 Jan 2014 15:55:38 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-201.messagelabs.com!1390492537!6135695!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8681 invoked from network); 23 Jan 2014 15:55:37 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-11.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	23 Jan 2014 15:55:37 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 23 Jan 2014 09:55:38 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 23 Jan 2014 09:55:36 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.342.0; Thu, 23 Jan 2014 16:55:34 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jan 2014 16:55:33 +0100
Message-ID: <1390492533-56999-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.8.5.2
MIME-Version: 1.0
Subject: [meta-oe][master/dora][PATCH] networkmanager: fix incorrect configure option
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
X-List-Received-Date: Thu, 23 Jan 2014 15:55:38 -0000
Content-Type: text/plain

The wrong option was breaking the build with:

configure: error: invalid package name: systemdsystemunitdir=

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index f190dfd8f7bc..fb58f6891e44 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF = " \
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
-    --without-systemdsystemunitdir=, \
+    --without-systemdsystemunitdir, \
     polkit \
 "
 # consolekit is not picked by shlibs, so add it to RDEPENDS too

