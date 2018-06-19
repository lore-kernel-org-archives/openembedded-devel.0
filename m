Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B1B1E75537
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:08:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,243,1526335200"; d="scan'208";a="10922185"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 15:08:41 +0200
Message-ID: <20180619130841.7044-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] TODO: add file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 13:08:31 -0000
Content-Type: text/plain

Add a new "TODO" file listing issues which should be done in the future
and mention it in the README file.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README |  3 ++-
 TODO   | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 TODO

diff --git a/README b/README
index b66df64..325cbc6 100644
--- a/README
+++ b/README
@@ -26,7 +26,8 @@ mailing list (openembedded-devel@lists.openembedded.org).
 Please refer to:
 https://wiki.yoctoproject.org/wiki/Contribution_Guidelines#General_Information
 
-for some useful guidelines to be followed when submitting patches.
+for some useful guidelines to be followed when submitting patches and the TODO
+file for some open points that should be done.
 
 Mailing list:
 
diff --git a/TODO b/TODO
new file mode 100644
index 0000000..810aa00
--- /dev/null
+++ b/TODO
@@ -0,0 +1,26 @@
+meta-java TODOs
+===============
+
+Bugfixes
+--------
+  * Fix OpenJDK 7 JIT (mixed & compiled mode) for x86
+
+  * Fix OpenJDK 8 JIT (mixed & compiled mode) for x86
+
+  * Fix do_package_qa issue for openjdk-{7,8}: libjvm.so has relocations in .text [textrel]
+
+
+Updates
+-------
+  * Update OpenJDK 7 to latest version
+
+    * except for arm as the JIT currently doesn't work there (http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=2942)
+
+  * Update OpenJDK 8 to latest version
+
+
+Features
+--------
+  * Add recipes for OpenJDK >8
+
+  * Add oeqa runtime tests for all relevant cases as quality gates
-- 
2.11.0


