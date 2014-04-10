Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 454EE65D8E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:43:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2014 03:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,833,1389772800"; d="scan'208";a="490680015"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2014 03:43:27 -0700
Received: from irsectmgbld0302.ir.intel.com (irsectmgbld0302.ir.intel.com
	[163.33.26.92])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s3AAhQ9M027600; Thu, 10 Apr 2014 11:43:26 +0100
Received: from irsectmgbld0302.ir.intel.com (localhost [127.0.0.1])
	by irsectmgbld0302.ir.intel.com with ESMTP id s3AAhQGj015771;
	Thu, 10 Apr 2014 11:43:26 +0100
Received: (from kmsywula@localhost)
	by irsectmgbld0302.ir.intel.com with œ id s3AAhQ4b015767;
	Thu, 10 Apr 2014 11:43:26 +0100
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Apr 2014 11:43:05 +0100
Message-Id: <1397126585-15711-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.8.2
Cc: koen@dominion.thruhere.net, paul.eggleton@linux.jf.intel.com
Subject: [meta-oe][PATCH v2] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 10:43:29 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb |  3 +++
 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb        | 11 +++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
 create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb

diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
new file mode 100644
index 0000000..23cc10e
--- /dev/null
+++ b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
@@ -0,0 +1,3 @@
+require dejagnu_${PV}.bb
+S = "${WORKDIR}/dejagnu-${PV}"
+inherit native
diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
new file mode 100644
index 0000000..5bfce52
--- /dev/null
+++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+SECTION = "devel"
+
+inherit autotools
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "053f18fd5d00873de365413cab17a666"
+SRC_URI[sha256sum] = "d0fbedef20fb0843318d60551023631176b27ceb1e11de7468a971770d0e048d"
-- 
1.8.2


