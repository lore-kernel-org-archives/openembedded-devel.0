Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1MgNJX-00020B-QN
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 20:33:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 788A1531D70;
	Wed, 26 Aug 2009 14:15:45 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21229-10; Wed, 26 Aug 2009 14:15:45 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 448DB52F42D;
	Wed, 26 Aug 2009 14:15:45 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id 193527CE208; Wed, 26 Aug 2009 14:14:27 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2009 14:14:27 -0400
Message-Id: <1251310467-24825-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <20090826170712.GH31371@gmail.com>
References: <20090826170712.GH31371@gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] usb-modeswitch: add v1.0.2
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
X-List-Received-Date: Wed, 26 Aug 2009 18:33:44 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini                             |    4 ++++
 recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb |   23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2d9e843..29238ff 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -24526,6 +24526,10 @@ sha256=dbc5d6921136711f08c197284ec67dc77232559e2e31429f8a30a1a102bd07f7
 md5=042c5243ce0253341fe920a8a863e37b
 sha256=6d2ae5d70609df7d2c2b518eca0624c4a59328b277ed114b9e5b57dd030e6e94
 
+[http://www.draisberghof.de/usb_modeswitch/usb_modeswitch-1.0.2.tar.bz2]
+md5=4f896ed631f9be0338df9c5a2145ef82
+sha256=f1b9388f4507185a4ac30bae3383d9e9bbb95075a14dd188c904cacdd8cf4e66
+
 [http://www.rpsys.net/openzaurus/patches/archive/usb_pxa27x_udc-r0.patch]
 md5=c8193bc27642fa446d702cfdb9464c2a
 sha256=2101f292449cbacc277aecc5c649de895d501057f299e8e48a7ec50cfb0a200d
diff --git a/recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb b/recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb
new file mode 100644
index 0000000..3919106
--- /dev/null
+++ b/recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
+SECTION = "base"
+PRIORITY = "required"
+LICENSE = "GPLv2"
+DEPENDS = "virtual/libusb0"
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb_modeswitch-${PV}.tar.bz2"
+
+S = "${WORKDIR}/usb_modeswitch-${PV}"
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${bindir} ${sysconfdir}"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${sysconfdir}
+	install -m 0755 ${S}/usb_modeswitch ${D}${bindir}/usb_modeswitch
+	install -m 0644 ${S}/usb_modeswitch.conf ${D}${sysconfdir}/usb_modeswitch.conf
+}
-- 
1.6.0.2



