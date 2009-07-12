Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MQ6Vl-0004SN-3j
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 23:23:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 147CB506B8D;
	Sun, 12 Jul 2009 17:09:58 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22254-04; Sun, 12 Jul 2009 17:09:58 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E861C506DE7; Sun, 12 Jul 2009 17:09:57 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 08F52506B8D;
	Sun, 12 Jul 2009 17:09:55 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id F0B3C416FD; Sun, 12 Jul 2009 17:09:54 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Jul 2009 17:09:53 -0400
Message-Id: <1247432993-31708-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <Pine.LNX.4.64.0907121701300.3621@juice.ott.cti.com>
References: <Pine.LNX.4.64.0907121701300.3621@juice.ott.cti.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH v2] hicolor-icon-theme: don't inherit gnome
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
X-List-Received-Date: Sun, 12 Jul 2009 21:23:06 -0000

inherit autotools and gtk-icon-cache instead, so the theme doesn't
depend on gconf.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.10.bb  |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
index a1cb41b..db13279 100644
--- a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
+++ b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
@@ -1,6 +1,10 @@
 SECTION = "unknown"
 LICENSE = "GPL"
-inherit gnome
+inherit autotools gtk-icon-cache
+
+# Override RDEPENDS = hicolor-icon-theme from gtk-icon-cache
+RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${P}.tar.gz"
 
-- 
1.6.3



