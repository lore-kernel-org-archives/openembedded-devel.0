Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mv1Fj-0003ee-2L
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 06:02:22 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KR200I2WR68MLOI@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	05 Oct 2009 23:01:20 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4FE414AF4F; Tue,
	06 Oct 2009 00:01:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 06 Oct 2009 00:00:47 -0400
Message-id: <1254801647-27989-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
In-reply-to: <20091006034646.GA22854@denix.org>
References: <20091006034646.GA22854@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] utils.py: add special handling for version delimiters
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
X-List-Received-Date: Tue, 06 Oct 2009 04:02:22 -0000

Make version comparison work properly for pre-releases and release-candidates,
when there is an extra suffix in the field, such as:
PV = "2.6.29+2.6.30-rc5-${PR}+gitr${SRCREV}"

More details: http://thread.gmane.org/gmane.comp.handhelds.openembedded/26691

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 lib/bb/utils.py |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/lib/bb/utils.py b/lib/bb/utils.py
index 2469bd7..e6664e2 100644
--- a/lib/bb/utils.py
+++ b/lib/bb/utils.py
@@ -21,8 +21,9 @@ BitBake Utility Functions
 
 digits = "0123456789"
 ascii_letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
+separators = ".-"
 
-import re, fcntl, os
+import re, fcntl, os, types
 
 def explode_version(s):
     r = []
@@ -39,12 +40,15 @@ def explode_version(s):
             r.append(m.group(1))
             s = m.group(2)
             continue
+        r.append(s[0])
         s = s[1:]
     return r
 
 def vercmp_part(a, b):
     va = explode_version(a)
     vb = explode_version(b)
+    sa = False
+    sb = False
     while True:
         if va == []:
             ca = None
@@ -56,6 +60,16 @@ def vercmp_part(a, b):
             cb = vb.pop(0)
         if ca == None and cb == None:
             return 0
+
+        if type(ca) is types.StringType:
+            sa = ca in separators
+        if type(cb) is types.StringType:
+            sb = cb in separators
+        if sa and not sb:
+            return -1
+        if not sa and sb:
+            return 1
+
         if ca > cb:
             return 1
         if ca < cb:
-- 
1.6.3.3



