Received: from gateway-2929.mvista.com ([206.112.117.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1NXKQG-0003ey-EJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 21:11:37 +0100
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 701E71DBD3; Tue, 19 Jan 2010 12:09:00 -0800 (PST)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 13:00:41 -0700
Message-Id: <1263931241-18389-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 206.112.117.47
X-SA-Exim-Mail-From: clarson@mvista.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] base.bbclass: add popen/system convenience functions
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
X-List-Received-Date: Tue, 19 Jan 2010 20:11:38 -0000

Provides oe_popen, which is a subprocess.Popen wrapper that automatically
provides our exported variables in the environment, including the PATH, and
oe_system, which is just a wrapper that acts like system.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass |   37 +++++++++++++++++++++++++++++++------
 1 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index f67773a..edda75b 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1,5 +1,36 @@
 BB_DEFAULT_TASK ?= "build"
 
+python () {
+    env = {}
+    for v in d.keys():
+        if d.getVarFlag(v, "export"):
+            env[v] = d.getVar(v, True) or ""
+    d.setVar("__oe_popen_env", env)
+}
+
+def subprocess_setup():
+   import signal
+   # Python installs a SIGPIPE handler by default. This is usually not what
+   # non-Python subprocesses expect.
+   signal.signal(signal.SIGPIPE, signal.SIG_DFL)
+
+def oe_popen(d, cmd, **kwargs):
+    """ Convenience function to call out processes with our exported
+    variables in the environment.
+    """
+    from subprocess import Popen
+
+    if kwargs.get("env") is None:
+        kwargs["env"] = d.getVar("__oe_popen_env", 0)
+
+    kwargs["preexec_fn"] = subprocess_setup
+
+    return Popen(cmd, **kwargs)
+
+def oe_system(d, cmd):
+    """ Popen based version of os.system. """
+    return oe_popen(d, cmd, shell=True).wait()
+
 # like os.path.join but doesn't treat absolute RHS specially
 def base_path_join(a, *p):
     path = a
@@ -750,12 +781,6 @@ base_do_buildall() {
 	:
 }
 
-def subprocess_setup():
-	import signal
-	# Python installs a SIGPIPE handler by default. This is usually not what
-	# non-Python subprocesses expect.
-	signal.signal(signal.SIGPIPE, signal.SIG_DFL)
-
 def oe_unpack_file(file, data, url = None):
 	import subprocess
 	if not url:
-- 
1.6.6



