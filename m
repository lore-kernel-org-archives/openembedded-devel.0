Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Su9RK-0001I1-Tq
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2012 23:48:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6PL9Vw2014863
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2012 22:09:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14132-03 for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2012 22:09:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6PL9MFC014857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2012 22:09:23 +0100
Message-ID: <1343250562.29991.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 25 Jul 2012 22:09:22 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
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
X-List-Received-Date: Wed, 25 Jul 2012 21:48:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently all sstate files are placed into one directory. This does not scale and
causes a variety of filesystem issues. This patch adds a two character subdirectory
to the layout (based on the first two characters of the hash) so that files
can be split into several directories.

This should help performance of sstate in most cases by avoding creating directories with 
huge numbers of files.

The SSTATE_MIRRORS syntax needs updating to account for the extra path element by
the addition of a PATH item, for example:

SSTATE_MIRRORS = "file://.* file:///some/path/to/sstate-cache/PATH"
SSTATE_MIRRORS = "file://.* http://192.168.1.23/sstate-cache/PATH"

This change also sets the scene for using things like lsb-release in
the 

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 570b371..d00779a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -4,16 +4,21 @@ SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
 
+def generate_sstatefn(spec, hash, d):
+    if not hash:
+        hash = "INVALID"
+    return hash[:2] + "/" + spec + hash
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
-SSTATE_PKGNAME    = "${SSTATE_PKGSPEC}${BB_TASKHASH}"
+SSTATE_PKGNAME    = "${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
+SSTATE_PATHSPEC   = "${SSTATE_DIR}/*/${SSTATE_PKGSPEC}"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
 
-BB_HASHFILENAME = "${SSTATE_PKGNAME}"
+BB_HASHFILENAME = "${SSTATE_PKGSPEC}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -158,10 +163,11 @@ def sstate_installpkg(ss, d):
         oe.path.remove(dir)
 
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
+    sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['name'] + ".tgz"
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
 
     if not os.path.exists(sstatepkg):
-       pstaging_fetch(sstatepkg, d)
+       pstaging_fetch(sstatefetch, sstatepkg, d)
 
     if not os.path.isfile(sstatepkg):
         bb.note("Staging package %s does not exist" % sstatepkg)
@@ -223,8 +229,7 @@ def sstate_installpkg(ss, d):
 def sstate_clean_cachefile(ss, d):
     import oe.path
 
-    sstatepkgdir = d.getVar('SSTATE_DIR', True)
-    sstatepkgfile = sstatepkgdir + '/' + d.getVar('SSTATE_PKGSPEC', True) + "*_" + ss['name'] + ".tgz*"
+    sstatepkgfile = d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['name'] + ".tgz*"
     bb.note("Removing %s" % sstatepkgfile)
     oe.path.remove(sstatepkgfile)
 
@@ -417,7 +422,7 @@ def sstate_package(ss, d):
 
     return
 
-def pstaging_fetch(sstatepkg, d):
+def pstaging_fetch(sstatefetch, sstatepkg, d):
     import bb.fetch2
 
     # Only try and fetch if the user has configured a mirror
@@ -430,7 +435,7 @@ def pstaging_fetch(sstatepkg, d):
     bb.data.update_data(localdata)
 
     dldir = localdata.expand("${SSTATE_DIR}")
-    srcuri = "file://" + os.path.basename(sstatepkg)
+    srcuri = "file://" + sstatefetch
 
     bb.mkdirhier(dldir)
 
@@ -519,8 +524,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
     }
 
     for task in range(len(sq_fn)):
-        sstatefile = d.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz")
-        sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
+        sstatefile = d.expand("${SSTATE_DIR}/" + generate_sstatefn(sq_hashfn[task], sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             ret.append(task)
@@ -544,10 +548,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             if task in ret:
                 continue
 
-            sstatefile = d.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz")
-            sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
+            sstatefile = d.expand(generate_sstatefn(sq_hashfn[task], sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
 
-            srcuri = "file://" + os.path.basename(sstatefile)
+            srcuri = "file://" + sstatefile
             localdata.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 





