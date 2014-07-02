Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E63E6AC66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:57:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626vj4m016249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:57:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:57:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:56:33 -0700
Message-ID: <1404284261-42377-7-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome] [PATCH 06/74] gnome-mplayer: use BPN in SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jul 2014 06:57:49 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index 4be94c5..c5ac6e2 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -10,7 +10,7 @@ PR = "r2"
 
 DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
+SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
 SRC_URI[md5sum] = "1d3ab24c5501b5528e357931ca4dc6da"
 SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a340f61b2"
 
-- 
1.7.9.5


