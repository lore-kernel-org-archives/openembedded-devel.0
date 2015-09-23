Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E6395608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:35:12 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8NMZCw2007051 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 17:35:12 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092317351222-278253 ;
	Wed, 23 Sep 2015 17:35:12 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2015 17:34:55 -0500
Message-Id: <1443047695-22567-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.4.5
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/23/2015 05:35:12 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/23/2015 05:35:12 PM,
	Serialize complete at 09/23/2015 05:35:12 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-24_01:, , signatures=0
Subject: [meta-oe] [PATCH] inotify-tools: Add
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
X-List-Received-Date: Wed, 23 Sep 2015 22:35:13 -0000

Add inotify-tools package, a C library and a set of command-line
programs for Linux providing a simple interface to inotify kernel
subsystem.

https://github.com/rvoicilas/inotify-tools/wiki
http://lwn.net/Articles/104343/

Testing: Built and installed IPK onto an x64 system (OE Fido).
inotifywatch and inotifywait successfully detected changes to
a test file.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb
new file mode 100644
index 0000000..75183ba
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb
@@ -0,0 +1,9 @@
+SUMMARY = "inotify command line utilities"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
+
+SRC_URI = "http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-${PV}.tar.gz"
+SRC_URI[sha256sum] = "222bcca8893d7bf8a1ce207fb39ceead5233b5015623d099392e95197676c92f"
+
+inherit autotools-brokensep
-- 
2.4.5


