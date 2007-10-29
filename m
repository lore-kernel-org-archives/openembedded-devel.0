Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1ImXhD-00066V-CF
	for openembedded-devel@openembedded.org; Mon, 29 Oct 2007 17:42:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9TGYnM8009383
	for <openembedded-devel@openembedded.org>; Mon, 29 Oct 2007 16:34:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08864-10 for <openembedded-devel@openembedded.org>;
	Mon, 29 Oct 2007 16:34:42 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9TGYcpb009345
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 29 Oct 2007 16:34:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 29 Oct 2007 16:34:37 +0000
Message-Id: <1193675678.6161.69.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: do_package changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2007 16:42:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'd like to apply the following patch to OE. It stops the do_package
step from being destructive by copying files rather than moving them.
With the patch applied, it means you can rerun do_package without having
to rerun do_install again first.

I've already applied this to poky where it seems to work fine. We took
an image generated before it was applied and compared it to one
afterwards and only found one difference where an empty directory was
created in one case and not in the other. Looking at the FILES values, I
think this actually fixed a regression though!

The copyfile function will eventually move into bitbake to match the
movefile routine which the next release will have.

I'll probably apply this within a few days unless there are any
objections.

Richard

--- package.bbclass	2007-10-21 18:43:57.000000000 +0100
+++ p1	2007-10-23 23:28:39.000000000 +0100
@@ -318,6 +318,76 @@
 	#bb.data.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep), d)
 }
 
+def copyfile(src,dest,newmtime=None,sstat=None):
+    """
+    Copies a file from src to dest, preserving all permissions and
+    attributes; mtime will be preserved even when moving across
+    filesystems.  Returns true on success and false on failure.
+    """
+    import os, stat, shutil, commands
+
+    #print "copyfile("+src+","+dest+","+str(newmtime)+","+str(sstat)+")"
+    try:
+        if not sstat:
+            sstat=os.lstat(src)
+    except Exception, e:
+        print "copyfile: Stating source file failed...", e
+        return False
+
+    destexists=1
+    try:
+        dstat=os.lstat(dest)
+    except:
+        dstat=os.lstat(os.path.dirname(dest))
+        destexists=0
+
+    if destexists:
+        if stat.S_ISLNK(dstat[stat.ST_MODE]):
+            try:
+                os.unlink(dest)
+                destexists=0
+            except Exception, e:
+                pass
+
+    if stat.S_ISLNK(sstat[stat.ST_MODE]):
+        try:
+            target=os.readlink(src)
+            if destexists and not stat.S_ISDIR(dstat[stat.ST_MODE]):
+                os.unlink(dest)
+            os.symlink(target,dest)
+            #os.lchown(dest,sstat[stat.ST_UID],sstat[stat.ST_GID])
+            return os.lstat(dest)
+        except Exception, e:
+            print "copyfile: failed to properly create symlink:", dest, "->", target, e
+            return False
+
+    if stat.S_ISREG(sstat[stat.ST_MODE]):
+            try: # For safety copy then move it over.
+                shutil.copyfile(src,dest+"#new")
+                os.rename(dest+"#new",dest)
+            except Exception, e:
+                print 'copyfile: copy', src, '->', dest, 'failed.', e
+                return False
+    else:
+            #we don't yet handle special, so we need to fall back to /bin/mv
+            a=commands.getstatusoutput("/bin/cp -f "+"'"+src+"' '"+dest+"'")
+            if a[0]!=0:
+                print "copyfile: Failed to copy special file:" + src + "' to '" + dest + "'", a
+                return False # failure
+    try:
+        os.lchown(dest,sstat[stat.ST_UID],sstat[stat.ST_GID])
+        os.chmod(dest, stat.S_IMODE(sstat[stat.ST_MODE])) # Sticky is reset on chown
+    except Exception, e:
+        print "copyfile: Failed to chown/chmod/unlink", dest, e
+        return False
+
+    if newmtime:
+        os.utime(dest,(newmtime,newmtime))
+    else:
+        os.utime(dest, (sstat[stat.ST_ATIME], sstat[stat.ST_MTIME]))
+        newmtime=sstat[stat.ST_MTIME]
+    return newmtime
+
 python populate_packages () {
 	import glob, stat, errno, re
 
@@ -380,6 +450,8 @@
 	pkgdest = bb.data.getVar('PKGDEST', d, 1)
 	os.system('rm -rf %s' % pkgdest)
 
+	seen = []
+
 	for pkg in package_list:
 		localdata = bb.data.createCopy(d)
 		root = os.path.join(pkgdest, pkg)
@@ -410,11 +482,17 @@
 					continue
 			if (not os.path.islink(file)) and (not os.path.exists(file)):
 				continue
+			if file in seen:
+				continue
+			seen.append(file)
+			if os.path.isdir(file):
+				bb.mkdirhier(os.path.join(root,file))
+				continue
 			fpath = os.path.join(root,file)
 			dpath = os.path.dirname(fpath)
 			bb.mkdirhier(dpath)
-			ret = bb.movefile(file,fpath)
-			if ret is None or ret == 0:
+			ret = copyfile(file, fpath)
+			if ret is False or ret == 0:
 				raise bb.build.FuncFailed("File population failed")
 		del localdata
 	os.chdir(workdir)
@@ -423,7 +501,8 @@
 	for root, dirs, files in os.walk(dvar):
 		for f in files:
 			path = os.path.join(root[len(dvar):], f)
-			unshipped.append(path)
+			if ('.' + path) not in seen:
+				unshipped.append(path)
 
 	if unshipped != []:
 		bb.note("the following files were installed but not shipped in any package:")





