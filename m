Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1U2gXq-0001yA-MF
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 12:18:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15B2gU3005884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Feb 2013 03:02:42 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 5 Feb 2013 03:02:30 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Feb 2013 13:02:19 +0200
Message-ID: <1360062139-10894-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][meta-systemd][PATCH] wpa-supplicant: Add bbappend to package systemd service in a -systemd package
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
X-List-Received-Date: Tue, 05 Feb 2013 11:19:12 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../wpa-supplicant/wpa-supplicant_2.0.bbappend     |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
new file mode 100644
index 0000000..d286689
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
@@ -0,0 +1,7 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "wpa_supplicant.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.5.4



