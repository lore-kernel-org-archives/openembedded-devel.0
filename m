Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MgmZT-0006py-7S
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 23:31:51 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 4DBE21B24F; Thu, 27 Aug 2009 14:13:42 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2009 14:11:13 -0700
Message-Id: <1251407473-1847-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.1.rc3.354.g332d31
Subject: [PATCH] insane.bbclass: catch a specific gettext failure
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
X-List-Received-Date: Thu, 27 Aug 2009 21:31:51 -0000

You can run into issues with old po/* with our more recent build tools.  For
the recipes that hit this, you likely need to stop doing the autoreconf, or
run a gettextize on the tree with our more recent gettext.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/insane.bbclass |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 606270d..b811ad0 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -546,10 +546,17 @@ python do_qa_configure() {
     bb.debug(1, "Checking sanity of the config.log file")
     import os
     for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True)):
-        statement = "grep 'CROSS COMPILE Badness:' %s > /dev/null" % \
-                    os.path.join(root,"config.log")
+        logfile = os.path.join(root, "config.log")
+        crosscheck = "grep 'CROSS COMPILE Badness:' %s > /dev/null" % logfile
+        gettextcheck = "grep -E 'WARNING:  (po|intl)/Makefile.*\.in seems to ignore the .*dir setting$' %s > /dev/null" % logfile
         if "config.log" in files:
-            if os.system(statement) == 0:
+            if os.system(crosscheck) == 0:
                 bb.fatal("""This autoconf log indicates errors, it looked at host includes.
 Rerun configure task after fixing this. The path was '%s'""" % root)
+            if os.system(gettextcheck) == 0:
+                bb.fatal("""The configure script reports that the gettext Makefiles aren't obeying
+all of its variables.  This can indicate the use of old gettext files that may not work with the
+current build tools used by OpenEmbedded.  We advise either avoiding autoreconf execution, or, the
+preferred method, patching the source tree with the results of a gettextize run from current gettext.
+The path is %s.""" % root)
 }
-- 
1.6.0



