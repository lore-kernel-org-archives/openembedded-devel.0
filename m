Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5gL6-00068f-2R
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Feb 2013 18:41:57 +0100
Received: by mail-pa0-f43.google.com with SMTP id bh2so832826pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=NlluHYiwdiNvKCTega7hGPnkBNfQfqbSXVdtg12+1SQ=;
	b=UnA/iMe786aqnrv55DJDf0+P5fLwkZPI11+wd1G12gWuTgmAi0EE5Se8OSs/F3Eutg
	EwiXM8iuBBNyHVyJwoW0MgDcNpJmzgkbMyaR91YAo4zf5KMOFAGmdo0BirOMcVp9GWa6
	wL050YWrUD5l5c0nLf4VaYekxS5VluwhaXVjBvnaYyYG1/1M9qc1PRB/jkgs8dmU0jXo
	+MC/biSP5+PzhJyC0zIBWwbZvPx6MuR9A+E33gYzPn+EDYmJ6KHeZoOisxEfWYORlJPb
	ehHXuCZNbNrXDijmxT2/D6UPr5TF08fAul4rv8qCk90OW49FgXgc7sEk8VSn73UdlaTa
	xRgA==
X-Received: by 10.66.72.201 with SMTP id f9mr65984633pav.38.1360776345989;
	Wed, 13 Feb 2013 09:25:45 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id o5sm85065000pay.5.2013.02.13.09.25.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 09:25:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2013 09:25:34 -0800
Message-Id: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Wed, 13 Feb 2013 17:42:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass |  225 ----------------------------------
 1 file changed, 225 deletions(-)
 delete mode 100644 meta-systemd/classes/systemd.bbclass

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
deleted file mode 100644
index f2a0363..0000000
--- a/meta-systemd/classes/systemd.bbclass
+++ /dev/null
@@ -1,225 +0,0 @@
-DEPENDS_append = " systemd-systemctl-native"
-
-SYSTEMD_AUTO_ENABLE ??= "enable"
-
-SYSTEMD_AUTO_RRECOMMENDS ??= "enable"
-
-systemd_postinst() {
-OPTS=""
-
-if [ -n "$D" ]; then
-    OPTS="--root=$D"
-fi
-
-systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
-
-if [ -z "$D" -a ${SYSTEMD_AUTO_ENABLE} = "enable" ]; then
-    systemctl start ${SYSTEMD_SERVICE}
-fi
-}
-
-systemd_prerm() {
-if [ -z "$D" ]; then
-    systemctl stop ${SYSTEMD_SERVICE}
-fi
-
-systemctl disable ${SYSTEMD_SERVICE}
-}
-
-def get_package_var(d, var, pkg):
-    val = (d.getVar('%s_%s' % (var, pkg), 1) or "").strip()
-    if val == "":
-        val = (d.getVar(var, 1) or "").strip()
-    return val
-
-def systemd_after_parse(d):
-    def systemd_check_vars():
-        if d.getVar('BB_WORKERCONTEXT', True) is not None:
-            return
-
-        bb_filename = d.getVar('FILE')
-        packages = d.getVar('PACKAGES', 1)
-
-        # check SYSTEMD_PACKAGES
-        systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
-        if systemd_pkgs == "":
-            raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
-        for pkg_systemd in systemd_pkgs.split():
-            if pkg_systemd.find("-systemd") == -1:
-                if pkg_systemd != d.getVar('PN', 1):
-                    raise bb.build.FuncFailed, \
-                        "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
-                        (bb_filename, pkg_systemd)
-            else:
-                pkg_systemd_base = pkg_systemd
-                if pkg_systemd_base.endswith('-systemd'):
-                    pkg_systemd_base = pkg_systemd[:-8]
-                if pkg_systemd_base not in packages:
-                    raise bb.build.FuncFailed, \
-                        "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
-                        ( bb_filename, pkg_systemd)
-
-    # prepend systemd-packages not already included
-    def systemd_create_package(pkg_systemd):
-        packages = d.getVar('PACKAGES', 1)
-        if not pkg_systemd in packages:
-            packages = "%s %s" % (pkg_systemd, packages)
-            d.setVar('PACKAGES', packages)
-
-
-    bpn = d.getVar('BPN', 1)
-    ml = d.getVar('MLPREFIX', 1) or ""
-    if bpn + "-native" != d.getVar('PN', 1) and \
-            bpn + "-cross" != d.getVar('PN', 1) and \
-            ml + bpn == d.getVar('PN', 1) and \
-            "nativesdk-" + bpn != d.getVar('PN', 1):
-        systemd_check_vars()
-        for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-            systemd_create_package(pkg_systemd)
-
-
-python __anonymous() {
-    systemd_after_parse(d)
-}
-
-# automatically install all *.service and *.socket supplied in recipe's SRC_URI
-do_install_append() {
-    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
-    # ensure installing systemd-files only (e.g not avahi *.service)
-    if grep -q '\[Unit\]' $service ; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 $service ${D}${systemd_unitdir}/system
-    fi
-    done
-}
-
-python populate_packages_prepend () {
-    def systemd_generate_package_scripts(pkg):
-        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-        localdata = d.createCopy()
-        overrides = localdata.getVar("OVERRIDES", 1)
-        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
-        bb.data.update_data(localdata)
-
-        """
-        systemd postinst is appended here because pkg_postinst may require to
-        execute on the target. Not doing so may cause systemd postinst invoked
-        twice to cause unwanted warnings.
-        """ 
-        postinst = localdata.getVar('pkg_postinst', 1)
-        if not postinst:
-            postinst = '#!/bin/sh\n'
-        postinst += localdata.getVar('systemd_postinst', 1)
-        d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-        prerm = localdata.getVar('pkg_prerm', 1)
-        if not prerm:
-            prerm = '#!/bin/sh\n'
-        prerm += localdata.getVar('systemd_prerm', 1)
-        d.setVar('pkg_prerm_%s' % pkg, prerm)
-
-    # add files to FILES_*-systemd if existent and not already done
-    def systemd_append_file(pkg_systemd, file_append):
-        appended = False
-        if os.path.exists('${D}' + file_append):
-            var_name = "FILES_" + pkg_systemd
-            files = d.getVar(var_name, 0) or ""
-            if file_append not in files.split():
-                d.setVar(var_name, "%s %s" % (files, file_append))
-                appended = True
-        return appended
-
-    # add systemd files to FILES_*-systemd, parse for Also= and follow recursive
-    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
-        # avoid infinite recursion
-        if systemd_append_file(pkg_systemd, path + service):
-            fullpath = '${D}' + path + service
-            if service.find('.socket') != -1:
-                # for *.socket add *.service and *@.service
-                service_base = service.replace('.socket', '')
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
-            for key in keys.split():
-                # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
-                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
-                pipe = os.popen(cmd, 'r')
-                line = pipe.readline()
-                while line:
-                    line = line.replace('\n', '')
-                    systemd_add_files_and_parse(pkg_systemd, path, line, keys)
-                    line = pipe.readline()
-                pipe.close()
-
-    # check service-files and call systemd_add_files_and_parse for each entry
-    def systemd_check_services():
-        base_libdir = d.getVar('base_libdir', 1)
-        searchpaths = '/etc/systemd/system/' + ' '
-        searchpaths += '/lib/systemd/system/' + ' '
-        searchpaths += '/usr/lib/systemd/system/' + ' '
-        systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
-        has_exactly_one_service = len(systemd_packages.split()) == 1
-        if has_exactly_one_service:
-            has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
-
-        keys = 'Also' # Conflicts??
-        if has_exactly_one_service:
-            # single service gets also the /dev/null dummies
-            keys = 'Also Conflicts'
-        # scan for all in SYSTEMD_SERVICE[]
-        for pkg_systemd in systemd_packages.split():
-            for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
-                path_found = ''
-                for path in searchpaths.split():
-                    if os.path.exists('${D}' + path + service):
-                        path_found = path
-                if path_found != '':
-                    systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
-                else:
-                    raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
-                        (pkg_systemd, service)
-
-    """     Setup rdepends / rrecommmends as:
-
-                -----------------------------
-                |  pkg_systemd_base: 'foo'  |
-                -----------------------------
-                           |    ^
-                           |    |                 --------------
-               rrecommends |    | rdepends        | 'systemd'  |
-                           |    |               ->--------------
-                           V    |              / rdepends
-                ------------------------------/
-                | pkg_systemd: 'foo-systemd' |
-                ------------------------------
-    """
-    def systemd_add_rdepends_rrecommends(pkg_systemd):
-        # RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
-        rdepends = d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
-        rdepends_arr = rdepends.split()
-        if not 'systemd' in rdepends_arr:
-            rdepends = '%s %s' % (rdepends, 'systemd')
-        pkg_systemd_base = pkg_systemd.replace('-systemd', '')
-        # no automatism for:
-        # recipes setting rdepends themselves AND
-        # not rdepending myself AND
-        # avoid double entries
-        if len(rdepends_arr) == 0 and pkg_systemd != '${PN}' and not pkg_systemd_base in rdepends:
-            rdepends = '%s %s' % (rdepends, pkg_systemd_base)
-        d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
-        auto_rrecommends = d.getVar('SYSTEMD_AUTO_RRECOMMENDS', 1) or 'enable'
-        if auto_rrecommends == 'enable':
-            # RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
-            rrecommends = d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
-            # not rrecommending myself AND avoid double entries
-            if pkg_systemd != pkg_systemd_base and not pkg_systemd in rrecommends.split():
-                rrecommends = '%s %s' % (rrecommends, pkg_systemd)
-            d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
-
-    # run all modifications once when creating package
-    if os.path.exists('${D}'):
-        for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-            if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
-                systemd_generate_package_scripts(pkg_systemd)
-                systemd_add_rdepends_rrecommends(pkg_systemd)
-        systemd_check_services()
-}
-- 
1.7.9.5



