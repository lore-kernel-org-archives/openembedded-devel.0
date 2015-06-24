Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2ECF759E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:27:50 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5OFRpir025663
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 24 Jun 2015 08:27:51 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z7maI-0005rx-Ri; Wed, 24 Jun 2015 11:27:30 -0400
Date: Wed, 24 Jun 2015 11:27:30 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org, amy.fong@windriver.com
Message-ID: <20150624152730.GA22543@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-java] [PATCH] cacao-initial-native build issues on gcc 4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jun 2015 15:27:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 460ba5f0f8d995e430608ae41eb6527da61bcb3e Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 23 Jun 2015 17:13:58 -0400
Subject: [PATCH] cacao-initial-native build issues on gcc 4.4

The following error is seen when cacao-initial is built with gcc 4.4:

  LOG: [0x00007f595fed3700] We received a SIGSEGV and tried to handle it, but we were |
  LOG: [0x00007f595fed3700] unable to find a Java method at: |
  LOG: [0x00007f595fed3700] |
  LOG: [0x00007f595fed3700] PC=0x0000000000459a37 |
  LOG: [0x00007f595fed3700] |
  LOG: [0x00007f595fed3700] Dumping the current stacktrace: |
          at java.lang.String.<clinit>()V(String.java:185) |
  LOG: [0x00007f595fed3700] Exiting... |
  Aborted (core dumped)

Adapting fix from the following (add -fno-strict-aliasing to CFLAGS):

  2009-06-24 Andrew John Hughes <ahughes@redhat.com>

  * patches/cacao/no-strict-aliasing.patch:
  New patch to fix CACAO build on GCC 4.4 (see PR129).
  * Makefile.am: Add new patch.
  * HACKING: Update.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-core/cacao/cacao-initial-native_0.98.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
index 72c6246..0b49a35 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -40,3 +40,8 @@ do_configure_append() {
 
 SRC_URI[md5sum] = "8b8907c8b925761c9410bcadb9705346"
 SRC_URI[sha256sum] = "cb9363add825cedf77764fc49a223aaf43f0a9f485b711ba8c92f16b13fff188"
+
+do_configure_prepend() {
+        export CFLAGS="${CFLAGS} -fno-strict-aliasing"
+}
+
-- 
2.1.4


