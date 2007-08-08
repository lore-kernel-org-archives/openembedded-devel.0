Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IIv7I-0007Wj-PE
	for openembedded-devel@openembedded.org; Thu, 09 Aug 2007 01:39:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l78NaP7Q003374
	for <openembedded-devel@openembedded.org>;
	Thu, 9 Aug 2007 00:36:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03295-03 for <openembedded-devel@openembedded.org>;
	Thu,  9 Aug 2007 00:36:21 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l78NaJ4u003368
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 9 Aug 2007 00:36:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46B9CA83.3010201@dominion.kabel.utwente.nl>
References: <46B9CA83.3010201@dominion.kabel.utwente.nl>
Date: Thu, 09 Aug 2007 00:36:19 +0100
Message-Id: <1186616179.6091.62.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: merging package.bbclass with poky, please review diff
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
X-List-Received-Date: Wed, 08 Aug 2007 23:39:05 -0000
X-Groupsio-MsgNum: 2664
Content-Type: multipart/mixed; boundary="=-uhFm1qtr9UVneQZxnFFf"

--=-uhFm1qtr9UVneQZxnFFf
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-08-08 at 15:52 +0200, Koen Kooi wrote:
> I'd like to merge in the changes from poky, but the diff is rather big, so that's why I'm
> sending it here for review.
> 
> The main features are a better do_strip, no more wildcard deps and more comments. The diff
> is between the .dev class and the class from poky with the PRIVATE_LIBS added.

I'm all in favour of this. To make this a little more digestible I've
attached the same patch split into 5 logical units which is more like
how it would have been committed to Poky. I need to look a little closer
at the PRIVATE_LIBS bit so thats not included.

Cheers,

Richard

--=-uhFm1qtr9UVneQZxnFFf
Content-Disposition: attachment; filename=package1.diff
Content-Type: text/x-patch; name=package1.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit

package.bbclass: Turn the runstrip function into python and improve its functionality to remove note and comments sections where possible (from Poky)

--- package.bbclass	2007-07-29 21:46:07.000000000 +0100
+++ package1.bbclass	2007-08-09 00:22:02.000000000 +0100
@@ -133,59 +133,57 @@
         bb.data.setVarFlag('do_package_write', 'depends', deps, d)
 }
 
-# file(1) output to match to consider a file an unstripped executable
-FILE_UNSTRIPPED_MATCH ?= "not stripped"
-#FIXME: this should be "" when any errors are gone!
-IGNORE_STRIP_ERRORS ?= "1"
-
-runstrip() {
-	# Function to strip a single file, called from RUNSTRIP in populate_packages below
-	# A working 'file' (one which works on the target architecture)
-	# is necessary for this stuff to work, hence the addition to do_package[depends]
-
-	local ro st
-
-	st=0
-	if {	file "$1" || {
-			oewarn "file $1: failed (forced strip)" >&2
-			echo '${FILE_UNSTRIPPED_MATCH}'
-		}
-	   } | grep -q '${FILE_UNSTRIPPED_MATCH}'
-	then
-		oenote "${STRIP} $1"
-		ro=
-		test -w "$1" || {
-			ro=1
-			chmod +w "$1"
-		}
-		mkdir -p $(dirname "$1")/.debug
-		debugfile="$(dirname "$1")/.debug/$(basename "$1")"
-		'${OBJCOPY}' --only-keep-debug "$1" "$debugfile"
-		'${STRIP}' "$1"
-		st=$?
-		'${OBJCOPY}' --add-gnu-debuglink="$debugfile" "$1"
-		test -n "$ro" && chmod -w "$1"
-		if test $st -ne 0
-		then
-			oewarn "runstrip: ${STRIP} $1: strip failed" >&2
-			if [ x${IGNORE_STRIP_ERRORS} = x1 ]
-			then
-				#FIXME: remove this, it's for error detection
-				if file "$1" 2>/dev/null >&2
-				then
-					(oefatal "${STRIP} $1: command failed" >/dev/tty)
-				else
-					(oefatal "file $1: command failed" >/dev/tty)
-				fi
-				st=0
-			fi
-		fi
-	else
-		oenote "runstrip: skip $1"
-	fi
-	return $st
-}
 
+def runstrip(file, d):
+    # Function to strip a single file, called from populate_packages below
+    # A working 'file' (one which works on the target architecture)
+    # is necessary for this stuff to work, hence the addition to do_package[depends]
+
+    import bb, os, commands, stat
+
+    pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, 1)
+
+    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
+
+    if ret:
+        bb.error("runstrip: 'file %s' failed (forced strip)" % file)
+
+    if "not stripped" not in result:
+        bb.debug(1, "runstrip: skip %s" % file)
+        return 0
+
+    strip = bb.data.getVar("STRIP", d, 1)
+    objcopy = bb.data.getVar("OBJCOPY", d, 1)
+
+    newmode = None
+    if not os.access(file, os.W_OK):
+        origmode = os.stat(file)[stat.ST_MODE]
+        newmode = origmode | stat.S_IWRITE
+        os.chmod(file, newmode)
+
+    extraflags = ""
+    if ".so" in file and "shared" in result:
+        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+    elif "shared" in result or "executable" in result:
+        extraflags = "--remove-section=.comment --remove-section=.note"
+
+    bb.mkdirhier(os.path.join(os.path.dirname(file), ".debug"))
+    debugfile=os.path.join(os.path.dirname(file), ".debug", os.path.basename(file))
+
+    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
+    bb.debug(1, "runstrip: %s" % stripcmd)
+
+    os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
+    ret = os.system("%s%s" % (pathprefix, stripcmd))
+    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
+
+    if newmode:
+        os.chmod(file, origmode)
+
+    if ret:
+        bb.error("runstrip: '%s' strip command failed" % stripcmd)
+
+    return 1
 
 #
 # Package data handling routines
@@ -367,19 +365,11 @@
 			package_list.append(pkg)
 
 	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, 1) != '1'):
-		stripfunc = ""
 		for root, dirs, files in os.walk(dvar):
 			for f in files:
 				file = os.path.join(root, f)
 				if not os.path.islink(file) and not os.path.isdir(file) and isexec(file):
-					stripfunc += "\trunstrip %s || st=1\n" % (file)
-		if not stripfunc == "":
-			from bb import build
-			localdata = bb.data.createCopy(d)
-			# strip
-			bb.data.setVar('RUNSTRIP', '\tlocal st\n\tst=0\n%s\treturn $st' % stripfunc, localdata)
-			bb.data.setVarFlag('RUNSTRIP', 'func', 1, localdata)
-			bb.build.exec_func('RUNSTRIP', localdata)
+					runstrip(file, d)
 
 	for pkg in package_list:
 		localdata = bb.data.createCopy(d)

--=-uhFm1qtr9UVneQZxnFFf
Content-Disposition: attachment; filename=package2.diff
Content-Type: text/x-patch; name=package2.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit

package.bbclass: Only set the do_package dependency when we have packages to generate (PACKAGES != "") removing needless dependencies (from poky)

--- package1.bbclass	2007-08-09 00:22:02.000000000 +0100
+++ package2.bbclass	2007-08-09 00:24:37.000000000 +0100
@@ -131,6 +131,9 @@
         for dep in (bb.data.getVar('PACKAGE_EXTRA_DEPENDS', d, True) or "").split():
             deps += " %s:do_populate_staging" % dep
         bb.data.setVarFlag('do_package_write', 'depends', deps, d)
+	
+        # shlibs requires any DEPENDS to have already packaged for the *.list files
+        bb.data.setVarFlag('do_package', 'deptask', 'do_package', d)
 }
 
 
@@ -877,8 +880,6 @@
 	for f in (bb.data.getVar('PACKAGEFUNCS', d, 1) or '').split():
 		bb.build.exec_func(f, d)
 }
-# shlibs requires any DEPENDS to have already packaged for the *.list files
-do_package[deptask] = "do_package"
 do_package[dirs] = "${D}"
 addtask package before do_build after do_install
 

--=-uhFm1qtr9UVneQZxnFFf
Content-Disposition: attachment; filename=package3.diff
Content-Type: text/x-patch; name=package3.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit

package.bbclass: Remove wildcards from the RDEPENDS field, unbreaking certain dependency chain handling in both ipkg and dpkg (from poky)

--- package2.bbclass	2007-08-09 00:24:37.000000000 +0100
+++ package3.bbclass	2007-08-09 00:26:13.000000000 +0100
@@ -310,9 +310,15 @@
 
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
 
-	rdep = (bb.data.getVar('RDEPENDS_%s' % mainpkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "").split()
-	rdep.append('%s-locale*' % pn)
-	bb.data.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep), d)
+	# Disabled by RP 18/06/07
+	# Wildcards aren't supported in debian
+	# They break with ipkg since glibc-locale* will mean that 
+	# glibc-localedata-translit* won't install as a dependency
+	# for some other package which breaks meta-toolchain
+	# Probably breaks since virtual-locale- isn't provided anywhere
+	#rdep = (bb.data.getVar('RDEPENDS_%s' % mainpkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "").split()
+	#rdep.append('%s-locale*' % pn)
+	#bb.data.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep), d)
 }
 
 python populate_packages () {

--=-uhFm1qtr9UVneQZxnFFf
Content-Disposition: attachment; filename=package4.diff
Content-Type: text/x-patch; name=package4.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit

package.bbclass: Fix a typo and remove broken code (from poky)

--- package3.bbclass	2007-08-09 00:26:13.000000000 +0100
+++ package4.bbclass	2007-08-09 00:27:30.000000000 +0100
@@ -367,7 +367,7 @@
 	for pkg in packages.split():
 		if pkg in package_list:
 			bb.error("-------------------")
-			bb.error("%s is listed in PACKAGES mutliple times, this leads to packaging errors." % pkg)
+			bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
 			bb.error("Please fix the metadata/report this as bug to OE bugtracker.")
 			bb.error("-------------------")
 		else:
@@ -401,7 +401,6 @@
 		bb.mkdirhier(root)
 		filesvar = bb.data.getVar('FILES', localdata, 1) or ""
 		files = filesvar.split()
-		cleandirs = []
 		for file in files:
 			if os.path.isabs(file):
 				file = '.' + file
@@ -410,8 +409,6 @@
 					newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
 					if newfiles:
 						files += newfiles
-						if file != "./":
-							cleandirs = [file] + cleandirs
 						continue
 			globbed = glob.glob(file)
 			if globbed:
@@ -423,16 +420,9 @@
 			fpath = os.path.join(root,file)
 			dpath = os.path.dirname(fpath)
 			bb.mkdirhier(dpath)
-#			if file in cleandirs:
-#				cleandirs.remove(file)
 			ret = bb.movefile(file,fpath)
 			if ret is None or ret == 0:
 				raise bb.build.FuncFailed("File population failed")
-#		for dir in cleandirs:
-#			if os.path.isdir(dir):
-#				os.rmdir(dir)
-#			else:
-#				bb.note("ERROR: directory %s went away unexpectedly during package population" % dir)
 		del localdata
 	os.chdir(workdir)
 

--=-uhFm1qtr9UVneQZxnFFf
Content-Disposition: attachment; filename=package5.diff
Content-Type: text/x-patch; name=package5.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit

package.bbclass: Improve dependency chain handling function to differentiate when multiple -dev or -dbg packages are generated and when a single one is generated (from poky)

--- package4.bbclass	2007-08-09 00:27:30.000000000 +0100
+++ package5.bbclass	2007-08-09 00:28:42.000000000 +0100
@@ -813,54 +813,81 @@
 python package_depchains() {
 	"""
 	For a given set of prefix and postfix modifiers, make those packages
-	RRECOMMENDS on the corresponding packages for its DEPENDS.
+	RRECOMMENDS on the corresponding packages for its RDEPENDS.
 
 	Example:  If package A depends upon package B, and A's .bb emits an
 	A-dev package, this would make A-dev Recommends: B-dev.
+
+	If only one of a given suffix is specified, it will take the RRECOMMENDS
+	based on the RDEPENDS of *all* other packages. If more than one of a given 
+	suffix is specified, its will only use the RDEPENDS of the single parent 
+	package.
 	"""
 
 	packages  = bb.data.getVar('PACKAGES', d, 1)
 	postfixes = (bb.data.getVar('DEPCHAIN_POST', d, 1) or '').split()
 	prefixes  = (bb.data.getVar('DEPCHAIN_PRE', d, 1) or '').split()
 
-	def pkg_addrrecs(pkg, base, func, d):
-		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + base, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "")
-		# bb.note('rdepends for %s is %s' % (base, rdepends))
+	def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
+		def packaged(pkg, d):
+			return os.access(bb.data.expand('${STAGING_DIR}/pkgdata/runtime/%s.packaged' % pkg, d), os.R_OK)
+
+                #bb.note('rdepends for %s is %s' % (base, rdepends))
+
 		rreclist = explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, 1) or bb.data.getVar('RRECOMMENDS', d, 1) or "")
 
 		for depend in rdepends:
-			split_depend = depend.split(' (')
-			name = split_depend[0].strip()
-			func(rreclist, name)
+			pkgname = getname(depend, suffix)
+			if not pkgname in rreclist and packaged(pkgname, d):
+				rreclist.append(pkgname)
 
+		#bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
 		bb.data.setVar('RRECOMMENDS_%s' % pkg, ' '.join(rreclist), d)
 
-	def packaged(pkg, d):
-		return os.access(bb.data.expand('${STAGING_DIR}/pkgdata/runtime/%s.packaged' % pkg, d), os.R_OK)
+	def add_dep(list, dep):
+		dep = dep.split(' (')[0].strip()
+		if dep not in list:
+			list.append(dep)
+
+	rdepends = []
+	for dep in explode_deps(bb.data.getVar('RDEPENDS', d, 1) or ""):
+		add_dep(rdepends, dep)
 
 	for pkg in packages.split():
-		for postfix in postfixes:
-			def func(list, name):
-				pkg = '%s%s' % (name, postfix)
-				if not pkg in list:
-					if packaged(pkg, d):
-						list.append(pkg)
+		for dep in explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 1) or ""):
+			add_dep(rdepends, dep)
+
+	#bb.note('rdepends is %s' % rdepends)
 
-			base = pkg[:-len(postfix)]
+	def post_getname(name, suffix):
+		return '%s%s' % (name, suffix)
+	def pre_getname(name, suffix):
+		return '%s%s' % (suffix, name)
+
+	pkgs = {}
+	for pkg in packages.split():
+		for postfix in postfixes:
 			if pkg.endswith(postfix):
-				pkg_addrrecs(pkg, base, func, d)
-				continue
+				if not postfix in pkgs:
+					pkgs[postfix] = {}
+				pkgs[postfix][pkg] = (pkg[:-len(postfix)], post_getname)
 
 		for prefix in prefixes:
-			def func(list, name):
-				pkg = '%s%s' % (prefix, name)
-				if not pkg in list:
-					if packaged(pkg, d):
-						list.append(pkg)
-
-			base = pkg[len(prefix):]
 			if pkg.startswith(prefix):
-				pkg_addrrecs(pkg, base, func, d)
+				if not prefix in pkgs:
+					pkgs[prefix] = {}
+				pkgs[prefix][pkg] = (pkg[:-len(prefix)], pre_getname)
+
+	for suffix in pkgs:
+		for pkg in pkgs[suffix]:
+			(base, func) = pkgs[suffix][pkg]
+			if len(pkgs[suffix]) == 1:
+				pkg_addrrecs(pkg, base, suffix, func, rdepends, d)
+			else:
+				rdeps = []
+				for dep in explode_deps(bb.data.getVar('RDEPENDS_' + base, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or ""):
+					add_dep(rdeps, dep)
+				pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
 }
 
 

--=-uhFm1qtr9UVneQZxnFFf--
