Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51ABB79874
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 05:37:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8D5booq017753
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 22:37:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Sep 2018 22:37:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Sep 2018 13:37:36 +0800
Message-ID: <1536817056-344059-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] spice: fix compile error on 32bit system
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
X-List-Received-Date: Thu, 13 Sep 2018 05:37:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix below compile error on 32bit system,  since input argument
is uLong, but use format %d:
format '%d' expects argument of type 'int', but argument 6 has type
'long unsigned int' [-Werror=format=]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-spice-fix-compile-fail-problem.patch      | 36 ++++++++++++++++++++++
 meta-networking/recipes-support/spice/spice_git.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
new file mode 100644
index 0000000..1f9d5fd
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
@@ -0,0 +1,36 @@
+From 7023732c65b4dc509c46a54fb7715da275b5597f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 13 Sep 2018 12:39:44 +0800
+Subject: [PATCH] spice: fix compile fail problem
+
+compile error:
+format '%d' expects argument of type 'int', but argument 6 has 
+type 'long unsigned int' [-Werror=format=]
+
+spice compile failed on 32bit system, since upstream commit
+9541cd2fe(in V0.14.1) change %ld to %PRIdPTR, %PRIdPTR is %d, but argument
+strm.total_out is uLong.
+
+Upstream-Status: Submitted[https://github.com/freedesktop/spice/pull/1]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ server/red-replay-qxl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
+index 1fce76c..bd33b58 100644
+--- a/server/red-replay-qxl.c
++++ b/server/red-replay-qxl.c
+@@ -266,7 +266,7 @@ static replay_t read_binary(SpiceReplay *replay, const char *prefix, size_t *siz
+             exit(1);
+         }
+         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
+-            spice_error("inflate error %d (disc: %" PRIdPTR ")", ret, *size - strm.total_out);
++            spice_error("inflate error %d (disc: %ld)", ret, *size - strm.total_out);
+             if (ret == Z_DATA_ERROR) {
+                 /* last operation may be wrong. since we do the recording
+                  * in red_worker, when there is a shutdown from the vcpu/io thread
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 871bb0f..c7e4b03 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice;name=spice \
     git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
     file://0001-Convert-pthread_t-to-be-numeric.patch \
+    file://0001-spice-fix-compile-fail-problem.patch \
 "
 
 FOO = "\
-- 
2.7.4


