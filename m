Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OihuN-0005oF-Ux
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 08:02:14 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id EDCBA80C52A; Tue, 10 Aug 2010 08:01:40 +0200 (CEST)
Received: from localhost (unknown [82.113.106.4])
	by gravedo.de (Postfix) with ESMTPSA id D0E0280C4FF;
	Tue, 10 Aug 2010 08:01:39 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 08:01:32 +0200
Message-Id: <1281420092-883-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1281420092-883-1-git-send-email-morphis@gravedo.de>
References: <1281420092-883-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] tzdata: bump version to 2010k
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
X-List-Received-Date: Tue, 10 Aug 2010 06:02:15 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/tzdata/tzdata_2010j.bb |   10 ----------
 recipes/tzdata/tzdata_2010k.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/tzdata/tzdata_2010j.bb
 create mode 100644 recipes/tzdata/tzdata_2010k.bb

diff --git a/recipes/tzdata/tzdata_2010j.bb b/recipes/tzdata/tzdata_2010j.bb
deleted file mode 100644
index 79b7769..0000000
--- a/recipes/tzdata/tzdata_2010j.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require tzdata.inc
-
-# Note that elsie.nci.nih.gov removes old archives when new is being
-# released. So if this doesn't build for you because of missing source file
-# just bump it to the latest available version, removing old one
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tar.md5sum] = "f668f66b260e14b477eac3f48bcfb5f4"
-SRC_URI[tar.sha256sum] = "dcf2101d0c5bb20a7f182866ea3e52b54c8f4d129c025a96c9a31377676f554b"
diff --git a/recipes/tzdata/tzdata_2010k.bb b/recipes/tzdata/tzdata_2010k.bb
new file mode 100644
index 0000000..216ae75
--- /dev/null
+++ b/recipes/tzdata/tzdata_2010k.bb
@@ -0,0 +1,10 @@
+require tzdata.inc
+
+# Note that elsie.nci.nih.gov removes old archives when new is being
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing old one
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tar.md5sum] = "5e2086249d6a6bb116534d358661ad3f"
+SRC_URI[tar.sha256sum] = "ef69c99504c0fd9864ba8ef1daae5f2d4df097cf7dc350f09b8f70386272408d"
-- 
1.7.0.4



