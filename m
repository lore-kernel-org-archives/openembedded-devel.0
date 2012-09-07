Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9wPN-0003Na-4q
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 13:07:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id E2F575BCA11;
	Fri,  7 Sep 2012 12:55:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UrhRTFS0867c; Fri,  7 Sep 2012 12:55:09 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id C754A5BCA10;
	Fri,  7 Sep 2012 12:55:08 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2012 12:54:53 +0200
Message-Id: <1347015293-28038-1-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1347014793-27837-1-git-send-email-sander@outrightsolutions.nl>
References: <1347014793-27837-1-git-send-email-sander@outrightsolutions.nl>
Subject: [meta-oe][meta-systemd][PATCH v2] dnsmasq: add systemd service scripts for dnsmasq
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
X-List-Received-Date: Fri, 07 Sep 2012 11:07:33 -0000

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 .../dnsmasq/dnsmasq/dnsmasq.service                |   13 +++++++++++++
 .../dnsmasq/dnsmasq_2.55.bbappend                  |   10 ++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
new file mode 100644
index 0000000..98bdbbc
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
+ExecReload=kill -HUP $(/bin/cat /run/dnsmasq.pid)
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



