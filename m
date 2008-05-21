Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jyw3q-0001fS-Sw
	for openembedded-devel@openembedded.org; Wed, 21 May 2008 23:41:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4LLcoGT002445;
	Wed, 21 May 2008 22:38:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02419-01; Wed, 21 May 2008 22:38:45 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4LLcfDS002428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 May 2008 22:38:41 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1211231730.20390.18.camel@dax.rpnet.com>
References: <200805080215.23729.zecke@selfish.org>
	<200805081306.37230.zecke@selfish.org>
	<1210246170.5006.34.camel@dax.rpnet.com>
	<200805101405.38789.zecke@selfish.org>
	<1211231730.20390.18.camel@dax.rpnet.com>
Date: Wed, 21 May 2008 22:38:44 +0100
Message-Id: <1211405924.5005.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 21 May 2008 21:41:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I talked to Holger about the previous patch and he rightly IMO didn't
like some aspects of it. In the discussion we concluded (I think,
correct me if I'm wrong!) the best idea was to:

Take the original environment and process it as I proposed cleaning
completely by default apart from the standard whitelist and allowing
this behaviour to be overridden with:

BB_PRESERVE_ENV - if set don't touch the environment
BB_ENV_WHITELIST - a list of variables to whitelist overriding the default
BB_ENV_EXTRAWHITE - extra variables to whitelist (not touch)

Any variables still in the environment after this process are added into
the data dictionary. The difference is that whilst we used to export
everything in the original environment when executing shell tasks we now
will only export anything explicitly marked as an export.

I ran some tests and various things did break, specifically, PATH went
missing, devshell was missing some variables and bbimage broke badly. I
did fix up bbimage but then I decided to remove it entirely, something
long planned we've just never got around to it. I've added fixes for the
PATH and devshell issues although devshell could perhaps use some
further variables.

One side effect of this is we can throw the 'matchesenv' flag away which
might actually give a small parsing speedup.

So, any further comments?

I should probably s/BB_PRESERVE_ENV/BB_ENV_PRESERVE/ for consistency.

Cheers,

Richard

Index: lib/bb/utils.py
===================================================================
--- lib/bb/utils.py	(revision 4517)
+++ lib/bb/utils.py	(working copy)
@@ -268,3 +268,59 @@
     for line in open(filename):
         s.update(line)
     return s.hexdigest()
+
+def preserved_envvars_list():
+    return [
+        'BBPATH',
+        'BB_PRESERVE_ENV',
+        'BB_ENV_WHITELIST',
+        'BB_ENV_EXTRAWHITE',
+        'COLORTERM',
+        'DBUS_SESSION_BUS_ADDRESS',
+        'DESKTOP_SESSION',
+        'DESKTOP_STARTUP_ID',
+        'DISPLAY',
+        'GNOME_KEYRING_PID',
+        'GNOME_KEYRING_SOCKET',
+        'GPG_AGENT_INFO',
+        'GTK_RC_FILES',
+        'HOME',
+        'LANG',
+        'LOGNAME',
+        'PATH',
+        'PWD',
+        'SESSION_MANAGER',
+        'SHELL',
+        'SSH_AUTH_SOCK',
+        'TERM',
+        'USER',
+        'USERNAME',
+        '_',
+        'XAUTHORITY',
+        'XDG_DATA_DIRS',
+        'XDG_SESSION_COOKIE',
+    ]
+
+def filter_environment(good_vars):
+    """
+    Create a pristine environment for bitbake. This will remove variables that
+    are not known and may influence the build in a negative way.
+    """
+
+    import bb
+
+    removed_vars = []
+    for key in os.environ.keys():
+        if key in good_vars:
+            continue
+        
+        removed_vars.append(key)
+        os.unsetenv(key)
+        del os.environ[key]
+
+    if len(removed_vars):
+        bb.debug(1, "Removed the following variables from the environment:", ",".join(removed_vars))
+
+    return removed_vars
+
+
Index: lib/bb/data.py
===================================================================
--- lib/bb/data.py	(revision 4517)
+++ lib/bb/data.py	(working copy)
@@ -324,22 +324,16 @@
         if val != expanded:
             setVar(key, expanded, alterdata)
 
-import os
-
 def inheritFromOS(d):
     """Inherit variables from the environment."""
-#   fakeroot needs to be able to set these
-    non_inherit_vars = [ "LD_LIBRARY_PATH", "LD_PRELOAD" ]
     for s in os.environ.keys():
-        if not s in non_inherit_vars:
-            try:
-                setVar(s, os.environ[s], d)
-                setVarFlag(s, 'matchesenv', '1', d)
-            except TypeError:
-                pass
+        try:
+            setVar(s, os.environ[s], d)
+        except TypeError:
+            pass
+        os.unsetenv(s)
+        del os.environ[s]
 
-import sys
-
 def emit_var(var, o=sys.__stdout__, d = init(), all=False):
     """Emit a variable to be sourced by a shell."""
     if getVarFlag(var, "python", d):
@@ -379,9 +373,6 @@
         o.write('unset %s\n' % varExpanded)
         return 1
 
-    if getVarFlag(var, 'matchesenv', d):
-        return 0
-
     val.rstrip()
     if not val:
         return 0
Index: lib/bb/data_smart.py
===================================================================
--- lib/bb/data_smart.py	(revision 4517)
+++ lib/bb/data_smart.py	(working copy)
@@ -149,9 +149,6 @@
 
         if not var in self.dict:
             self._makeShadowCopy(var)
-        if self.getVarFlag(var, 'matchesenv'):
-            self.delVarFlag(var, 'matchesenv')
-            self.setVarFlag(var, 'export', 1)
 
         # more cookies for the cookie monster
         if '_' in var:
Index: lib/bb/cooker.py
===================================================================
--- lib/bb/cooker.py	(revision 4517)
+++ lib/bb/cooker.py	(working copy)
@@ -59,6 +59,10 @@
 
         self.configuration.data = bb.data.init()
 
+    def parseConfiguration(self):
+
+        bb.data.inheritFromOS(self.configuration.data)
+
         for f in self.configuration.file:
             self.parseConfigurationFile( f )
 
Index: lib/bb/parse/parse_py/ConfHandler.py
===================================================================
--- lib/bb/parse/parse_py/ConfHandler.py	(revision 4517)
+++ lib/bb/parse/parse_py/ConfHandler.py	(working copy)
@@ -118,7 +118,6 @@
     init(data)
 
     if include == 0:
-        bb.data.inheritFromOS(data)
         oldfile = None
     else:
         oldfile = bb.data.getVar('FILE', data)
Index: bin/bitbake
===================================================================
--- bin/bitbake	(revision 4517)
+++ bin/bitbake	(working copy)
@@ -113,6 +113,18 @@
 
     cooker = bb.cooker.BBCooker(configuration)
 
+    # Optionally clean up the environment
+    if 'BB_PRESERVE_ENV' not in os.environ:
+        if 'BB_ENV_WHITELIST' in os.environ:
+            good_vars = os.environ['BB_ENV_WHITELIST'].split()
+        else:
+            good_vars = bb.utils.preserved_envvars_list()
+        if 'BB_ENV_EXTRAWHITE' in os.environ:
+            good_vars.extend(os.environ['BB_ENV_EXTRAWHITE'].split())
+        bb.utils.filter_environment(good_vars)
+
+    cooker.parseConfiguration()
+
     if configuration.profile:
         try:
             import cProfile as profile



