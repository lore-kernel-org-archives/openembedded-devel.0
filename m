Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MPQn9-0000P5-BD
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 02:50:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5302E505C54;
	Fri, 10 Jul 2009 20:37:20 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28707-10; Fri, 10 Jul 2009 20:37:20 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 3441E505C56; Fri, 10 Jul 2009 20:37:20 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 683B1505C1D;
	Fri, 10 Jul 2009 20:37:19 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 62577A26460; Fri, 10 Jul 2009 20:37:19 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2009 20:37:00 -0400
Message-Id: <1247272621-26730-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247272621-26730-2-git-send-email-msmith@cbnco.com>
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
	<1247272621-26730-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/4] hicolor-icon-theme: don't inherit gnome
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
X-List-Received-Date: Sat, 11 Jul 2009 00:50:15 -0000

inherit autotools instead, so the theme doesn't end up depending
on gconf and gnome-common.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.10.bb  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
index a1cb41b..b09f8a9 100644
--- a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
+++ b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
@@ -1,6 +1,6 @@
 SECTION = "unknown"
 LICENSE = "GPL"
-inherit gnome
+inherit autotools
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${P}.tar.gz"
 
-- 
1.6.3



