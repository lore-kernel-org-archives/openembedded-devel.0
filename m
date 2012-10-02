Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJ9ic-0002z1-UJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Oct 2012 23:09:30 +0200
Received: by weyt44 with SMTP id t44so3864793wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2012 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=awkx9dUW1hnU3wX9JhGFfecrJjr9qasbWKg9iGaTWhk=;
	b=QXqXjHMpG6ZFEEG9zQIr4tDo89bXgsJhDzNUwUy5ZX2mpJ/HSaAL+Thtle6ZGJQEjO
	Hi96LFvmhzUMEK9JZ1x0yUTk03A2FXTfGmGdKdqR4EjlnZKlzMqCzUQceFvrxAHrzoen
	WqmUBQhbQF4eRR++Ma7koE0I1c1iHc3WKC4mAm+zRmxk4otWxHxOwWBV0m7g9K8jJseK
	GC+54sYqCn5FzxVbsWAwR7cb8PMnnrWHbGoE80Bm3GvrC1eThkd2w9EScETpNy61nPyB
	P10yrXQgCZObrK87lhrqrqRty+b0iO3u9xatxZ2pjuIjkOy2WvikpIyXBmB7RbAOonH+
	b7wA==
Received: by 10.216.241.137 with SMTP id g9mr9134332wer.122.1349211392187;
	Tue, 02 Oct 2012 13:56:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm4373200wib.10.2012.10.02.13.56.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 13:56:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2012 22:56:28 +0200
Message-Id: <1349211388-18453-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH] srctree: remove this bbclass
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
X-List-Received-Date: Tue, 02 Oct 2012 21:09:31 -0000

* it's depending on clean.bbclass which isn't in meta-oe and oe-core now has externalsrc.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/srctree.bbclass | 123 ----------------------------------------
 1 file changed, 123 deletions(-)
 delete mode 100644 meta-oe/classes/srctree.bbclass

diff --git a/meta-oe/classes/srctree.bbclass b/meta-oe/classes/srctree.bbclass
deleted file mode 100644
index 1457e56..0000000
--- a/meta-oe/classes/srctree.bbclass
+++ /dev/null
@@ -1,123 +0,0 @@
-# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-#
-# srctree.bbclass enables operation inside of an existing source tree for a
-# project, rather than using the fetch/unpack/patch idiom.
-#
-# By default, it expects that you're keeping the recipe(s) inside the
-# aforementioned source tree, but you could override S to point at an external
-# directory and place the recipes in a normal collection/overlay, if you so
-# chose.
-#
-# It also provides some convenience python functions for assembling your
-# do_clean, if you want to leverage things like 'git clean' to simplify the
-# operation.
-
-
-# Grab convenience methods & sane default for do_clean
-inherit clean
-
-# Build here
-S = "${FILE_DIRNAME}"
-SRC_URI = ""
-
-def remove_tasks(deltasks, d):
-    for task in filter(lambda k: d.getVarFlag(k, "task"), d.keys()):
-        deps = d.getVarFlag(task, "deps")
-        for preptask in deltasks:
-            if preptask in deps:
-                deps.remove(preptask)
-        d.setVarFlag(task, "deps", deps)
-
-addtask configure after do_setscene
-
-def merge_tasks(d):
-    """
-    Merges all of the operations that occur prior to do_populate_sysroot
-    into do_populate_sysroot.
-
-    This is necessary because of recipe variants (normal, native, cross,
-    sdk).  If a bitbake run happens to want to build more than one of
-    these variants in a single run, it's possible for them to step on one
-    another's toes, due to the shared ${S}.  Interleaved
-    configure/compile/install amongst variants will break things badly.
-    """
-    from itertools import chain
-    from bb import note
-
-    def __gather_taskdeps(task, seen):
-        for dep in d.getVarFlag(task, "deps"):
-            if not dep in seen:
-                __gather_taskdeps(dep, seen)
-        if not task in seen:
-            seen.append(task)
-
-    def gather_taskdeps(task):
-        items = []
-        __gather_taskdeps(task, items)
-        return items
-
-    newtask = "do_populate_sysroot_post"
-    mergedtasks = gather_taskdeps(newtask)
-    mergedtasks.pop()
-
-    for task in (key for key in d.keys()
-                 if d.getVarFlag(key, "task") and
-                 not key in mergedtasks):
-        deps = d.getVarFlag(task, "deps")
-        for mergetask in mergedtasks:
-            if mergetask in (d.getVarFlag(task, "recrdeptask"),
-                             d.getVarFlag(task, "recdeptask"),
-                             d.getVarFlag(task, "deptask")):
-                continue
-
-            if mergetask in deps:
-                deps.remove(mergetask)
-                #note("removing dep on %s from %s" % (mergetask, task))
-
-                if not newtask in deps:
-                    #note("adding dep on %s to %s" % (newtask, task))
-                    deps.append(newtask)
-        d.setVarFlag(task, "deps", deps)
-
-    # Pull cross recipe task deps over
-    depends = []
-    deptask = []
-    for task in mergedtasks[:-1]:
-        depends.append(d.getVarFlag(task, "depends") or "")
-        deptask.append(d.getVarFlag(task, "deptask") or "")
-
-    d.setVarFlag("do_populate_sysroot_post", "depends", " ".join(depends))
-    d.setVarFlag("do_populate_sysroot_post", "deptask", " ".join(deptask))
-
-python () {
-    remove_tasks(["do_patch", "do_unpack", "do_fetch"], d)
-    b = d.getVar("B", True)
-    if not b or b == d.getVar("S", True):
-        merge_tasks(d)
-}
-
-# Manually run do_install & all of its deps
-python do_populate_sysroot_post () {
-    from os.path import exists
-    from bb.build import exec_func, make_stamp
-    from bb import note
-
-    stamp = d.getVar("STAMP", True)
-
-    def rec_exec_task(task, seen):
-        for dep in d.getVarFlag(task, "deps"):
-            if not dep in seen:
-                rec_exec_task(dep, seen)
-        seen.add(task)
-        if not exists("%s.%s" % (stamp, task)):
-            note("%s: executing task %s" % (d.getVar("PF", True), task))
-            exec_func(task, d)
-            flags = d.getVarFlags(task)
-            if not flags.get('nostamp') and not flags.get('selfstamp'):
-                make_stamp(task, d)
-
-    rec_exec_task("do_populate_sysroot", set())
-}
-addtask populate_sysroot_post after do_populate_sysroot
-do_populate_sysroot_post[lockfiles] += "${S}/.lock"
-- 
1.7.12



