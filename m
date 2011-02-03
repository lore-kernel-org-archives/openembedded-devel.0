Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PktCO-0007P6-D1
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 08:01:53 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LG100JVR4SOJGK0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	03 Feb 2011 01:00:25 -0600 (CST)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DCF8514AF6C; Thu,
	03 Feb 2011 02:00:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 03 Feb 2011 02:00:21 -0500
Message-id: <1296716421-19240-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4
Subject: [PATCH] insane.bbclass: fix the check for bad RPATH
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
X-List-Received-Date: Thu, 03 Feb 2011 07:01:53 -0000

* Variable 'sane' is boolean, so adding to it breaks the error condition
* Fixes previous commit 6aa31074 ported from Yocto

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 50752b5..a846832 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -174,7 +174,7 @@ def package_qa_check_rpath(file,name,d, elf):
         for dir in bad_dirs:
             if dir in line:
                 error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
-                sane = sane + package_qa_handle_error(1, error_msg, name, file, d)
+                sane = package_qa_handle_error(1, error_msg, name, file, d)
 
     return sane
 
-- 
1.7.4



