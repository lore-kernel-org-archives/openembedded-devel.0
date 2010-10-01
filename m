Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P1nUd-0006M5-Pd
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 23:50:17 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P1nUF-0007El-HQ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 14:49:51 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 1 Oct 2010 14:49:51 -0700
Received: from localhost.localdomain ([172.30.80.12]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 1 Oct 2010 15:49:49 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 14:49:39 -0700
Message-Id: <1285969779-7932-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285969779-7932-1-git-send-email-tom_rini@mentor.com>
References: <1285969779-7932-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 01 Oct 2010 21:49:49.0906 (UTC)
	FILETIME=[926FBB20:01CB61B2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] insane.bbclass: Skip '.pc' in qa_configure
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
X-List-Received-Date: Fri, 01 Oct 2010 21:50:17 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/insane.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 5afa63c..9087efd 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -466,6 +466,8 @@ python do_qa_configure() {
     configs = []
     bb.debug(1, "Checking sanity of the config.log file")
     for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True)):
+        if ".pc" in root:
+            continue
         statement = "grep 'CROSS COMPILE Badness:' %s > /dev/null" % \
                     os.path.join(root,"config.log")
         if "config.log" in files:
-- 
1.6.3.3



