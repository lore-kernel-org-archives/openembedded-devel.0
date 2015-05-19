Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12C6F73223
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 03:28:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J3SkUG022766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 20:28:46 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 18 May 2015 20:28:45 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 May 2015 11:26:34 +0800
Message-ID: <1432005994-32642-2-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432005994-32642-1-git-send-email-wenzong.fan@windriver.com>
References: <1432005994-32642-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-oe] libyaml: Security Advisory - libyaml - CVE-2014-9130
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
X-List-Received-Date: Tue, 19 May 2015 03:28:45 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9130

The patch comes from:
https://bitbucket.org/xi/libyaml/commits/2b9156756423e967cfd09a61d125d883fca6f4f2

Removed invalid simple key assertion (thank to Jonathan Gray)

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libyaml/files/libyaml-CVE-2014-9130.patch      | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch

diff --git a/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch b/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
new file mode 100644
index 0000000..3c4a00e
--- /dev/null
+++ b/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
@@ -0,0 +1,32 @@
+# HG changeset patch
+# User Kirill Simonov <xi@resolvent.net>
+# Date 1417197312 21600
+# Node ID 2b9156756423e967cfd09a61d125d883fca6f4f2
+# Parent  053f53a381ff6adbbc93a31ab7fdee06a16c8a33
+Removed invalid simple key assertion (thank to Jonathan Gray).
+
+The patch comes from 
+
+https://bitbucket.org/xi/libyaml/commits/2b9156756423e967cfd09a61d125d883fca6f4f2
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+diff -r 053f53a381ff -r 2b9156756423 src/scanner.c
+--- a/src/scanner.c	Wed Mar 26 13:55:54 2014 -0500
++++ b/src/scanner.c	Fri Nov 28 11:55:12 2014 -0600
+@@ -1106,13 +1106,6 @@
+             && parser->indent == (ptrdiff_t)parser->mark.column);
+ 
+     /*
+-     * A simple key is required only when it is the first token in the current
+-     * line.  Therefore it is always allowed.  But we add a check anyway.
+-     */
+-
+-    assert(parser->simple_key_allowed || !required);    /* Impossible. */
+-
+-    /*
+      * If the current position may start a simple key, save it.
+      */
+ 
diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
index 8a624f7..b015577 100644
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
@@ -8,6 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 
 SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://libyaml-CVE-2014-9130.patch \
           "
 
 SRC_URI[md5sum] = "5fe00cda18ca5daeb43762b80c38e06e"
-- 
1.9.1


