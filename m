Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V3-0001kL-LG
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 452753148E20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id d+vt7pvY299w; Wed, 29 Sep 2010 22:36:57 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 463A83148E14;
	Wed, 29 Sep 2010 22:36:56 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:36:56 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:17 +0000
Message-Id: <1285792594-10032-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/18] utils.bbclass: add name to SRC_URI[{md5, sha256}sum]
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:51 -0000

* When a checksum is missing or invalid, print strings which can be
  copied into a recipe without modification.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/utils.bbclass |   37 ++++++++++++++++++++++---------------
 1 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 1c636be..c9c8e02 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -126,7 +126,21 @@ def setup_checksum_deps(d):
             d.setVarFlag("do_fetch", "depends", "%s %s" %
                          (depends, "shasum-native:do_populate_sysroot"))
 
-def base_chk_file_checksum(localpath, src_uri, expected_md5sum, expected_sha256sum, data):
+def base_get_hash_flags(params):
+    try:
+        name = params["name"]
+    except KeyError:
+        name = ""
+    if name:
+        md5flag = "%s.md5sum" % name
+        sha256flag = "%s.sha256sum" % name
+    else:
+        md5flag = "md5sum"
+        sha256flag = "sha256sum"
+
+    return (md5flag, sha256flag)
+
+def base_chk_file_checksum(localpath, src_uri, expected_md5sum, expected_sha256sum, params, data):
     strict_checking = True
     if bb.data.getVar("OE_STRICT_CHECKSUMS", data, True) != "1":
         strict_checking = False
@@ -161,17 +175,19 @@ def base_chk_file_checksum(localpath, src_uri, expected_md5sum, expected_sha256s
         if not ufile:
             raise Exception("Creating %s.sum failed" % uname)
 
-        ufile.write("SRC_URI[md5sum] = \"%s\"\nSRC_URI[sha256sum] = \"%s\"\n" % (md5data, sha256data))
+        (md5flag, sha256flag) = base_get_hash_flags(params)
+        ufile.write("SRC_URI[%s] = \"%s\"\nSRC_URI[%s] = \"%s\"\n" % (md5flag, md5data, sha256flag, sha256data))
         ufile.close()
         bb.note("This package has no checksums, please add to recipe")
-        bb.note("\nSRC_URI[md5sum] = \"%s\"\nSRC_URI[sha256sum] = \"%s\"\n" % (md5data, sha256data))
+        bb.note("\nSRC_URI[%s] = \"%s\"\nSRC_URI[%s] = \"%s\"\n" % (md5flag, md5data, sha256flag, sha256data))
 
         # fail for strict, continue for disabled strict checksums
         return not strict_checking
 
     if (expected_md5sum and expected_md5sum != md5data) or (expected_sha256sum and expected_sha256sum != sha256data):
+        (md5flag, sha256flag) = base_get_hash_flags(params)
         bb.note("The checksums for '%s' did not match.\nExpected MD5: '%s' and Got: '%s'\nExpected SHA256: '%s' and Got: '%s'" % (localpath, expected_md5sum, md5data, expected_sha256sum, sha256data))
-        bb.note("Your checksums:\nSRC_URI[md5sum] = \"%s\"\nSRC_URI[sha256sum] = \"%s\"\n" % (md5data, sha256data))
+        bb.note("Your checksums:\nSRC_URI[%s] = \"%s\"\nSRC_URI[%s] = \"%s\"\n" % (md5flag, md5data, sha256flag, sha256data))
         return False
 
     return True
@@ -180,16 +196,7 @@ def base_get_checksums(pn, pv, src_uri, localpath, params, data):
     # Try checksum from recipe and then parse checksums.ini 
     # and try PN-PV-SRC_URI first and then try PN-SRC_URI
     # we rely on the get method to create errors
-    try:
-        name = params["name"]
-    except KeyError:
-        name = ""
-    if name:
-        md5flag = "%s.md5sum" % name
-        sha256flag = "%s.sha256sum" % name
-    else:
-        md5flag = "md5sum"
-        sha256flag = "sha256sum"
+    (md5flag, sha256flag) = base_get_hash_flags(params)
     expected_md5sum = bb.data.getVarFlag("SRC_URI", md5flag, data)
     expected_sha256sum = bb.data.getVarFlag("SRC_URI", sha256flag, data)
 
@@ -240,7 +247,7 @@ def base_get_checksums(pn, pv, src_uri, localpath, params, data):
 
 def base_chk_file(pn, pv, src_uri, localpath, params, data):
     (expected_md5sum, expected_sha256sum) = base_get_checksums(pn, pv, src_uri, localpath, params, data)
-    return base_chk_file_checksum(localpath, src_uri, expected_md5sum, expected_sha256sum, data)
+    return base_chk_file_checksum(localpath, src_uri, expected_md5sum, expected_sha256sum, params, data)
 
 oedebug() {
 	test $# -ge 2 || {
-- 
1.7.1



