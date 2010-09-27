Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P0IKp-0001XH-1A
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 20:21:56 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9F005SA4BHV5M1@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	27 Sep 2010 13:21:23 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DFF6E14AF60; Mon,
	27 Sep 2010 14:21:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Sep 2010 14:21:04 -0400
Message-id: <1285611664-30291-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: not use bb.fetch.urldata in do_unpack() for traversing SRC_URIs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Sep 2010 18:21:57 -0000

bb.fetch.urldata contains cached SRC_URIs, but in case SRC_URI is altered by
amend.inc or machine override, the original SRC_URI is not removed from the
cache, leading to calling do_unpack() multiple times on original and modified
versions of the file. Don't rely on bb.fetch.urldata and traverse SRC_URIs
directly.

Some background and details:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/36703

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/base.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index b19eb32..964fe1c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -202,10 +202,14 @@ do_unpack[dirs] = "${WORKDIR}"
 python base_do_unpack() {
     from glob import glob
 
-    srcurldata = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
+    src_uri = d.getVar("SRC_URI", True)
+    if not src_uri:
+        return
+    srcurldata = bb.fetch.init(src_uri.split(), d, True)
     filespath = d.getVar("FILESPATH", True).split(":")
 
-    for url, urldata in srcurldata.iteritems():
+    for url in src_uri.split():
+        urldata = srcurldata[url]
         if urldata.type == "file" and "*" in urldata.path:
             # The fetch code doesn't know how to handle globs, so
             # we need to handle the local bits ourselves
-- 
1.6.3.3



