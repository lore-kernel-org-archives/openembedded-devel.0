Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SrokC-00025N-W9
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 13:18:09 +0200
Received: by weyr6 with SMTP id r6so1599639wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 04:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=CyG+pcgWlAIAI117vN6nmdDOgNcj/Krr9T1Q+RzBAFQ=;
	b=X4S0fykK7WpnQX54nsh/Q36d4vrmp1Y9Ylfa/Dq2QUuIWen2rETrvmD9h1+WgYgaIg
	u7PKF0M9HTH3OY0wSa8FyVFf5iMoKsr22Xq5dCiVpt55ZlRs8YdncK8pwTH0KwAJqeju
	AFzSQZ0WYyV4uggcmuconPgCwhC/qS2UTcsa4QYl9yYJ0rujVY6K8x2WZYRZ+dbFtSiV
	Vn0SKpqj0aF/Q9vrT/iI2jF5Kfu/HOQ3LXB3Ph27gYijuBj8fvd4qYIYPdxOMaZ89/Fh
	L0fS3ELOVdDVLayWsxSaZ0PNJlADZ1Fvch/5K+eEvtZUHIa+gUJ0qTCGqak5V+yn/fz6
	q03g==
Received: by 10.216.24.85 with SMTP id w63mr974825wew.145.1342696006993;
	Thu, 19 Jul 2012 04:06:46 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id w3sm4866929eep.2.2012.07.19.04.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 04:06:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:06:40 +0200
Message-Id: <1342696000-19804-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnBI+lL2H/B9ZDXh+8p2LR5Qa+XVcYdIGKw3lkadAxKh6+4eiPp3DBgv8D9M68eg6VBhc1H
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-systemd][PATCH] systemd bbclass: replace all tabs with 4 spaces
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
X-List-Received-Date: Thu, 19 Jul 2012 11:18:09 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/classes/systemd.bbclass |  330 +++++++++++++++++-----------------
 1 files changed, 165 insertions(+), 165 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 38b9ed5..dd9f326 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -27,51 +27,51 @@ systemctl disable ${SYSTEMD_SERVICE}
 }
 
 def get_package_var(d, var, pkg):
-	val = (d.getVar('%s_%s' % (var, pkg), d, 1) or "").strip()
-	if val == "":
-		val = (d.getVar(var, d, 1) or "").strip()
-	return val
+    val = (d.getVar('%s_%s' % (var, pkg), d, 1) or "").strip()
+    if val == "":
+        val = (d.getVar(var, d, 1) or "").strip()
+    return val
 
 def systemd_after_parse(d):
-	def systemd_check_vars():
-		if d.getVar('BB_WORKERCONTEXT', True) is not None:
-			return
-
-		bb_filename = d.getVar('FILE')
-		packages = d.getVar('PACKAGES', 1)
-
-		# check SYSTEMD_PACKAGES
-		systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
-		if systemd_pkgs == "":
-			raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
-		for pkg_systemd in systemd_pkgs.split():
-			if pkg_systemd.find("-systemd") == -1:
-				if pkg_systemd != d.getVar('PN', 1):
-					raise bb.build.FuncFailed, \
-						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
-						(bb_filename, pkg_systemd)
-			else:
-				pkg_systemd_base = pkg_systemd.replace('-systemd', '')
-				if pkg_systemd_base not in packages:
-					raise bb.build.FuncFailed, \
-						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
-						( bb_filename, pkg_systemd)
-
-	# prepend systemd-packages not already included
-	def systemd_create_package(pkg_systemd):
-		packages = d.getVar('PACKAGES', 1)
-		if not pkg_systemd in packages:
-			packages = "%s %s" % (pkg_systemd, packages)
-			d.setVar('PACKAGES', packages)
-
-
-	bpn = d.getVar('BPN', 1)
-	if bpn + "-native" != d.getVar('PN', 1) and \
-		    bpn + "-cross" != d.getVar('PN', 1) and \
-		    bpn + "-nativesdk" != d.getVar('PN', 1):
-		systemd_check_vars()
-		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			systemd_create_package(pkg_systemd)
+    def systemd_check_vars():
+        if d.getVar('BB_WORKERCONTEXT', True) is not None:
+            return
+
+        bb_filename = d.getVar('FILE')
+        packages = d.getVar('PACKAGES', 1)
+
+        # check SYSTEMD_PACKAGES
+        systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
+        if systemd_pkgs == "":
+            raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
+        for pkg_systemd in systemd_pkgs.split():
+            if pkg_systemd.find("-systemd") == -1:
+                if pkg_systemd != d.getVar('PN', 1):
+                    raise bb.build.FuncFailed, \
+                        "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
+                        (bb_filename, pkg_systemd)
+            else:
+                pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+                if pkg_systemd_base not in packages:
+                    raise bb.build.FuncFailed, \
+                        "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
+                        ( bb_filename, pkg_systemd)
+
+    # prepend systemd-packages not already included
+    def systemd_create_package(pkg_systemd):
+        packages = d.getVar('PACKAGES', 1)
+        if not pkg_systemd in packages:
+            packages = "%s %s" % (pkg_systemd, packages)
+            d.setVar('PACKAGES', packages)
+
+
+    bpn = d.getVar('BPN', 1)
+    if bpn + "-native" != d.getVar('PN', 1) and \
+            bpn + "-cross" != d.getVar('PN', 1) and \
+            bpn + "-nativesdk" != d.getVar('PN', 1):
+        systemd_check_vars()
+        for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+            systemd_create_package(pkg_systemd)
 
 
 python __anonymous() {
@@ -81,103 +81,103 @@ python __anonymous() {
 # automatically install all *.service and *.socket supplied in recipe's SRC_URI
 do_install_append() {
     for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
-	# ensure installing systemd-files only (e.g not avahi *.service)
-	if grep -q '\[Unit\]' $service ; then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 644 $service ${D}${systemd_unitdir}/system
-	fi
+    # ensure installing systemd-files only (e.g not avahi *.service)
+    if grep -q '\[Unit\]' $service ; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 $service ${D}${systemd_unitdir}/system
+    fi
     done
 }
 
 python populate_packages_prepend () {
-	def systemd_generate_package_scripts(pkg):
-		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-		localdata = bb.data.createCopy(d)
-		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
-		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
-		bb.data.update_data(localdata)
-
-		"""
-		systemd postinst is appended here because pkg_postinst may require to
-		execute on the target. Not doing so may cause systemd postinst invoked
-		twice to cause unwanted warnings.
-		""" 
-		postinst = bb.data.getVar('pkg_postinst', localdata, 1)
-		if not postinst:
-			postinst = '#!/bin/sh\n'
-		postinst += bb.data.getVar('systemd_postinst', localdata, 1)
-		bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
-
-		prerm = bb.data.getVar('pkg_prerm', localdata, 1)
-		if not prerm:
-			prerm = '#!/bin/sh\n'
-		prerm += bb.data.getVar('systemd_prerm', localdata, 1)
-		bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
-
-		postrm = bb.data.getVar('pkg_postrm', localdata, 1)
-		if not postrm:
-			postrm = '#!/bin/sh\n'
-		postrm += bb.data.getVar('systemd_postrm', localdata, 1)
-		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
-
-	# add files to FILES_*-systemd if existent and not already done
-	def systemd_append_file(pkg_systemd, file_append):
-		appended = False
-		if os.path.exists('${D}' + file_append):
-			var_name = "FILES_" + pkg_systemd
-			files = d.getVar(var_name, 0) or ""
-			if file_append not in files.split():
-				d.setVar(var_name, "%s %s" % (files, file_append))
-				appended = True
-		return appended
-
-	# add systemd files to FILES_*-systemd, parse for Also= and follow recursive
-	def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
-		# avoid infinite recursion
-		if systemd_append_file(pkg_systemd, path + service):
-			fullpath = '${D}' + path + service
-			if service.find('.socket') != -1:
-				# for *.socket add *.service and *@.service
-				service_base = service.replace('.socket', '')
-				systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
-				systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
-			for key in keys.split():
-				# recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
-				cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
-				pipe = os.popen(cmd, 'r')
-				line = pipe.readline()
-				while line:
-					line = line.replace('\n', '')
-					systemd_add_files_and_parse(pkg_systemd, path, line, keys)
-					line = pipe.readline()
-				pipe.close()
-
-	# check service-files and call systemd_add_files_and_parse for each entry
-	def systemd_check_services():
-		searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
-		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
-		has_exactly_one_service = len(systemd_packages.split()) == 1
-		if has_exactly_one_service:
-			has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
-
-		keys = 'Also' # Conflicts??
-		if has_exactly_one_service:
-			# single service gets also the /dev/null dummies
-			keys = 'Also Conflicts'
-		# scan for all in SYSTEMD_SERVICE[]
-		for pkg_systemd in systemd_packages.split():
-			for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
-				path_found = ''
-				for path in searchpaths.split():
-					if os.path.exists('${D}' + path + service):
-						path_found = path
-				if path_found != '':
-					systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
-				else:
-					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
-						(pkg_systemd, service)
-
-	"""     Setup rdepends / rrecommmends as:
+    def systemd_generate_package_scripts(pkg):
+        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
+        localdata = bb.data.createCopy(d)
+        overrides = bb.data.getVar("OVERRIDES", localdata, 1)
+        bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+        bb.data.update_data(localdata)
+
+        """
+        systemd postinst is appended here because pkg_postinst may require to
+        execute on the target. Not doing so may cause systemd postinst invoked
+        twice to cause unwanted warnings.
+        """ 
+        postinst = bb.data.getVar('pkg_postinst', localdata, 1)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += bb.data.getVar('systemd_postinst', localdata, 1)
+        bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
+
+        prerm = bb.data.getVar('pkg_prerm', localdata, 1)
+        if not prerm:
+            prerm = '#!/bin/sh\n'
+        prerm += bb.data.getVar('systemd_prerm', localdata, 1)
+        bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
+
+        postrm = bb.data.getVar('pkg_postrm', localdata, 1)
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += bb.data.getVar('systemd_postrm', localdata, 1)
+        bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
+
+    # add files to FILES_*-systemd if existent and not already done
+    def systemd_append_file(pkg_systemd, file_append):
+        appended = False
+        if os.path.exists('${D}' + file_append):
+            var_name = "FILES_" + pkg_systemd
+            files = d.getVar(var_name, 0) or ""
+            if file_append not in files.split():
+                d.setVar(var_name, "%s %s" % (files, file_append))
+                appended = True
+        return appended
+
+    # add systemd files to FILES_*-systemd, parse for Also= and follow recursive
+    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
+        # avoid infinite recursion
+        if systemd_append_file(pkg_systemd, path + service):
+            fullpath = '${D}' + path + service
+            if service.find('.socket') != -1:
+                # for *.socket add *.service and *@.service
+                service_base = service.replace('.socket', '')
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+            for key in keys.split():
+                # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
+                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
+                pipe = os.popen(cmd, 'r')
+                line = pipe.readline()
+                while line:
+                    line = line.replace('\n', '')
+                    systemd_add_files_and_parse(pkg_systemd, path, line, keys)
+                    line = pipe.readline()
+                pipe.close()
+
+    # check service-files and call systemd_add_files_and_parse for each entry
+    def systemd_check_services():
+        searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+        systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
+        has_exactly_one_service = len(systemd_packages.split()) == 1
+        if has_exactly_one_service:
+            has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
+
+        keys = 'Also' # Conflicts??
+        if has_exactly_one_service:
+            # single service gets also the /dev/null dummies
+            keys = 'Also Conflicts'
+        # scan for all in SYSTEMD_SERVICE[]
+        for pkg_systemd in systemd_packages.split():
+            for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
+                path_found = ''
+                for path in searchpaths.split():
+                    if os.path.exists('${D}' + path + service):
+                        path_found = path
+                if path_found != '':
+                    systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
+                else:
+                    raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
+                        (pkg_systemd, service)
+
+    """     Setup rdepends / rrecommmends as:
 
                 -----------------------------
                 |  pkg_systemd_base: 'foo'  |
@@ -190,33 +190,33 @@ python populate_packages_prepend () {
                 ------------------------------/
                 | pkg_systemd: 'foo-systemd' |
                 ------------------------------
-	"""
-	def systemd_add_rdepends_rrecommends(pkg_systemd):
-		# RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
-		rdepends = d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
-		rdepends_arr = rdepends.split()
-		if not 'systemd' in rdepends_arr:
-			rdepends = '%s %s' % (rdepends, 'systemd')
-		pkg_systemd_base = pkg_systemd.replace('-systemd', '')
-		# no automatism for:
-		# recipes setting rdepends themselves AND
-		# not rdepending myself AND
-		# avoid double entries
-		if len(rdepends_arr) == 0 and pkg_systemd != '${PN}' and not pkg_systemd_base in rdepends:
-			rdepends = '%s %s' % (rdepends, pkg_systemd_base)
-		d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
-		# RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
-		rrecommends = d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
-		# not rrecommending myself AND avoid double entries
-		if pkg_systemd != pkg_systemd_base and not pkg_systemd in rrecommends.split():
-			rrecommends = '%s %s' % (rrecommends, pkg_systemd)
-		d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
-
-	# run all modifications once when creating package
-	if os.path.exists('${D}'):
-		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
-				systemd_generate_package_scripts(pkg_systemd)
-				systemd_add_rdepends_rrecommends(pkg_systemd)
-		systemd_check_services()
+    """
+    def systemd_add_rdepends_rrecommends(pkg_systemd):
+        # RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
+        rdepends = d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
+        rdepends_arr = rdepends.split()
+        if not 'systemd' in rdepends_arr:
+            rdepends = '%s %s' % (rdepends, 'systemd')
+        pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+        # no automatism for:
+        # recipes setting rdepends themselves AND
+        # not rdepending myself AND
+        # avoid double entries
+        if len(rdepends_arr) == 0 and pkg_systemd != '${PN}' and not pkg_systemd_base in rdepends:
+            rdepends = '%s %s' % (rdepends, pkg_systemd_base)
+        d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
+        # RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
+        rrecommends = d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
+        # not rrecommending myself AND avoid double entries
+        if pkg_systemd != pkg_systemd_base and not pkg_systemd in rrecommends.split():
+            rrecommends = '%s %s' % (rrecommends, pkg_systemd)
+        d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
+
+    # run all modifications once when creating package
+    if os.path.exists('${D}'):
+        for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+            if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
+                systemd_generate_package_scripts(pkg_systemd)
+                systemd_add_rdepends_rrecommends(pkg_systemd)
+        systemd_check_services()
 }
-- 
1.7.7.3



