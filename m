Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 1855 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Jan 2015 09:14:00 UTC
Received: from atl4mhob06.myregisteredsite.com
	(atl4mhob06.myregisteredsite.com [209.17.115.44])
	by mail.openembedded.org (Postfix) with ESMTP id ED290718E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 09:14:00 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by atl4mhob06.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t0Q8h4Xt023477 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 03:43:04 -0500
Received: (qmail 5300 invoked by uid 0); 26 Jan 2015 08:43:04 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 26 Jan 2015 08:43:04 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jan 2015 09:42:53 +0100
Message-Id: <1422261773-11620-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] iperf3: Add native support
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
X-List-Received-Date: Mon, 26 Jan 2015 09:14:10 -0000

If you want to use iperf3 to measure your board's IP performance, you
may also want to compile if for the build host, because unlike iperf,
iperf3 isn't readily available as a standard Ubuntu package for example.

Add a BBCLASSEXTEND="native" to the recipe so that you just can build
iperf3-native and have bitbake compile it for you, instead of having to
download, compile and install it manually on the build machine.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index d34eb69..b4d2b61 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -23,3 +23,4 @@ SRCREV = "de420cc741dd8967ebc57f80b7712556442de81b"
 S = "${WORKDIR}/git"
 
 inherit autotools
+BBCLASSEXTEND = "native"
-- 
1.9.1


