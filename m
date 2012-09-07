Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9wHE-0002hJ-Jy
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 12:59:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 37DB25BCA11;
	Fri,  7 Sep 2012 12:46:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ndcv1BbcFSmS; Fri,  7 Sep 2012 12:46:44 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 6D1165BCA10;
	Fri,  7 Sep 2012 12:46:44 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2012 12:46:33 +0200
Message-Id: <1347014793-27837-1-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][meta-systemd][PATCH] dnsmasq: add systemd service scripts for dnsmasq
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
X-List-Received-Date: Fri, 07 Sep 2012 10:59:08 -0000

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 .../dnsmasq/dnsmasq/dnsmasq.service                |   13 +++++++++++++
 .../dnsmasq/dnsmasq_2.55.bbappend                  |   10 ++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
new file mode 100644
index 0000000..c9c7f9d
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=DNS forwarder and DHCP server
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/dnsmasq.pid
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecReload=kill -HUP $(cat /run/dnsmasq.pid)
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
new file mode 100644
index 0000000..0a9c77e
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://dnsmasq.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "dnsmasq.service"
-- 
1.7.9.5



