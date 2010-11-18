Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1PIu1d-0006u9-82
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 03:15:01 +0100
Received: from localhost.localdomain (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 75AEB3041C;
	Wed, 17 Nov 2010 21:13:50 -0500 (EST)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 18:13:41 -0800
Message-Id: <1290046421-22553-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 75AEB3041C.A2CFE
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
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: [PATCH] tar: upgrade to version 1.25
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
X-List-Received-Date: Thu, 18 Nov 2010 02:15:02 -0000

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/tar/tar_1.23.bb |    6 ------
 recipes/tar/tar_1.25.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 recipes/tar/tar_1.23.bb
 create mode 100644 recipes/tar/tar_1.25.bb

diff --git a/recipes/tar/tar_1.23.bb b/recipes/tar/tar_1.23.bb
deleted file mode 100644
index dc37247..0000000
--- a/recipes/tar/tar_1.23.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require tar.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "41e2ca4b924ec7860e51b43ad06cdb7e"
-SRC_URI[sha256sum] = "c9328372db62fbb1d94c9e4e3cefc961111af46de47085b635359c00a0eebe36"
diff --git a/recipes/tar/tar_1.25.bb b/recipes/tar/tar_1.25.bb
new file mode 100644
index 0000000..c611f77
--- /dev/null
+++ b/recipes/tar/tar_1.25.bb
@@ -0,0 +1,6 @@
+require tar.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6e497f861c77bbba2f7da4e10270995b"
+SRC_URI[sha256sum] = "f3f6ce41b8e0f327abd05c95990f113ddafbae131e10f79a99728ed46458494b"
-- 
1.7.1



