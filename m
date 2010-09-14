Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OvPvA-0002FH-C8
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 09:31:34 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 2536E3D42F; Tue, 14 Sep 2010 11:25:51 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Sep 2010 11:25:49 +0400
Message-Id: <1284449149-31426-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTimZs1Our0mEetgXnYGPyhyQf8SQCXu2JE8vU6MZ@mail.gmail.com>
References: <AANLkTimZs1Our0mEetgXnYGPyhyQf8SQCXu2JE8vU6MZ@mail.gmail.com>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dnsmasq: remove versions prior to 2.52
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
X-List-Received-Date: Tue, 14 Sep 2010 07:34:28 -0000

These have known unpatched security issues, 2.52 is in the repo for quite some
time, anyone who cares should be using that already.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/dnsmasq/dnsmasq-dbus_2.47.bb |   16 ----------------
 recipes/dnsmasq/dnsmasq_2.11.bb      |    4 ----
 recipes/dnsmasq/dnsmasq_2.15.bb      |    6 ------
 recipes/dnsmasq/dnsmasq_2.22.bb      |    4 ----
 recipes/dnsmasq/dnsmasq_2.47.bb      |    4 ----
 5 files changed, 0 insertions(+), 34 deletions(-)
 delete mode 100644 recipes/dnsmasq/dnsmasq-dbus_2.47.bb
 delete mode 100644 recipes/dnsmasq/dnsmasq_2.11.bb
 delete mode 100644 recipes/dnsmasq/dnsmasq_2.15.bb
 delete mode 100644 recipes/dnsmasq/dnsmasq_2.22.bb
 delete mode 100644 recipes/dnsmasq/dnsmasq_2.47.bb

diff --git a/recipes/dnsmasq/dnsmasq-dbus_2.47.bb b/recipes/dnsmasq/dnsmasq-dbus_2.47.bb
deleted file mode 100644
index fa3dbfc..0000000
--- a/recipes/dnsmasq/dnsmasq-dbus_2.47.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-# dnsmasq with support for DBus interface
-
-require dnsmasq.inc
-
-S = "${WORKDIR}/dnsmasq-${PV}"
-
-DEPENDS = "dbus"
-EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
-
-do_install_append () {
-        install -d ${D}${sysconfdir}/dbus-1/system.d
-        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
-}
-
-SRC_URI[dnsmasq-2.47.md5sum] = "4524081e56d0b935717d493e8e8d3e11"
-SRC_URI[dnsmasq-2.47.sha256sum] = "f2716a43eb05b232c640a4ad647fd0fc21dd0c4f4ad20c9f5303568742399e5d"
diff --git a/recipes/dnsmasq/dnsmasq_2.11.bb b/recipes/dnsmasq/dnsmasq_2.11.bb
deleted file mode 100644
index fc66269..0000000
--- a/recipes/dnsmasq/dnsmasq_2.11.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.11.md5sum] = "02aa4ffb835cbc9bdf96fcb915901cb3"
-SRC_URI[dnsmasq-2.11.sha256sum] = "2dac596d5150174d0a2d9170db698c1d72584a8ab3b5eedf907086f53f76cc87"
diff --git a/recipes/dnsmasq/dnsmasq_2.15.bb b/recipes/dnsmasq/dnsmasq_2.15.bb
deleted file mode 100644
index 89fd260..0000000
--- a/recipes/dnsmasq/dnsmasq_2.15.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-PR = "r2"
-
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.15.md5sum] = "72f59fa070a1dc7f664603b20134c383"
-SRC_URI[dnsmasq-2.15.sha256sum] = "9aec45b395b6206e8eb85417f58186cdd0a307ed0f26f4b73af7031023a52225"
diff --git a/recipes/dnsmasq/dnsmasq_2.22.bb b/recipes/dnsmasq/dnsmasq_2.22.bb
deleted file mode 100644
index 9aebdfc..0000000
--- a/recipes/dnsmasq/dnsmasq_2.22.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.22.md5sum] = "b38f33cd0703fa664a37a4595d918189"
-SRC_URI[dnsmasq-2.22.sha256sum] = "cc2c86cbd0ec020a4486ac9d195e6a848a0d11a280c3194e095719f60c9751a9"
diff --git a/recipes/dnsmasq/dnsmasq_2.47.bb b/recipes/dnsmasq/dnsmasq_2.47.bb
deleted file mode 100644
index 70c6529..0000000
--- a/recipes/dnsmasq/dnsmasq_2.47.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.47.md5sum] = "4524081e56d0b935717d493e8e8d3e11"
-SRC_URI[dnsmasq-2.47.sha256sum] = "f2716a43eb05b232c640a4ad647fd0fc21dd0c4f4ad20c9f5303568742399e5d"
-- 
1.6.4.2



