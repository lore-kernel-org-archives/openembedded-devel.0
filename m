Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 427AB76D96
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443745"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:50 +0300
Message-Id: <1442233610-32279-11-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/10] libyaml: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libyaml/files/libyaml-CVE-2014-9130.patch      | 32 ----------------------
 meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb   | 21 --------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
 delete mode 100644 meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb

diff --git a/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch b/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
deleted file mode 100644
index 3c4a00e..0000000
--- a/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-# HG changeset patch
-# User Kirill Simonov <xi@resolvent.net>
-# Date 1417197312 21600
-# Node ID 2b9156756423e967cfd09a61d125d883fca6f4f2
-# Parent  053f53a381ff6adbbc93a31ab7fdee06a16c8a33
-Removed invalid simple key assertion (thank to Jonathan Gray).
-
-The patch comes from 
-
-https://bitbucket.org/xi/libyaml/commits/2b9156756423e967cfd09a61d125d883fca6f4f2
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-diff -r 053f53a381ff -r 2b9156756423 src/scanner.c
---- a/src/scanner.c	Wed Mar 26 13:55:54 2014 -0500
-+++ b/src/scanner.c	Fri Nov 28 11:55:12 2014 -0600
-@@ -1106,13 +1106,6 @@
-             && parser->indent == (ptrdiff_t)parser->mark.column);
- 
-     /*
--     * A simple key is required only when it is the first token in the current
--     * line.  Therefore it is always allowed.  But we add a check anyway.
--     */
--
--    assert(parser->simple_key_allowed || !required);    /* Impossible. */
--
--    /*
-      * If the current position may start a simple key, save it.
-      */
- 
diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
deleted file mode 100644
index b015577..0000000
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
-DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
-a human-readable data serialization format. "
-HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
-SECTION = "libs/devel"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
-
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
-           file://libyaml-CVE-2014-9130.patch \
-          "
-
-SRC_URI[md5sum] = "5fe00cda18ca5daeb43762b80c38e06e"
-SRC_URI[sha256sum] = "7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749"
-
-S = "${WORKDIR}/yaml-${PV}"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
-- 
2.1.4


