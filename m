Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgPB-0000Bf-5B
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:37 +0200
Received: (qmail 27987 invoked by uid 813007); 22 Jun 2009 09:54:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:54 +0200
Message-Id: <1245664435-30183-11-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [STABLE][PATCH 034/125] fixes wrong license value usage for GPLv2
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:37 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/xfce.bbclass                  |    2 +-
 recipes/gnash/gnash-minimal.inc       |    2 +-
 recipes/gnash/gnash.inc               |    2 +-
 recipes/linphone/linphone_1.3.99.8.bb |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/xfce.bbclass b/classes/xfce.bbclass
index 48e012e..b18313f 100644
--- a/classes/xfce.bbclass
+++ b/classes/xfce.bbclass
@@ -5,7 +5,7 @@
 # Global class to make it easier to maintain XFCE packages
 
 HOMEPAGE = "http://www.xfce.org"
-LICENSE = "LGPL-2"
+LICENSE = "LGPLv2"
 DEPENDS += "startup-notification"
 
 XFCE_VERSION = ${PV}
diff --git a/recipes/gnash/gnash-minimal.inc b/recipes/gnash/gnash-minimal.inc
index a8e5229..5a8a91e 100644
--- a/recipes/gnash/gnash-minimal.inc
+++ b/recipes/gnash/gnash-minimal.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF v7 features"
 HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPL-2"
+LICENSE = "GPLv2"
 
 DEPENDS = "virtual/libiconv virtual/libintl libtool agg libxml2 zlib boost jpeg pango curl freetype \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg libmad', d)}"
diff --git a/recipes/gnash/gnash.inc b/recipes/gnash/gnash.inc
index 3602f6f..ea20524 100644
--- a/recipes/gnash/gnash.inc
+++ b/recipes/gnash/gnash.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF v7 features"
 HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPL-2"
+LICENSE = "GPLv2"
 DEPENDS = "giflib libtool gtk+ cairo libxml2 libsdl-mixer zlib boost jpeg pango curl freetype \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg libmad', d)}"
           
diff --git a/recipes/linphone/linphone_1.3.99.8.bb b/recipes/linphone/linphone_1.3.99.8.bb
index f96bd66..4e9b130 100644
--- a/recipes/linphone/linphone_1.3.99.8.bb
+++ b/recipes/linphone/linphone_1.3.99.8.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "SIP-based IP phone (Console edition)"
 HOMEPAGE = "http://www.linphone.org/?lang=us"
-LICENSE = "GPL-2"
+LICENSE = "GPLv2"
 DEPENDS = "libosip2 speex libogg alsa-lib readline"
 PR = "r0"
 
-- 
1.6.3.1





