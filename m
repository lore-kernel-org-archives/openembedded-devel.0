Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1RJOEr-0006sL-HE
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 13:35:13 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1RJO94-00012K-PS from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 04:29:14 -0700
Received: from localhost.localdomain ([137.202.156.87]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 27 Oct 2011 13:29:13 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Oct 2011 16:28:35 +0500
Message-Id: <e47e61f0299e7aeb267452a50cde4441ad72118f.1319713297.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319713297.git.Imran_Mehmood@mentor.com>
References: <cover.1319713297.git.Imran_Mehmood@mentor.com>
In-Reply-To: <cover.1319713297.git.Imran_Mehmood@mentor.com>
References: <cover.1319713297.git.Imran_Mehmood@mentor.com>
X-OriginalArrivalTime: 27 Oct 2011 11:29:13.0930 (UTC)
	FILETIME=[A794F2A0:01CC949B]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH v2 1/1] xclock: Add version 1.0.5 (initial recipe)
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
X-List-Received-Date: Thu, 27 Oct 2011 11:35:13 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

    * Imported from oe.dev commit id 6e7e35679200cd55264fae308cd5dec7ef2d1d29

Signed-off-by: Imran Mehmood <Imran_Mehmood@mentor.com>
---
 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
new file mode 100644
index 0000000..f50b74e
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
@@ -0,0 +1,12 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+DESCRIPTION = "analog / digital clock for X"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=857759ade8f2ddde5c7b32ef7356ea36"
+
+DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
+
+SRC_URI[md5sum] = "eaf124bbc9d13e1a12a29faaa2ed3612"
+SRC_URI[sha256sum] = "53a9169e24f3814fbfcfee3ca0b98637840a3156ed7c7e36ae03940fabae4c9a"
+FILES_${PN} += " /usr/share/X11/app-defaults/"
+
-- 
1.7.0.4



