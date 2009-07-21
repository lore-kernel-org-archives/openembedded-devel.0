Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MTKO7-0007bl-Fz
	for openembedded-devel@openembedded.org; Tue, 21 Jul 2009 20:48:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6LIXOBT023995; Tue, 21 Jul 2009 19:33:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MOgYJ07OQnJH; Tue, 21 Jul 2009 19:33:24 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6LIXINF023990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jul 2009 19:33:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Tue, 21 Jul 2009 19:32:14 +0100
Message-Id: <1248201134.26475.15.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake runqueue performance improvement
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
X-List-Received-Date: Tue, 21 Jul 2009 18:48:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At present there is a bottleneck in runqueue in the
get_recursive_tdepends() function which bothers me as we never used to
have it. It appeared when we fixed some correctness issues with the
dependency tree and the code in this area has grown adhoc for too long.

As an example the above function was getting called 500,000 times in my
main test case of building an image. Its particularly problematic in
builds with many recursive dependencies such as 'bitbake world'.

The attached patch rewrites the problematic function entirely with the
following benefits:

* Replaces the most illegible code in that function with code thats 
  easier to understand
* Builds the dependency tree per filename, not per task since we don't 
  need it per task which is a performance win
* Improves the documentation in places
* Much faster execution
* Reuses the main dependency tree data, doesn't make its own.

The code functions very differently to the original. Previously the
recursive dependency tree and the main dependency tree were separate. In
this implementation we use the main tree to build the recursive tree
after the main tree has been completed, then inject the dependencies.

Compared with the original this actually inserts small numbers (4 in my
test cases) of additional dependencies into the task graph such as
image_recipe:do_rootfs -> image_recipe:do_package_write_ipk which is
arguably an bug in the existing implementation. I've checked into this,
understand why its happening and believe none of the additional
dependencies should cause any complications.

Since this is critical code I'd appreciate any testing people can give
it.

Cheers,

Richard

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 9b3cbdf..4c466b6 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -321,9 +321,10 @@ class RunQueue:
         to optimise the execution order.
         """
 
-        depends = []
         runq_build = []
         recursive_tdepends = {}
+        runq_recrdepends = []
+        tdepends_fnid = {}
 
         taskData = self.taskData
 
@@ -335,9 +336,9 @@ class RunQueue:
 
         # Step A - Work out a list of tasks to run
         #
-        # Taskdata gives us a list of possible providers for a every target 
-        # ordered by priority (build_targets, run_targets). It also gives
-        # information on each of those providers.
+        # Taskdata gives us a list of possible providers for every build and run
+        # target ordered by priority. It also gives information on each of those 
+        # providers.
         #
         # To create the actual list of tasks to execute we fix the list of 
         # providers and then resolve the dependencies into task IDs. This 
@@ -345,10 +346,14 @@ class RunQueue:
         # rdeptast, recrdeptask, idepends).
 
         for task in range(len(taskData.tasks_name)):
+            depends = []
+            recrdepends = []
             fnid = taskData.tasks_fnid[task]
             fn = taskData.fn_index[fnid]
             task_deps = self.dataCache.task_deps[fn]
 
+            bb.msg.debug(2, bb.msg.domain.RunQueue, "Processing %s:%s" %(fn, taskData.tasks_name[task]))
+
             if fnid not in taskData.failed_fnids:
 
                 # Resolve task internal dependencies 
@@ -388,6 +393,8 @@ class RunQueue:
                 #
                 # e.g. do_sometask[depends] = "targetname:do_someothertask"
                 # (makes sure sometask runs after targetname's someothertask)
+                if fnid not in tdepends_fnid:
+                    tdepends_fnid[fnid] = set()
                 idepends = taskData.tasks_idepends[task]
                 for (depid, idependtask) in idepends:
                     if depid in taskData.build_targets:
@@ -395,122 +402,37 @@ class RunQueue:
                         depdata = taskData.build_targets[depid][0]
                         if depdata is not None:
                             dep = taskData.fn_index[depdata]
-                            depends.append(taskData.gettask_id(dep, idependtask))
-
-                # Create a list of recursive dependent tasks (from tdepends) and cache
-                def get_recursive_tdepends(task):
-                    if not task:
-                        return []
-                    if task in recursive_tdepends:
-                        return recursive_tdepends[task]
-
-                    fnid = taskData.tasks_fnid[task]
-                    taskids = taskData.gettask_ids(fnid)
-
-                    rectdepends = taskids
-                    nextdeps = taskids
-                    while len(nextdeps) != 0:
-                        newdeps = []
-                        for nextdep in nextdeps:
-                            for tdepend in taskData.tasks_tdepends[nextdep]:
-                                if tdepend not in rectdepends:
-                                    rectdepends.append(tdepend)
-                                    newdeps.append(tdepend)
-                        nextdeps = newdeps
-                    recursive_tdepends[task] = rectdepends
-                    return rectdepends
-
-                # Using the list of tdepends for this task create a list of 
-                # the recursive idepends we have
-                def get_recursive_idepends(task):
-                    if not task:
-                        return []
-                    rectdepends = get_recursive_tdepends(task)
-
-                    recidepends = []
-                    for tdepend in rectdepends:
-                        for idepend in taskData.tasks_idepends[tdepend]:
-                            recidepends.append(idepend)
-                    return recidepends
-
-                def add_recursive_build(depid, depfnid):
-                    """
-                    Add build depends of depid to depends
-                    (if we've not see it before)
-                    (calls itself recursively)
-                    """
-                    if str(depid) in dep_seen:
-                        return
-                    dep_seen.append(depid)
-                    if depid in taskData.build_targets:
-                        depdata = taskData.build_targets[depid][0]
-                        if depdata is not None:
-                            dep = taskData.fn_index[depdata]
-                            # Need to avoid creating new tasks here
-                            taskid = taskData.gettask_id(dep, taskname, False)
-                            if taskid is not None:
-                                depends.append(taskid)
-                                fnid = taskData.tasks_fnid[taskid]
-                                #print "Added %s (%s) due to %s" % (taskid, taskData.fn_index[fnid], taskData.fn_index[depfnid])
-                            else:
-                                fnid = taskData.getfn_id(dep)
-                            for nextdepid in taskData.depids[fnid]:
-                                if nextdepid not in dep_seen:
-                                    add_recursive_build(nextdepid, fnid)
-                            for nextdepid in taskData.rdepids[fnid]:
-                                if nextdepid not in rdep_seen:
-                                    add_recursive_run(nextdepid, fnid)
-                            for (idependid, idependtask) in get_recursive_idepends(taskid):
-                                if idependid not in dep_seen:
-                                    add_recursive_build(idependid, fnid)
-
-                def add_recursive_run(rdepid, depfnid):
-                    """
-                    Add runtime depends of rdepid to depends
-                    (if we've not see it before)
-                    (calls itself recursively)
-                    """
-                    if str(rdepid) in rdep_seen:
-                        return
-                    rdep_seen.append(rdepid)
-                    if rdepid in taskData.run_targets:
-                        depdata = taskData.run_targets[rdepid][0]
-                        if depdata is not None:
-                            dep = taskData.fn_index[depdata]
-                            # Need to avoid creating new tasks here
-                            taskid = taskData.gettask_id(dep, taskname, False)
-                            if taskid is not None:
-                                depends.append(taskid)
-                                fnid = taskData.tasks_fnid[taskid]
-                                #print "Added %s (%s) due to %s" % (taskid, taskData.fn_index[fnid], taskData.fn_index[depfnid])
-                            else:
-                                fnid = taskData.getfn_id(dep)
-                            for nextdepid in taskData.depids[fnid]:
-                                if nextdepid not in dep_seen:
-                                    add_recursive_build(nextdepid, fnid)
-                            for nextdepid in taskData.rdepids[fnid]:
-                                if nextdepid not in rdep_seen:
-                                    add_recursive_run(nextdepid, fnid)
-                            for (idependid, idependtask) in get_recursive_idepends(taskid):
-                                if idependid not in dep_seen:
-                                    add_recursive_build(idependid, fnid)
-
-                # Resolve recursive 'recrdeptask' dependencies 
+                            taskid = taskData.gettask_id(dep, idependtask)
+                            depends.append(taskid)
+                            if depdata != fnid:
+                                tdepends_fnid[fnid].add(taskid)
+
+
+                # Resolve recursive 'recrdeptask' dependencies (A)
                 #
                 # e.g. do_sometask[recrdeptask] = "do_someothertask"
                 # (makes sure sometask runs after someothertask of all DEPENDS, RDEPENDS and intertask dependencies, recursively)
+                # We cover the recursive part of the dependencies below
                 if 'recrdeptask' in task_deps and taskData.tasks_name[task] in task_deps['recrdeptask']:
                     for taskname in task_deps['recrdeptask'][taskData.tasks_name[task]].split():
-                        dep_seen = []
-                        rdep_seen = []
-                        idep_seen = []
+                        recrdepends.append(taskname)
+                        for depid in taskData.rdepids[fnid]:
+                            if depid in taskData.run_targets:
+                                depdata = taskData.run_targets[depid][0]
+                                if depdata is not None:
+                                    dep = taskData.fn_index[depdata]
+                                    taskid = taskData.gettask_id(dep, taskname, False)
+                                    if taskid is not None:
+                                        depends.append(taskid)
                         for depid in taskData.depids[fnid]:
-                            add_recursive_build(depid, fnid)
-                        for rdepid in taskData.rdepids[fnid]:
-                            add_recursive_run(rdepid, fnid)
-                        deptaskid = taskData.gettask_id(fn, taskname, False)
-                        for (idependid, idependtask) in get_recursive_idepends(deptaskid):
-                            add_recursive_build(idependid, fnid)
+                            # Won't be in build_targets if ASSUME_PROVIDED
+                            if depid in taskData.build_targets:
+                                depdata = taskData.build_targets[depid][0]
+                                if depdata is not None:
+                                    dep = taskData.fn_index[depdata]
+                                    taskid = taskData.gettask_id(dep, taskname, False)
+                                    if taskid is not None:
+                                        depends.append(taskid)
 
                 # Rmove all self references
                 if task in depends:
@@ -521,13 +443,51 @@ class RunQueue:
                           newdep.append(dep)
                     depends = newdep
 
-
             self.runq_fnid.append(taskData.tasks_fnid[task])
             self.runq_task.append(taskData.tasks_name[task])
             self.runq_depends.append(set(depends))
             self.runq_revdeps.append(set())
 
             runq_build.append(0)
+            runq_recrdepends.append(recrdepends)
+
+        #
+        # Build a list of recursive cumulative dependencies for each fnid
+        # We do this by fnid, since if A depends on some task in B
+        # we're interested in later tasks B's fnid might have but B itself 
+        # doesn't depend on
+        #
+        # Algorithm is O(tasks) + O(tasks)*O(fnids)
+        #
+        reccumdepends = {}
+        for task in range(len(self.runq_fnid)):
+            fnid = self.runq_fnid[task]
+            if fnid not in reccumdepends:
+                reccumdepends[fnid] = set()
+            if task in self.runq_depends:
+                reccumdepends[fnid].update(self.runq_depends[task])
+            if fnid in tdepends_fnid:
+                reccumdepends[fnid].update(tdepends_fnid[fnid])
+        for task in range(len(self.runq_fnid)):
+            taskfnid = self.runq_fnid[task]
+            for fnid in reccumdepends:
+                if task in reccumdepends[fnid]:
+                    reccumdepends[fnid].add(task)
+                    if taskfnid in reccumdepends:
+                        reccumdepends[fnid].update(reccumdepends[taskfnid])
+
+
+        # Resolve recursive 'recrdeptask' dependencies (B)
+        #
+        # e.g. do_sometask[recrdeptask] = "do_someothertask"
+        # (makes sure sometask runs after someothertask of all DEPENDS, RDEPENDS and intertask dependencies, recursively)
+        for task in range(len(self.runq_fnid)):
+            if len(runq_recrdepends[task]) > 0:
+                taskfnid = self.runq_fnid[task]
+                for dep in reccumdepends[taskfnid]:
+                    for taskname in runq_recrdepends[task]:
+                        if taskData.tasks_name[dep] == taskname:
+                            self.runq_depends[task].add(dep)
 
         # Step B - Mark all active tasks
         #



-- 
Richard Purdie
Intel Open Source Technology Centre



