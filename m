Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3wmC-000888-4q
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 20:32:28 +0200
Received: (qmail 24575 invoked by uid 813007); 12 May 2009 18:25:48 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2009 18:25:48 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 20:25:12 +0200
Message-Id: <1242152713-31425-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Richard Purdie <rpurdie@linux.intel.com>
Subject: [STABLE][PATCH 1/2] bitbake: Update to work without warnings with python 2.6
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
X-List-Received-Date: Tue, 12 May 2009 18:32:28 -0000

From: Richard Purdie <rpurdie@linux.intel.com>

Some time ago I fixed BitBake trunk to not generate DeprecationWarnings
when used with Python 2.6. Some time later Richard Purdie backported it
into bitbake-1.8 branch. Now I tested it with stable/2009 and want to
get it inside.

Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 bitbake/lib/bb/COW.py        |    4 ++--
 bitbake/lib/bb/cache.py      |    3 +--
 bitbake/lib/bb/cooker.py     |    5 ++---
 bitbake/lib/bb/data_smart.py |    5 ++---
 bitbake/lib/bb/runqueue.py   |    7 +++----
 5 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/bitbake/lib/bb/COW.py b/bitbake/lib/bb/COW.py
index e5063d6..5db4177 100644
--- a/bitbake/lib/bb/COW.py
+++ b/bitbake/lib/bb/COW.py
@@ -26,7 +26,7 @@
 from inspect import getmro
 
 import copy
-import types, sets
+import types
 types.ImmutableTypes = tuple([ \
     types.BooleanType, \
     types.ComplexType, \
@@ -35,7 +35,7 @@ types.ImmutableTypes = tuple([ \
     types.LongType, \
     types.NoneType, \
     types.TupleType, \
-    sets.ImmutableSet] + \
+    frozenset] + \
     list(types.StringTypes))
 
 MUTABLE = "__mutable__"
diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
index a4a4f47..06985be 100644
--- a/bitbake/lib/bb/cache.py
+++ b/bitbake/lib/bb/cache.py
@@ -31,7 +31,6 @@
 import os, re
 import bb.data
 import bb.utils
-from sets import Set
 
 try:
     import cPickle as pickle
@@ -473,6 +472,6 @@ class CacheData:
         (set elsewhere)
         """
         self.ignored_dependencies = []
-        self.world_target = Set()
+        self.world_target = set()
         self.bbfile_priority = {}
         self.bbfile_config_priorities = []
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 6a6d254..90325d1 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -25,7 +25,6 @@
 import sys, os, getopt, glob, copy, os.path, re, time
 import bb
 from bb import utils, data, parse, event, cache, providers, taskdata, runqueue
-from sets import Set
 import itertools, sre_constants
 
 parsespin = itertools.cycle( r'|/-\\' )
@@ -485,7 +484,7 @@ class BBCooker:
 
         # Tweak some variables
         item = self.bb_cache.getVar('PN', fn, True)
-        self.status.ignored_dependencies = Set()
+        self.status.ignored_dependencies = set()
         self.status.bbfile_priority[fn] = 1
 
         # Remove external dependencies
@@ -577,7 +576,7 @@ class BBCooker:
         self.status = bb.cache.CacheData()
 
         ignore = bb.data.getVar("ASSUME_PROVIDED", self.configuration.data, 1) or ""
-        self.status.ignored_dependencies = Set( ignore.split() )
+        self.status.ignored_dependencies = set( ignore.split() )
 
         self.handleCollections( bb.data.getVar("BBFILE_COLLECTIONS", self.configuration.data, 1) )
 
diff --git a/bitbake/lib/bb/data_smart.py b/bitbake/lib/bb/data_smart.py
index 0d39d20..c93aea7 100644
--- a/bitbake/lib/bb/data_smart.py
+++ b/bitbake/lib/bb/data_smart.py
@@ -32,7 +32,6 @@ import copy, os, re, sys, time, types
 import bb
 from bb   import utils, methodpool
 from COW  import COWDictBase
-from sets import Set
 from new  import classobj
 
 
@@ -142,7 +141,7 @@ class DataSmart:
             try:
                 self._special_values[keyword].add( base )
             except:
-                self._special_values[keyword] = Set()
+                self._special_values[keyword] = set()
                 self._special_values[keyword].add( base )
 
             return
@@ -154,7 +153,7 @@ class DataSmart:
         if '_' in var:
             override = var[var.rfind('_')+1:]
             if not self._seen_overrides.has_key(override):
-                self._seen_overrides[override] = Set()
+                self._seen_overrides[override] = set()
             self._seen_overrides[override].add( var )
 
         # setting var
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 2df51de..9b3cbdf 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -23,7 +23,6 @@ Handles preparation and execution of a queue of tasks
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 from bb import msg, data, event, mkdirhier, utils
-from sets import Set 
 import bb, os, sys
 import signal
 import stat
@@ -525,8 +524,8 @@ class RunQueue:
 
             self.runq_fnid.append(taskData.tasks_fnid[task])
             self.runq_task.append(taskData.tasks_name[task])
-            self.runq_depends.append(Set(depends))
-            self.runq_revdeps.append(Set())
+            self.runq_depends.append(set(depends))
+            self.runq_revdeps.append(set())
 
             runq_build.append(0)
 
@@ -622,7 +621,7 @@ class RunQueue:
                 if maps[origdep] == -1:
                     bb.msg.fatal(bb.msg.domain.RunQueue, "Invalid mapping - Should never happen!")
                 newdeps.append(maps[origdep])
-            self.runq_depends[listid] = Set(newdeps)
+            self.runq_depends[listid] = set(newdeps)
 
         bb.msg.note(2, bb.msg.domain.RunQueue, "Assign Weightings")
 
-- 
1.6.3





