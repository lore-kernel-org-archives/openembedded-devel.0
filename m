Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Neu5R-0007d3-Kf
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 18:41:24 +0100
Received: (qmail 9421 invoked by uid 813007); 9 Feb 2010 17:38:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 9 Feb 2010 17:38:50 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 18:38:18 +0100
Message-Id: <1265737098-5430-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] file: added 5.04 (WIP)
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
X-List-Received-Date: Tue, 09 Feb 2010 17:41:25 -0000

- BBCLASSEXTEND used for native version
- DEPENDS = "file-native" needs to be added for target package

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/file/file_5.04.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/file/file_5.04.bb

diff --git a/recipes/file/file_5.04.bb b/recipes/file/file_5.04.bb
new file mode 100644
index 0000000..ed00759
--- /dev/null
+++ b/recipes/file/file_5.04.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "File attempts to classify files depending \
+on their contents and prints a description if a match is found."
+SECTION = "console/utils"
+LICENSE = "BSD-ADV"
+
+SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+DEFAULT_PREFERENCE = "5"
-- 
1.6.6.1





