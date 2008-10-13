Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpQgZ-0001ni-Gt
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 18:54:23 +0200
Received: from [92.116.253.95] (helo=[10.129.253.95])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1KpQbb-0002Xq-Hv; Mon, 13 Oct 2008 18:49:23 +0200
From: Holger Freyther <zecke@selfish.org>
To: bitbake-dev@lists.berlios.de
Date: Mon, 13 Oct 2008 18:43:53 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810131843.56121.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.253.95
Cc: openembedded-devel@lists.openembedded.org
Subject: [bitbake] Using pyflakes on trunk
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
X-List-Received-Date: Mon, 13 Oct 2008 16:54:23 -0000
X-Groupsio-MsgNum: 6179
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Mr38IvuXgVKrZsi"

--Boundary-00=_Mr38IvuXgVKrZsi
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

tom tomster mentioned pyflakes last winter and I finally ran it on the bitbake 
code base. It has saved my ass today (using it before pushing an untested 
change) and I just sat down and went through the other errors.

There are some things that CAN NEVER WORK:
	bb.utils has some old code that will lead to runtime error
	runqueue.py and cooker.py has some undefined variables...


I would like to land the cleanup on the imports and propose removing old cruft 
from bb.utils (package_rpm even uses the broken bb.movefile...).


so attached to this mail is a patch to bitbake, the output of pyflakes before 
and after running this utility. I would like to land the bitbake patch as 
soon as possible.


z.

--Boundary-00=_Mr38IvuXgVKrZsi
Content-Type: text/x-diff;
  charset="us-ascii";
  name="make-pyflakes-happy.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="make-pyflakes-happy.diff"

diff --git a/lib/bb/COW.py b/lib/bb/COW.py
index e5063d6..d76bbc9 100644
--- a/lib/bb/COW.py
+++ b/lib/bb/COW.py
@@ -23,8 +23,6 @@
 # Assign a file to __warn__ to get warnings about slow operations.
 #
 
-from inspect import getmro
-
 import copy
 import types, sets
 types.ImmutableTypes = tuple([ \
diff --git a/lib/bb/__init__.py b/lib/bb/__init__.py
index 9999521..0edf577 100644
--- a/lib/bb/__init__.py
+++ b/lib/bb/__init__.py
@@ -31,7 +31,6 @@ __all__ = [
     "fatal",
 
     "mkdirhier",
-    "movefile",
 
     "tokenize",
     "evaluate",
@@ -39,13 +38,11 @@ __all__ = [
     "relparse",
     "ververify",
     "isjustname",
-    "isspecific",
     "pkgsplit",
     "catpkgsplit",
     "vercmp",
     "pkgcmp",
     "dep_parenreduce",
-    "dep_opconvert",
 
 # fetch
     "decodeurl",
@@ -69,8 +66,7 @@ __all__ = [
 whitespace = '\t\n\x0b\x0c\r '
 lowercase = 'abcdefghijklmnopqrstuvwxyz'
 
-import sys, os, types, re, string, bb
-from bb import msg
+import os, types, re, string, bb, shutil
 
 #projectdir = os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0])))
 projectdir = os.getcwd()
@@ -752,23 +748,6 @@ def isjustname(mypkg):
     return 1
 
 
-_isspecific_cache_={}
-
-def isspecific(mypkg):
-    "now supports packages with no category"
-    try:
-        return __isspecific_cache__[mypkg]
-    except:
-        pass
-
-    mysplit = string.split(mypkg,"/")
-    if not isjustname(mysplit[-1]):
-            __isspecific_cache__[mypkg] = 1
-            return 1
-    __isspecific_cache__[mypkg] = 0
-    return 0
-
-
 #######################################################################
 
 __pkgsplit_cache__={}
@@ -1048,85 +1027,6 @@ def dep_parenreduce(mysplit, mypos=0):
     return mysplit
 
 
-def dep_opconvert(mysplit, myuse):
-    "Does dependency operator conversion"
-
-    mypos   = 0
-    newsplit = []
-    while mypos < len(mysplit):
-        if type(mysplit[mypos]) == types.ListType:
-            newsplit.append(dep_opconvert(mysplit[mypos],myuse))
-            mypos += 1
-        elif mysplit[mypos] == ")":
-            # mismatched paren, error
-            return None
-        elif mysplit[mypos]=="||":
-            if ((mypos+1)>=len(mysplit)) or (type(mysplit[mypos+1])!=types.ListType):
-                # || must be followed by paren'd list
-                return None
-            try:
-                mynew = dep_opconvert(mysplit[mypos+1],myuse)
-            except Exception, e:
-                error("unable to satisfy OR dependancy: " + string.join(mysplit," || "))
-                raise e
-            mynew[0:0] = ["||"]
-            newsplit.append(mynew)
-            mypos += 2
-        elif mysplit[mypos][-1] == "?":
-            # use clause, i.e "gnome? ( foo bar )"
-            # this is a quick and dirty hack so that repoman can enable all USE vars:
-            if (len(myuse) == 1) and (myuse[0] == "*"):
-                # enable it even if it's ! (for repoman) but kill it if it's
-                # an arch variable that isn't for this arch. XXX Sparc64?
-                if (mysplit[mypos][:-1] not in settings.usemask) or \
-                        (mysplit[mypos][:-1]==settings["ARCH"]):
-                    enabled=1
-                else:
-                    enabled=0
-            else:
-                if mysplit[mypos][0] == "!":
-                    myusevar = mysplit[mypos][1:-1]
-                    enabled = not myusevar in myuse
-                    #if myusevar in myuse:
-                    #    enabled = 0
-                    #else:
-                    #    enabled = 1
-                else:
-                    myusevar=mysplit[mypos][:-1]
-                    enabled = myusevar in myuse
-                    #if myusevar in myuse:
-                    #    enabled=1
-                    #else:
-                    #    enabled=0
-            if (mypos +2 < len(mysplit)) and (mysplit[mypos+2] == ":"):
-                # colon mode
-                if enabled:
-                    # choose the first option
-                    if type(mysplit[mypos+1]) == types.ListType:
-                        newsplit.append(dep_opconvert(mysplit[mypos+1],myuse))
-                    else:
-                        newsplit.append(mysplit[mypos+1])
-                else:
-                    # choose the alternate option
-                    if type(mysplit[mypos+1]) == types.ListType:
-                        newsplit.append(dep_opconvert(mysplit[mypos+3],myuse))
-                    else:
-                        newsplit.append(mysplit[mypos+3])
-                mypos += 4
-            else:
-                # normal use mode
-                if enabled:
-                    if type(mysplit[mypos+1]) == types.ListType:
-                        newsplit.append(dep_opconvert(mysplit[mypos+1],myuse))
-                    else:
-                        newsplit.append(mysplit[mypos+1])
-                # otherwise, continue
-                mypos += 2
-        else:
-            # normal item
-            newsplit.append(mysplit[mypos])
-            mypos += 1
-    return newsplit
 
 if __name__ == "__main__":
     import doctest, bb
diff --git a/lib/bb/build.py b/lib/bb/build.py
index b8abe6d..ba423cb 100644
--- a/lib/bb/build.py
+++ b/lib/bb/build.py
@@ -191,7 +191,7 @@ def exec_func(func, d, dirs = None):
 
 def exec_func_python(func, d, runfile, logfile):
     """Execute a python BB 'function'"""
-    import re, os
+    import os
 
     bbfile = bb.data.getVar('FILE', d, 1)
     tmp  = "def " + func + "():\n%s" % data.getVar(func, d)
diff --git a/lib/bb/cache.py b/lib/bb/cache.py
index fe38ea0..8de6ee2 100644
--- a/lib/bb/cache.py
+++ b/lib/bb/cache.py
@@ -28,9 +28,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 
-import os, re
-import bb.data
-import bb.utils
+import os
+import bb
 from sets import Set
 
 try:
@@ -380,8 +379,7 @@ class Cache:
         Return the data and whether parsing resulted in the file being skipped
         """
 
-        import bb
-        from bb import utils, data, parse, debug, event, fatal
+        from bb import data, parse
 
         # expand tmpdir to include this topdir
         data.setVar('TMPDIR', data.getVar('TMPDIR', config, 1) or "", config)
diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index 1531808..acbdf4e 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -22,12 +22,11 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import sys, os, getopt, glob, copy, os.path, re, time
+import sys, os, glob, re, time
 import bb
-from bb import utils, data, parse, event, cache, providers, taskdata, runqueue
-from bb import xmlrpcserver, command
+from bb import data, runqueue
 from sets import Set
-import itertools, sre_constants
+import sre_constants
 
 class MultipleMatches(Exception):
     """
diff --git a/lib/bb/data.py b/lib/bb/data.py
index 82eef44..5e5b3e5 100644
--- a/lib/bb/data.py
+++ b/lib/bb/data.py
@@ -37,7 +37,7 @@ the speed is more critical here.
 #
 #Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import sys, os, re, time, types
+import sys, os, re, types
 if sys.argv[0][-5:] == "pydoc":
     path = os.path.dirname(os.path.dirname(sys.argv[1]))
 else:
diff --git a/lib/bb/data_smart.py b/lib/bb/data_smart.py
index 0d39d20..1e4971d 100644
--- a/lib/bb/data_smart.py
+++ b/lib/bb/data_smart.py
@@ -28,12 +28,9 @@ BitBake build tools.
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import copy, os, re, sys, time, types
-import bb
-from bb   import utils, methodpool
+import bb, copy, re, sys, types
 from COW  import COWDictBase
 from sets import Set
-from new  import classobj
 
 
 __setvar_keyword__ = ["_append","_prepend"]
@@ -65,7 +62,6 @@ class DataSmart:
                 return match.group()
 
         def python_sub(match):
-            import bb
             code = match.group()[3:-1]
             locals()['d'] = self
             s = eval(code)
diff --git a/lib/bb/event.py b/lib/bb/event.py
index c13a012..e32b46b 100644
--- a/lib/bb/event.py
+++ b/lib/bb/event.py
@@ -22,7 +22,6 @@ BitBake build tools.
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import os, re
 import bb.utils
 
 class Event:
diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 99f4b58..992cfa1 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -24,7 +24,7 @@ BitBake build tools.
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re, fcntl
+import os
 import bb
 from   bb import data
 from   bb import persist_data
diff --git a/lib/bb/fetch/bzr.py b/lib/bb/fetch/bzr.py
index b23e9ee..b27fb63 100644
--- a/lib/bb/fetch/bzr.py
+++ b/lib/bb/fetch/bzr.py
@@ -29,7 +29,6 @@ import bb
 from bb import data
 from bb.fetch import Fetch
 from bb.fetch import FetchError
-from bb.fetch import MissingParameterError
 from bb.fetch import runfetchcmd
 
 class Bzr(Fetch):
diff --git a/lib/bb/fetch/cvs.py b/lib/bb/fetch/cvs.py
index aa55ad8..d8bd4ea 100644
--- a/lib/bb/fetch/cvs.py
+++ b/lib/bb/fetch/cvs.py
@@ -26,7 +26,7 @@ BitBake build tools.
 #Based on functions from the base bb module, Copyright 2003 Holger Schurig
 #
 
-import os, re
+import os
 import bb
 from   bb import data
 from   bb.fetch import Fetch
diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index 3a2fa5a..58a2873 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -20,11 +20,10 @@ BitBake 'Fetch' git implementation
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import os, re
+import os
 import bb
 from   bb    import data
 from   bb.fetch import Fetch
-from   bb.fetch import FetchError
 from   bb.fetch import runfetchcmd
 
 class Git(Fetch):
diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
index 1cd5a8a..03de859 100644
--- a/lib/bb/fetch/hg.py
+++ b/lib/bb/fetch/hg.py
@@ -24,7 +24,7 @@ BitBake 'Fetch' implementation for mercurial DRCS (hg).
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os
 import sys
 import bb
 from bb import data
diff --git a/lib/bb/fetch/local.py b/lib/bb/fetch/local.py
index 54d598a..577774e 100644
--- a/lib/bb/fetch/local.py
+++ b/lib/bb/fetch/local.py
@@ -25,7 +25,7 @@ BitBake build tools.
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os
 import bb
 from   bb import data
 from   bb.fetch import Fetch
diff --git a/lib/bb/fetch/perforce.py b/lib/bb/fetch/perforce.py
index 2fb38b4..394f5a2 100644
--- a/lib/bb/fetch/perforce.py
+++ b/lib/bb/fetch/perforce.py
@@ -25,12 +25,11 @@ BitBake build tools.
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os
 import bb
 from   bb import data
 from   bb.fetch import Fetch
 from   bb.fetch import FetchError
-from   bb.fetch import MissingParameterError
 
 class Perforce(Fetch):
     def supports(self, url, ud, d):
diff --git a/lib/bb/fetch/ssh.py b/lib/bb/fetch/ssh.py
index 81a9892..68e6fdb 100644
--- a/lib/bb/fetch/ssh.py
+++ b/lib/bb/fetch/ssh.py
@@ -37,11 +37,9 @@ IETF secsh internet draft:
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import re, os
-import bb
 from   bb import data
 from   bb.fetch import Fetch
 from   bb.fetch import FetchError
-from   bb.fetch import MissingParameterError
 
 
 __pattern__ = re.compile(r'''
diff --git a/lib/bb/fetch/svk.py b/lib/bb/fetch/svk.py
index d863ccb..c579a3a 100644
--- a/lib/bb/fetch/svk.py
+++ b/lib/bb/fetch/svk.py
@@ -25,7 +25,7 @@ This implementation is for svk. It is based on the svn implementation
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os, date
 import bb
 from   bb import data
 from   bb.fetch import Fetch
diff --git a/lib/bb/fetch/svn.py b/lib/bb/fetch/svn.py
index 5e5b31b..89beb8d 100644
--- a/lib/bb/fetch/svn.py
+++ b/lib/bb/fetch/svn.py
@@ -23,7 +23,7 @@ BitBake 'Fetch' implementation for svn.
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os
 import sys
 import bb
 from   bb import data
diff --git a/lib/bb/fetch/wget.py b/lib/bb/fetch/wget.py
index 739d5a1..e6ae5ac 100644
--- a/lib/bb/fetch/wget.py
+++ b/lib/bb/fetch/wget.py
@@ -25,7 +25,7 @@ BitBake build tools.
 #
 # Based on functions from the base bb module, Copyright 2003 Holger Schurig
 
-import os, re
+import os
 import bb
 from   bb import data
 from   bb.fetch import Fetch
diff --git a/lib/bb/manifest.py b/lib/bb/manifest.py
index 4e4b7d9..5cb53a7 100644
--- a/lib/bb/manifest.py
+++ b/lib/bb/manifest.py
@@ -16,8 +16,8 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import os, sys
-import bb, bb.data
+import os
+import bb
 
 def getfields(line):
     fields = {}
diff --git a/lib/bb/methodpool.py b/lib/bb/methodpool.py
index f43c4a0..1b5984e 100644
--- a/lib/bb/methodpool.py
+++ b/lib/bb/methodpool.py
@@ -38,6 +38,8 @@ from bb       import error
 _parsed_methods = { }
 _parsed_fns     = { }
 
+global __builtins__
+
 def insert_method(modulename, code, fn):
     """
     Add code of a module should be added. The methods
diff --git a/lib/bb/msg.py b/lib/bb/msg.py
index 7aa0a27..7990833 100644
--- a/lib/bb/msg.py
+++ b/lib/bb/msg.py
@@ -22,8 +22,8 @@ Message handling infrastructure for bitbake
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import sys, os, re, bb
-from bb import utils, event
+import sys, bb
+from bb import event
 
 debug_level = {}
 
diff --git a/lib/bb/parse/parse_py/BBHandler.py b/lib/bb/parse/parse_py/BBHandler.py
index e9b950a..7369286 100644
--- a/lib/bb/parse/parse_py/BBHandler.py
+++ b/lib/bb/parse/parse_py/BBHandler.py
@@ -25,9 +25,8 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import re, bb, os, sys, time
-import bb.fetch, bb.build, bb.utils
-from bb import data, fetch, methodpool
+import re, bb, os
+from bb import data, methodpool
 
 from ConfHandler import include, localpath, obtain, init
 from bb.parse import ParseError
@@ -47,6 +46,7 @@ __body__   = []
 __classname__ = ""
 classes = [ None, ]
 
+
 # We need to indicate EOF to the feeder. This code is so messy that
 # factoring it out to a close_parse_file method is out of question.
 # We will use the IN_PYTHON_EOF as an indicator to just close the method
diff --git a/lib/bb/providers.py b/lib/bb/providers.py
index 3504efc..fb0c401 100644
--- a/lib/bb/providers.py
+++ b/lib/bb/providers.py
@@ -21,7 +21,7 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import os, re
+import re
 from bb import data, utils
 import bb
 
diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 4130b50..f193fe8 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -22,7 +22,7 @@ Handles preparation and execution of a queue of tasks
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-from bb import msg, data, event, mkdirhier, utils
+from bb import event
 from sets import Set 
 import bb, os, sys
 import signal
diff --git a/lib/bb/shell.py b/lib/bb/shell.py
index 34828fe..0e4dc9d 100644
--- a/lib/bb/shell.py
+++ b/lib/bb/shell.py
@@ -56,8 +56,8 @@ try:
     set
 except NameError:
     from sets import Set as set
-import sys, os, readline, socket, httplib, urllib, commands, popen2, copy, shlex, Queue, fnmatch
-from bb import data, parse, build, fatal, cache, taskdata, runqueue, providers as Providers
+import sys, os, readline, socket, httplib, urllib, commands, popen2, shlex, Queue, fnmatch
+from bb import data, parse, build, cache, taskdata, runqueue, providers as Providers
 
 __version__ = "0.5.3.1"
 __credits__ = """BitBake Shell Version %s (C) 2005 Michael 'Mickey' Lauer <mickey@Vanille.de>
@@ -133,12 +133,12 @@ class BitBakeShellCommands:
 
     def buffers( self, params ):
         """Show the available output buffers"""
-        commands = self._shell.myout.bufferedCommands()
-        if not commands:
+        _commands = self._shell.myout.bufferedCommands()
+        if not _commands:
             print "SHELL: No buffered commands available yet. Start doing something."
         else:
             print "="*35, "Available Output Buffers", "="*27
-            for index, cmd in enumerate( commands ):
+            for index, cmd in enumerate( _commands ):
                 print "| %s %s" % ( str( index ).ljust( 3 ), cmd )
             print "="*88
 
diff --git a/lib/bb/taskdata.py b/lib/bb/taskdata.py
index 566614e..4e4b48c 100644
--- a/lib/bb/taskdata.py
+++ b/lib/bb/taskdata.py
@@ -23,8 +23,7 @@ Task data collection and handling
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-from bb import data, event, mkdirhier, utils
-import bb, os
+import bb
 
 class TaskData:
     """
diff --git a/lib/bb/ui/depexplorer.py b/lib/bb/ui/depexplorer.py
index becbb5d..90cfcb7 100644
--- a/lib/bb/ui/depexplorer.py
+++ b/lib/bb/ui/depexplorer.py
@@ -20,6 +20,7 @@
 import gobject
 import gtk
 import threading
+import xmlrpclib
 
 # Package Model
 (COL_PKG_NAME) = (0)
diff --git a/lib/bb/ui/knotty.py b/lib/bb/ui/knotty.py
index 9e89660..3476fc0 100644
--- a/lib/bb/ui/knotty.py
+++ b/lib/bb/ui/knotty.py
@@ -19,11 +19,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
-import bb
-from bb import cooker
 
 import sys
-import time
 import itertools
 import xmlrpclib
 
diff --git a/lib/bb/ui/ncurses.py b/lib/bb/ui/ncurses.py
index 1476baa..c7ac522 100644
--- a/lib/bb/ui/ncurses.py
+++ b/lib/bb/ui/ncurses.py
@@ -44,10 +44,9 @@
 
 """
 
-import os, sys, curses, time, random, threading, itertools, time
-from curses.textpad import Textbox
+import curses, itertools, time
 import bb
-from bb import ui
+import xmlrpclib
 from bb.ui import uihelper
 
 parsespin = itertools.cycle( r'|/-\\' )
diff --git a/lib/bb/ui/uievent.py b/lib/bb/ui/uievent.py
index 9d724d7..476eb4c 100644
--- a/lib/bb/ui/uievent.py
+++ b/lib/bb/ui/uievent.py
@@ -24,7 +24,7 @@ server and queue them for the UI to process. This process must be used to avoid
 client/server deadlocks.
 """
 
-import sys, socket, threading
+import socket, threading
 from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
 
 class BBUIEventQueue:
diff --git a/lib/bb/xmlrpcserver.py b/lib/bb/xmlrpcserver.py
index 075eda0..2a23436 100644
--- a/lib/bb/xmlrpcserver.py
+++ b/lib/bb/xmlrpcserver.py
@@ -37,7 +37,7 @@ import xmlrpclib
 DEBUG = False
 
 from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
-import os, sys, inspect, select
+import inspect, select
 
 class BitBakeServerCommands():
     def __init__(self, server, cooker):

--Boundary-00=_Mr38IvuXgVKrZsi
Content-Type: text/plain;
  charset="us-ascii";
  name="pyflakes.output.after"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="pyflakes.output.after"

./lib/bb/__init__.py:210: undefined name 'getstatusoutput'
./lib/bb/__init__.py:210: undefined name 'getstatusoutput'
./lib/bb/__init__.py:216: undefined name 'missingos'
./lib/bb/__init__.py:282: undefined name 'getstatusoutput'
./lib/bb/__init__.py:216: undefined name 'missingos'
./lib/bb/__init__.py:210: undefined name 'getstatusoutput'
./lib/bb/__init__.py:216: undefined name 'missingos'
./lib/bb/__init__.py:282: undefined name 'getstatusoutput'
./lib/bb/__init__.py:282: undefined name 'getstatusoutput'
./lib/bb/__init__.py:210: undefined name 'getstatusoutput'
./lib/bb/__init__.py:216: undefined name 'missingos'
./lib/bb/__init__.py:282: undefined name 'getstatusoutput'
./lib/bb/event.py:60: undefined name 'tmpHandler'
./lib/bb/event.py:60: undefined name 'tmpHandler'
./lib/bb/methodpool.py:49: undefined name '__builtins__'
./lib/bb/methodpool.py:49: undefined name '__builtins__'
./lib/bb/cooker.py:677: undefined name 'targets'
./lib/bb/cooker.py:677: undefined name 'targets'
./lib/bb/cooker.py:913: redefinition of unused 'profile' from line 911
./lib/bb/cooker.py:913: redefinition of unused 'profile' from line 911
./lib/bb/cooker.py:677: undefined name 'targets'
./lib/bb/cooker.py:913: redefinition of unused 'profile' from line 911
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/persist_data.py:24: redefinition of unused 'sqlite3' from line 21
./lib/bb/persist_data.py:24: redefinition of unused 'sqlite3' from line 21
./lib/bb/cache.py:38: redefinition of unused 'pickle' from line 36
./lib/bb/cache.py:38: redefinition of unused 'pickle' from line 36
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/parse_py/__init__.py:32: 'ConfHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:32: 'ConfHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:33: 'BBHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:33: 'BBHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:32: 'ConfHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:33: 'BBHandler' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'

--Boundary-00=_Mr38IvuXgVKrZsi
Content-Type: text/plain;
  charset="us-ascii";
  name="pyflakes.output.before"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="pyflakes.output.before"

./lib/bb/shell.py:59: 'copy' imported but unused
./lib/bb/shell.py:59: 'copy' imported but unused
./lib/bb/shell.py:60: 'fatal' imported but unused
./lib/bb/shell.py:136: redefinition of unused 'commands' from line 59
./lib/bb/shell.py:60: 'fatal' imported but unused
./lib/bb/shell.py:59: 'copy' imported but unused
./lib/bb/shell.py:60: 'fatal' imported but unused
./lib/bb/shell.py:136: redefinition of unused 'commands' from line 59
./lib/bb/shell.py:136: redefinition of unused 'commands' from line 59
./lib/bb/shell.py:59: 'copy' imported but unused
./lib/bb/shell.py:60: 'fatal' imported but unused
./lib/bb/shell.py:136: redefinition of unused 'commands' from line 59
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/__init__.py:72: 'sys' imported but unused
./lib/bb/__init__.py:73: 'msg' imported but unused
./lib/bb/__init__.py:206: undefined name 'shutil'
./lib/bb/__init__.py:214: undefined name 'getstatusoutput'
./lib/bb/__init__.py:220: undefined name 'missingos'
./lib/bb/__init__.py:286: undefined name 'getstatusoutput'
./lib/bb/__init__.py:760: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:766: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:768: undefined name '__isspecific_cache__'
./lib/bb/__init__.py:1081: undefined name 'settings'
./lib/bb/__init__.py:1082: undefined name 'settings'
./lib/bb/event.py:25: 're' imported but unused
./lib/bb/event.py:25: 're' imported but unused
./lib/bb/event.py:25: 'os' imported but unused
./lib/bb/event.py:61: undefined name 'tmpHandler'
./lib/bb/event.py:25: 'os' imported but unused
./lib/bb/event.py:25: 're' imported but unused
./lib/bb/event.py:25: 'os' imported but unused
./lib/bb/event.py:61: undefined name 'tmpHandler'
./lib/bb/event.py:61: undefined name 'tmpHandler'
./lib/bb/event.py:25: 're' imported but unused
./lib/bb/event.py:25: 'os' imported but unused
./lib/bb/event.py:61: undefined name 'tmpHandler'
./lib/bb/methodpool.py:47: undefined name '__builtins__'
./lib/bb/methodpool.py:47: undefined name '__builtins__'
./lib/bb/manifest.py:19: 'sys' imported but unused
./lib/bb/manifest.py:19: 'sys' imported but unused
./lib/bb/manifest.py:20: redefinition of unused 'bb' from line 20
./lib/bb/manifest.py:20: redefinition of unused 'bb' from line 20
./lib/bb/manifest.py:19: 'sys' imported but unused
./lib/bb/manifest.py:20: redefinition of unused 'bb' from line 20
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/cooker.py:25: redefinition of unused 'os' from line 25
./lib/bb/cooker.py:25: 'getopt' imported but unused
./lib/bb/cooker.py:25: 'copy' imported but unused
./lib/bb/cooker.py:27: 'providers' imported but unused
./lib/bb/cooker.py:27: 'utils' imported but unused
./lib/bb/cooker.py:27: 'parse' imported but unused
./lib/bb/cooker.py:27: 'event' imported but unused
./lib/bb/cooker.py:27: 'cache' imported but unused
./lib/bb/cooker.py:27: 'taskdata' imported but unused
./lib/bb/cooker.py:28: 'xmlrpcserver' imported but unused
./lib/bb/cooker.py:28: 'command' imported but unused
./lib/bb/cooker.py:30: 'itertools' imported but unused
./lib/bb/cooker.py:197: redefinition of unused 'event' from line 27
./lib/bb/cooker.py:269: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:322: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:650: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:678: undefined name 'targets'
./lib/bb/cooker.py:723: redefinition of unused 'taskdata' from line 27
./lib/bb/cooker.py:914: redefinition of unused 'profile' from line 912
./lib/bb/providers.py:24: 'os' imported but unused
./lib/bb/providers.py:24: 'os' imported but unused
./lib/bb/COW.py:26: 'getmro' imported but unused
./lib/bb/COW.py:26: 'getmro' imported but unused
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:25: 'mkdirhier' imported but unused
./lib/bb/runqueue.py:25: 'utils' imported but unused
./lib/bb/runqueue.py:25: 'msg' imported but unused
./lib/bb/runqueue.py:25: 'data' imported but unused
./lib/bb/runqueue.py:332: redefinition of unused 'msg' from line 25
./lib/bb/runqueue.py:946: undefined name 'runQueueCleanup'
./lib/bb/runqueue.py:955: undefined name 'runQueueCleanup'
./lib/bb/xmlrpcserver.py:40: 'sys' imported but unused
./lib/bb/xmlrpcserver.py:40: 'sys' imported but unused
./lib/bb/xmlrpcserver.py:40: 'os' imported but unused
./lib/bb/xmlrpcserver.py:40: 'os' imported but unused
./lib/bb/xmlrpcserver.py:40: 'sys' imported but unused
./lib/bb/xmlrpcserver.py:40: 'os' imported but unused
./lib/bb/taskdata.py:26: 'mkdirhier' imported but unused
./lib/bb/taskdata.py:26: 'mkdirhier' imported but unused
./lib/bb/taskdata.py:26: 'data' imported but unused
./lib/bb/taskdata.py:26: 'utils' imported but unused
./lib/bb/taskdata.py:26: 'event' imported but unused
./lib/bb/taskdata.py:27: 'os' imported but unused
./lib/bb/taskdata.py:26: 'data' imported but unused
./lib/bb/taskdata.py:26: 'mkdirhier' imported but unused
./lib/bb/taskdata.py:26: 'data' imported but unused
./lib/bb/taskdata.py:26: 'utils' imported but unused
./lib/bb/taskdata.py:26: 'event' imported but unused
./lib/bb/taskdata.py:27: 'os' imported but unused
./lib/bb/taskdata.py:26: 'utils' imported but unused
./lib/bb/taskdata.py:26: 'mkdirhier' imported but unused
./lib/bb/taskdata.py:26: 'data' imported but unused
./lib/bb/taskdata.py:26: 'utils' imported but unused
./lib/bb/taskdata.py:26: 'event' imported but unused
./lib/bb/taskdata.py:27: 'os' imported but unused
./lib/bb/taskdata.py:26: 'event' imported but unused
./lib/bb/taskdata.py:26: 'mkdirhier' imported but unused
./lib/bb/taskdata.py:26: 'data' imported but unused
./lib/bb/taskdata.py:26: 'utils' imported but unused
./lib/bb/taskdata.py:26: 'event' imported but unused
./lib/bb/taskdata.py:27: 'os' imported but unused
./lib/bb/taskdata.py:27: 'os' imported but unused
./lib/bb/taskdata.py:26: 'mkdirhier' imported but unused
./lib/bb/taskdata.py:26: 'data' imported but unused
./lib/bb/taskdata.py:26: 'utils' imported but unused
./lib/bb/taskdata.py:26: 'event' imported but unused
./lib/bb/taskdata.py:27: 'os' imported but unused
./lib/bb/persist_data.py:24: redefinition of unused 'sqlite3' from line 21
./lib/bb/persist_data.py:24: redefinition of unused 'sqlite3' from line 21
./lib/bb/build.py:194: 're' imported but unused
./lib/bb/build.py:194: 're' imported but unused
./lib/bb/msg.py:25: 're' imported but unused
./lib/bb/msg.py:25: 're' imported but unused
./lib/bb/msg.py:25: 'os' imported but unused
./lib/bb/msg.py:26: 'utils' imported but unused
./lib/bb/msg.py:25: 'os' imported but unused
./lib/bb/msg.py:25: 're' imported but unused
./lib/bb/msg.py:25: 'os' imported but unused
./lib/bb/msg.py:26: 'utils' imported but unused
./lib/bb/msg.py:26: 'utils' imported but unused
./lib/bb/msg.py:25: 're' imported but unused
./lib/bb/msg.py:25: 'os' imported but unused
./lib/bb/msg.py:26: 'utils' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data_smart.py:31: 'time' imported but unused
./lib/bb/data_smart.py:31: 'os' imported but unused
./lib/bb/data_smart.py:33: 'methodpool' imported but unused
./lib/bb/data_smart.py:33: 'utils' imported but unused
./lib/bb/data_smart.py:36: 'classobj' imported but unused
./lib/bb/data_smart.py:68: 'bb' imported but unused
./lib/bb/data.py:40: 'time' imported but unused
./lib/bb/data.py:40: 'time' imported but unused
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/cache.py:31: 're' imported but unused
./lib/bb/cache.py:33: redefinition of unused 'bb' from line 32
./lib/bb/cache.py:39: redefinition of unused 'pickle' from line 37
./lib/bb/cache.py:384: 'event' imported but unused
./lib/bb/cache.py:384: 'debug' imported but unused
./lib/bb/cache.py:384: 'fatal' imported but unused
./lib/bb/cache.py:384: 'utils' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/ncurses.py:47: redefinition of unused 'time' from line 47
./lib/bb/ui/ncurses.py:47: 'random' imported but unused
./lib/bb/ui/ncurses.py:47: 'sys' imported but unused
./lib/bb/ui/ncurses.py:47: 'threading' imported but unused
./lib/bb/ui/ncurses.py:47: 'os' imported but unused
./lib/bb/ui/ncurses.py:48: 'Textbox' imported but unused
./lib/bb/ui/ncurses.py:50: 'ui' imported but unused
./lib/bb/ui/ncurses.py:236: undefined name 'xmlrpclib'
./lib/bb/ui/ncurses.py:327: redefinition of unused 'ui' from line 50
./lib/bb/ui/depexplorer.py:209: undefined name 'xmlrpclib'
./lib/bb/ui/depexplorer.py:209: undefined name 'xmlrpclib'
./lib/bb/ui/uievent.py:27: 'sys' imported but unused
./lib/bb/ui/uievent.py:27: 'sys' imported but unused
./lib/bb/ui/knotty.py:22: 'bb' imported but unused
./lib/bb/ui/knotty.py:22: 'bb' imported but unused
./lib/bb/ui/knotty.py:23: 'cooker' imported but unused
./lib/bb/ui/knotty.py:26: 'time' imported but unused
./lib/bb/ui/knotty.py:23: 'cooker' imported but unused
./lib/bb/ui/knotty.py:22: 'bb' imported but unused
./lib/bb/ui/knotty.py:23: 'cooker' imported but unused
./lib/bb/ui/knotty.py:26: 'time' imported but unused
./lib/bb/ui/knotty.py:26: 'time' imported but unused
./lib/bb/ui/knotty.py:22: 'bb' imported but unused
./lib/bb/ui/knotty.py:23: 'cooker' imported but unused
./lib/bb/ui/knotty.py:26: 'time' imported but unused
./lib/bb/fetch/__init__.py:27: 're' imported but unused
./lib/bb/fetch/__init__.py:27: 're' imported but unused
./lib/bb/fetch/__init__.py:27: 'fcntl' imported but unused
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:68: redefinition of unused 're' from line 27
./lib/bb/fetch/__init__.py:27: 'fcntl' imported but unused
./lib/bb/fetch/__init__.py:27: 're' imported but unused
./lib/bb/fetch/__init__.py:27: 'fcntl' imported but unused
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:68: redefinition of unused 're' from line 27
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:27: 're' imported but unused
./lib/bb/fetch/__init__.py:27: 'fcntl' imported but unused
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:68: redefinition of unused 're' from line 27
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:27: 're' imported but unused
./lib/bb/fetch/__init__.py:27: 'fcntl' imported but unused
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:68: redefinition of unused 're' from line 27
./lib/bb/fetch/__init__.py:68: redefinition of unused 're' from line 27
./lib/bb/fetch/__init__.py:27: 're' imported but unused
./lib/bb/fetch/__init__.py:27: 'fcntl' imported but unused
./lib/bb/fetch/__init__.py:35: redefinition of unused 'pickle' from line 33
./lib/bb/fetch/__init__.py:35: 'pickle' imported but unused
./lib/bb/fetch/__init__.py:68: redefinition of unused 're' from line 27
./lib/bb/fetch/local.py:28: 're' imported but unused
./lib/bb/fetch/local.py:28: 're' imported but unused
./lib/bb/fetch/ssh.py:40: 'bb' imported but unused
./lib/bb/fetch/ssh.py:40: 'bb' imported but unused
./lib/bb/fetch/ssh.py:44: 'MissingParameterError' imported but unused
./lib/bb/fetch/ssh.py:44: 'MissingParameterError' imported but unused
./lib/bb/fetch/ssh.py:40: 'bb' imported but unused
./lib/bb/fetch/ssh.py:44: 'MissingParameterError' imported but unused
./lib/bb/fetch/perforce.py:28: 're' imported but unused
./lib/bb/fetch/perforce.py:28: 're' imported but unused
./lib/bb/fetch/perforce.py:33: 'MissingParameterError' imported but unused
./lib/bb/fetch/perforce.py:33: 'MissingParameterError' imported but unused
./lib/bb/fetch/perforce.py:28: 're' imported but unused
./lib/bb/fetch/perforce.py:33: 'MissingParameterError' imported but unused
./lib/bb/fetch/hg.py:27: 're' imported but unused
./lib/bb/fetch/hg.py:27: 're' imported but unused
./lib/bb/fetch/svk.py:28: 're' imported but unused
./lib/bb/fetch/svk.py:28: 're' imported but unused
./lib/bb/fetch/svk.py:70: undefined name 'date'
./lib/bb/fetch/svk.py:70: undefined name 'date'
./lib/bb/fetch/svk.py:28: 're' imported but unused
./lib/bb/fetch/svk.py:70: undefined name 'date'
./lib/bb/fetch/svn.py:26: 're' imported but unused
./lib/bb/fetch/svn.py:26: 're' imported but unused
./lib/bb/fetch/bzr.py:32: 'MissingParameterError' imported but unused
./lib/bb/fetch/bzr.py:32: 'MissingParameterError' imported but unused
./lib/bb/fetch/git.py:23: 're' imported but unused
./lib/bb/fetch/git.py:23: 're' imported but unused
./lib/bb/fetch/git.py:27: 'FetchError' imported but unused
./lib/bb/fetch/git.py:27: 'FetchError' imported but unused
./lib/bb/fetch/git.py:23: 're' imported but unused
./lib/bb/fetch/git.py:27: 'FetchError' imported but unused
./lib/bb/fetch/wget.py:28: 're' imported but unused
./lib/bb/fetch/wget.py:28: 're' imported but unused
./lib/bb/fetch/cvs.py:29: 're' imported but unused
./lib/bb/fetch/cvs.py:29: 're' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/__init__.py:84: 'ConfHandler' imported but unused
./lib/bb/parse/__init__.py:84: 'BBHandler' imported but unused
./lib/bb/parse/__init__.py:84: '__version__' imported but unused
./lib/bb/parse/parse_py/__init__.py:32: 'ConfHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:32: 'ConfHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:33: 'BBHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:33: 'BBHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:32: 'ConfHandler' imported but unused
./lib/bb/parse/parse_py/__init__.py:33: 'BBHandler' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:28: 'sys' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:28: 'time' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 28
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:29: redefinition of unused 'bb' from line 29
./lib/bb/parse/parse_py/BBHandler.py:30: 'fetch' imported but unused
./lib/bb/parse/parse_py/BBHandler.py:244: undefined name '__residue__'
./lib/bb/parse/parse_py/BBHandler.py:247: undefined name '__residue__'

--Boundary-00=_Mr38IvuXgVKrZsi--
