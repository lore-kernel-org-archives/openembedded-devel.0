Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1T8L3x-0002fr-LT
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 03:02:50 +0200
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q830oRp9014519
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 Sep 2012 17:50:29 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Sep 2012 20:50:20 -0400
Message-Id: <1346633420-10990-3-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
In-Reply-To: <1346633420-10990-2-git-send-email-joe.macdonald@windriver.com>
References: <1346633420-10990-1-git-send-email-joe.macdonald@windriver.com>
	<1346633420-10990-2-git-send-email-joe.macdonald@windriver.com>
Subject: [meta-oe][PATCH 2/2] meta-networking: stylize dnsmasq recipe
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
X-List-Received-Date: Mon, 03 Sep 2012 01:02:50 -0000

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 .../recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb           | 10 +++++-----
 meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc        | 14 +++++++-------
 meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb    |  3 ++-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb b/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb
index 896952d..5c4500f 100644
--- a/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb
+++ b/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb
@@ -1,13 +1,13 @@
 # dnsmasq with support for DBus interface
-
-require dnsmasq_${PV}.bb
+DEPENDS = "dbus"
 
 S = "${WORKDIR}/dnsmasq-${PV}"
 
-DEPENDS = "dbus"
 EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
 
 do_install_append () {
-        install -d ${D}${sysconfdir}/dbus-1/system.d
-        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
+    install -d ${D}${sysconfdir}/dbus-1/system.d
+    install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
 }
+
+require dnsmasq_${PV}.bb
diff --git a/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc b/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc
index e994852..3c87abf 100644
--- a/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc
@@ -17,13 +17,13 @@ INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
 
 do_install () {
-        oe_runmake "PREFIX=${D}${prefix}" \
-                   "BINDIR=${D}${bindir}" \
-                   "MANDIR=${D}${mandir}" \
-                   install
-        install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
-        install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
-        install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
+    oe_runmake "PREFIX=${D}${prefix}" \
+               "BINDIR=${D}${bindir}" \
+               "MANDIR=${D}${mandir}" \
+               install
+    install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
+    install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
+    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
 }
 
 CONFFILES_${PN} = "${sysconfdir}/dnsmasq.conf"
diff --git a/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb b/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb
index 5f87704..e98f61c 100644
--- a/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb
+++ b/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb
@@ -1,4 +1,5 @@
-require dnsmasq.inc
 
 SRC_URI[dnsmasq-2.55.md5sum] = "b093d7c6bc7f97ae6fd35d048529232a"
 SRC_URI[dnsmasq-2.55.sha256sum] = "cf63ecf5977f00474cbda98376a9d8743500a82fd98e13f43d7037bce9f9f929"
+
+require dnsmasq.inc
-- 
1.7.11.3



