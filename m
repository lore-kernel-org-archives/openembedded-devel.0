Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKTS0-0007Na-Jv
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 10:12:15 +0100
Received: by iwn32 with SMTP id 32so2532654iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 01:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9MXIxtypttuE38Vy6l/1ZiRpqPyYDNhQbrySPqoGdgg=;
	b=gntH+B/UAZ7kSICycsv3xiI4yXeR4pxN7a4ZXnBeCY/FpQmDA4HLBhB+zPw5taa4MJ
	4g7IYVKLlj0nCKC93l348WmxDLzj4EaZQs6pOMEYQO+BuRCzb4AScglYTGKjiPrZk+XJ
	XZqC9ZdYiU6kQVV9LhNtMRVPsHlfaCvrokC3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DCtfK604+X1pQ9byfS41Lq0eAFKV02uBUY0t8BcbhaRAtNjqAkZbAmkA1kM/wTslti
	KdIaO0H7AkjvOm6Q8UvRNukHp3KyvfgLKWh5Fn41Dvo5xfr3TQICdMUNlmkGV6338Lzz
	YB5wU2T5F2WG1Xm1gCqWd1HyURR6Zno1IRwtg=
Received: by 10.231.170.14 with SMTP id b14mr744571ibz.26.1260868225672;
	Tue, 15 Dec 2009 01:10:25 -0800 (PST)
Received: from localhost ([123.162.68.164])
	by mx.google.com with ESMTPS id 21sm4102094iwn.10.2009.12.15.01.10.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Dec 2009 01:10:25 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2009 17:10:13 +0800
Message-Id: <1260868213-26276-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Enable --ignore-deps options to access regular expression string
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
X-List-Received-Date: Tue, 15 Dec 2009 09:12:15 -0000

1. Add a function named re_match_strings(target,strings), to match
   target using the string in strings which can be regular expression
---
 lib/bb/taskdata.py |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/lib/bb/taskdata.py b/lib/bb/taskdata.py
index 45f6902..3935e09 100644
--- a/lib/bb/taskdata.py
+++ b/lib/bb/taskdata.py
@@ -26,6 +26,19 @@ Task data collection and handling
 from bb import data, event, mkdirhier, utils
 import bb, os
 
+def re_match_strings(target, strings):
+    """
+    Whether or not the string 'target' matches 
+    any one string of the strings which can be regular expression string
+    """
+    import re
+
+    for name in strings:
+        if (name==target or 
+                re.search(name,target)!=None):
+            return True
+    return False
+
 class TaskData:
     """
     BitBake Task Data implementation
@@ -262,7 +275,7 @@ class TaskData:
         """
         unresolved = []
         for target in self.build_names_index:
-            if target in dataCache.ignored_dependencies:
+            if re_match_strings(target, dataCache.ignored_dependencies):
                 continue
             if self.build_names_index.index(target) in self.failed_deps:
                 continue
@@ -277,7 +290,7 @@ class TaskData:
         """
         unresolved = []
         for target in self.run_names_index:
-            if target in dataCache.ignored_dependencies:
+            if re_match_strings(target, dataCache.ignored_dependencies):
                 continue
             if self.run_names_index.index(target) in self.failed_rdeps:
                 continue
@@ -357,7 +370,7 @@ class TaskData:
         added internally during dependency resolution
         """
 
-        if item in dataCache.ignored_dependencies:
+        if re_match_strings(item, dataCache.ignored_dependencies):
             return
 
         if not item in dataCache.providers:
@@ -408,7 +421,7 @@ class TaskData:
         (takes item names from RDEPENDS/PACKAGES namespace)
         """
 
-        if item in dataCache.ignored_dependencies:
+        if re_match_strings(item, dataCache.ignored_dependencies):
             return
 
         if self.have_runtime_target(item):
-- 
1.5.4.3



