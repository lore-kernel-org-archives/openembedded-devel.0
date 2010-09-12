Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OujFP-0008UY-0P
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 11:53:20 +0200
Received: from [192.168.42.31] (unknown [92.116.249.73])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0D9271B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 09:54:23 +0000 (UTC)
Message-ID: <4C8CA2DC.40707@freyther.de>
Date: Sun, 12 Sep 2010 17:52:28 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] insane.bbclass: Enable the insane.bbclass for everyone in a warning mode
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
X-List-Received-Date: Sun, 12 Sep 2010 09:53:20 -0000
X-Groupsio-MsgNum: 23470
Content-Type: multipart/mixed; boundary="------------010502090000090302090307"

--------------010502090000090302090307
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Make conf/bitbake.conf load conf/insane.conf that will INHERIT the
insane.bbclass. Remove the INHERIT from the distros currently using
insane.bbclass. Change insane.bbclass to check QA_FATAL to see if errors
are allowed to be fatal, make SHR/Kaelios and Angstrom use that new
flag to continue having fatal QA Errors.

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
---
 classes/insane.bbclass               |    5 ++++-
 conf/bitbake.conf                    |    1 +
 conf/distro/include/angstrom.inc     |    4 ++--
 conf/distro/include/kaeilos-2010.inc |    4 ++--
 conf/distro/include/kaeilos.inc      |    4 ++--
 conf/distro/shr.conf                 |    3 +--
 conf/insane.conf                     |    2 ++
 7 files changed, 14 insertions(+), 9 deletions(-)
 create mode 100644 conf/insane.conf



--------------010502090000090302090307
Content-Type: text/x-patch;
 name="0001-insane.bbclass-Enable-the-insane.bbclass-for-everyon.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-insane.bbclass-Enable-the-insane.bbclass-for-everyon.pa";
 filename*1="tch"

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 4696c25..d137dfc 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -106,12 +106,15 @@ def package_qa_clean_path(path,d):
     """ Remove the common prefix from the path. In this case it is the TMPDIR"""
     return path.replace(bb.data.getVar('TMPDIR',d,True),"")
 
-def package_qa_make_fatal_error(error_class, name, path,d):
+def package_qa_make_fatal_error(error_class, name, path, d):
     """
     decide if an error is fatal
 
     TODO: Load a whitelist of known errors
     """
+
+    if not bb.data.getVar("QA_FATAL", d):
+        return False
     return not error_class in [0, 5, 7]
 
 def package_qa_write_error(error_class, name, path, d):
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index b099499..bc8eea0 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -701,6 +701,7 @@ require conf/sanity.conf
 require conf/abi_version.conf
 require conf/enterprise.conf
 require conf/compatibility-providers.conf
+require conf/insane.conf
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 8983c86..030ef3b 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -85,10 +85,10 @@ INHERIT += "devshell"
 #use angstrom source mirrors to combat 404s
 INHERIT += "angstrom-mirrors" 
 
-#run QA tests on builds and packages and log them  
-INHERIT += "insane"
 # INHERIT += "packagehistory"
+#log QA errors
 QA_LOG = "1"
+QA_FATAL = "1"
 
 #run QA tests on recipes
 INHERIT += "recipe_sanity"
diff --git a/conf/distro/include/kaeilos-2010.inc b/conf/distro/include/kaeilos-2010.inc
index 2fb30ce..7061aee 100644
--- a/conf/distro/include/kaeilos-2010.inc
+++ b/conf/distro/include/kaeilos-2010.inc
@@ -53,9 +53,9 @@ INHERIT += "sanity"
 #make devshell available as task
 INHERIT += "devshell" 
 
-#run QA tests on builds and packages and log them  
-INHERIT += "insane"
+#log QA errors
 QA_LOG = "1"
+QA_FATAL = "1"
 
 #run QA tests on recipes
 INHERIT += "recipe_sanity"
diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index edbad69..af8eca3 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -84,10 +84,10 @@ INHERIT += "devshell"
 #use angstrom source mirrors to combat 404s
 INHERIT += "angstrom-mirrors" 
 
-#run QA tests on builds and packages and log them  
-INHERIT += "insane"
 # INHERIT += "packagehistory"
+#log QA errors
 QA_LOG = "1"
+QA_FATAL = "1"
 
 #run QA tests on recipes
 INHERIT += "recipe_sanity"
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 9dd1c3e..aa94f95 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -40,10 +40,9 @@ INHERIT += "testlab"
 #activate the angstrom blacklister
 INHERIT += "angstrom"
 
-#run QA tests on builds and packages and log them
-INHERIT += "insane"
 # INHERIT += "packagehistory"
 QA_LOG = "1"
+QA_FATAL = "1"
 
 #make devshell available as task
 INHERIT += "devshell"
diff --git a/conf/insane.conf b/conf/insane.conf
new file mode 100644
index 0000000..5324529
--- /dev/null
+++ b/conf/insane.conf
@@ -0,0 +1,2 @@
+# Run insane for everyone
+INHERIT += "insane"


--------------010502090000090302090307--
