Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr9-0001JN-CL
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:20 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181069eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=hQ5wezlqxmXoVxEqGjr2o7zl8N1MDiD2uuT1HxIeazY=;
	b=arYeXDNF8J33D7doKaZd002W48fWdjTiW1PvMF3PwMLv2BzbZTpCNzIlVsAhf7tZok
	dc4Cd0KLMmSj4vosZkPuiB8f8cbkKR/uEvbwCcsly2kn1kYdq1M7jGHsSA48j+avAaF6
	LZaDDKx2gcMd8yU6sIV+z8K6lSIRFPnVustHw=
Received: by 10.14.99.7 with SMTP id w7mr5741699eef.130.1328627599359;
	Tue, 07 Feb 2012 07:13:19 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:51 +0100
Message-Id: <1328627573-5217-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 25/27] dhcp: add native support for dhcp-relay / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   16 +++++-----------
 .../dhcp/files/dhcrelay.service                    |   10 ++++++++++
 2 files changed, 15 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service

diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
index d47f1ce..556dba1 100644
--- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
+++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
@@ -1,19 +1,13 @@
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/files"
 
+PRINC = "1"
+
 inherit systemd
 
 SYSTEMD_PACKAGES = "dhcp-server-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
+SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
 
-SRC_URI += "file://dhcpd.service"
-
-do_install_append() {
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/dhcpd.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "dhcp-server-systemd"
-
-FILES_dhcp-server-systemd += "${base_libdir}/systemd"
-RDEPENDS_dhcp-server-systemd += "dhcp-server"
+SRC_URI += "file://dhcpd.service \
+            file://dhcrelay.service"
diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
new file mode 100644
index 0000000..f68f468
--- /dev/null
+++ b/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DHCP Relay Agent Daemon
+After=syslog.target network.target
+
+[Service]
+EnvironmentFile=/etc/default/dhcp-relay
+ExecStart=/usr/sbin/dhcrelay -d $DHCRELAYARGS
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.6.4



