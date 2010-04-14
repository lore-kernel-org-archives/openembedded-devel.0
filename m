Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O1zNF-0004ec-Kd
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 11:59:12 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3E9teTL005411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Apr 2010 11:55:40 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1O1zJs-0001qU-Ic; Wed, 14 Apr 2010 11:55:40 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 11:55:39 +0200
Message-Id: <1271238939-7065-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 14 Apr 2010 09:59:20 -0000

Doing a '-c clean' operation on a staged package with very much files
(e.g. glibc) took several minutes because

* every removed file was reported
* an 'rm' instance was spawned for every file

This patch uses the native 'os.unlink()' method for removing files and
reports only the removed root directory instead of the single files.

Based upon maillist discussion, reporting happens with 'debug' level
instead of 'note' one, and only error conditions due to non-existing
files will be ignored.  Other (e.g. permission denied) errors will now
abort the build while they were silently ignored previously.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/packaged-staging.bbclass |   23 ++++++++++++++++++-----
 1 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 9c72d11..f3648d2 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -26,6 +26,16 @@ PSTAGE_NATIVEDEPENDS = "\
 
 BB_STAMP_WHITELIST = "${PSTAGE_NATIVEDEPENDS}"
 
+def _package_unlink (f):
+    import os, errno
+    try:
+	os.unlink(f)
+	return True
+    except OSError, e:
+	if e.errno == errno.ENOENT:
+	    return False
+	raise
+
 python () {
     pstage_allowed = True
 
@@ -87,10 +97,10 @@ def pstage_manualclean(srcname, destvarname, d):
 	dest = bb.data.getVar(destvarname, d, True)
 
 	for walkroot, dirs, files in os.walk(src):
+		bb.debug("rm %s" % walkroot)
 		for file in files:
 			filepath = os.path.join(walkroot, file).replace(src, dest)
-			bb.note("rm %s" % filepath)
-			os.system("rm %s" % filepath)
+			_package_unlink(filepath)
 
 def pstage_set_pkgmanager(d):
     path = bb.data.getVar("PATH", d, 1)
@@ -162,6 +172,7 @@ PSTAGE_TASKS_COVERED = "fetch unpack munge patch configure qa_configure rig_loca
 SCENEFUNCS += "packagestage_scenefunc"
 
 python packagestage_scenefunc () {
+    import glob
     if bb.data.getVar("PSTAGING_ACTIVE", d, 1) == "0":
         return
 
@@ -227,7 +238,9 @@ python packagestage_scenefunc () {
 
         # Remove the stamps and files we added above
         # FIXME - we should really only remove the stamps we added
-        os.system('rm -f ' + stamp + '.*')
+	for fname in glob.glob(stamp + '.*'):
+	    _package_unlink(fname)
+
         os.system(bb.data.expand("rm -rf ${WORKDIR}/tstage", d))
 
         if stageok:
@@ -260,8 +273,8 @@ python packagedstage_stampfixing_eventhandler() {
                     # so we need to remove the autogenerated stamps.
                     for task in taskscovered:
                         dir = "%s.do_%s" % (e.stampPrefix[fn], task)
-                        os.system('rm -f ' + dir)
-                    os.system('rm -f ' + stamp)
+			_package_unlink(dir)
+		    _package_unlink(stamp)
 }
 
 populate_staging_preamble () {
-- 
1.7.0.1



