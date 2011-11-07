Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNQMx-00019F-D7
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 15:40:15 +0100
Received: by ywf9 with SMTP id 9so5004558ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=nElk/bimzPjbYtdWPeXQl/W/oZeS7K11wZqIKj2KaGU=;
	b=apfJnT58IhUN0VaeMy3OdhRagB+RAD9Sq6K3weLwPxU5DSDCwbAyHosLnFVvs/lBUP
	jrdH6bhhL8bJEpMeTfeEgugN6W/n4Q2HP2HINfgpctOfinCeTrjl5OQLgAr9Lg2+D0If
	zIzIljnE8gPBCaJLAfpPS/Nefxo+CnnSW3734=
Received: by 10.236.75.167 with SMTP id z27mr34988876yhd.53.1320676441159;
	Mon, 07 Nov 2011 06:34:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l8sm56038679anb.1.2011.11.07.06.33.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:34:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Nov 2011 14:33:49 +0000
Message-Id: <c910d23fec8138319d3ff83ad37ba89469267b86.1320676389.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320676389.git.otavio@ossystems.com.br>
References: <cover.1320676389.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320676389.git.otavio@ossystems.com.br>
References: <cover.1320676389.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] dhcp: add system support to dhcp-server
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
X-List-Received-Date: Mon, 07 Nov 2011 14:40:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   19 +++++++++++++++++++
 .../recipes-connectivity/dhcp/files/dhcpd.service  |   12 ++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcpd.service

diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
new file mode 100644
index 0000000..d47f1ce
--- /dev/null
+++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
@@ -0,0 +1,19 @@
+# look for files in the layer first
+FILESEXTRAPATHS := "${THISDIR}/files"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "dhcp-server-systemd"
+SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
+
+SRC_URI += "file://dhcpd.service"
+
+do_install_append() {
+    install -d ${D}${base_libdir}/systemd/system
+    install -m 644 ${WORKDIR}/dhcpd.service ${D}${base_libdir}/systemd/system
+}
+
+PACKAGES =+ "dhcp-server-systemd"
+
+FILES_dhcp-server-systemd += "${base_libdir}/systemd"
+RDEPENDS_dhcp-server-systemd += "dhcp-server"
diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service b/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service
new file mode 100644
index 0000000..70beee9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Dynamic Host Configuration Protocol (DHCP)
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/dhcpd.pid
+EnvironmentFile=-/etc/default/dhcp-server
+ExecStart=/usr/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf -q $INTERFACES
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.2.5



