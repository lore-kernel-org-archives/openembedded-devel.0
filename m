Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N360w-0001uj-AB
	for openembedded-devel@openembedded.org; Wed, 28 Oct 2009 11:44:29 +0100
Received: (qmail 31201 invoked by uid 813007); 28 Oct 2009 10:43:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Oct 2009 10:43:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 11:45:58 +0100
Message-Id: <1256726758-22996-7-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 6/6] netcat: use update-alternatives as we have netcat in busybox too
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
X-List-Received-Date: Wed, 28 Oct 2009 10:44:29 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/netcat/netcat_0.7.1.bb |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes/netcat/netcat_0.7.1.bb b/recipes/netcat/netcat_0.7.1.bb
index c7ceccd..7c4dfc5 100644
--- a/recipes/netcat/netcat_0.7.1.bb
+++ b/recipes/netcat/netcat_0.7.1.bb
@@ -2,8 +2,17 @@ DESCRIPTION = "GNU Netcat"
 HOMEPAGE = "http://netcat.sourceforge.net"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
 
-inherit autotools
+inherit autotools update-alternatives
+
+do_install_append() {
+	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
+}
+
+ALTERNATIVE_NAME = "nc"
+ALTERNATIVE_LINK = "${bindir}/nc"
+ALTERNATIVE_PATH = "${bindir}/nc.${PN}"
+ALTERNATIVE_PRIORITY = "100"
-- 
1.6.5





