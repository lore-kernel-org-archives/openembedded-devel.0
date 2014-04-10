Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E80165D21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 13:19:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2014 06:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,834,1389772800"; d="scan'208";a="518321949"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2014 06:19:51 -0700
Received: from irsectmgbld0302.ir.intel.com (irsectmgbld0302.ir.intel.com
	[163.33.26.92])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s3ADJp0R012819; Thu, 10 Apr 2014 14:19:51 +0100
Received: from irsectmgbld0302.ir.intel.com (localhost [127.0.0.1])
	by irsectmgbld0302.ir.intel.com with ESMTP id s3ADJpFZ042965;
	Thu, 10 Apr 2014 14:19:51 +0100
Received: (from kmsywula@localhost)
	by irsectmgbld0302.ir.intel.com with œ id s3ADJoqp042957;
	Thu, 10 Apr 2014 14:19:50 +0100
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Apr 2014 14:19:28 +0100
Message-Id: <1397135968-42902-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.8.2
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH v3] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 13:19:53 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb

diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
new file mode 100644
index 0000000..f5fe9b9
--- /dev/null
+++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+SECTION = "devel"
+
+inherit autotools
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "053f18fd5d00873de365413cab17a666"
+SRC_URI[sha256sum] = "d0fbedef20fb0843318d60551023631176b27ceb1e11de7468a971770d0e048d"
+
+BBCLASSEXTEND = "native"
-- 
1.8.2


