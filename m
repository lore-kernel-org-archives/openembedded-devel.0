Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pfdd8-0004Aw-Iv
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 20:23:42 +0100
Received: by eya28 with SMTP id 28so691462eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 11:23:02 -0800 (PST)
Received: by 10.213.35.209 with SMTP id q17mr1556322ebd.97.1295464982541;
	Wed, 19 Jan 2011 11:23:02 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x54sm5786377eeh.5.2011.01.19.11.23.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 19 Jan 2011 11:23:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jan 2011 20:21:53 +0100
Message-Id: <1295464913-2642-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Wed, 19 Jan 2011 19:23:42 -0000

* Having rpath to sysroot is just as bad as one to workdir

Based on insane.bbclass from yocto

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/insane.bbclass |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 677db27..50752b5 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -160,20 +160,21 @@ def package_qa_check_rpath(file,name,d, elf):
     import bb, os
     sane = True
     scanelf = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
-    bad_dir = bb.data.getVar('TMPDIR', d, True) + "/work"
+    bad_dirs = [bb.data.getVar('TMPDIR', d, True) + "/work", bb.data.getVar('STAGING_DIR_TARGET', d, True)]
     bad_dir_test = bb.data.getVar('TMPDIR', d, True)
     if not os.path.exists(scanelf):
         bb.fatal("Can not check RPATH, scanelf (part of pax-utils-native) not found")
 
-    if not bad_dir in bb.data.getVar('WORKDIR', d, True):
+    if not bad_dirs[0] in bb.data.getVar('WORKDIR', d, True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
 
     output = os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
     txt    = output.readline().split()
     for line in txt:
-        if bad_dir in line:
-            error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
-            sane = package_qa_handle_error(1, error_msg, name, file, d)
+        for dir in bad_dirs:
+            if dir in line:
+                error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
+                sane = sane + package_qa_handle_error(1, error_msg, name, file, d)
 
     return sane
 
-- 
1.6.6.1



