Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P2jrs-0004WB-Lf
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 14:10:27 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id F23B8491286
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 14:09:49 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 4 Oct 2010 14:09:49 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 79C2D2DA65; Mon,  4 Oct 2010 14:09:54 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Oct 2010 14:09:52 +0200
Message-Id: <1286194192-22256-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <i8cf7aMAN_POSIXLY_CORRECT=1@dough.gmane.org>
References: <i8cf7aMAN_POSIXLY_CORRECT=1@dough.gmane.org>
X-OriginalArrivalTime: 04 Oct 2010 12:09:49.0688 (UTC)
	FILETIME=[0B211F80:01CB63BD]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v4] epiphany-2.30.2: unbreak build by adding ca-certificates dependencies
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
X-List-Received-Date: Mon, 04 Oct 2010 12:11:44 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/gnome/epiphany_2.30.2.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
index 426d468..6422c74 100644
--- a/recipes/gnome/epiphany_2.30.2.bb
+++ b/recipes/gnome/epiphany_2.30.2.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "GNOME default webbrowser"
-DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
+LICENSE = "GPLv2"
+DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification ca-certificates"
 RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
-PR = "r2"
+RRECOMMENDS_${PN} = "ca-certificates"
+PR = "r3"
 
 inherit gnome
 
-- 
1.7.1



