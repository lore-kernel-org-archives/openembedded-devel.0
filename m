Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O41iZ-0001eV-VM
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 02:53:38 +0200
Received: by qyk33 with SMTP id 33so536895qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=87yHfnYmaZ30HkSY848ZHx4PJDCeB5WgRVtOdOGJh0U=;
	b=FF6BD7GpvUIHbqsR9ihmCfZUBlNGOxxv0gecDm7EJNV/K3eca3OLfY9AjHZeW62DJP
	bmiSwpk5tSbaQZ8HDtq6ge95PyC63U8ygTwJKoQVBA4VzU6pcWcjODFxMYIaRPcGpWii
	5BhLK3ZcPBfDVfG4XQ9DOsoxvm4IKCspF4SgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=GLMbV7d7iwsEHr+FRysDibMxHJDaN+4C2bYu0qm6EfQAi3eYdWfDOGxLuJ45AoVQE0
	uGQJVKM7mkO3eeuvcENJkk8f9LQKnynWOQcIyTGSg7FyMFfDtcctxL8I+7AZAzlj/W8t
	eyiqZRKH5tMAZ5saZc42AneuGESJPTFGIBwLs=
Received: by 10.229.190.209 with SMTP id dj17mr322793qcb.52.1271724602428;
	Mon, 19 Apr 2010 17:50:02 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id y41sm3655857qce.23.2010.04.19.17.50.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Apr 2010 17:50:01 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 17:49:51 -0700
Message-Id: <1271724591-29429-2-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1271724591-29429-1-git-send-email-clarson@kergoth.com>
References: <1271724591-29429-1-git-send-email-clarson@kergoth.com>
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_QUOTING autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] Initial move of common python bits into modules of the 'oe' python package
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
X-List-Received-Date: Tue, 20 Apr 2010 00:53:38 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/base.bbclass   |    3 +
 classes/insane.bbclass |   85 +---------
 classes/patch.bbclass  |  466 ++----------------------------------------------
 classes/utils.bbclass  |  158 +++++------------
 lib/oe/patch.py        |  407 ++++++++++++++++++++++++++++++++++++++++++
 lib/oe/path.py         |   46 +++++
 lib/oe/qa.py           |   76 ++++++++
 lib/oe/utils.py        |   69 +++++++
 8 files changed, 657 insertions(+), 653 deletions(-)
 create mode 100644 lib/oe/__init__.py
 create mode 100644 lib/oe/patch.py
 create mode 100644 lib/oe/path.py
 create mode 100644 lib/oe/qa.py
 create mode 100644 lib/oe/utils.py

diff --git a/classes/base.bbclass b/classes/base.bbclass
index a738cec..f3c9428 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -25,9 +25,12 @@ python sys_path_eh () {
             else:
                 __builtins__[name] = value
 
+        import oe.path
+        import oe.utils
         inject("bb", bb)
         inject("sys", sys)
         inject("time", time)
+        inject("oe", oe)
 }
 
 addhandler sys_path_eh
diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 7e42f45..923751d 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -88,86 +88,6 @@ def package_qa_get_machine_dict():
 
        }
 
-# factory for a class, embedded in a method
-def package_qa_get_elf(path, bits32):
-    class ELFFile:
-        EI_NIDENT = 16
-
-        EI_CLASS      = 4
-        EI_DATA       = 5
-        EI_VERSION    = 6
-        EI_OSABI      = 7
-        EI_ABIVERSION = 8
-
-        # possible values for EI_CLASS
-        ELFCLASSNONE = 0
-        ELFCLASS32   = 1
-        ELFCLASS64   = 2
-
-        # possible value for EI_VERSION
-        EV_CURRENT   = 1
-
-        # possible values for EI_DATA
-        ELFDATANONE  = 0
-        ELFDATA2LSB  = 1
-        ELFDATA2MSB  = 2
-
-        def my_assert(self, expectation, result):
-            if not expectation == result:
-                #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
-                raise Exception("This does not work as expected")
-
-        def __init__(self, name):
-            self.name = name
-
-        def open(self):
-            self.file = file(self.name, "r")
-            self.data = self.file.read(ELFFile.EI_NIDENT+4)
-
-            self.my_assert(len(self.data), ELFFile.EI_NIDENT+4)
-            self.my_assert(self.data[0], chr(0x7f) )
-            self.my_assert(self.data[1], 'E')
-            self.my_assert(self.data[2], 'L')
-            self.my_assert(self.data[3], 'F')
-            if bits32 :
-                self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS32))
-            else:
-                self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS64))
-            self.my_assert(self.data[ELFFile.EI_VERSION], chr(ELFFile.EV_CURRENT) )
-
-            self.sex = self.data[ELFFile.EI_DATA]
-            if self.sex == chr(ELFFile.ELFDATANONE):
-                raise Exception("self.sex == ELFDATANONE")
-            elif self.sex == chr(ELFFile.ELFDATA2LSB):
-                self.sex = "<"
-            elif self.sex == chr(ELFFile.ELFDATA2MSB):
-                self.sex = ">"
-            else:
-                raise Exception("Unknown self.sex")
-
-        def osAbi(self):
-            return ord(self.data[ELFFile.EI_OSABI])
-
-        def abiVersion(self):
-            return ord(self.data[ELFFile.EI_ABIVERSION])
-
-        def isLittleEndian(self):
-            return self.sex == "<"
-
-        def isBigEngian(self):
-            return self.sex == ">"
-
-        def machine(self):
-            """
-            We know the sex stored in self.sex and we
-            know the position
-            """
-            import struct
-            (a,) = struct.unpack(self.sex+"H", self.data[18:20])
-            return a
-
-    return ELFFile(path)
-
 
 # Known Error classes
 # 0 - non dev contains .so
@@ -432,7 +352,7 @@ def package_qa_check_staged(path,d):
 
 # Walk over all files in a directory and call func
 def package_qa_walk(path, funcs, package,d):
-    sane = True
+    import oe.qa
 
     #if this will throw an exception, then fix the dict above
     target_os   = bb.data.getVar('TARGET_OS',   d, True)
@@ -440,10 +360,11 @@ def package_qa_walk(path, funcs, package,d):
     (machine, osabi, abiversion, littleendian, bits32) \
         = package_qa_get_machine_dict()[target_os][target_arch]
 
+    sane = True
     for root, dirs, files in os.walk(path):
         for file in files:
             path = os.path.join(root,file)
-            elf = package_qa_get_elf(path, bits32)
+            elf = oe.qa.ELFFile(path, bits32)
             try:
                 elf.open()
             except:
diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 33184df..cc3d8dd 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -3,472 +3,26 @@
 # Point to an empty file so any user's custom settings don't break things
 QUILTRCFILE ?= "${STAGING_BINDIR_NATIVE}/quiltrc"
 
-def patch_init(d):
-	class NotFoundError(Exception):
-		def __init__(self, path):
-			self.path = path
-		def __str__(self):
-			return "Error: %s not found." % self.path
-
-	def md5sum(fname):
-		# when we move to Python 2.5 as minimal supported
-		# we can kill that try/except as hashlib is 2.5+
-		try:
-			import hashlib
-			m = hashlib.md5()
-		except ImportError:
-			import md5
-			m = md5.new()
-
-		try:
-			f = file(fname, 'rb')
-		except IOError:
-			raise NotFoundError(fname)
-
-		while True:
-			d = f.read(8096)
-			if not d:
-				break
-			m.update(d)
-		f.close()
-		return m.hexdigest()
-
-	class CmdError(Exception):
-		def __init__(self, exitstatus, output):
-			self.status = exitstatus
-			self.output = output
-
-		def __str__(self):
-			return "Command Error: exit status: %d  Output:\n%s" % (self.status, self.output)
-
-
-	def runcmd(args, dir = None):
-		import commands
-
-		if dir:
-			olddir = os.path.abspath(os.curdir)
-			if not os.path.exists(dir):
-				raise NotFoundError(dir)
-			os.chdir(dir)
-			# print("cwd: %s -> %s" % (olddir, dir))
-
-		try:
-			args = [ commands.mkarg(str(arg)) for arg in args ]
-			cmd = " ".join(args)
-			# print("cmd: %s" % cmd)
-			(exitstatus, output) = commands.getstatusoutput(cmd)
-			if exitstatus != 0:
-				raise CmdError(exitstatus >> 8, output)
-			return output
-
-		finally:
-			if dir:
-				os.chdir(olddir)
-
-	class PatchError(Exception):
-		def __init__(self, msg):
-			self.msg = msg
-
-		def __str__(self):
-			return "Patch Error: %s" % self.msg
-
-	class PatchSet(object):
-		defaults = {
-			"strippath": 1
-		}
-
-		def __init__(self, dir, d):
-			self.dir = dir
-			self.d = d
-			self.patches = []
-			self._current = None
-
-		def current(self):
-			return self._current
-
-		def Clean(self):
-			"""
-			Clean out the patch set.  Generally includes unapplying all
-			patches and wiping out all associated metadata.
-			"""
-			raise NotImplementedError()
-
-		def Import(self, patch, force):
-			if not patch.get("file"):
-				if not patch.get("remote"):
-					raise PatchError("Patch file must be specified in patch import.")
-				else:
-					patch["file"] = bb.fetch.localpath(patch["remote"], self.d)
-
-			for param in PatchSet.defaults:
-				if not patch.get(param):
-					patch[param] = PatchSet.defaults[param]
-
-			if patch.get("remote"):
-				patch["file"] = bb.data.expand(bb.fetch.localpath(patch["remote"], self.d), self.d)
-
-			patch["filemd5"] = md5sum(patch["file"])
-
-		def Push(self, force):
-			raise NotImplementedError()
-
-		def Pop(self, force):
-			raise NotImplementedError()
-
-		def Refresh(self, remote = None, all = None):
-			raise NotImplementedError()
-
-
-	class PatchTree(PatchSet):
-		def __init__(self, dir, d):
-			PatchSet.__init__(self, dir, d)
-
-		def Import(self, patch, force = None):
-			""""""
-			PatchSet.Import(self, patch, force)
-
-			if self._current is not None:
-				i = self._current + 1
-			else:
-				i = 0
-			self.patches.insert(i, patch)
-
-		def _applypatch(self, patch, force = False, reverse = False, run = True):
-			shellcmd = ["cat", patch['file'], "|", "patch", "-p", patch['strippath']]
-			if reverse:
-				shellcmd.append('-R')
-
-			if not run:
-				return "sh" + "-c" + " ".join(shellcmd)
-
-			if not force:
-				shellcmd.append('--dry-run')
-
-			output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-
-			if force:
-				return
-
-			shellcmd.pop(len(shellcmd) - 1)
-			output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-			return output
-
-		def Push(self, force = False, all = False, run = True):
-			bb.note("self._current is %s" % self._current)
-			bb.note("patches is %s" % self.patches)
-			if all:
-				for i in self.patches:
-					if self._current is not None:
-						self._current = self._current + 1
-					else:
-						self._current = 0
-					bb.note("applying patch %s" % i)
-					self._applypatch(i, force)
-			else:
-				if self._current is not None:
-					self._current = self._current + 1
-				else:
-					self._current = 0
-				bb.note("applying patch %s" % self.patches[self._current])
-				return self._applypatch(self.patches[self._current], force)
-
-
-		def Pop(self, force = None, all = None):
-			if all:
-				for i in self.patches:
-					self._applypatch(i, force, True)
-			else:
-				self._applypatch(self.patches[self._current], force, True)
-
-		def Clean(self):
-			""""""
-
-	class GitApplyTree(PatchTree):
-		def __init__(self, dir, d):
-			PatchTree.__init__(self, dir, d)
-
-		def _applypatch(self, patch, force = False, reverse = False, run = True):
-			shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
-
-			if reverse:
-				shellcmd.append('-R')
-
-			shellcmd.append(patch['file'])
-
-			if not run:
-				return "sh" + "-c" + " ".join(shellcmd)
-
-			return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-
-
-	class QuiltTree(PatchSet):
-		def _runcmd(self, args, run = True):
-			quiltrc = bb.data.getVar('QUILTRCFILE', self.d, 1)
-			if not run:
-				return ["quilt"] + ["--quiltrc"] + [quiltrc] + args
-			runcmd(["quilt"] + ["--quiltrc"] + [quiltrc] + args, self.dir)
-
-		def _quiltpatchpath(self, file):
-			return os.path.join(self.dir, "patches", os.path.basename(file))
-
-
-		def __init__(self, dir, d):
-			PatchSet.__init__(self, dir, d)
-			self.initialized = False
-			p = os.path.join(self.dir, 'patches')
-			if not os.path.exists(p):
-				os.makedirs(p)
-
-		def Clean(self):
-			try:
-				self._runcmd(["pop", "-a", "-f"])
-			except Exception:
-				pass
-			self.initialized = True
-
-		def InitFromDir(self):
-			# read series -> self.patches
-			seriespath = os.path.join(self.dir, 'patches', 'series')
-			if not os.path.exists(self.dir):
-				raise Exception("Error: %s does not exist." % self.dir)
-			if os.path.exists(seriespath):
-				series = file(seriespath, 'r')
-				for line in series.readlines():
-					patch = {}
-					parts = line.strip().split()
-					patch["quiltfile"] = self._quiltpatchpath(parts[0])
-					patch["quiltfilemd5"] = md5sum(patch["quiltfile"])
-					if len(parts) > 1:
-						patch["strippath"] = parts[1][2:]
-					self.patches.append(patch)
-				series.close()
-
-				# determine which patches are applied -> self._current
-				try:
-					output = runcmd(["quilt", "applied"], self.dir)
-				except CmdError:
-					import sys
-					if sys.exc_value.output.strip() == "No patches applied":
-						return
-					else:
-						raise sys.exc_value
-				output = [val for val in output.split('\n') if not val.startswith('#')]
-				for patch in self.patches:
-					if os.path.basename(patch["quiltfile"]) == output[-1]:
-						self._current = self.patches.index(patch)
-			self.initialized = True
-
-		def Import(self, patch, force = None):
-			if not self.initialized:
-				self.InitFromDir()
-			PatchSet.Import(self, patch, force)
-
-			args = ["import", "-p", patch["strippath"]]
-			if force:
-				args.append("-f")
-				args.append("-dn")
-			args.append(patch["file"])
-
-			self._runcmd(args)
-
-			patch["quiltfile"] = self._quiltpatchpath(patch["file"])
-			patch["quiltfilemd5"] = md5sum(patch["quiltfile"])
-
-			# TODO: determine if the file being imported:
-			#	   1) is already imported, and is the same
-			#	   2) is already imported, but differs
-
-			self.patches.insert(self._current or 0, patch)
-
-
-		def Push(self, force = False, all = False, run = True):
-			# quilt push [-f]
-
-			args = ["push"]
-			if force:
-				args.append("-f")
-			if all:
-				args.append("-a")
-			if not run:
-				return self._runcmd(args, run)
-
-			self._runcmd(args)
-
-			if self._current is not None:
-				self._current = self._current + 1
-			else:
-				self._current = 0
-
-		def Pop(self, force = None, all = None):
-			# quilt pop [-f]
-			args = ["pop"]
-			if force:
-				args.append("-f")
-			if all:
-				args.append("-a")
-
-			self._runcmd(args)
-
-			if self._current == 0:
-				self._current = None
-
-			if self._current is not None:
-				self._current = self._current - 1
-
-		def Refresh(self, **kwargs):
-			if kwargs.get("remote"):
-				patch = self.patches[kwargs["patch"]]
-				if not patch:
-					raise PatchError("No patch found at index %s in patchset." % kwargs["patch"])
-				(type, host, path, user, pswd, parm) = bb.decodeurl(patch["remote"])
-				if type == "file":
-					import shutil
-					if not patch.get("file") and patch.get("remote"):
-						patch["file"] = bb.fetch.localpath(patch["remote"], self.d)
-
-					shutil.copyfile(patch["quiltfile"], patch["file"])
-				else:
-					raise PatchError("Unable to do a remote refresh of %s, unsupported remote url scheme %s." % (os.path.basename(patch["quiltfile"]), type))
-			else:
-				# quilt refresh
-				args = ["refresh"]
-				if kwargs.get("quiltfile"):
-					args.append(os.path.basename(kwargs["quiltfile"]))
-				elif kwargs.get("patch"):
-					args.append(os.path.basename(self.patches[kwargs["patch"]]["quiltfile"]))
-				self._runcmd(args)
-
-	class Resolver(object):
-		def __init__(self, patchset):
-			raise NotImplementedError()
-
-		def Resolve(self):
-			raise NotImplementedError()
-
-		def Revert(self):
-			raise NotImplementedError()
-
-		def Finalize(self):
-			raise NotImplementedError()
-
-	class NOOPResolver(Resolver):
-		def __init__(self, patchset):
-			self.patchset = patchset
-
-		def Resolve(self):
-			olddir = os.path.abspath(os.curdir)
-			os.chdir(self.patchset.dir)
-			try:
-				self.patchset.Push()
-			except Exception:
-				import sys
-				os.chdir(olddir)
-				raise sys.exc_value
-
-	# Patch resolver which relies on the user doing all the work involved in the
-	# resolution, with the exception of refreshing the remote copy of the patch
-	# files (the urls).
-	class UserResolver(Resolver):
-		def __init__(self, patchset):
-			self.patchset = patchset
-
-		# Force a push in the patchset, then drop to a shell for the user to
-		# resolve any rejected hunks
-		def Resolve(self):
-
-			olddir = os.path.abspath(os.curdir)
-			os.chdir(self.patchset.dir)
- 			try:
- 				self.patchset.Push(False)
- 			except CmdError, v:
- 				# Patch application failed
- 				patchcmd = self.patchset.Push(True, False, False)
- 
- 				t = bb.data.getVar('T', d, 1)
- 				if not t:
- 					bb.msg.fatal(bb.msg.domain.Build, "T not set")
- 				bb.mkdirhier(t)
- 				import random
- 				rcfile = "%s/bashrc.%s.%s" % (t, str(os.getpid()), random.random())
- 				f = open(rcfile, "w")
- 				f.write("echo '*** Manual patch resolution mode ***'\n")
- 				f.write("echo 'Dropping to a shell, so patch rejects can be fixed manually.'\n")
- 				f.write("echo 'Run \"quilt refresh\" when patch is corrected, press CTRL+D to exit.'\n")
- 				f.write("echo ''\n")
- 				f.write(" ".join(patchcmd) + "\n")
- 				f.write("#" + bb.data.getVar('TERMCMDRUN', d, 1))
- 				f.close()
- 				os.chmod(rcfile, 0775)
- 
- 				os.environ['TERMWINDOWTITLE'] = "Bitbake: Please fix patch rejects manually"
- 				os.environ['TERMRCFILE'] = rcfile
- 				rc = os.system(bb.data.getVar('TERMCMDRUN', d, 1))
-				if os.WIFEXITED(rc) and os.WEXITSTATUS(rc) != 0:
- 					bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual patch resolution - '%s' not found. " \
-					    + "Check TERMCMDRUN variable.") % bb.data.getVar('TERMCMDRUN', d, 1))
-
-				# Construct a new PatchSet after the user's changes, compare the
-				# sets, checking patches for modifications, and doing a remote
-				# refresh on each.
-				oldpatchset = self.patchset
-				self.patchset = oldpatchset.__class__(self.patchset.dir, self.patchset.d)
-
-				for patch in self.patchset.patches:
-					oldpatch = None
-					for opatch in oldpatchset.patches:
-						if opatch["quiltfile"] == patch["quiltfile"]:
-							oldpatch = opatch
-
-					if oldpatch:
-						patch["remote"] = oldpatch["remote"]
-						if patch["quiltfile"] == oldpatch["quiltfile"]:
-							if patch["quiltfilemd5"] != oldpatch["quiltfilemd5"]:
-								bb.note("Patch %s has changed, updating remote url %s" % (os.path.basename(patch["quiltfile"]), patch["remote"]))
-								# user change?  remote refresh
-								self.patchset.Refresh(remote=True, patch=self.patchset.patches.index(patch))
-							else:
-								# User did not fix the problem.  Abort.
-								raise PatchError("Patch application failed, and user did not fix and refresh the patch.")
-			except Exception:
-				os.chdir(olddir)
-				raise
-			os.chdir(olddir)
-
-	g = globals()
-	g["PatchSet"] = PatchSet
-	g["PatchTree"] = PatchTree
-	g["QuiltTree"] = QuiltTree
-	g["GitApplyTree"] = GitApplyTree
-	g["Resolver"] = Resolver
-	g["UserResolver"] = UserResolver
-	g["NOOPResolver"] = NOOPResolver
-	g["NotFoundError"] = NotFoundError
-	g["CmdError"] = CmdError
-
-addtask patch after do_unpack
-do_patch[dirs] = "${WORKDIR}"
-
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_staging"
-do_patch[depends] = "${PATCHDEPENDENCY}"
 
 python patch_do_patch() {
-	patch_init(d)
+	import oe.patch
 
 	src_uri = (bb.data.getVar('SRC_URI', d, 1) or '').split()
 	if not src_uri:
 		return
 
 	patchsetmap = {
-		"patch": PatchTree,
-		"quilt": QuiltTree,
-		"git": GitApplyTree,
+		"patch": oe.patch.PatchTree,
+		"quilt": oe.patch.QuiltTree,
+		"git": oe.patch.GitApplyTree,
 	}
 
 	cls = patchsetmap[bb.data.getVar('PATCHTOOL', d, 1) or 'quilt']
 
 	resolvermap = {
-		"noop": NOOPResolver,
-		"user": UserResolver,
+		"noop": oe.patch.NOOPResolver,
+		"user": oe.patch.UserResolver,
 	}
 
 	rcls = resolvermap[bb.data.getVar('PATCHRESOLVE', d, 1) or 'user']
@@ -540,13 +94,17 @@ python patch_do_patch() {
 				bb.note("Patch '%s' applies to earlier revisions" % pname)
 				continue
 
-		bb.note("Applying patch '%s' (%s)" % (pname, base_path_out(unpacked, d)))
+		bb.note("Applying patch '%s' (%s)" % (pname, oe.path.format_display(unpacked, d)))
 		try:
 			patchset.Import({"file":unpacked, "remote":url, "strippath": pnum}, True)
-		except:
+		except Exception:
 			import sys
 			raise bb.build.FuncFailed(str(sys.exc_value))
 		resolver.Resolve()
 }
 
+addtask patch after do_unpack
+do_patch[dirs] = "${WORKDIR}"
+do_patch[depends] = "${PATCHDEPENDENCY}"
+
 EXPORT_FUNCTIONS do_patch
diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 6081b1e..6a9254b 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -1,3 +1,44 @@
+# For compatibility
+def base_path_join(a, *p):
+    return oe.path.join(a, *p)
+
+def base_path_relative(src, dest):
+    return oe.path.relative(src, dest)
+
+def base_path_out(path, d):
+    return oe.path.format_display(path, d)
+
+def base_read_file(filename):
+    return oe.utils.read_file(filename)
+
+def base_ifelse(condition, iftrue = True, iffalse = False):
+    return oe.utils.ifelse(condition, iftrue, iffalse)
+
+def base_conditional(variable, checkvalue, truevalue, falsevalue, d):
+    return oe.utils.conditional(variable, checkvalue, truevalue, falsevalue, d)
+
+def base_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
+    return oe.utils.less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
+
+def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
+    return oe.utils.version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
+
+def base_contains(variable, checkvalues, truevalue, falsevalue, d):
+    return oe.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
+
+def base_both_contain(variable1, variable2, checkvalue, d):
+    return oe.utils.both_contain(variable1, variable2, checkvalue, d)
+
+def base_prune_suffix(var, suffixes, d):
+    return oe.utils.prune_suffix(var, suffixes, d)
+
+def oe_filter(f, str, d):
+    return oe.utils.str_filter(f, str, d)
+
+def oe_filter_out(f, str, d):
+    return oe.utils.str_filter_out(f, str, d)
+
+
 def subprocess_setup():
    import signal
    # Python installs a SIGPIPE handler by default. This is usually not what
@@ -28,53 +69,6 @@ def oe_system(d, cmd):
     """ Popen based version of os.system. """
     return oe_popen(d, cmd, shell=True).wait()
 
-# like os.path.join but doesn't treat absolute RHS specially
-def base_path_join(a, *p):
-    path = a
-    for b in p:
-        if path == '' or path.endswith('/'):
-            path +=  b
-        else:
-            path += '/' + b
-    return path
-
-def base_path_relative(src, dest):
-    """ Return a relative path from src to dest.
-
-    >>> base_path_relative("/usr/bin", "/tmp/foo/bar")
-    ../../tmp/foo/bar
-
-    >>> base_path_relative("/usr/bin", "/usr/lib")
-    ../lib
-
-    >>> base_path_relative("/tmp", "/tmp/foo/bar")
-    foo/bar
-    """
-    from os.path import sep, pardir, normpath, commonprefix
-
-    destlist = normpath(dest).split(sep)
-    srclist = normpath(src).split(sep)
-
-    # Find common section of the path
-    common = commonprefix([destlist, srclist])
-    commonlen = len(common)
-
-    # Climb back to the point where they differentiate
-    relpath = [ pardir ] * (len(srclist) - commonlen)
-    if commonlen < len(destlist):
-        # Add remaining portion
-        relpath += destlist[commonlen:]
-
-    return sep.join(relpath)
-
-def base_path_out(path, d):
-    """ Prepare a path for display to the user. """
-    rel = base_path_relative(d.getVar("TOPDIR", 1), path)
-    if len(rel) > len(path):
-        return path
-    else:
-        return rel
-
 # for MD5/SHA handling
 def base_chk_load_parser(config_paths):
     import ConfigParser
@@ -205,76 +199,6 @@ def base_chk_file(pn, pv, src_uri, localpath, params, data):
     (expected_md5sum, expected_sha256sum) = base_get_checksums(pn, pv, src_uri, localpath, params, data)
     return base_chk_file_checksum(localpath, src_uri, expected_md5sum, expected_sha256sum, data)
 
-def base_read_file(filename):
-	try:
-		f = file( filename, "r" )
-	except IOError, reason:
-		return "" # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
-	else:
-		return f.read().strip()
-	return None
-
-def base_ifelse(condition, iftrue = True, iffalse = False):
-    if condition:
-        return iftrue
-    else:
-        return iffalse
-
-def base_conditional(variable, checkvalue, truevalue, falsevalue, d):
-	if bb.data.getVar(variable,d,1) == checkvalue:
-		return truevalue
-	else:
-		return falsevalue
-
-def base_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-	if float(bb.data.getVar(variable,d,1)) <= float(checkvalue):
-		return truevalue
-	else:
-		return falsevalue
-
-def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    result = bb.vercmp(bb.data.getVar(variable,d,True), checkvalue)
-    if result <= 0:
-        return truevalue
-    else:
-        return falsevalue
-
-def base_contains(variable, checkvalues, truevalue, falsevalue, d):
-	val = bb.data.getVar(variable,d,1)
-	if not val:
-		return falsevalue
-	matches = 0
-	if type(checkvalues).__name__ == "str":
-		checkvalues = [checkvalues]
-	for value in checkvalues:
-		if val.find(value) != -1:
-			matches = matches + 1
-	if matches == len(checkvalues):
-		return truevalue
-	return falsevalue
-
-def base_both_contain(variable1, variable2, checkvalue, d):
-       if bb.data.getVar(variable1,d,1).find(checkvalue) != -1 and bb.data.getVar(variable2,d,1).find(checkvalue) != -1:
-               return checkvalue
-       else:
-               return ""
-
-def base_prune_suffix(var, suffixes, d):
-    # See if var ends with any of the suffixes listed and 
-    # remove it if found
-    for suffix in suffixes:
-        if var.endswith(suffix):
-            return var.replace(suffix, "")
-    return var
-
-def oe_filter(f, str, d):
-	from re import match
-	return " ".join(filter(lambda x: match(f, x, 0), str.split()))
-
-def oe_filter_out(f, str, d):
-	from re import match
-	return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
-
 oedebug() {
 	test $# -ge 2 || {
 		echo "Usage: oedebug level \"message\""
diff --git a/lib/oe/__init__.py b/lib/oe/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/lib/oe/patch.py b/lib/oe/patch.py
new file mode 100644
index 0000000..54c12ba
--- /dev/null
+++ b/lib/oe/patch.py
@@ -0,0 +1,407 @@
+class NotFoundError(Exception):
+    def __init__(self, path):
+        self.path = path
+
+    def __str__(self):
+        return "Error: %s not found." % self.path
+
+class CmdError(Exception):
+    def __init__(self, exitstatus, output):
+        self.status = exitstatus
+        self.output = output
+
+    def __str__(self):
+        return "Command Error: exit status: %d  Output:\n%s" % (self.status, self.output)
+
+
+def runcmd(args, dir = None):
+    import commands
+
+    if dir:
+        olddir = os.path.abspath(os.curdir)
+        if not os.path.exists(dir):
+            raise NotFoundError(dir)
+        os.chdir(dir)
+        # print("cwd: %s -> %s" % (olddir, dir))
+
+    try:
+        args = [ commands.mkarg(str(arg)) for arg in args ]
+        cmd = " ".join(args)
+        # print("cmd: %s" % cmd)
+        (exitstatus, output) = commands.getstatusoutput(cmd)
+        if exitstatus != 0:
+            raise CmdError(exitstatus >> 8, output)
+        return output
+
+    finally:
+        if dir:
+            os.chdir(olddir)
+
+class PatchError(Exception):
+    def __init__(self, msg):
+        self.msg = msg
+
+    def __str__(self):
+        return "Patch Error: %s" % self.msg
+
+class PatchSet(object):
+    defaults = {
+        "strippath": 1
+    }
+
+    def __init__(self, dir, d):
+        self.dir = dir
+        self.d = d
+        self.patches = []
+        self._current = None
+
+    def current(self):
+        return self._current
+
+    def Clean(self):
+        """
+        Clean out the patch set.  Generally includes unapplying all
+        patches and wiping out all associated metadata.
+        """
+        raise NotImplementedError()
+
+    def Import(self, patch, force):
+        if not patch.get("file"):
+            if not patch.get("remote"):
+                raise PatchError("Patch file must be specified in patch import.")
+            else:
+                patch["file"] = bb.fetch.localpath(patch["remote"], self.d)
+
+        for param in PatchSet.defaults:
+            if not patch.get(param):
+                patch[param] = PatchSet.defaults[param]
+
+        if patch.get("remote"):
+            patch["file"] = bb.data.expand(bb.fetch.localpath(patch["remote"], self.d), self.d)
+
+        patch["filemd5"] = bb.utils.md5_file(patch["file"])
+
+    def Push(self, force):
+        raise NotImplementedError()
+
+    def Pop(self, force):
+        raise NotImplementedError()
+
+    def Refresh(self, remote = None, all = None):
+        raise NotImplementedError()
+
+
+class PatchTree(PatchSet):
+    def __init__(self, dir, d):
+        PatchSet.__init__(self, dir, d)
+
+    def Import(self, patch, force = None):
+        """"""
+        PatchSet.Import(self, patch, force)
+
+        if self._current is not None:
+            i = self._current + 1
+        else:
+            i = 0
+        self.patches.insert(i, patch)
+
+    def _applypatch(self, patch, force = False, reverse = False, run = True):
+        shellcmd = ["cat", patch['file'], "|", "patch", "-p", patch['strippath']]
+        if reverse:
+            shellcmd.append('-R')
+
+        if not run:
+            return "sh" + "-c" + " ".join(shellcmd)
+
+        if not force:
+            shellcmd.append('--dry-run')
+
+        output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
+        if force:
+            return
+
+        shellcmd.pop(len(shellcmd) - 1)
+        output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        return output
+
+    def Push(self, force = False, all = False, run = True):
+        bb.note("self._current is %s" % self._current)
+        bb.note("patches is %s" % self.patches)
+        if all:
+            for i in self.patches:
+                if self._current is not None:
+                    self._current = self._current + 1
+                else:
+                    self._current = 0
+                bb.note("applying patch %s" % i)
+                self._applypatch(i, force)
+        else:
+            if self._current is not None:
+                self._current = self._current + 1
+            else:
+                self._current = 0
+            bb.note("applying patch %s" % self.patches[self._current])
+            return self._applypatch(self.patches[self._current], force)
+
+
+    def Pop(self, force = None, all = None):
+        if all:
+            for i in self.patches:
+                self._applypatch(i, force, True)
+        else:
+            self._applypatch(self.patches[self._current], force, True)
+
+    def Clean(self):
+        """"""
+
+class GitApplyTree(PatchTree):
+    def __init__(self, dir, d):
+        PatchTree.__init__(self, dir, d)
+
+    def _applypatch(self, patch, force = False, reverse = False, run = True):
+        shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+
+        if reverse:
+            shellcmd.append('-R')
+
+        shellcmd.append(patch['file'])
+
+        if not run:
+            return "sh" + "-c" + " ".join(shellcmd)
+
+        return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
+
+class QuiltTree(PatchSet):
+    def _runcmd(self, args, run = True):
+        quiltrc = bb.data.getVar('QUILTRCFILE', self.d, 1)
+        if not run:
+            return ["quilt"] + ["--quiltrc"] + [quiltrc] + args
+        runcmd(["quilt"] + ["--quiltrc"] + [quiltrc] + args, self.dir)
+
+    def _quiltpatchpath(self, file):
+        return os.path.join(self.dir, "patches", os.path.basename(file))
+
+
+    def __init__(self, dir, d):
+        PatchSet.__init__(self, dir, d)
+        self.initialized = False
+        p = os.path.join(self.dir, 'patches')
+        if not os.path.exists(p):
+            os.makedirs(p)
+
+    def Clean(self):
+        try:
+            self._runcmd(["pop", "-a", "-f"])
+        except Exception:
+            pass
+        self.initialized = True
+
+    def InitFromDir(self):
+        # read series -> self.patches
+        seriespath = os.path.join(self.dir, 'patches', 'series')
+        if not os.path.exists(self.dir):
+            raise Exception("Error: %s does not exist." % self.dir)
+        if os.path.exists(seriespath):
+            series = file(seriespath, 'r')
+            for line in series.readlines():
+                patch = {}
+                parts = line.strip().split()
+                patch["quiltfile"] = self._quiltpatchpath(parts[0])
+                patch["quiltfilemd5"] = bb.utils.md5_file(patch["quiltfile"])
+                if len(parts) > 1:
+                    patch["strippath"] = parts[1][2:]
+                self.patches.append(patch)
+            series.close()
+
+            # determine which patches are applied -> self._current
+            try:
+                output = runcmd(["quilt", "applied"], self.dir)
+            except CmdError:
+                import sys
+                if sys.exc_value.output.strip() == "No patches applied":
+                    return
+                else:
+                    raise sys.exc_value
+            output = [val for val in output.split('\n') if not val.startswith('#')]
+            for patch in self.patches:
+                if os.path.basename(patch["quiltfile"]) == output[-1]:
+                    self._current = self.patches.index(patch)
+        self.initialized = True
+
+    def Import(self, patch, force = None):
+        if not self.initialized:
+            self.InitFromDir()
+        PatchSet.Import(self, patch, force)
+
+        args = ["import", "-p", patch["strippath"]]
+        if force:
+            args.append("-f")
+            args.append("-dn")
+        args.append(patch["file"])
+
+        self._runcmd(args)
+
+        patch["quiltfile"] = self._quiltpatchpath(patch["file"])
+        patch["quiltfilemd5"] = bb.utils.md5_file(patch["quiltfile"])
+
+        # TODO: determine if the file being imported:
+        #      1) is already imported, and is the same
+        #      2) is already imported, but differs
+
+        self.patches.insert(self._current or 0, patch)
+
+
+    def Push(self, force = False, all = False, run = True):
+        # quilt push [-f]
+
+        args = ["push"]
+        if force:
+            args.append("-f")
+        if all:
+            args.append("-a")
+        if not run:
+            return self._runcmd(args, run)
+
+        self._runcmd(args)
+
+        if self._current is not None:
+            self._current = self._current + 1
+        else:
+            self._current = 0
+
+    def Pop(self, force = None, all = None):
+        # quilt pop [-f]
+        args = ["pop"]
+        if force:
+            args.append("-f")
+        if all:
+            args.append("-a")
+
+        self._runcmd(args)
+
+        if self._current == 0:
+            self._current = None
+
+        if self._current is not None:
+            self._current = self._current - 1
+
+    def Refresh(self, **kwargs):
+        if kwargs.get("remote"):
+            patch = self.patches[kwargs["patch"]]
+            if not patch:
+                raise PatchError("No patch found at index %s in patchset." % kwargs["patch"])
+            (type, host, path, user, pswd, parm) = bb.decodeurl(patch["remote"])
+            if type == "file":
+                import shutil
+                if not patch.get("file") and patch.get("remote"):
+                    patch["file"] = bb.fetch.localpath(patch["remote"], self.d)
+
+                shutil.copyfile(patch["quiltfile"], patch["file"])
+            else:
+                raise PatchError("Unable to do a remote refresh of %s, unsupported remote url scheme %s." % (os.path.basename(patch["quiltfile"]), type))
+        else:
+            # quilt refresh
+            args = ["refresh"]
+            if kwargs.get("quiltfile"):
+                args.append(os.path.basename(kwargs["quiltfile"]))
+            elif kwargs.get("patch"):
+                args.append(os.path.basename(self.patches[kwargs["patch"]]["quiltfile"]))
+            self._runcmd(args)
+
+class Resolver(object):
+    def __init__(self, patchset):
+        raise NotImplementedError()
+
+    def Resolve(self):
+        raise NotImplementedError()
+
+    def Revert(self):
+        raise NotImplementedError()
+
+    def Finalize(self):
+        raise NotImplementedError()
+
+class NOOPResolver(Resolver):
+    def __init__(self, patchset):
+        self.patchset = patchset
+
+    def Resolve(self):
+        olddir = os.path.abspath(os.curdir)
+        os.chdir(self.patchset.dir)
+        try:
+            self.patchset.Push()
+        except Exception:
+            import sys
+            os.chdir(olddir)
+            raise sys.exc_value
+
+# Patch resolver which relies on the user doing all the work involved in the
+# resolution, with the exception of refreshing the remote copy of the patch
+# files (the urls).
+class UserResolver(Resolver):
+    def __init__(self, patchset):
+        self.patchset = patchset
+
+    # Force a push in the patchset, then drop to a shell for the user to
+    # resolve any rejected hunks
+    def Resolve(self):
+
+        olddir = os.path.abspath(os.curdir)
+        os.chdir(self.patchset.dir)
+        try:
+            self.patchset.Push(False)
+        except CmdError, v:
+            # Patch application failed
+            patchcmd = self.patchset.Push(True, False, False)
+
+            t = bb.data.getVar('T', d, 1)
+            if not t:
+                bb.msg.fatal(bb.msg.domain.Build, "T not set")
+            bb.mkdirhier(t)
+            import random
+            rcfile = "%s/bashrc.%s.%s" % (t, str(os.getpid()), random.random())
+            f = open(rcfile, "w")
+            f.write("echo '*** Manual patch resolution mode ***'\n")
+            f.write("echo 'Dropping to a shell, so patch rejects can be fixed manually.'\n")
+            f.write("echo 'Run \"quilt refresh\" when patch is corrected, press CTRL+D to exit.'\n")
+            f.write("echo ''\n")
+            f.write(" ".join(patchcmd) + "\n")
+            f.write("#" + bb.data.getVar('TERMCMDRUN', d, 1))
+            f.close()
+            os.chmod(rcfile, 0775)
+
+            os.environ['TERMWINDOWTITLE'] = "Bitbake: Please fix patch rejects manually"
+            os.environ['TERMRCFILE'] = rcfile
+            rc = os.system(bb.data.getVar('TERMCMDRUN', d, 1))
+            if os.WIFEXITED(rc) and os.WEXITSTATUS(rc) != 0:
+                bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual patch resolution - '%s' not found. " \
+                    + "Check TERMCMDRUN variable.") % bb.data.getVar('TERMCMDRUN', d, 1))
+
+            # Construct a new PatchSet after the user's changes, compare the
+            # sets, checking patches for modifications, and doing a remote
+            # refresh on each.
+            oldpatchset = self.patchset
+            self.patchset = oldpatchset.__class__(self.patchset.dir, self.patchset.d)
+
+            for patch in self.patchset.patches:
+                oldpatch = None
+                for opatch in oldpatchset.patches:
+                    if opatch["quiltfile"] == patch["quiltfile"]:
+                        oldpatch = opatch
+
+                if oldpatch:
+                    patch["remote"] = oldpatch["remote"]
+                    if patch["quiltfile"] == oldpatch["quiltfile"]:
+                        if patch["quiltfilemd5"] != oldpatch["quiltfilemd5"]:
+                            bb.note("Patch %s has changed, updating remote url %s" % (os.path.basename(patch["quiltfile"]), patch["remote"]))
+                            # user change?  remote refresh
+                            self.patchset.Refresh(remote=True, patch=self.patchset.patches.index(patch))
+                        else:
+                            # User did not fix the problem.  Abort.
+                            raise PatchError("Patch application failed, and user did not fix and refresh the patch.")
+        except Exception:
+            os.chdir(olddir)
+            raise
+        os.chdir(olddir)
diff --git a/lib/oe/path.py b/lib/oe/path.py
new file mode 100644
index 0000000..dbaa08d
--- /dev/null
+++ b/lib/oe/path.py
@@ -0,0 +1,46 @@
+def join(a, *p):
+    """Like os.path.join but doesn't treat absolute RHS specially"""
+    path = a
+    for b in p:
+        if path == '' or path.endswith('/'):
+            path +=  b
+        else:
+            path += '/' + b
+    return path
+
+def relative(src, dest):
+    """ Return a relative path from src to dest.
+
+    >>> relative("/usr/bin", "/tmp/foo/bar")
+    ../../tmp/foo/bar
+
+    >>> relative("/usr/bin", "/usr/lib")
+    ../lib
+
+    >>> relative("/tmp", "/tmp/foo/bar")
+    foo/bar
+    """
+    from os.path import sep, pardir, normpath, commonprefix
+
+    destlist = normpath(dest).split(sep)
+    srclist = normpath(src).split(sep)
+
+    # Find common section of the path
+    common = commonprefix([destlist, srclist])
+    commonlen = len(common)
+
+    # Climb back to the point where they differentiate
+    relpath = [ pardir ] * (len(srclist) - commonlen)
+    if commonlen < len(destlist):
+        # Add remaining portion
+        relpath += destlist[commonlen:]
+
+    return sep.join(relpath)
+
+def format_display(path, metadata):
+    """ Prepare a path for display to the user. """
+    rel = relative(metadata.getVar("TOPDIR", 1), path)
+    if len(rel) > len(path):
+        return path
+    else:
+        return rel
diff --git a/lib/oe/qa.py b/lib/oe/qa.py
new file mode 100644
index 0000000..0181393
--- /dev/null
+++ b/lib/oe/qa.py
@@ -0,0 +1,76 @@
+class ELFFile:
+    EI_NIDENT = 16
+
+    EI_CLASS      = 4
+    EI_DATA       = 5
+    EI_VERSION    = 6
+    EI_OSABI      = 7
+    EI_ABIVERSION = 8
+
+    # possible values for EI_CLASS
+    ELFCLASSNONE = 0
+    ELFCLASS32   = 1
+    ELFCLASS64   = 2
+
+    # possible value for EI_VERSION
+    EV_CURRENT   = 1
+
+    # possible values for EI_DATA
+    ELFDATANONE  = 0
+    ELFDATA2LSB  = 1
+    ELFDATA2MSB  = 2
+
+    def my_assert(self, expectation, result):
+        if not expectation == result:
+            #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
+            raise Exception("This does not work as expected")
+
+    def __init__(self, name, bits32):
+        self.name = name
+        self.bits32 = bits32
+
+    def open(self):
+        self.file = file(self.name, "r")
+        self.data = self.file.read(ELFFile.EI_NIDENT+4)
+
+        self.my_assert(len(self.data), ELFFile.EI_NIDENT+4)
+        self.my_assert(self.data[0], chr(0x7f) )
+        self.my_assert(self.data[1], 'E')
+        self.my_assert(self.data[2], 'L')
+        self.my_assert(self.data[3], 'F')
+        if self.bits32 :
+            self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS32))
+        else:
+            self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS64))
+        self.my_assert(self.data[ELFFile.EI_VERSION], chr(ELFFile.EV_CURRENT) )
+
+        self.sex = self.data[ELFFile.EI_DATA]
+        if self.sex == chr(ELFFile.ELFDATANONE):
+            raise Exception("self.sex == ELFDATANONE")
+        elif self.sex == chr(ELFFile.ELFDATA2LSB):
+            self.sex = "<"
+        elif self.sex == chr(ELFFile.ELFDATA2MSB):
+            self.sex = ">"
+        else:
+            raise Exception("Unknown self.sex")
+
+    def osAbi(self):
+        return ord(self.data[ELFFile.EI_OSABI])
+
+    def abiVersion(self):
+        return ord(self.data[ELFFile.EI_ABIVERSION])
+
+    def isLittleEndian(self):
+        return self.sex == "<"
+
+    def isBigEngian(self):
+        return self.sex == ">"
+
+    def machine(self):
+        """
+        We know the sex stored in self.sex and we
+        know the position
+        """
+        import struct
+        (a,) = struct.unpack(self.sex+"H", self.data[18:20])
+        return a
diff --git a/lib/oe/utils.py b/lib/oe/utils.py
new file mode 100644
index 0000000..e61d663
--- /dev/null
+++ b/lib/oe/utils.py
@@ -0,0 +1,69 @@
+def read_file(filename):
+    try:
+        f = file( filename, "r" )
+    except IOError, reason:
+        return "" # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
+    else:
+        return f.read().strip()
+    return None
+
+def ifelse(condition, iftrue = True, iffalse = False):
+    if condition:
+        return iftrue
+    else:
+        return iffalse
+
+def conditional(variable, checkvalue, truevalue, falsevalue, d):
+    if bb.data.getVar(variable,d,1) == checkvalue:
+        return truevalue
+    else:
+        return falsevalue
+
+def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
+    if float(bb.data.getVar(variable,d,1)) <= float(checkvalue):
+        return truevalue
+    else:
+        return falsevalue
+
+def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
+    result = bb.vercmp(bb.data.getVar(variable,d,True), checkvalue)
+    if result <= 0:
+        return truevalue
+    else:
+        return falsevalue
+
+def contains(variable, checkvalues, truevalue, falsevalue, d):
+    val = bb.data.getVar(variable,d,1)
+    if not val:
+        return falsevalue
+    matches = 0
+    if type(checkvalues).__name__ == "str":
+        checkvalues = [checkvalues]
+    for value in checkvalues:
+        if val.find(value) != -1:
+            matches = matches + 1
+    if matches == len(checkvalues):
+        return truevalue
+    return falsevalue
+
+def both_contain(variable1, variable2, checkvalue, d):
+    if bb.data.getVar(variable1,d,1).find(checkvalue) != -1 and bb.data.getVar(variable2,d,1).find(checkvalue) != -1:
+        return checkvalue
+    else:
+        return ""
+
+def prune_suffix(var, suffixes, d):
+    # See if var ends with any of the suffixes listed and 
+    # remove it if found
+    for suffix in suffixes:
+        if var.endswith(suffix):
+            return var.replace(suffix, "")
+    return var
+
+def str_filter(f, str, d):
+    from re import match
+    return " ".join(filter(lambda x: match(f, x, 0), str.split()))
+
+def str_filter_out(f, str, d):
+    from re import match
+    return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
-- 
1.6.3.3



