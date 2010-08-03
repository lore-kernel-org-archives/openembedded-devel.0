Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1Og8gz-0003nl-TH
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 06:01:30 +0200
Received: from localhost.localdomain (75-93-58-1.war.clearwire-wmx.net
	[75.93.58.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 5A322301F0;
	Tue,  3 Aug 2010 00:01:20 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Aug 2010 21:01:14 -0700
Message-Id: <1280808074-13861-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.7.0.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 5A322301F0.973A5
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Scott Garman <sgarman@zenlinux.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH] tar: Upgrade to v1.23
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
X-List-Received-Date: Tue, 03 Aug 2010 04:01:31 -0000

From: Scott Garman <scott.a.garman@intel.com>

* Addresses CVE-2010-0624

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/tar/tar_1.22.bb |    4 ----
 recipes/tar/tar_1.23.bb |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 recipes/tar/tar_1.22.bb
 create mode 100644 recipes/tar/tar_1.23.bb

diff --git a/recipes/tar/tar_1.22.bb b/recipes/tar/tar_1.22.bb
deleted file mode 100644
index 4863e84..0000000
--- a/recipes/tar/tar_1.22.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require tar.inc
-
-SRC_URI[md5sum] = "07fa517027f426bb80f5f5ff91b63585"
-SRC_URI[sha256sum] = "3cefb67f197a3f8f5235999fe749ced0889466a71ddcbc96fddca84e5d53aa4d"
diff --git a/recipes/tar/tar_1.23.bb b/recipes/tar/tar_1.23.bb
new file mode 100644
index 0000000..89a0243
--- /dev/null
+++ b/recipes/tar/tar_1.23.bb
@@ -0,0 +1,4 @@
+require tar.inc
+
+SRC_URI[md5sum] = "41e2ca4b924ec7860e51b43ad06cdb7e"
+SRC_URI[sha256sum] = "c9328372db62fbb1d94c9e4e3cefc961111af46de47085b635359c00a0eebe36"
-- 
1.7.0.4



