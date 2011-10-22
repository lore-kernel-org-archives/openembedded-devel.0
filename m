Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RHamz-0002C6-OR
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 14:35:13 +0200
Received: from iph4.telenor.se (iph4.telenor.se [195.54.127.135])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 80EF4EAB2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2011 14:28:58 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgSAAPa1ok5T4zkNPGdsb2JhbABDiTyQZo5+GQEBAQE3MoFuAVEBCiMwH0sKLYgCpQMBjRSIQASUCYhpiHQ
X-IronPort-AV: E=Sophos;i="4.69,391,1315173600"; d="scan'208";a="1992070019"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	nazgul.atmel.com) ([83.227.57.13])
	by iph4.telenor.se with ESMTP; 22 Oct 2011 14:28:58 +0200
From: ulf_samuelsson@telia.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Oct 2011 14:28:55 +0200
Message-Id: <1319286535-2935-1-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Ulf Samuelsson <ulf_samuelsson@telia.com>,
	Ulf Samuelsson <ulf.samuelsson@telia.com>
Subject: [PATCH] freetype_2.4.3.bb; Change order of configuration.
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
X-List-Received-Date: Sat, 22 Oct 2011 12:35:13 -0000

From: Ulf Samuelsson <ulf_samuelsson@telia.com>

Build of freetype-native is broken on Ubuntu 11.10 x64 - possible others.
Problem fixed in openembedded-core 2.4.4 recipe
Backporting the change will allow the build to complete.

openembedded-core-contrib/meta/recipes-graphics/freetype

Signed-Off-By: Ulf Samuelsson <ulf.samuelsson@telia.com>
---
 recipes/freetype/freetype_2.4.3.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/freetype/freetype_2.4.3.bb b/recipes/freetype/freetype_2.4.3.bb
index 66d2e51..dfc1b43 100644
--- a/recipes/freetype/freetype_2.4.3.bb
+++ b/recipes/freetype/freetype_2.4.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
 LICENSE = "freetype GPLv2"
-PR = "r1"
+PR = "r2"
 DEPENDS = "zlib"
 
 SRC_URI = "\
@@ -23,9 +23,9 @@ LDFLAGS_append = " -Wl,-rpath-link -Wl,${STAGING_DIR_TARGET}${libdir}"
 
 do_configure() {
 	cd builds/unix
-	gnu-configize --force
-	aclocal -I .
 	libtoolize --force --copy
+	aclocal -I .
+	gnu-configize --force
 	autoconf
 	cd ${S}
 	oe_runconf
-- 
1.7.5.4



