Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TupFH-0006ut-2H
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 19:59:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0EIhYm8025677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 10:43:34 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 14 Jan 2013 10:43:34 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Jan 2013 20:42:55 +0200
Message-ID: <1358188976-14581-3-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][meta-systemd][PATCH 3/4] portmap: Add systemd service
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
X-List-Received-Date: Mon, 14 Jan 2013 18:59:04 -0000
X-List-Received-Date: Mon, 14 Jan 2013 18:59:04 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../portmap/portmap/portmap.service                |   10 ++++++++++
 .../portmap/portmap_6.0.bbappend                   |   11 +++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/portmap/portmap/portmap.service
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/portmap/portmap_6.0.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/portmap/portmap/portmap.service b/meta-systemd/meta-oe/recipes-connectivity/portmap/portmap/portmap.service
new file mode 100644
index 0000000..cffb56c
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/portmap/portmap/portmap.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Portmap
+
+[Service]
+Type=oneshot
+ExecStart=/sbin/portmap -l
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/portmap/portmap_6.0.bbappend
new file mode 100644
index 0000000..c0276a3
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "portmap.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+SRC_URI_append = " file://portmap.service"
-- 
1.7.5.4



