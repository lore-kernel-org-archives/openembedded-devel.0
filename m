Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF276FFEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 10:03:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBGA3YIT025510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 02:03:34 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Dec 2015 02:03:33 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Dec 2015 18:03:43 +0800
Message-ID: <1450260223-19633-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] cacao-initial-native build issues on gcc 4.4
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
X-List-Received-Date: Wed, 16 Dec 2015 10:03:41 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

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
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/cacao/cacao-initial-native_0.98.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
index 2a8ced5..a26e686 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -41,3 +41,8 @@ do_configure_append() {
 
 SRC_URI[md5sum] = "8b8907c8b925761c9410bcadb9705346"
 SRC_URI[sha256sum] = "cb9363add825cedf77764fc49a223aaf43f0a9f485b711ba8c92f16b13fff188"
+
+do_configure_prepend() {
+        export CFLAGS="${CFLAGS} -fno-strict-aliasing"
+}
+
-- 
2.3.5


