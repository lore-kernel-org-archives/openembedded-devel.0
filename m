Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1R3SX6-0004vx-GD
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 14:56:12 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R3SS8-0003Le-Kq from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 05:51:04 -0700
Received: from localhost.localdomain ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 13 Sep 2011 14:51:03 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2011 17:49:48 +0500
Message-Id: <4f19ed0177ac717d462981b37219a062fa46dffd.1315914262.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1315914262.git.Imran_Mehmood@mentor.com>
References: <cover.1315914262.git.Imran_Mehmood@mentor.com>
In-Reply-To: <cover.1315914262.git.Imran_Mehmood@mentor.com>
References: <cover.1315914262.git.Imran_Mehmood@mentor.com>
X-OriginalArrivalTime: 13 Sep 2011 12:51:03.0466 (UTC)
	FILETIME=[CBB7B0A0:01CC7213]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH 1/1] twm: add recipe version 1.0.6 (initial recipe)
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
X-List-Received-Date: Tue, 13 Sep 2011 12:56:12 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

 * Imported from oe.dev commit id d90ee2735e9aa9d1a8dd7d0eb6a5917030a233d3


Signed-off-by: Imran Mehmood <Imran_Mehmood@mentor.com>
---
 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
new file mode 100644
index 0000000..d5105c0
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
@@ -0,0 +1,18 @@
+require xorg-app-common.inc
+DESCRIPTION = "tiny window manager"
+DEPENDS += " libxext libxt libxmu"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "952d06a0c2ec34687b536c7b619fc671"
+SRC_URI[archive.sha256sum] = "e7dccad7879a7570442f0cd9df0b9064e926466b5a52b710fca8cfb167f294e9"
+
+FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/twm"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "1"
-- 
1.7.0.4



