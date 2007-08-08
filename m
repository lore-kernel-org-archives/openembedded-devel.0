Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IIm01-0006UE-My
	for openembedded-devel@openembedded.org; Wed, 08 Aug 2007 15:54:57 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l78DqH1R028435 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2007 15:52:17 +0200
Message-ID: <46B9CA83.3010201@dominion.kabel.utwente.nl>
Date: Wed, 08 Aug 2007 15:52:03 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: merging package.bbclass with poky, please review diff
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
X-List-Received-Date: Wed, 08 Aug 2007 13:54:58 -0000
Content-Type: multipart/mixed; boundary="------------070909030508080401030200"

--------------070909030508080401030200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I'd like to merge in the changes from poky, but the diff is rather big, so that's why I'm
sending it here for review.

The main features are a better do_strip, no more wildcard deps and more comments. The diff
is between the .dev class and the class from poky with the PRIVATE_LIBS added.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGucqDMkyGM64RGpERAhLgAJ95uPtw2gMk98ZfrIOnZBZ+laAwuwCgirfJ
VwHbiUyiG6TnPReVSTB/Uys=
=oois
-----END PGP SIGNATURE-----
#
# old_revision [0bb67ca8b729200534e9fda164dd38051ee0ec16]
#
# patch "classes/package.bbclass"
#  from [de47edf65ee6076b0e6ad324f73e8d80f8133cfd]
#    to [38b89a3477576789d47adfad8017558a8312e12c]
#
============================================================
--- classes/package.bbclass	de47edf65ee6076b0e6ad324f73e8d80f8133cfd
+++ classes/package.bbclass	38b89a3477576789d47adfad8017558a8312e12c
@@ -120,7 +120,6 @@ python () {
 
 python () {
     import bb
-
     if bb.data.getVar('PACKAGES', d, True) != '':
         deps = bb.data.getVarFlag('do_package', 'depends', d) or ""
         for dep in (bb.data.getVar('PACKAGE_DEPENDS', d, True) or "").split():
@@ -131,62 +130,63 @@ python () {
         for dep in (bb.data.getVar('PACKAGE_EXTRA_DEPENDS', d, True) or "").split():
             deps += " %s:do_populate_staging" % dep
         bb.data.setVarFlag('do_package_write', 'depends', deps, d)
+	
+        # shlibs requires any DEPENDS to have already packaged for the *.list files
+        bb.data.setVarFlag('do_package', 'deptask', 'do_package', d)
 }
 
-# file(1) output to match to consider a file an unstripped executable
-FILE_UNSTRIPPED_MATCH ?= "not stripped"
-#FIXME: this should be "" when any errors are gone!
-IGNORE_STRIP_ERRORS ?= "1"
 
-runstrip() {
-	# Function to strip a single file, called from RUNSTRIP in populate_packages below
-	# A working 'file' (one which works on the target architecture)
-	# is necessary for this stuff to work, hence the addition to do_package[depends]
+def runstrip(file, d):
+    # Function to strip a single file, called from populate_packages below
+    # A working 'file' (one which works on the target architecture)
+    # is necessary for this stuff to work, hence the addition to do_package[depends]
 
-	local ro st
+    import bb, os, commands, stat
 
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
+    pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, 1)
 
+    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
 
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
+
 #
 # Package data handling routines
 #
@@ -309,9 +309,15 @@ python package_do_split_locales() {
 
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
@@ -360,26 +366,18 @@ python populate_packages () {
 	for pkg in packages.split():
 		if pkg in package_list:
 			bb.error("-------------------")
-			bb.error("%s is listed in PACKAGES mutliple times, this leads to packaging errors." % pkg)
+			bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
 			bb.error("Please fix the metadata/report this as bug to OE bugtracker.")
 			bb.error("-------------------")
 		else:
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
@@ -402,7 +400,6 @@ python populate_packages () {
 		bb.mkdirhier(root)
 		filesvar = bb.data.getVar('FILES', localdata, 1) or ""
 		files = filesvar.split()
-		cleandirs = []
 		for file in files:
 			if os.path.isabs(file):
 				file = '.' + file
@@ -411,8 +408,6 @@ python populate_packages () {
 					newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
 					if newfiles:
 						files += newfiles
-						if file != "./":
-							cleandirs = [file] + cleandirs
 						continue
 			globbed = glob.glob(file)
 			if globbed:
@@ -424,16 +419,9 @@ python populate_packages () {
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
 
@@ -601,8 +589,7 @@ python package_do_shlibs() {
 				soname = None
 				path = os.path.join(root, file)
 				if os.access(path, os.X_OK) or lib_re.match(file):
-					cmd = bb.data.getVar('OBJDUMP', d, 1) + " -p " + path + " 2>/dev/null"
-					cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', d, 1), cmd)
+					cmd = (bb.data.getVar('BUILD_PREFIX', d, 1) or "") + "objdump -p " + path + " 2>/dev/null"
 					fd = os.popen(cmd)
 					lines = fd.readlines()
 					fd.close()
@@ -612,10 +599,11 @@ python package_do_shlibs() {
 							needed[pkg].append(m.group(1))
 						m = re.match("\s+SONAME\s+([^\s]*)", l)
 						if m and not m.group(1) in sonames:
+							sonames.append(m.group(1))
 							# if library is private (only used by package) then do not build shlib for it
 							if not private_libs or -1 == private_libs.find(m.group(1)):
-								sonames.append(m.group(1))
-						if m and libdir_re.match(root):
+                                                        	sonames.append(m.group(1))
+                                                if m and libdir_re.match(root):
 							needs_ldconfig = True
 		shlibs_file = os.path.join(shlibs_dir, pkg + ".list")
 		if os.path.exists(shlibs_file):
@@ -824,54 +812,81 @@ python package_depchains() {
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
 
+	rdepends = []
+	for dep in explode_deps(bb.data.getVar('RDEPENDS', d, 1) or ""):
+		add_dep(rdepends, dep)
+
 	for pkg in packages.split():
-		for postfix in postfixes:
-			def func(list, name):
-				pkg = '%s%s' % (name, postfix)
-				if not pkg in list:
-					if packaged(pkg, d):
-						list.append(pkg)
+		for dep in explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 1) or ""):
+			add_dep(rdepends, dep)
 
-			base = pkg[:-len(postfix)]
+	#bb.note('rdepends is %s' % rdepends)
+
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
+			if pkg.startswith(prefix):
+				if not prefix in pkgs:
+					pkgs[prefix] = {}
+				pkgs[prefix][pkg] = (pkg[:-len(prefix)], pre_getname)
 
-			base = pkg[len(prefix):]
-			if pkg.startswith(prefix):
-				pkg_addrrecs(pkg, base, func, d)
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
 
 
@@ -887,8 +902,6 @@ python package_do_package () {
 	for f in (bb.data.getVar('PACKAGEFUNCS', d, 1) or '').split():
 		bb.build.exec_func(f, d)
 }
-# shlibs requires any DEPENDS to have already packaged for the *.list files
-do_package[deptask] = "do_package"
 do_package[dirs] = "${D}"
 addtask package before do_build after do_install
 

--------------070909030508080401030200--
