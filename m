Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1PqVzU-0000N5-Ae
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 20:27:45 +0100
Received: from sb-ubuntu-1004.alm.mentorg.com ([134.86.97.236])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p1IJQT1l032238
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 13:26:29 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 12:26:27 -0700
Message-Id: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.3.5
Subject: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Fri, 18 Feb 2011 19:27:46 -0000

In order to make the user experience better we now use bb.warn
on non-fatal QA errors and bb.error on fatal errors.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/insane.bbclass |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index a846832..3b042c9 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -116,7 +116,7 @@ def package_qa_make_fatal_error(error_class, name, path,d):
 
     TODO: Load a whitelist of known errors
     """
-    return not error_class in [0, 5, 7]
+    return not error_class in [0, 1, 5, 7]
 
 def package_qa_write_error(error_class, name, path, d):
     """
@@ -145,10 +145,16 @@ def package_qa_write_error(error_class, name, path, d):
              (ERROR_NAMES[error_class], name, package_qa_clean_path(path,d))
     f.close()
 
+# Returns False is there was a fatal problem and True if we did not hit a fatal
+# error
 def package_qa_handle_error(error_class, error_msg, name, path, d):
-    bb.error("QA Issue with %s: %s" % (name, error_msg))
+    fatal = package_qa_make_fatal_error(error_class, name, path, d)
     package_qa_write_error(error_class, name, path, d)
-    return not package_qa_make_fatal_error(error_class, name, path, d)
+    if fatal:
+        bb.error("QA Issue with %s: %s" % (name, error_msg))
+    else:
+        bb.warn("QA Issue with %s: %s" % (name, error_msg))
+    return not fatal
 
 def package_qa_check_rpath(file,name,d, elf):
     """
-- 
1.7.3.5



