Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QEQbW-00032C-AN
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:33:50 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QEQZ7-0004zM-EY from Tom_Rini@mentor.com ;
	Mon, 25 Apr 2011 11:31:21 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 11:31:21 -0700
Received: from localhost.localdomain ([172.30.80.238]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Apr 2011 12:31:20 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 11:31:13 -0700
Message-Id: <1303756273-22385-4-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 25 Apr 2011 18:31:20.0543 (UTC)
	FILETIME=[F8FFA6F0:01CC0376]
Cc: koen@dominion.thruhere.net
Subject: [PATCH 3/3] bluez4: Add 4.91 and make it default for Angstrom
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
X-List-Received-Date: Mon, 25 Apr 2011 18:33:50 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/bluez/bluez4_4.91.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.91.bb

diff --git a/recipes/bluez/bluez4_4.91.bb b/recipes/bluez/bluez4_4.91.bb
new file mode 100644
index 0000000..16f06d5
--- /dev/null
+++ b/recipes/bluez/bluez4_4.91.bb
@@ -0,0 +1,18 @@
+require bluez4.inc
+
+SRC_URI[md5sum] = "3059b7ef5168c84cd0c6a67034ce79f9"
+SRC_URI[sha256sum] = "11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842a0bbcad8a4eac18d"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_angstrom = "1"
+
+DEPENDS += "libsndfile1"
+
+PR = "${INC_PR}.0"
+
+# Not all distros have a recent enough udev
+BTUDEV = " --disable-udevrules"
+BTUDEV_angstrom = " --enable-udevrules"
+BTUDEV_shr = " --enable-udevrules"
+
+EXTRA_OECONF += "${BTUDEV}"
-- 
1.7.0.4



