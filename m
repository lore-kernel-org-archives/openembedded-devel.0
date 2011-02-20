Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrAw0-0006lM-Ui
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:10:53 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrAum-00064D-PM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 07:09:36 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 07:09:36 -0800
Received: from localhost.localdomain ([172.30.80.150]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 08:09:35 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 08:09:18 -0700
Message-Id: <1298214559-9650-4-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 20 Feb 2011 15:09:35.0582 (UTC)
	FILETIME=[2F712FE0:01CBD110]
Subject: [PATCH 3/4] slugos: Pin gvfs to 1.6.6
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
X-List-Received-Date: Sun, 20 Feb 2011 15:10:53 -0000

We're doing this since glib-2.0 is pinned.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 conf/distro/include/preferred-slugos-versions.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index cde3eb0..4f1033c 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -32,6 +32,7 @@ PREFERRED_VERSION_glib-2.0			?= "2.26.1"
 PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
 PREFERRED_VERSION_gtk+				?= "2.18.6"
 PREFERRED_VERSION_gtk+-native			?= "2.18.6"
+PREFERRED_VERSION_gvfs				?= "1.6.6"
 PREFERRED_VERSION_ipkg				?= "0.99.163"
 PREFERRED_VERSION_ipkg-native			?= "0.99.163"
 PREFERRED_VERSION_linux-libc-headers		?= "2.6.31"
-- 
1.7.0.4



