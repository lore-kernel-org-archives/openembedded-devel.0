Return-Path: <btv1==03598fe66be==Terry.Boese@vecima.com>
X-Greylist: delayed 802 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Aug 2016 17:14:14 UTC
Received: from mx1.vecima.com (mx1.vecima.com [216.65.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id 342EA74197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:14:14 +0000 (UTC)
X-ASG-Debug-ID: 1471280449-0347d858c5265ce0001-aWHRdb
Received: from ExchangeInt.corp.vcom.com (exchangeint.corp.vcom.com
	[192.168.50.125]) by mx1.vecima.com with ESMTP id
	dKE3RfDr4mggKGop for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:00:49 -0600 (CST)
X-Barracuda-Envelope-From: Terry.Boese@vecima.com
Received: from PC2170.corp.vcom.com (192.168.216.92) by
	ExchangeInt.corp.vcom.com (192.168.50.125) with Microsoft SMTP Server
	id 14.3.279.2; Mon, 15 Aug 2016 11:00:49 -0600
From: Terry Boese <terry.boese@vecima.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 11:00:36 -0600
X-ASG-Orig-Subj: [meta-networking][PATCH v3] dnsmasq: update to version 2.76
Message-ID: <1471280436-3588-1-git-send-email-terry.boese@vecima.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.168.216.92]
X-Barracuda-Connect: exchangeint.corp.vcom.com[192.168.50.125]
X-Barracuda-Start-Time: 1471280449
X-Barracuda-URL: https://192.168.99.189:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 2285
X-Virus-Scanned: by bsmtpd at vecima.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=4.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.32028
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: [meta-networking][PATCH v3] dnsmasq: update to version 2.76
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 17:14:15 -0000
Content-Type: text/plain

Correct do_compile_append() and do_install(), as the location of
the DHCP lease tools has changed.

Signed-off-by: Terry Boese <terry.boese@vecima.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc                  | 4 ++--
 .../recipes-support/dnsmasq/{dnsmasq_2.75.bb => dnsmasq_2.76.bb}     | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.75.bb => dnsmasq_2.76.bb} (27%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 793c106..9ef54fe 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -38,7 +38,7 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.
 
 do_compile_append() {
     # build dhcp_release
-    cd ${S}/contrib/wrt
+    cd ${S}/contrib/lease-tools
     oe_runmake
 }
 
@@ -59,7 +59,7 @@ do_install () {
         install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     fi
 
-    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
+    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
 
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
similarity index 27%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
index a11aabb..41573d9 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
@@ -4,6 +4,5 @@ SRC_URI += "\
     file://lua.patch \
 "
 
-SRC_URI[dnsmasq-2.75.md5sum] = "d99ac126d4fe910c679d88430559669b"
-SRC_URI[dnsmasq-2.75.sha256sum] = "f8252c0a0ba162c2cd45f81140c7c17cc40a5fca2b869d1a420835b74acad294"
-
+SRC_URI[dnsmasq-2.76.md5sum] = "6610f8233ca89b15a1bb47c788ffb84f"
+SRC_URI[dnsmasq-2.76.sha256sum] = "777c4762d2fee3738a0380401f2d087b47faa41db2317c60660d69ad10a76c32"
-- 
2.7.4


