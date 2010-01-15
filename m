Received: from gateway-2929.mvista.com ([206.112.117.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1NVr6g-0001aY-AS
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 19:41:18 +0100
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 1E3591DBA5; Fri, 15 Jan 2010 10:38:59 -0800 (PST)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 11:30:33 -0700
Message-Id: <1263580233-3494-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.4.339.g527d
X-SA-Exim-Connect-IP: 206.112.117.47
X-SA-Exim-Mail-From: clarson@mvista.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] base.bbclass: use bb.utils.*_sum instead of calling md5/sha sum commands
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
X-List-Received-Date: Fri, 15 Jan 2010 18:41:18 -0000

From: Ross Burton <ross@openedhand.com>

Patch courtesy the Poky project.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass |   27 +++++++++++++++------------
 1 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 96164d4..dc56282 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -122,23 +122,26 @@ def base_chk_file_vars(parser, localpath, params, data):
         raise Exception("The path does not exist '%s'" % localpath)
 
     if want_md5sum:
-        try:
-	    md5pipe = os.popen('PATH=%s md5sum %s' % (bb.data.getVar('PATH', data, True), localpath))
-            md5data = (md5pipe.readline().split() or [ "" ])[0]
-            md5pipe.close()
-        except OSError, e:
-            raise Exception("Executing md5sum failed")
+        md5data = bb.utils.md5_file(localpath)
+
         if want_md5sum != md5data:
             bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%s'" % (want_md5sum, md5data))
             raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" % (want_md5sum, md5data))
 
     if want_sha256sum:
-        try:
-            shapipe = os.popen('PATH=%s oe_sha256sum %s' % (bb.data.getVar('PATH', data, True), localpath))
-            sha256data = (shapipe.readline().split() or [ "" ])[0]
-            shapipe.close()
-        except OSError, e:
-            raise Exception("Executing shasum failed")
+        shadata = bb.utils.sha256_file(localpath)
+
+        # sha256_file() can return None if we are running on Python 2.4 (hashlib is
+        # 2.5 onwards, sha in 2.4 is 160-bit only), so check for this and call the
+        # standalone shasum binary if required.
+        if shadata is None:
+            try:
+                shapipe = os.popen('PATH=%s oe_sha256sum %s' % (bb.data.getVar('PATH', data, True), localpath))
+                shadata = (shapipe.readline().split() or [ "" ])[0]
+                shapipe.close()
+            except OSError:
+                raise Exception("Executing shasum failed, please build shasum-native")
+
         if want_sha256sum != sha256data:
             bb.note("The SHA256Sums did not match. Wanted: '%s' and Got: '%s'" % (want_sha256sum, sha256data))
             raise Exception("SHA256 Sums do not match. Wanted: '%s' Got: '%s'" % (want_sha256sum, sha256data))
-- 
1.6.4.339.g527d



