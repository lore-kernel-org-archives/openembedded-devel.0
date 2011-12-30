Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RgSkK-0002gs-Gx
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 04:03:04 +0100
Received: from mail125-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 30 Dec 2011 02:55:25 +0000
Received: from mail125-tx2 (localhost [127.0.0.1])	by
	mail125-tx2-R.bigfish.com (Postfix) with ESMTP id 1E0F9180409	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 02:55:25 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail125-tx2 (localhost.localdomain [127.0.0.1]) by mail125-tx2
	(MessageSwitch) id 1325213724709790_13414;
	Fri, 30 Dec 2011 02:55:24 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.240])	by
	mail125-tx2.bigfish.com (Postfix) with ESMTP id A6E8F480043	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 02:55:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 30 Dec 2011 02:55:53 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 29 Dec 2011 20:55:47 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id pBU2tiRe022393;
	Thu, 29 Dec 2011 20:55:46 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Dec 2011 10:59:36 +0800
Message-ID: <1325213976-17890-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH mete-oe] bbclass: drop gitver.bbclass amd srctree.bbclass which are already in oe-core
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
X-List-Received-Date: Fri, 30 Dec 2011 03:03:05 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/classes/gitver.bbclass  |   80 -------------------------
 meta-oe/classes/srctree.bbclass |  123 ---------------------------------------
 2 files changed, 0 insertions(+), 203 deletions(-)
 delete mode 100644 meta-oe/classes/gitver.bbclass
 delete mode 100644 meta-oe/classes/srctree.bbclass

diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
deleted file mode 100644
index ee8323d..0000000
--- a/meta-oe/classes/gitver.bbclass
+++ /dev/null
@@ -1,80 +0,0 @@
-# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-#
-# gitver.bbclass provides a GITVER variable which is a (fairly) sane version,
-# for use in ${PV}, extracted from the ${S} git checkout, assuming it is one.
-# This is most useful in concert with srctree.bbclass.
-
-def git_drop_tag_prefix(version):
-    import re
-    if re.match("v\d", version):
-        return version[1:]
-    else:
-        return version
-
-GIT_TAGADJUST = "git_drop_tag_prefix(version)"
-GITVER = "${@get_git_pv('${S}', d, tagadjust=lambda version:${GIT_TAGADJUST})}"
-GITSHA = "${@get_git_hash('${S}', d)}"
-
-def get_git_hash(path, d):
-    return oe_run(d, ["git", "rev-parse", "--short", "HEAD"], cwd=path).rstrip()
-
-def get_git_pv(path, d, tagadjust=None):
-    import os
-    import oe.process
-
-    gitdir = os.path.abspath(os.path.join(d.getVar("S", True), ".git"))
-    def git(cmd):
-        try:
-            return oe_run(d, ["git"] + cmd, cwd=gitdir).rstrip()
-        except oe.process.CmdError, exc:
-            bb.fatal(str(exc))
-
-    try:
-        ver = oe_run(d, ["git", "describe", "--tags"], cwd=gitdir).rstrip()
-    except Exception, exc:
-        bb.fatal(str(exc))
-
-    if not ver:
-        try:
-            ver = get_git_hash(gitdir, d)
-        except Exception, exc:
-            bb.fatal(str(exc))
-
-        if ver:
-            return "0.0+%s" % ver
-        else:
-            return "0.0"
-    else:
-        if tagadjust:
-            ver = tagadjust(ver)
-        return ver
-
-def mark_recipe_dependencies(path, d):
-    from bb.parse import mark_dependency
-
-    gitdir = os.path.join(path, ".git")
-
-    # Force the recipe to be reparsed so the version gets bumped
-    # if the active branch is switched, or if the branch changes.
-    mark_dependency(d, os.path.join(gitdir, "HEAD"))
-
-    # Force a reparse if anything in the index changes.
-    mark_dependency(d, os.path.join(gitdir, "index"))
-
-    try:
-        ref = oe_run(d, ["git", "symbolic-ref", "-q", "HEAD"], cwd=gitdir).rstrip()
-    except oe.process.CmdError:
-        pass
-    else:
-        if ref:
-            mark_dependency(d, os.path.join(gitdir, ref))
-
-    # Catch new tags.
-    tagdir = os.path.join(gitdir, "refs", "tags")
-    if os.path.exists(tagdir):
-        mark_dependency(d, tagdir)
-
-python () {
-    mark_recipe_dependencies(d.getVar("S", True), d)
-}
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
1.7.0.4




