Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Om9mv-0001hy-3v
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 20:24:30 +0200
Received: by pxi11 with SMTP id 11so869396pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=ivwBMFcl7UGYxmzYJupzvdTAfHEyXskle9CTq4BBiEg=;
	b=dYAQ0ez6N9vxdUcUsyTRY9G7RMb3CAu2qKFzFKFKyOCi//Zz1wfzuskVnXUFJfIjrs
	Y9re+XRhYhgW88Zd6FPqhdN2iSEHw1fHVfsOVRsGQUS7nMmylpHGCkDlWGtLRRrg4aZe
	/O3UC8Pxc0MwIEPVSsw10IEIt9rbdny5soSOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=pxULU6kDVqZV/N8vPW5aZyYnyOsLoaqluOIuUYuwr73YqgQoZ1HmE1Mo9y67zW7/fg
	xR4nPxk//j7xJkJMMSXj4TYzQqQGf6Zq+5N/fTU3/eNMwXvF5b3Q3blX4RMYs0U//O2o
	b9iXojhUBKf7VlyC8hsshqJLUtPAx9F05keHI=
Received: by 10.142.141.10 with SMTP id o10mr93122wfd.285.1282242247196;
	Thu, 19 Aug 2010 11:24:07 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id t11sm2060433wfc.16.2010.08.19.11.24.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Aug 2010 11:24:06 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 11:23:59 -0700
Message-Id: <1282242239-30776-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.2.1.66.g0d0ba
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] Fix the package_arch=machine_arch logic to use FILESPATH*
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
X-List-Received-Date: Thu, 19 Aug 2010 18:24:30 -0000

From: Chris Larson <chris_larson@mentor.com>

- Use FILESPATHPKG and FILESPATHBASE to locate the machine specific dirs
- Use the fetch urldata rather than poking at urls ourselves
- Move the logic into utils.bbclass as def'd python functions
- Simplify

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/base.bbclass  |   21 ++++-----------------
 classes/utils.bbclass |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 02c7875..89f983f 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -442,23 +442,10 @@ python () {
     # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
     #
     override = bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', d, 1)
-    if override != '0':
-        paths = []
-        for p in [ "${PF}", "${P}", "${PN}", "files", "" ]:
-            path = bb.data.expand(os.path.join("${FILE_DIRNAME}", p, "${MACHINE}"), d)
-            if os.path.isdir(path):
-                paths.append(path)
-        if len(paths) != 0:
-            for s in srcuri.split():
-                if not s.startswith("file://"):
-                    continue
-                local = bb.data.expand(bb.fetch.localpath(s, d), d)
-                for mp in paths:
-                    if local.startswith(mp):
-                        #bb.note("overriding PACKAGE_ARCH from %s to %s" % (pkg_arch, mach_arch))
-                        bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
-                        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
-                        return
+    if override != '0' and is_machine_specific(d):
+        bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
+        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
+        return
 
     multiarch = pkg_arch
 
diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 7740ea3..4840c4f 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -38,6 +38,24 @@ def oe_filter(f, str, d):
 def oe_filter_out(f, str, d):
     return oe.utils.str_filter_out(f, str, d)
 
+def machine_paths(d):
+    """List any existing machine specific filespath directories"""
+    machine = d.getVar("MACHINE", True)
+    filespathpkg = d.getVar("FILESPATHPKG", True).split(":")
+    for basepath in d.getVar("FILESPATHBASE", True).split(":"):
+        for pkgpath in filespathpkg:
+            machinepath = os.path.join(basepath, pkgpath, machine)
+            if os.path.isdir(machinepath):
+                yield machinepath
+
+def is_machine_specific(d):
+    """Determine whether the current recipe is machine specific"""
+    machinepaths = set(machine_paths(d))
+    urldatadict = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
+    for urldata in (urldata for urldata in urldatadict.itervalues()
+                    if urldata.type == "file"):
+        if any(urldata.path.startswith(mp + "/") for mp in machinepaths):
+            return True
 
 def subprocess_setup():
    import signal
-- 
1.7.2.1.66.g0d0ba



