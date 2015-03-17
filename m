Return-Path: <denis@denix.org>
X-Greylist: delayed 3614 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Mar 2015 01:43:01 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id C9AE26AC43
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 01:43:01 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB00KK6ZAX8M20@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	16 Mar 2015 19:42:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8 a=5rCe5-i4AAAA:8	a=NEAV23lmAAAA:8
	a=z5E4bW7GdpvrKwfNQeQA:9 a=phLkc5FJxekA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 20388200F0;	Mon,
	16 Mar 2015 20:42:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 20:42:27 -0400
Message-id: <1426552947-18113-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-networking][PATCH] smcroute: add version 2.0.0 with /usr/sbin and endless loop fixes
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
X-List-Received-Date: Tue, 17 Mar 2015 01:43:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb b/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
new file mode 100644
index 0000000..c206cb9
--- /dev/null
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Static Multicast Routing Daemon"
+DESCRIPTION = "SMCRoute is a daemon and command line tool to manipulate the multicast routing table in the UNIX kernel."
+HOMEPAGE = "http://troglobit.github.io/smcroute.html"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+SRCREV = "d6280e64b27d5a4bd7f37dac36b455f4ae5f9ab3"
+SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
2.2.0


