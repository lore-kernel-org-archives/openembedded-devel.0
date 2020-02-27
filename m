Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27445601DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 03:38:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01R3cupJ020632
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 19:38:56 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 26 Feb 2020 19:38:56 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 11:38:54 +0800
Message-ID: <1582774734-157200-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] cyrus-sasl: fix CVE-2019-19906
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
X-List-Received-Date: Thu, 27 Feb 2020 03:38:56 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch     | 35 ++++++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.27.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
new file mode 100644
index 0000000..b94780f
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
@@ -0,0 +1,35 @@
+From 94fe6eb9ea2691f4a7c32fbf2d0c7c454995b666 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Feb 2020 11:08:57 +0800
+Subject: [PATCH] Fix #587
+
+Off by one error in common.c, CVE-2019-19906.
+
+Thanks to Stephan Zeisberg for reporting
+
+CVE: CVE-2019-19906
+
+Upstream-Stauts: Backport [https://github.com/cyrusimap/cyrus-sasl
+/commit/dcc9f51cbd4ed622cfb0f9b1c141eb2ffe3b12f1]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/common.c b/lib/common.c
+index 305311d..445c5d5 100644
+--- a/lib/common.c
++++ b/lib/common.c
+@@ -190,7 +190,7 @@ int _sasl_add_string(char **out, size_t *alloclen,
+ 
+   if (add==NULL) add = "(null)";
+ 
+-  addlen=strlen(add); /* only compute once */
++  addlen=strlen(add)+1; /* only compute once */
+   if (_buf_alloc(out, alloclen, (*outlen)+addlen)!=SASL_OK)
+     return SASL_NOMEM;
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index be7131d..d55dc4a 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https \
            file://0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch \
            file://0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch \
            file://0001-makeinit.sh-fix-parallel-build-issue.patch \
+           file://CVE-2019-19906.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
-- 
2.7.4


