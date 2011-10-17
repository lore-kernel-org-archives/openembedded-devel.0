Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RFr02-0003n9-Ui
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 19:29:19 +0200
Received: by eyd9 with SMTP id 9so3120202eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 10:23:30 -0700 (PDT)
Received: by 10.213.14.71 with SMTP id f7mr595574eba.137.1318872209250;
	Mon, 17 Oct 2011 10:23:29 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z58sm765322eea.3.2011.10.17.10.23.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 10:23:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 19:23:19 +0200
Message-Id: <1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
References: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-xfce 2/4] xfce-panel-plugin: bbclass for panel plugins
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
X-List-Received-Date: Mon, 17 Oct 2011 17:29:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-xfce/classes/xfce-panel-plugin.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/classes/xfce-panel-plugin.bbclass

diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
new file mode 100644
index 0000000..495d0b1
--- /dev/null
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -0,0 +1,10 @@
+inherit xfce
+
+DEPENDS += "libxfcegui4 libxfce4util xfce4-panel"
+
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+
+FILES_${PN} += "${datadir}/xfce4/panel-plugins/"
+FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
+
+
-- 
1.6.6.1



