Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrnM7-0008WA-EW
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 11:49:11 +0200
Received: by wgbdr1 with SMTP id dr1so2068012wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=is3UzU8jKSMu4oz4mKSwc8ppnLkqwuF9X7cXbR17Yc8=;
	b=HHdTTlOCKzrlXO1jLw7F+Aa1WR5zTX8d8+U/1IRMqeqQ/9DsKNWmOaTRmiE/Lggdap
	+ulVG9NlKvC6+u63idSc1IGfQaJgSDXIcxut0rL6P/FDrXI60jBtKjmXWnc84PJ+zKGi
	cCZ0FHIsENrp10v8RGHPNbO3a+uVamOFoyC3Ijdf2UvVTA75y5hA2bkGI1Fs61nosgxr
	BE57KHtUbYjOEje+dKlgZsODeX7f+9Vg8OGdfAtLkRIZs3ixa9GVI+Kzf/lGS/4yC23U
	wLND9HNuY05hcKly6UmE2M4SiZZeHfrSKZZ1xGMImsmf4/Cu8mLCove4+l0Qft1NQ+pX
	QhBg==
Received: by 10.217.3.77 with SMTP id q55mr738803wes.158.1342690669747;
	Thu, 19 Jul 2012 02:37:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu3sm4748804wib.10.2012.07.19.02.37.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 02:37:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 11:37:59 +0200
Message-Id: <1342690679-22685-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH] kernel.bbclass: convert tab indentation in python functions into four-space
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
X-List-Received-Date: Thu, 19 Jul 2012 09:49:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |  342 ++++++++++++++++++++--------------------
 1 files changed, 171 insertions(+), 171 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 1cd2540..2bb1b5b 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -318,177 +318,177 @@ module_conf_sco = "alias bt-proto-2 sco"
 module_conf_rfcomm = "alias bt-proto-3 rfcomm"
 
 python populate_packages_prepend () {
-	def extract_modinfo(file):
-		import tempfile, re, subprocess
-		tempfile.tempdir = d.getVar("WORKDIR", True)
-		tf = tempfile.mkstemp()
-		tmpfile = tf[1]
-		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
-		subprocess.call(cmd, shell=True)
-		f = open(tmpfile)
-		l = f.read().split("\000")
-		f.close()
-		os.close(tf[0])
-		os.unlink(tmpfile)
-		exp = re.compile("([^=]+)=(.*)")
-		vals = {}
-		for i in l:
-			m = exp.match(i)
-			if not m:
-				continue
-			vals[m.group(1)] = m.group(2)
-		return vals
-	
-	def parse_depmod():
-		import re
-
-		dvar = d.getVar('PKGD', True)
-		if not dvar:
-			bb.error("PKGD not defined")
-			return
-
-		kernelver = d.getVar('KERNEL_VERSION', True)
-		kernelver_stripped = kernelver
-		m = re.match('^(.*-hh.*)[\.\+].*$', kernelver)
-		if m:
-			kernelver_stripped = m.group(1)
-		path = d.getVar("PATH", True)
-
-		cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
-		f = os.popen(cmd, 'r')
-
-		deps = {}
-		pattern0 = "^(.*\.k?o):..*$"
-		pattern1 = "^(.*\.k?o):\s*(.*\.k?o)\s*$"
-		pattern2 = "^(.*\.k?o):\s*(.*\.k?o)\s*\\\$"
-		pattern3 = "^\t(.*\.k?o)\s*\\\$"
-		pattern4 = "^\t(.*\.k?o)\s*$"
-
-		line = f.readline()
-		while line:
-			if not re.match(pattern0, line):
-				line = f.readline()
-				continue
-			m1 = re.match(pattern1, line)
-			if m1:
-				deps[m1.group(1)] = m1.group(2).split()
-			else:
-				m2 = re.match(pattern2, line)
-				if m2:
-					deps[m2.group(1)] = m2.group(2).split()
-					line = f.readline()
-					m3 = re.match(pattern3, line)
-					while m3:
-						deps[m2.group(1)].extend(m3.group(1).split())
-						line = f.readline()
-						m3 = re.match(pattern3, line)
-					m4 = re.match(pattern4, line)
-					deps[m2.group(1)].extend(m4.group(1).split())
-			line = f.readline()
-		f.close()
-		return deps
-	
-	def get_dependencies(file, pattern, format):
-		# file no longer includes PKGD
-		file = file.replace(d.getVar('PKGD', True) or '', '', 1)
-		# instead is prefixed with /lib/modules/${KERNEL_VERSION}
-		file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
-
-		if module_deps.has_key(file):
-			import re
-			dependencies = []
-			for i in module_deps[file]:
-				m = re.match(pattern, os.path.basename(i))
-				if not m:
-					continue
-				on = legitimize_package_name(m.group(1))
-				dependency_pkg = format % on
-				dependencies.append(dependency_pkg)
-			return dependencies
-		return []
-
-	def frob_metadata(file, pkg, pattern, format, basename):
-		import re
-		vals = extract_modinfo(file)
-
-		dvar = d.getVar('PKGD', True)
-
-		# If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
-		# appropriate modprobe commands to the postinst
-		autoload = d.getVar('module_autoload_%s' % basename, True)
-		if autoload:
-			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
-			f = open(name, 'w')
-			for m in autoload.split():
-				f.write('%s\n' % m)
-			f.close()
-			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
-			if not postinst:
-				bb.fatal("pkg_postinst_%s not defined" % pkg)
-			postinst += d.getVar('autoload_postinst_fragment', True) % autoload
-			d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-		# Write out any modconf fragment
-		modconf = d.getVar('module_conf_%s' % basename, True)
-		if modconf:
-			name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
-			f = open(name, 'w')
-			f.write("%s\n" % modconf)
-			f.close()
-
-		files = d.getVar('FILES_%s' % pkg, True)
-		files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-		d.setVar('FILES_%s' % pkg, files)
-
-		if vals.has_key("description"):
-			old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
-			d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
-
-		rdepends_str = d.getVar('RDEPENDS_' + pkg, True)
-		if rdepends_str:
-			rdepends = rdepends_str.split()
-		else:
-			rdepends = []
-		rdepends.extend(get_dependencies(file, pattern, format))
-		d.setVar('RDEPENDS_' + pkg, ' '.join(rdepends))
-
-	module_deps = parse_depmod()
-	module_regex = '^(.*)\.k?o$'
-	module_pattern = 'kernel-module-%s'
-
-	postinst = d.getVar('pkg_postinst_modules', True)
-	postrm = d.getVar('pkg_postrm_modules', True)
-	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
-
-	# If modules-load.d and modprobe.d are empty at this point, remove them to
-	# avoid warnings. removedirs only raises an OSError if an empty
-	# directory cannot be removed.
-	dvar = d.getVar('PKGD', True)
-	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
-		if len(os.listdir(dir)) == 0:
-			os.rmdir(dir)
-
-	import re
-	metapkg = "kernel-modules"
-	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
-	for l in module_deps.values():
-		for i in l:
-			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-			blacklist.append(pkg)
-	metapkg_rdepends = []
-	packages = d.getVar('PACKAGES', True).split()
-	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends:
-			metapkg_rdepends.append(pkg)
-	d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-	d.setVar('DESCRIPTION_' + metapkg, 'Kernel modules meta package')
-	packages.append(metapkg)
-	d.setVar('PACKAGES', ' '.join(packages))
+    def extract_modinfo(file):
+        import tempfile, re, subprocess
+        tempfile.tempdir = d.getVar("WORKDIR", True)
+        tf = tempfile.mkstemp()
+        tmpfile = tf[1]
+        cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
+        subprocess.call(cmd, shell=True)
+        f = open(tmpfile)
+        l = f.read().split("\000")
+        f.close()
+        os.close(tf[0])
+        os.unlink(tmpfile)
+        exp = re.compile("([^=]+)=(.*)")
+        vals = {}
+        for i in l:
+            m = exp.match(i)
+            if not m:
+                continue
+            vals[m.group(1)] = m.group(2)
+        return vals
+    
+    def parse_depmod():
+        import re
+
+        dvar = d.getVar('PKGD', True)
+        if not dvar:
+            bb.error("PKGD not defined")
+            return
+
+        kernelver = d.getVar('KERNEL_VERSION', True)
+        kernelver_stripped = kernelver
+        m = re.match('^(.*-hh.*)[\.\+].*$', kernelver)
+        if m:
+            kernelver_stripped = m.group(1)
+        path = d.getVar("PATH", True)
+
+        cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
+        f = os.popen(cmd, 'r')
+
+        deps = {}
+        pattern0 = "^(.*\.k?o):..*$"
+        pattern1 = "^(.*\.k?o):\s*(.*\.k?o)\s*$"
+        pattern2 = "^(.*\.k?o):\s*(.*\.k?o)\s*\\\$"
+        pattern3 = "^\t(.*\.k?o)\s*\\\$"
+        pattern4 = "^\t(.*\.k?o)\s*$"
+
+        line = f.readline()
+        while line:
+            if not re.match(pattern0, line):
+                line = f.readline()
+                continue
+            m1 = re.match(pattern1, line)
+            if m1:
+                deps[m1.group(1)] = m1.group(2).split()
+            else:
+                m2 = re.match(pattern2, line)
+                if m2:
+                    deps[m2.group(1)] = m2.group(2).split()
+                    line = f.readline()
+                    m3 = re.match(pattern3, line)
+                    while m3:
+                        deps[m2.group(1)].extend(m3.group(1).split())
+                        line = f.readline()
+                        m3 = re.match(pattern3, line)
+                    m4 = re.match(pattern4, line)
+                    deps[m2.group(1)].extend(m4.group(1).split())
+            line = f.readline()
+        f.close()
+        return deps
+    
+    def get_dependencies(file, pattern, format):
+        # file no longer includes PKGD
+        file = file.replace(d.getVar('PKGD', True) or '', '', 1)
+        # instead is prefixed with /lib/modules/${KERNEL_VERSION}
+        file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
+
+        if module_deps.has_key(file):
+            import re
+            dependencies = []
+            for i in module_deps[file]:
+                m = re.match(pattern, os.path.basename(i))
+                if not m:
+                    continue
+                on = legitimize_package_name(m.group(1))
+                dependency_pkg = format % on
+                dependencies.append(dependency_pkg)
+            return dependencies
+        return []
+
+    def frob_metadata(file, pkg, pattern, format, basename):
+        import re
+        vals = extract_modinfo(file)
+
+        dvar = d.getVar('PKGD', True)
+
+        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
+        # appropriate modprobe commands to the postinst
+        autoload = d.getVar('module_autoload_%s' % basename, True)
+        if autoload:
+            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
+            f = open(name, 'w')
+            for m in autoload.split():
+                f.write('%s\n' % m)
+            f.close()
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            if not postinst:
+                bb.fatal("pkg_postinst_%s not defined" % pkg)
+            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        # Write out any modconf fragment
+        modconf = d.getVar('module_conf_%s' % basename, True)
+        if modconf:
+            name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
+            f = open(name, 'w')
+            f.write("%s\n" % modconf)
+            f.close()
+
+        files = d.getVar('FILES_%s' % pkg, True)
+        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
+        d.setVar('FILES_%s' % pkg, files)
+
+        if vals.has_key("description"):
+            old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
+            d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
+
+        rdepends_str = d.getVar('RDEPENDS_' + pkg, True)
+        if rdepends_str:
+            rdepends = rdepends_str.split()
+        else:
+            rdepends = []
+        rdepends.extend(get_dependencies(file, pattern, format))
+        d.setVar('RDEPENDS_' + pkg, ' '.join(rdepends))
+
+    module_deps = parse_depmod()
+    module_regex = '^(.*)\.k?o$'
+    module_pattern = 'kernel-module-%s'
+
+    postinst = d.getVar('pkg_postinst_modules', True)
+    postrm = d.getVar('pkg_postrm_modules', True)
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
+
+    # If modules-load.d and modprobe.d are empty at this point, remove them to
+    # avoid warnings. removedirs only raises an OSError if an empty
+    # directory cannot be removed.
+    dvar = d.getVar('PKGD', True)
+    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
+        if len(os.listdir(dir)) == 0:
+            os.rmdir(dir)
+
+    import re
+    metapkg = "kernel-modules"
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    d.setVar('FILES_' + metapkg, "")
+    blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
+    for l in module_deps.values():
+        for i in l:
+            pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
+            blacklist.append(pkg)
+    metapkg_rdepends = []
+    packages = d.getVar('PACKAGES', True).split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends:
+            metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + metapkg, 'Kernel modules meta package')
+    packages.append(metapkg)
+    d.setVar('PACKAGES', ' '.join(packages))
 }
 
 # Support checking the kernel size since some kernels need to reside in partitions
-- 
1.7.8.6



