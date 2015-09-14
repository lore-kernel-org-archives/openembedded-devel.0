Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 00AC6769A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443696"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:46 +0300
Message-Id: <1442233610-32279-7-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/9] libsecret: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/libsecret/libsecret_0.18.bb      | 23 ----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb

diff --git a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
deleted file mode 100644
index f610d44..0000000
--- a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
-
-inherit gnomebase gtk-doc
-
-DEPENDS = "glib-2.0 libgcrypt"
-
-GNOME_COMPRESS_TYPE = "xz"
-
-EXTRA_OECONF += "--disable-manpages"
-
-SRC_URI[archive.md5sum] = "279d723cd005e80d1d304f74a3488acc"
-SRC_URI[archive.sha256sum] = "0c73aa762dbd1e38ba7b03de350e23ce818cb810b0784375e95ef61e004b02e3"
-
-# Fails to build with thumb-1 (qemuarm)
-# | {standard input}: Assembler messages:
-# | {standard input}:686: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
-# | {standard input}:686: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'
-# | {standard input}:687: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#29'
-# | {standard input}:687: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#19'
-# | {standard input}:688: Error: lo register required -- `orr r10,r10,r10'
-ARM_INSTRUCTION_SET = "arm"
-- 
2.1.4


