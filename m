Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Oitsv-0007nx-JQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 20:49:29 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id C4CE180C527; Tue, 10 Aug 2010 20:49:02 +0200 (CEST)
Received: from localhost (p5489A930.dip.t-dialin.net [84.137.169.48])
	by gravedo.de (Postfix) with ESMTPSA id 1226780C4FF;
	Tue, 10 Aug 2010 20:49:00 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 20:48:50 +0200
Message-Id: <1281466130-5731-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1281420092-883-1-git-send-email-morphis@gravedo.de>
References: <1281420092-883-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] tzcode-native: bump version to 2010k
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
X-List-Received-Date: Tue, 10 Aug 2010 18:50:36 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/tzcode/tzcode-native_2010j.bb |   16 ----------------
 recipes/tzcode/tzcode-native_2010k.bb |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2010j.bb
 create mode 100644 recipes/tzcode/tzcode-native_2010k.bb

diff --git a/recipes/tzcode/tzcode-native_2010j.bb b/recipes/tzcode/tzcode-native_2010j.bb
deleted file mode 100644
index 7e1ae77..0000000
--- a/recipes/tzcode/tzcode-native_2010j.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tzcode-native.inc
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2010j"
-
-SRC_URI[tzcode-2010j.md5sum] = "5ba8345720296d3a659b349b2052d139"
-SRC_URI[tzcode-2010j.sha256sum] = "f32b46405190e3a5f1ee4db9fb50aaf1379e6af4e5493402ebfc8ee757058e97"
-SRC_URI[tzdata-2010j.md5sum] = "f668f66b260e14b477eac3f48bcfb5f4"
-SRC_URI[tzdata-2010j.sha256sum] = "dcf2101d0c5bb20a7f182866ea3e52b54c8f4d129c025a96c9a31377676f554b"
-
-PR = "${INC_PR}.0"
diff --git a/recipes/tzcode/tzcode-native_2010k.bb b/recipes/tzcode/tzcode-native_2010k.bb
new file mode 100644
index 0000000..21796d6
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2010k.bb
@@ -0,0 +1,16 @@
+require tzcode-native.inc
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2010k"
+
+SRC_URI[tzcode-2010k.md5sum] = "63cd2199679c91bed972a0248d6916af"
+SRC_URI[tzcode-2010k.sha256sum] = "96671eac3a98d0c974833c8bfa7ea9b537cc9d32573e902103846b90f6dccdbd"
+SRC_URI[tzdata-2010k.md5sum] = "5e2086249d6a6bb116534d358661ad3f"
+SRC_URI[tzdata-2010k.sha256sum] = "ef69c99504c0fd9864ba8ef1daae5f2d4df097cf7dc350f09b8f70386272408d"
+
+PR = "${INC_PR}.0"
-- 
1.7.0.4



