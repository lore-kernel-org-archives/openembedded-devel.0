Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P8bFQ-0006Jm-1Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 18:11:57 +0200
Received: (qmail 23687 invoked by uid 0); 20 Oct 2010 16:09:45 -0000
Received: from 193.8.40.126 by www115.gmx.net with HTTP;
	Wed, 20 Oct 2010 18:09:43 +0200 (CEST)
Cc: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 18:09:43 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101020160943.161310@gmx.net>
MIME-Version: 1.0
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1+scz03EqKso1GsiUqZyG2wwbWq7IMJIU48Lb25Ew
	RJtDBpwN8odu1tk0XWi5VPKtRIySMsensWAw== 
X-GMX-UID: IXDXAThebHIhf8p93jQ0RBUiJihyalCL
X-FuHaFi: 0.57999999999999996
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL, BAYES_00, MISSING_HEADERS,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] [PATCH] Add support for comma separated tasks with the -c option.
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
X-List-Received-Date: Wed, 20 Oct 2010 16:14:42 -0000
X-List-Received-Date: Wed, 20 Oct 2010 16:14:42 -0000
X-List-Received-Date: Wed, 20 Oct 2010 16:14:42 -0000
X-List-Received-Date: Wed, 20 Oct 2010 16:14:42 -0000
X-Groupsio-MsgNum: 25182
Content-Type: multipart/mixed; boundary="========GMX16131128759098362478"

--========GMX16131128759098362478
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

[forgot the cc]

-------- Original-Nachricht --------
Datum: Wed, 20 Oct 2010 18:08:11 +0200
Von: "Alexander Stohr" <Alexander.Stohr@gmx.de>
An: 
Betreff: Re: [Bitbake-dev] [PATCH] Add support for comma separated tasks with the -c option.

as it is GPL...

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

i felt free to port that patch back to a smaller set of older versions.

it should apply as a patch to what its names says, the rest is again GPL:

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

regards, Alex.

PS: for the CC'ed one, thats the url for the original patch including a good reasoning along with a short description on how its operation is meant
  https://lists.berlios.de/pipermail/bitbake-dev/2010-October/000719.html
-- 
GMX DSL Doppel-Flat ab 19,99 &euro;/mtl.! Jetzt auch mit 
gratis Notebook-Flat! http://portal.gmx.net/de/go/dsl

-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail

--========GMX16131128759098362478
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="bitbake-1.8.12-comma-separated-tasks.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="bitbake-1.8.12-comma-separated-tasks.patch"

diff -Nru bitbake-1.8.12.orig/lib/bb/cooker.py bitbake-1.8.12/lib/bb/cooker.py
--- bitbake-1.8.12.orig/lib/bb/cooker.py	2008-12-14 20:37:23.000000000 +0100
+++ bitbake-1.8.12/lib/bb/cooker.py	2010-10-20 17:58:54.000000000 +0200
@@ -70,6 +70,7 @@
 
         if not self.configuration.cmd:
             self.configuration.cmd = bb.data.getVar("BB_DEFAULT_TASK", self.configuration.data) or "build"
+        self.configuration.cmd = self.configuration.cmd.split(",")
 
         bbpkgs = bb.data.getVar('BBPKGS', self.configuration.data, True)
         if bbpkgs:
@@ -228,7 +229,7 @@
             if data.getVarFlag( e, 'python', envdata ):
                 sys.__stdout__.write("\npython %s () {\n%s}\n" % (e, data.getVar(e, envdata, 1)))
 
-    def generateDotGraph( self, pkgs_to_build, ignore_deps ):
+    def generateDotGraph( self, pkgs_to_build, ignore_deps, task ):
         """
         Generate a task dependency graph. 
 
@@ -249,7 +250,8 @@
         try:
             for k in pkgs_to_build:
                 taskdata.add_provider(localdata, self.status, k)
-                runlist.append([k, "do_%s" % self.configuration.cmd])
+                for t in task:
+                    runlist.append([k, "do_%s" % t])
             taskdata.add_unresolved(localdata, self.status)
         except bb.providers.NoProvider:
             sys.exit(1)
@@ -465,7 +467,7 @@
                 return False
             return matches[0]
 
-    def buildFile(self, buildfile):
+    def buildFile(self, buildfile, task):
         """
         Build the file matching regexp buildfile
         """
@@ -475,6 +477,10 @@
         if not fn:
             return False
 
+        # If we are told to do the None task then query the default task
+        if (task == None):
+            task = self.configuration.cmd
+
         # Load data into the cache for fn
         self.bb_cache = bb.cache.init(self)
         self.bb_cache.loadData(fn, self.configuration.data)
@@ -496,8 +502,9 @@
 
         # Remove stamp for target if force mode active
         if self.configuration.force:
-            bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (self.configuration.cmd, fn))
-            bb.build.del_stamp('do_%s' % self.configuration.cmd, self.configuration.data)
+            for t in task:
+                bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (t, fn))
+                bb.build.del_stamp('do_%s' % t, self.configuration.data)
 
         # Setup taskdata structure
         taskdata = bb.taskdata.TaskData(self.configuration.abort, self.configuration.tryaltconfigs)
@@ -507,7 +514,9 @@
         bb.event.fire(bb.event.BuildStarted(buildname, [item], self.configuration.event_data))
 
         # Execute the runqueue
-        runlist = [[item, "do_%s" % self.configuration.cmd]]
+        runlist = []
+        for t in task:
+            runlist.append([item, "do_%s" % t])
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)
         rq.prepare_runqueue()
         try:
@@ -522,7 +531,7 @@
         bb.event.fire(bb.event.BuildCompleted(buildname, [item], self.configuration.event_data, failures))
         return True
 
-    def buildTargets(self, targets):
+    def buildTargets(self, targets, task):
         """
         Attempt to build the targets specified
         """
@@ -540,7 +549,8 @@
         try:
             for k in targets:
                 taskdata.add_provider(localdata, self.status, k)
-                runlist.append([k, "do_%s" % self.configuration.cmd])
+                for t in task:
+                    runlist.append([k, "do_%s" % t])
             taskdata.add_unresolved(localdata, self.status)
         except bb.providers.NoProvider:
             sys.exit(1)
@@ -609,7 +619,7 @@
             self.interactiveMode()
 
         if self.configuration.buildfile is not None:
-            if not self.buildFile(self.configuration.buildfile):
+            if not self.buildFile(self.configuration.buildfile, self.configuration.cmd):
                 sys.exit(1)
             sys.exit(0)
 
@@ -638,10 +648,10 @@
                     pkgs_to_build.append(t)
 
             if self.configuration.dot_graph:
-                self.generateDotGraph( pkgs_to_build, self.configuration.ignored_dot_deps )
+                self.generateDotGraph( pkgs_to_build, self.configuration.ignored_dot_deps, self.configuration.cmd )
                 sys.exit( 0 )
 
-            return self.buildTargets(pkgs_to_build)
+            return self.buildTargets(pkgs_to_build, self.configuration.cmd)
 
         except KeyboardInterrupt:
             bb.msg.note(1, bb.msg.domain.Collection, "KeyboardInterrupt - Build not completed.")

--========GMX16131128759098362478
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="bitbake-1.8.18-comma-separated-tasks.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="bitbake-1.8.18-comma-separated-tasks.patch"

diff -Nru bitbake-1.8.18.orig/lib/bb/cooker.py bitbake-1.8.18/lib/bb/cooker.py
--- bitbake-1.8.18.orig/lib/bb/cooker.py	2009-11-10 16:22:07.000000000 +0100
+++ bitbake-1.8.18/lib/bb/cooker.py	2010-10-20 17:46:27.000000000 +0200
@@ -69,6 +69,7 @@
 
         if not self.configuration.cmd:
             self.configuration.cmd = bb.data.getVar("BB_DEFAULT_TASK", self.configuration.data) or "build"
+        self.configuration.cmd = self.configuration.cmd.split(",")
 
         bbpkgs = bb.data.getVar('BBPKGS', self.configuration.data, True)
         if bbpkgs and len(self.configuration.pkgs_to_build) == 0:
@@ -227,7 +228,7 @@
             if data.getVarFlag( e, 'python', envdata ):
                 sys.__stdout__.write("\npython %s () {\n%s}\n" % (e, data.getVar(e, envdata, 1)))
 
-    def generateDotGraph( self, pkgs_to_build, ignore_deps ):
+    def generateDotGraph( self, pkgs_to_build, ignore_deps, task ):
         """
         Generate a task dependency graph. 
 
@@ -248,7 +249,8 @@
         try:
             for k in pkgs_to_build:
                 taskdata.add_provider(localdata, self.status, k)
-                runlist.append([k, "do_%s" % self.configuration.cmd])
+                for t in task:
+                    runlist.append([k, "do_%s" % t])
             taskdata.add_unresolved(localdata, self.status)
         except bb.providers.NoProvider:
             sys.exit(1)
@@ -464,7 +466,7 @@
                 return False
             return matches[0]
 
-    def buildFile(self, buildfile):
+    def buildFile(self, buildfile, task):
         """
         Build the file matching regexp buildfile
         """
@@ -474,6 +476,10 @@
         if not fn:
             return False
 
+        # If we are told to do the None task then query the default task
+        if (task == None):
+            task = self.configuration.cmd
+
         # Load data into the cache for fn and parse the loaded cache data
         self.bb_cache = bb.cache.init(self)
         self.status = bb.cache.CacheData()
@@ -492,8 +498,9 @@
 
         # Remove stamp for target if force mode active
         if self.configuration.force:
-            bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (self.configuration.cmd, fn))
-            bb.build.del_stamp('do_%s' % self.configuration.cmd, self.configuration.data)
+            for t in task:
+                bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (t, fn))
+                bb.build.del_stamp('do_%s' % t, self.configuration.data)
 
         # Setup taskdata structure
         taskdata = bb.taskdata.TaskData(self.configuration.abort, self.configuration.tryaltconfigs)
@@ -503,7 +510,9 @@
         bb.event.fire(bb.event.BuildStarted(buildname, [item], self.configuration.event_data))
 
         # Execute the runqueue
-        runlist = [[item, "do_%s" % self.configuration.cmd]]
+        runlist = []
+        for t in task:
+            runlist.append([item, "do_%s" % t])
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)
         rq.prepare_runqueue()
         try:
@@ -518,7 +527,7 @@
         bb.event.fire(bb.event.BuildCompleted(buildname, [item], self.configuration.event_data, failures))
         return True
 
-    def buildTargets(self, targets):
+    def buildTargets(self, targets, task):
         """
         Attempt to build the targets specified
         """
@@ -536,7 +545,8 @@
         try:
             for k in targets:
                 taskdata.add_provider(localdata, self.status, k)
-                runlist.append([k, "do_%s" % self.configuration.cmd])
+                for t in task:
+                    runlist.append([k, "do_%s" % t])
             taskdata.add_unresolved(localdata, self.status)
         except bb.providers.NoProvider:
             sys.exit(1)
@@ -605,7 +615,7 @@
             self.interactiveMode()
 
         if self.configuration.buildfile is not None:
-            if not self.buildFile(self.configuration.buildfile):
+            if not self.buildFile(self.configuration.buildfile, self.configuration.cmd):
                 sys.exit(1)
             sys.exit(0)
 
@@ -634,10 +644,10 @@
                     pkgs_to_build.append(t)
 
             if self.configuration.dot_graph:
-                self.generateDotGraph( pkgs_to_build, self.configuration.ignored_dot_deps )
+                self.generateDotGraph( pkgs_to_build, self.configuration.ignored_dot_deps, self.configuration.cmd )
                 sys.exit( 0 )
 
-            return self.buildTargets(pkgs_to_build)
+            return self.buildTargets(pkgs_to_build, self.configuration.cmd)
 
         except KeyboardInterrupt:
             bb.msg.note(1, bb.msg.domain.Collection, "KeyboardInterrupt - Build not completed.")

--========GMX16131128759098362478
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="bitbake-1.10.0-comma-separated-tasks.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="bitbake-1.10.0-comma-separated-tasks.patch"

diff -Nru bitbake-1.10.0.orig/lib/bb/cooker.py bitbake-1.10.0/lib/bb/cooker.py
--- bitbake-1.10.0.orig/lib/bb/cooker.py	2010-08-13 17:57:38.000000000 +0200
+++ bitbake-1.10.0/lib/bb/cooker.py	2010-10-20 13:14:28.000000000 +0200
@@ -91,6 +91,7 @@
 
         if not self.configuration.cmd:
             self.configuration.cmd = bb.data.getVar("BB_DEFAULT_TASK", self.configuration.data, True) or "build"
+        self.configuration.cmd = self.configuration.cmd.split(",")
 
         bbpkgs = bb.data.getVar('BBPKGS', self.configuration.data, True)
         if bbpkgs and len(self.configuration.pkgs_to_build) == 0:
@@ -320,7 +321,8 @@
         runlist = []
         for k in pkgs_to_build:
             taskdata.add_provider(localdata, self.status, k)
-            runlist.append([k, "do_%s" % task])
+            for t in task:
+                runlist.append([k, "do_%s" % t])
         taskdata.add_unresolved(localdata, self.status)
 
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)
@@ -695,8 +697,9 @@
 
         # Remove stamp for target if force mode active
         if self.configuration.force:
-            bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (task, fn))
-            bb.build.del_stamp('do_%s' % task, self.status, fn)
+            for t in task:
+                bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (t, fn))
+                bb.build.del_stamp('do_%s' % t, self.status, fn)
 
         # Setup taskdata structure
         taskdata = bb.taskdata.TaskData(self.configuration.abort)
@@ -706,7 +709,9 @@
         bb.event.fire(bb.event.BuildStarted(buildname, [item]), self.configuration.event_data)
 
         # Execute the runqueue
-        runlist = [[item, "do_%s" % task]]
+        runlist = []
+        for t in task:
+            runlist.append([item, "do_%s" % t])
 
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)
 
@@ -780,7 +785,8 @@
         runlist = []
         for k in targets:
             taskdata.add_provider(localdata, self.status, k)
-            runlist.append([k, "do_%s" % task])
+            for t in task:
+                runlist.append([k, "do_%s" % t])
         taskdata.add_unresolved(localdata, self.status)
 
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)

--========GMX16131128759098362478
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="bitbake-1.10.1-comma-separated-tasks.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="bitbake-1.10.1-comma-separated-tasks.patch"

diff -Nru bitbake-1.10.1.orig/lib/bb/cooker.py bitbake-1.10.1/lib/bb/cooker.py
--- bitbake-1.10.1.orig/lib/bb/cooker.py	2010-10-15 02:45:07.000000000 +0200
+++ bitbake-1.10.1/lib/bb/cooker.py	2010-10-20 13:07:34.000000000 +0200
@@ -91,6 +91,7 @@
 
         if not self.configuration.cmd:
             self.configuration.cmd = bb.data.getVar("BB_DEFAULT_TASK", self.configuration.data, True) or "build"
+        self.configuration.cmd = self.configuration.cmd.split(",")
 
         bbpkgs = bb.data.getVar('BBPKGS', self.configuration.data, True)
         if bbpkgs and len(self.configuration.pkgs_to_build) == 0:
@@ -320,7 +321,8 @@
         runlist = []
         for k in pkgs_to_build:
             taskdata.add_provider(localdata, self.status, k)
-            runlist.append([k, "do_%s" % task])
+            for t in task:
+                runlist.append([k, "do_%s" % t])
         taskdata.add_unresolved(localdata, self.status)
 
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)
@@ -695,8 +697,9 @@
 
         # Remove stamp for target if force mode active
         if self.configuration.force:
-            bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (task, fn))
-            bb.build.del_stamp('do_%s' % task, self.status, fn)
+            for t in task:
+                bb.msg.note(2, bb.msg.domain.RunQueue, "Remove stamp %s, %s" % (t, fn))
+                bb.build.del_stamp('do_%s' % t, self.status, fn)
 
         # Setup taskdata structure
         taskdata = bb.taskdata.TaskData(self.configuration.abort)
@@ -706,7 +709,9 @@
         bb.event.fire(bb.event.BuildStarted(buildname, [item]), self.configuration.event_data)
 
         # Execute the runqueue
-        runlist = [[item, "do_%s" % task]]
+        runlist = []
+        for t in task:
+            runlist.append([item, "do_%s" % t])
 
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)
 
@@ -780,7 +785,8 @@
         runlist = []
         for k in targets:
             taskdata.add_provider(localdata, self.status, k)
-            runlist.append([k, "do_%s" % task])
+            for t in task:
+                runlist.append([k, "do_%s" % t])
         taskdata.add_unresolved(localdata, self.status)
 
         rq = bb.runqueue.RunQueue(self, self.configuration.data, self.status, taskdata, runlist)

--========GMX16131128759098362478--
