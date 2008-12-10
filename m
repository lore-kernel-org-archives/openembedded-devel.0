Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LAYrq-0002Vp-Bl
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 00:53:22 +0100
Received: from p5b0369ce.dip.t-dialin.net ([91.3.105.206] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LAYnt-0004ya-CY by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 00:49:20 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LAYnn-0001fB-0I
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 00:49:11 +0100
Date: Thu, 11 Dec 2008 00:49:10 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081210234910.GA16050@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Wed, 10 Dec 2008 23:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

While playing to get connman 0.1 running I found that we don't ship two files in
the wpa-supplicant that come in handy.

/etc/dbus-1/system.d/dbus-wpa_supplicant.conf

That one is really needed. Without it a wpa-supplicant -u barks out about wrong
security.

/usr/share/dbus-1/system-services/dbus-wpa_supplicant.service

This one is a nice-to-have. It allows autostart the service with the service
activation infrastructure from dbus. If a bus name listed in such a file is
called and not available it gets started the way described in this file.

The following patch i nstalls the files correctly for me. Never used FILES_${PN}
before so I would like to get some review before.

diff --git a/packages/wpa-supplicant/wpa-supplicant-0.6.inc b/packages/wpa-supplicant/wpa-supplicant-0.6.inc
index 6198958..779bee7 100644
--- a/packages/wpa-supplicant/wpa-supplicant-0.6.inc
+++ b/packages/wpa-supplicant/wpa-supplicant-0.6.inc
@@ -59,7 +59,14 @@ do_install () {
 	install -d ${D}${sysconfdir}/wpa_supplicant
 	install -m 755 ${WORKDIR}/ifupdown.sh ${D}${sysconfdir}/wpa_supplicant/
 	install -m 755 ${WORKDIR}/functions.sh ${D}${sysconfdir}/wpa_supplicant
-	
+
+	install -d ${D}/${sysconfdir}/dbus-1/system.d
+	install -m 644 ${S}/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
+	install -d ${D}/${datadir}/dbus-1/system-services
+	install -m 644 ${S}/dbus-wpa_supplicant.service ${D}/${datadir}/dbus-1/system-services
+
 	ln -s /etc/wpa_supplicant/ifupdown.sh ${D}${sysconfdir}/network/if-pre-up.d/wpasupplicant
 	ln -s /etc/wpa_supplicant/ifupdown.sh ${D}${sysconfdir}/network/if-post-down.d/wpasupplicant
 }
+
+FILES_${PN} += "${datadir}/dbus-1/system-services/*"
diff --git a/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb b/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb
index d20ccaa..11fc774 100644
--- a/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb
+++ b/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb
@@ -1,3 +1,3 @@
 require wpa-supplicant-0.6.inc
 
-PR = "r1"
+PR = "r2"
diff --git a/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb b/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb
index d20ccaa..11fc774 100644
--- a/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb
+++ b/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb
@@ -1,3 +1,3 @@
 require wpa-supplicant-0.6.inc
 
-PR = "r1"
+PR = "r2"

Anyone objections?

regards
Stefan Schmidt


