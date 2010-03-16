Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nrdvf-0003zn-Kj
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 22:03:59 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id DB3C314FA0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 22:00:52 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Agk7APKNn0tT4zvyPGdsb2JhbACbAwwBAQEBNy2sWY14hHYE
X-IronPort-AV: E=Sophos;i="4.49,652,1262559600"; d="scan'208";a="51327622"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 22:00:52 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 22:00:52 +0100
Message-Id: <1268773252-15145-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.21
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 1/1] gnome-mplayer: add dependency on libstdc++
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
X-List-Received-Date: Tue, 16 Mar 2010 21:03:59 -0000

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/gnome-mplayer/gnome-mplayer.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome-mplayer/gnome-mplayer.inc b/recipes/gnome-mplayer/gnome-mplayer.inc
index dc364ff..eaa4166 100644
--- a/recipes/gnome-mplayer/gnome-mplayer.inc
+++ b/recipes/gnome-mplayer/gnome-mplayer.inc
@@ -3,12 +3,12 @@ AUTHOR = "Kevin DeKorte <kdekorte@gmail.com>"
 HOMEPAGE = "http://code.google.com/p/gnome-mplayer/"
 SECTION = "x11/multimedia"
 LICENSE = "GPL"
-DEPENDS = "curl gtk+ gconf dbus-glib libmusicbrainz libgpod"
+DEPENDS = "libstdc++ curl gtk+ gconf dbus-glib libmusicbrainz libgpod "
 RDEPENDS = "mplayer"
 
 inherit gnome
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "http://gnome-mplayer.googlecode.com/files/${P}.tar.gz;name=gnomemplayer"
 
-- 
1.6.0.2



