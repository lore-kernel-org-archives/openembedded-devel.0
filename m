Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TupFQ-0006v2-4p
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 19:59:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0EIhk9I012758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 10:43:46 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 14 Jan 2013 10:43:43 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Jan 2013 20:42:56 +0200
Message-ID: <1358188976-14581-4-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][meta-systemd][PATCH 4/4] xorg-xserver: Add systemd service
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
X-List-Received-Date: Mon, 14 Jan 2013 18:59:07 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../xorg-xserver/xserver-xorg/X.service            |   10 ++++++++++
 .../xorg-xserver/xserver-xorg_1.13.1.bbappend      |   10 ++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100755 meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg/X.service
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bbappend

diff --git a/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg/X.service b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg/X.service
new file mode 100755
index 0000000..7e900ff
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg/X.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=X Server
+
+[Service]
+Type=simple
+ExecStartPre=-/bin/rm -rf /var/log/Xorg*
+ExecStart=/usr/bin/X
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bbappend b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bbappend
new file mode 100644
index 0000000..a3eb98c
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI_append = " file://X.service "
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "X.service"
-- 
1.7.5.4



