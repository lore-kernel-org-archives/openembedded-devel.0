Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LnuvZ-0006bI-EB
	for openembedded-devel@openembedded.org; Sun, 29 Mar 2009 15:19:53 +0200
Received: from p5b0350d5.dip.t-dialin.net ([91.3.80.213] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Lnuta-0002zc-Ux by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@openembedded.org>;
	Sun, 29 Mar 2009 15:17:53 +0200
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LnutZ-00031r-Ri
	for openembedded-devel@openembedded.org; Sun, 29 Mar 2009 15:17:49 +0200
Date: Sun, 29 Mar 2009 15:17:49 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090329131749.GA350@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: [PATCH] connman: Package python test scripts into	connman-test-utils
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
X-List-Received-Date: Sun, 29 Mar 2009 13:19:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I would like to get some feedback from other people using connman in OE. I did
the following to package the test scripts which enables you to install them as
separate package.

I'm also thinking about removing some older connman versions. Say everything
below 0.14. (0.13 was broken from upstream)

Feedback?

regards
Stefan Schmidt


From 0b61b8085f4c0cad0ff6137cb66fe71bda0c0a99 Mon Sep 17 00:00:00 2001
From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Fri, 27 Mar 2009 17:36:46 +0100
Subject: [PATCH] connman: Package python test scripts into connman-test-utils

---
 packages/connman/connman.inc     |    7 ++++++-
 packages/connman/connman_0.15.bb |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/packages/connman/connman.inc b/packages/connman/connman.inc
index 5ca7723..dd845f5 100644
--- a/packages/connman/connman.inc
+++ b/packages/connman/connman.inc
@@ -26,6 +26,9 @@ do_configure_append() {
 
 do_install_append() {
     install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+    install -d ${D}${libdir}/connman/test/
+    for file in test/*; do install -m 0755 $file ${D}${libdir}/connman/test/; done
+    rm ${D}${libdir}/connman/test/Makefile*
 }
 
 do_stage() {
@@ -49,7 +52,7 @@ python populate_packages_prepend() {
 
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
-PACKAGES += "${PN}-scripts"
+PACKAGES += "${PN}-scripts ${PN}-test-utils"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
@@ -59,6 +62,8 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/bonobo/servers \
             ${datadir}/dbus-1/system-services/*"
 
+FILES_${PN}-test-utils += "${libdir}/connman/test/*"
+
 FILES_${PN}-scripts += "${libdir}/connman/scripts"
 FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
 FILES_${PN}-dev += "${libdir}/connman/*/*.la"
diff --git a/packages/connman/connman_0.15.bb b/packages/connman/connman_0.15.bb
index c2bb92b..4d86500 100644
--- a/packages/connman/connman_0.15.bb
+++ b/packages/connman/connman_0.15.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
-- 
1.6.2.1



