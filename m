Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TupF3-0006u2-3W
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 19:58:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0EIhMMX012752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 10:43:22 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 14 Jan 2013 10:43:20 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Jan 2013 20:42:53 +0200
Message-ID: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][meta-systemd][PATCH 1/4] bluez4: Package systemd service
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
X-List-Received-Date: Mon, 14 Jan 2013 18:58:48 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../bluez/bluez4_4.101.bbappend                    |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
new file mode 100644
index 0000000..8945a6d
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -0,0 +1,9 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "bluetooth.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.5.4



