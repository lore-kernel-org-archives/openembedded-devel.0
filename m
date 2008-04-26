Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JptPn-0005aI-Ib
	for openembedded-devel@openembedded.org; Sun, 27 Apr 2008 01:02:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3QN2PGm024439
	for <openembedded-devel@openembedded.org>;
	Sun, 27 Apr 2008 00:02:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24045-07 for <openembedded-devel@openembedded.org>;
	Sun, 27 Apr 2008 00:02:21 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3QN2Jjh024433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 27 Apr 2008 00:02:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sun, 27 Apr 2008 00:02:20 +0100
Message-Id: <1209250940.5086.46.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Proposed rebuild task fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 26 Apr 2008 23:02:44 -0000
X-Groupsio-MsgNum: 5016
Content-Type: multipart/mixed; boundary="=-kPMBZexOzucQL7RhfN+Y"

--=-kPMBZexOzucQL7RhfN+Y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

As mentioned recently the rebuild task has issues. The attached patch is
the fix I'd like to propose for this. It adds a "setscene" task which
runs before fetch and does housekeeping style activities like cleaning
up work areas. I've written it so the existing packaged-staging
"do_prepackaged_stage" task is also brought under the umbrella of this
new task. One useful advantage to this is you can then enable/disable
packaged staging within a given build and it won't rebuild everything
which is a drawback of the current setup.

The main drawback to this proposed change is that it will force a full
rebuild of everything equivalent to a 'wipe tmp/'.

Let me know if anyone objects to the change or wants more information...

Cheers,

Richard


--=-kPMBZexOzucQL7RhfN+Y
Content-Disposition: attachment; filename=scene.patch
Content-Type: text/x-patch; name=scene.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Index: packaged-staging.bbclass
===================================================================
--- packaged-staging.bbclass	(revision 4350)
+++ packaged-staging.bbclass	(working copy)
@@ -123,7 +123,9 @@
 
 PSTAGE_TASKS_COVERED = "fetch unpack munge patch configure qa_configure rig_locales compile sizecheck install deploy package populate_staging package_write_deb package_write_ipk package_write package_stage qa_staging"
 
-python do_prepackaged_stage () {
+SCENEFUNCS += "packagestage_scenefunc"
+
+python packagestage_scenefunc () {
     import os
 
     if bb.data.getVar("PSTAGING_ACTIVE", d, 1) == "0":
@@ -161,12 +163,8 @@
         #    bb.build.make_stamp("do_" + task, d)
         bb.build.make_stamp("do_stage_package_populated", d)
 
-    else:
-        bb.build.make_stamp("do_prepackaged_stage", d)
 }
-do_prepackaged_stage[cleandirs] = "${PSTAGE_TMPDIR_STAGE}"
-do_prepackaged_stage[selfstamp] = "1"
-addtask prepackaged_stage before do_fetch
+packagestage_cleanfunc[cleandirs] = "${PSTAGE_TMPDIR_STAGE}"
 
 addhandler packagedstage_stampfixing_eventhandler
 python packagedstage_stampfixing_eventhandler() {
Index: base.bbclass
===================================================================
--- base.bbclass	(revision 4350)
+++ base.bbclass	(working copy)
@@ -464,6 +464,24 @@
 	bb.build.exec_func('do_clean', d)
 }
 
+SCENEFUNCS += "base_scenefunction"
+											
+python base_do_setscene () {
+        for f in (bb.data.getVar('SCENEFUNCS', d, 1) or '').split():
+                bb.build.exec_func(f, d)
+	if not os.path.exists(bb.data.getVar('STAMP', d, 1) + ".do_setscene"):
+		bb.build.make_stamp("do_setscene", d)
+}
+do_setscene[selfstamp] = "1"
+addtask setscene before do_fetch
+
+python base_scenefunction () {
+	stamp = bb.data.getVar('STAMP', d, 1) + ".needclean"
+	if os.path.exists(stamp):
+	        bb.build.exec_func("do_clean", d)
+}
+
+
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[depends] = "shasum-native:do_populate_staging"
@@ -604,7 +622,6 @@
 	return ret == 0
 
 addtask unpack after do_fetch
-do_unpack[cleandirs] = "${WORKDIR}"
 do_unpack[dirs] = "${WORKDIR}"
 python base_do_unpack() {
 	import re, os
@@ -707,6 +724,7 @@
 				dir = "%s.*" % e.stampPrefix[fn]
 				bb.note("Removing stamps: " + dir)
 				os.system('rm -f '+ dir)
+				os.system('touch ' + e.stampPrefix[fn] + '.needclean')
 
 	if not data in e.__dict__:
 		return NotHandled
@@ -972,7 +994,7 @@
 # Move to autotools.bbclass?
 inherit siteinfo
 
-EXPORT_FUNCTIONS do_clean do_mrproper do_fetch do_unpack do_configure do_compile do_install do_package do_populate_pkgs do_stage do_rebuild do_fetchall
+EXPORT_FUNCTIONS do_setscene do_clean do_mrproper do_fetch do_unpack do_configure do_compile do_install do_package do_populate_pkgs do_stage do_rebuild do_fetchall
 
 MIRRORS[func] = "0"
 MIRRORS () {

--=-kPMBZexOzucQL7RhfN+Y--
