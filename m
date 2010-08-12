Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OjLIc-0008Qk-GC
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 02:05:35 +0200
Received: by pvg6 with SMTP id 6so254613pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 17:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=O8/VaN6NWjWCOWSaFNYKJrFkLLifU/HuQX1VnAM+590=;
	b=qt9bIMZPHni6/Y6LU3XGF2yL18LoP4YshU7PwWtpRemueW3qhMKcztczWmlff5Pxtk
	w7FWr6gsIa1WYmaFsXdbBPGTfFQFckG8MFxjyQsLBrxRxbYAJPlIG9orjOHUGNKWHhIz
	e1pcj8ewOYAs9aNwqd9sfUH5kHa8DZ5EnBRzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aujjgHBPTB/KqJDFR0HPyTMBTxel9N5/zhgUA8VV8NDtVj6GNHGN8oBBXrNTrDZGIY
	WKcWv0ZWZEO5iwWm5LLYeCXXYNgJ5BndDg9Sq9rt3I3KxwyvUPEt3pU5QEnlUJ8YMbU9
	dcsvlVi/KrAkjcXE1idqEUpPOT6qWasZrM9CQ=
Received: by 10.142.180.20 with SMTP id c20mr16531428wff.136.1281571520750;
	Wed, 11 Aug 2010 17:05:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y16sm765075wff.14.2010.08.11.17.05.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Aug 2010 17:05:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Aug 2010 17:05:08 -0700
Message-Id: <1281571508-3792-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] srctree.bbclass: Also account fot deptask
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
X-List-Received-Date: Thu, 12 Aug 2010 00:05:36 -0000

* Use exec_func instead of exec_task
* Use a new name for meta task

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/srctree.bbclass |   31 ++++++++++++++++++-------------
 1 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/classes/srctree.bbclass b/classes/srctree.bbclass
index 7232c26..1a88613 100644
--- a/classes/srctree.bbclass
+++ b/classes/srctree.bbclass
@@ -50,7 +50,7 @@ def merge_tasks(d):
 		__gather_taskdeps(task, items)
 		return items
 
-	newtask = "do_populate_sysroot"
+	newtask = "do_populate_sysroot_post"
 	mergedtasks = gather_taskdeps(newtask)
 	mergedtasks.pop()
 	deltasks = gather_taskdeps("do_patch")
@@ -83,17 +83,22 @@ def merge_tasks(d):
 		d.setVarFlag(task, "deps", deps)
 
 	# Pull cross recipe task deps over
-	depends = (d.getVarFlag(task, "depends") or ""
-	           for task in mergedtasks[:-1]
-	           if not task in deltasks)
-	d.setVarFlag("do_populate_sysroot", "depends", " ".join(depends))
+	depends = []
+	deptask = []
+	for task in mergedtasks[:-1]:
+	    if not task in deltasks:
+		depends.append(d.getVarFlag(task, "depends") or "")
+		deptask.append(d.getVarFlag(task, "deptask") or "")
+
+	d.setVarFlag("do_populate_sysroot_post", "depends", " ".join(depends))
+	d.setVarFlag("do_populate_sysroot_post", "deptask", " ".join(deptask))
 
 python () {
     merge_tasks(d)
 }
 
-# Manually run do_install & all of its deps, then do_stage
-python do_populate_sysroot () {
+# Manually run do_install & all of its deps
+python do_populate_sysroot_post () {
 	from os.path import exists
 	from bb.build import exec_task, exec_func
 	from bb import note
@@ -105,11 +110,11 @@ python do_populate_sysroot () {
 			if not dep in seen:
 				rec_exec_task(dep, seen)
 		seen.add(task)
-		#if not exists("%s.%s" % (stamp, task)):
-		note("%s: executing task %s" % (d.getVar("PF", True), task))
-		exec_task(task, d)
+		if not exists("%s.%s" % (stamp, task)):
+		    note("%s: executing task %s" % (d.getVar("PF", True), task))
+		    exec_func(task, d)
 
-	rec_exec_task("do_install", set())
-	exec_func("do_stage", d)
+	rec_exec_task("do_populate_sysroot", set())
 }
-do_populate_sysroot[lockfiles] += "${S}/.lock"
+addtask populate_sysroot_post after do_populate_sysroot
+do_populate_sysroot_post[lockfiles] += "${S}/.lock"
-- 
1.7.1



