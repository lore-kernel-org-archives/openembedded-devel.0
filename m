Received: from mail.codelabs.ch ([217.150.249.120] helo=fenrir.codelabs.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@codelabs.ch>) id 1O8K2k-0001wp-5e
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 23:16:13 +0200
X-Virus-Scanned: by codelabs.ch
Received: from localhost.localdomain (244-43-239-77-pool.cable.fcom.ch
	[77.239.43.244])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by fenrir.codelabs.ch (Postfix) with ESMTPSA id 9F75262C6F;
	Sat,  1 May 2010 23:05:22 +0200 (CEST)
From: Adrian-Ken Rueegsegger <ken@codelabs.ch>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 May 2010 23:12:18 +0200
Message-Id: <1272748338-23051-2-git-send-email-ken@codelabs.ch>
In-Reply-To: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
References: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
X-SA-Exim-Connect-IP: 217.150.249.120
X-SA-Exim-Mail-From: ken@codelabs.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] tzdata: update to latest version (2010i).
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
X-List-Received-Date: Sat, 01 May 2010 21:16:13 -0000

Signed-off-by: Adrian-Ken Rueegsegger <ken@codelabs.ch>
---
 recipes/tzdata/tzdata_2010h.bb |   10 ----------
 recipes/tzdata/tzdata_2010i.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/tzdata/tzdata_2010h.bb
 create mode 100644 recipes/tzdata/tzdata_2010i.bb

diff --git a/recipes/tzdata/tzdata_2010h.bb b/recipes/tzdata/tzdata_2010h.bb
deleted file mode 100644
index 1e00fd3..0000000
--- a/recipes/tzdata/tzdata_2010h.bb
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
-SRC_URI[tar.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
-SRC_URI[tar.sha256sum] = "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
diff --git a/recipes/tzdata/tzdata_2010i.bb b/recipes/tzdata/tzdata_2010i.bb
new file mode 100644
index 0000000..fbd0d7d
--- /dev/null
+++ b/recipes/tzdata/tzdata_2010i.bb
@@ -0,0 +1,10 @@
+require tzdata.inc
+
+# Note that elsie.nci.nih.gov removes old archives when new is being
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing old one
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tar.md5sum] = "4d2a90afd5bffe8df97f3def245e178e"
+SRC_URI[tar.sha256sum] = "bee0a26cca54db3413416d968c0a6361d83188b112d2512559d0e3602f254dc3"
-- 
1.7.0.2



