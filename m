Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OqogJ-000079-CR
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 16:53:18 +0200
Received: by pwj8 with SMTP id 8so3110639pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=oiBpGcnW3rzpfuRS7e9wk0Kb2saG3fI1tBMKcxuk8YE=;
	b=KClKmHVx0sVlk4UHfmk6M3IVsgFdWmV2p6MW8uswh7xjCQPP4d8ELMfqUFg653Yzag
	4pjydTH0o/2D/DFy9/ppJ9zZvIA1rnWchBRosXcDXW+dNQXzfK86nnZKrLg4Hvq6ff20
	+OOjmJg3qo7q9i/c6uwi0KGS2ygYFn6JzdzbM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=MgzuZgMsyvJNDwo7HzqAJAk4IH4Ga3q6v1sKn07oTN2cA4AGlQRV6jSYnRZ3N8pyRs
	eLb+wzX86Q5A9Zwmogao2EaH7ygxMhSczEiUB5YvtX3gCrkR/HXvTVVctXtguigfUDJF
	Mo7EcB44q8kc4rKNLjvaXgn4W1B/D0/bdTgEE=
Received: by 10.114.133.15 with SMTP id g15mr8902719wad.72.1283352739092;
	Wed, 01 Sep 2010 07:52:19 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id s5sm18715930wak.0.2010.09.01.07.52.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 07:52:17 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 07:52:10 -0700
Message-Id: <1283352730-17975-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.2.1.66.g0d0ba
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] do_unpack, do_patch: shift some responsibility around, clean things up
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
X-List-Received-Date: Wed, 01 Sep 2010 14:53:39 -0000

From: Chris Larson <chris_larson@mentor.com>

- Consolidate 'is this file a patch' logic
- Move unpack functions from classes into oe.patch
- Move the unpacking message printing into do_unpack
- Move the destination directory determination into do_unpack
- Use subprocess's ability to pass in PATH and cwd rather than mangling the cmd
- Use shutil.copy2/copytree for ordinary file "unpack"
- Use the existing urldata from bb.fetch.init rather than re-decodeurl'ing the urls
- Make handling of globs in url paths explicit rather than implicit, calling
  oe_unpack on each one, so showing an unpacking message to the user for each
  globbed file, rather than the entirety

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/base.bbclass  |  161 +++++++++++++++++--------------------------------
 classes/patch.bbclass |   35 ++++-------
 lib/oe/unpack.py      |   95 +++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+), 126 deletions(-)
 create mode 100644 lib/oe/unpack.py

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 438327c..299e875 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -163,117 +163,68 @@ python base_do_fetch() {
 			raise bb.build.FuncFailed("Checksum of '%s' failed" % uri)
 }
 
-def oe_unpack_file(file, data, url = None):
-	import subprocess
-	if not url:
-		url = "file://%s" % file
-	dots = file.split(".")
-	if dots[-1] in ['gz', 'bz2', 'Z']:
-		efile = os.path.join(bb.data.getVar('WORKDIR', data, 1),os.path.basename('.'.join(dots[0:-1])))
-	else:
-		efile = file
-	cmd = None
-	(type, host, path, user, pswd, parm) = bb.decodeurl(url)
-	if file.endswith('.tar'):
-		cmd = 'tar x --no-same-owner -f %s' % file
-	elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
-		cmd = 'tar xz --no-same-owner -f %s' % file
-	elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
-		cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
-	elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
-		cmd = 'gzip -dc %s > %s' % (file, efile)
-	elif file.endswith('.bz2'):
-		cmd = 'bzip2 -dc %s > %s' % (file, efile)
-	elif file.endswith('.tar.xz'):
-		cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
-	elif file.endswith('.xz'):
-		cmd = 'xz -dc %s > %s' % (file, efile)
-	elif file.endswith('.zip') or file.endswith('.jar'):
-		cmd = 'unzip -q -o'
-		if 'dos' in parm:
-			cmd = '%s -a' % cmd
-		cmd = "%s '%s'" % (cmd, file)
-	elif (type == "file" and file.endswith('.patch') or file.endswith('.diff')) and parm.get('apply') != 'no':
-	# patch and diff files are special and need not be copied to workdir
-		cmd = ""
-	elif os.path.isdir(file):
-		destdir = "."
-		filespath = bb.data.getVar("FILESPATH", data, 1).split(":")
-		for fp in filespath:
-			if file[0:len(fp)] == fp:
-				destdir = file[len(fp):file.rfind('/')]
-				destdir = destdir.strip('/')
-				if len(destdir) < 1:
-					destdir = "."
-				elif not os.access("%s/%s" % (os.getcwd(), destdir), os.F_OK):
-					os.makedirs("%s/%s" % (os.getcwd(), destdir))
-				break
-
-		cmd = 'cp -pPR %s %s/%s/' % (file, os.getcwd(), destdir)
-	else:
-		if not 'patch' in parm and parm.get('apply') != 'yes':
-			# The "destdir" handling was specifically done for FILESPATH
-			# items.  So, only do so for file:// entries.
-			if type == "file":
-				if not host:
-					dest = os.path.dirname(path) or "."
-				else:
-				# this case is for backward compatiblity with older version
-				# of bitbake which do not have the fix
-				# http://cgit.openembedded.org/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8
-				# this should not be needed once all releases of bitbake has this fix
-				# applied/backported
-					dest = host + os.path.dirname(path) or "."
-			else:
-				dest = "."
-			bb.mkdirhier("%s" % oe.path.join(os.getcwd(),dest))
-			cmd = 'cp %s %s' % (file, oe.path.join(os.getcwd(), dest))
-	if not cmd:
-		return True
-	if not host:
-		dest = oe.path.join(os.getcwd(), path)
-	else:
-		dest = oe.path.join(os.getcwd(), oe.path.join(host, path))
-	if os.path.exists(dest):
-		if os.path.samefile(file, dest):
-			return True
-	# Change to subdir before executing command
-	save_cwd = os.getcwd();
-	if 'subdir' in parm:
-		newdir = ("%s/%s" % (os.getcwd(), parm['subdir']))
-		bb.mkdirhier(newdir)
-		os.chdir(newdir)
-
-	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
-	bb.note("Unpacking %s to %s/" % (base_path_out(file, data), base_path_out(os.getcwd(), data)))
-	ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
-
-	os.chdir(save_cwd)
+def oe_unpack(d, local, urldata):
+    from oe.unpack import unpack_file, is_patch, UnpackError
+    if is_patch(local, urldata.parm):
+        return
 
-	return ret == 0
+    subdirs = []
+    if "subdir" in urldata.parm:
+        subdirs.append(urldata.parm["subdir"])
+
+    if urldata.type == "file":
+        if not urldata.host:
+            urlpath = urldata.path
+        else:
+            urlpath = oe.path.join(urldata.host, urldata.path)
+
+        if not os.path.isabs(urlpath):
+            subdirs.append(os.path.dirname(urlpath))
+
+    workdir = d.getVar("WORKDIR", True)
+    if subdirs:
+        destdir = oe.path.join(workdir, *subdirs)
+        bb.mkdirhier(destdir)
+    else:
+        destdir = workdir
+    dos = urldata.parm.get("dos")
+
+    bb.note("Unpacking %s to %s/" % (base_path_out(local, d),
+                                     base_path_out(destdir, d)))
+    try:
+        unpack_file(local, destdir, env={"PATH": d.getVar("PATH", True)}, dos=dos)
+    except UnpackError, exc:
+        bb.fatal(str(exc))
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
 python base_do_unpack() {
-	import re
+    from glob import glob
+
+    srcurldata = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
+    filespath = d.getVar("FILESPATH", True).split(":")
+
+    for url, urldata in srcurldata.iteritems():
+        if urldata.type == "file" and "*" in urldata.path:
+            # The fetch code doesn't know how to handle globs, so
+            # we need to handle the local bits ourselves
+            for path in filespath:
+                srcdir = oe.path.join(path, urldata.host,
+                                      os.path.dirname(urldata.path))
+                if os.path.exists(srcdir):
+                    break
+            else:
+                bb.fatal("Unable to locate files for %s" % url)
 
-	localdata = bb.data.createCopy(d)
-	bb.data.update_data(localdata)
+            for filename in glob(oe.path.join(srcdir,
+                                              os.path.basename(urldata.path))):
+                oe_unpack(d, filename, urldata)
+        else:
+            local = urldata.localpath
+            if not local:
+                raise bb.build.FuncFailed('Unable to locate local file for %s' % url)
 
-	src_uri = bb.data.getVar('SRC_URI', localdata, True)
-	if not src_uri:
-		return
-	for url in src_uri.split():
-		try:
-			local = bb.data.expand(bb.fetch.localpath(url, localdata), localdata)
-		except bb.MalformedUrl, e:
-			raise bb.build.FuncFailed('Unable to generate local path for malformed uri: %s' % e)
-		if not local:
-			raise bb.build.FuncFailed('Unable to locate local file for %s' % url)
-		local = os.path.realpath(local)
-		ret = oe_unpack_file(local, localdata, url)
-		if not ret:
-			raise bb.build.FuncFailed()
+            oe_unpack(d, local, urldata)
 }
 
 addhandler base_eventhandler
diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 227d7c9..58b931f 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -7,6 +7,7 @@ PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
 python patch_do_patch() {
 	import oe.patch
+	import oe.unpack
 
 	src_uri = (bb.data.getVar('SRC_URI', d, 1) or '').split()
 	if not src_uri:
@@ -34,32 +35,24 @@ python patch_do_patch() {
 
 	classes = {}
 
+	src_uri = d.getVar("SRC_URI", True).split()
+	srcurldata = bb.fetch.init(src_uri, d, True)
 	workdir = bb.data.getVar('WORKDIR', d, 1)
-	for url in src_uri:
-		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
+	for url in d.getVar("SRC_URI", True).split():
+		urldata = srcurldata[url]
 
-		local = None
-		base, ext = os.path.splitext(os.path.basename(path))
+		local = urldata.localpath
+		if not local:
+			raise bb.build.FuncFailed('Unable to locate local file for %s' % url)
+
+		base, ext = os.path.splitext(os.path.basename(local))
 		if ext in ('.gz', '.bz2', '.Z'):
-			local = os.path.join(workdir, base)
-			ext = os.path.splitext(base)[1]
-
-		if "apply" in parm:
-			apply = parm["apply"]
-			if apply != "yes":
-				if apply != "no":
-					bb.msg.warn(None, "Unsupported value '%s' for 'apply' url param in '%s', please use 'yes' or 'no'" % (apply, url))
-				continue
-		elif "patch" in parm:
-			bb.msg.warn(None, "Deprecated usage of 'patch' url param in '%s', please use 'apply={yes,no}'" % url)
-		elif ext not in (".diff", ".patch"):
+			local = oe.path.join(workdir, base)
+
+		if not oe.unpack.is_patch(local, urldata.parm):
 			continue
 
-		if not local:
-			bb.fetch.init([url],d)
-			url = bb.encodeurl((type, host, path, user, pswd, []))
-			local = os.path.join('/', bb.fetch.localpath(url, d))
-		local = bb.data.expand(local, d)
+		parm = urldata.parm
 
 		if "striplevel" in parm:
 			striplevel = parm["striplevel"]
diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
new file mode 100644
index 0000000..34569aa
--- /dev/null
+++ b/lib/oe/unpack.py
@@ -0,0 +1,95 @@
+import os.path
+import bb
+
+class UnpackError(Exception):
+    def __init__(self, filename, destdir, command, output):
+        self.filename = filename
+        self.destdir = destdir
+        self.command = command
+        self.output = output
+
+    def __str__(self):
+        return "Unable to unpack '%s' to '%s' (cmd: %s): %s" % \
+               (self.filename, self.destdir, self.command, self.output)
+
+def to_boolean(string, default=None):
+    if not string:
+        return default
+
+    normalized = string.lower()
+    if normalized in ("y", "yes", "1", "true"):
+        return True
+    elif normalized in ("n", "no", "0", "false"):
+        return False
+    else:
+        raise ValueError("Invalid value for to_boolean: %s" % string)
+
+def is_patch(filename, parameters):
+    try:
+        apply = to_boolean(parameters.get("apply"))
+    except ValueError, exc:
+        bb.fatal("Invalid value for 'apply' parameter for %s: %s" %
+                 (filename, parameters.get("apply")))
+
+    if apply is not None:
+        return apply
+
+    if parameters.get("patch"):
+        bb.msg.warn(None, "Deprecated usage of 'patch' url param for '%s', please use 'apply={yes,no}'" % filename)
+        return True
+
+    base, ext = os.path.splitext(filename)
+    return ext in (".diff", ".patch")
+
+def subprocess_setup():
+    import signal
+    # Python installs a SIGPIPE handler by default. This is usually not what
+    # non-Python subprocesses expect.
+    signal.signal(signal.SIGPIPE, signal.SIG_DFL)
+
+def unpack_file(file, destdir, dos=False, env=None):
+    import subprocess, shutil
+
+    dest = os.path.join(destdir, os.path.basename(file))
+    if os.path.exists(dest):
+        if os.path.samefile(file, dest):
+            return True
+
+    cmd = None
+    if file.endswith('.tar'):
+        cmd = 'tar x --no-same-owner -f %s' % file
+    elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
+        cmd = 'tar xz --no-same-owner -f %s' % file
+    elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
+        cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
+    elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
+        base, ext = os.path.splitext(file)
+        cmd = 'gzip -dc %s > %s' % (file, base)
+    elif file.endswith('.bz2'):
+        base, ext = os.path.splitext(file)
+        cmd = 'bzip2 -dc %s > %s' % (file, base)
+    elif file.endswith('.tar.xz'):
+        cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
+    elif file.endswith('.xz'):
+        base, ext = os.path.splitext(file)
+        cmd = 'xz -dc %s > %s' % (file, base)
+    elif file.endswith('.zip') or file.endswith('.jar'):
+        cmd = 'unzip -q -o'
+        if dos:
+            cmd = '%s -a' % cmd
+        cmd = "%s '%s'" % (cmd, file)
+    elif os.path.isdir(file):
+        shutil.rmtree(dest, True)
+        shutil.copytree(file, dest, True)
+    else:
+        shutil.copy2(file, dest)
+
+    if not cmd:
+        return
+
+    pipe = subprocess.Popen(cmd, preexec_fn=subprocess_setup, shell=True,
+                            cwd=destdir, env=env, stdout=subprocess.PIPE,
+                            stderr=subprocess.STDOUT)
+    stdout = pipe.communicate()[0]
+    if pipe.returncode != 0:
+        raise UnpackError(file, destdir, cmd, stdout)
-- 
1.7.2.1.66.g0d0ba



