Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1OJSl0-00023y-5a
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 16:47:55 +0200
Received: from [10.250.128.198] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 277A312EC00E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 10:11:14 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 01 Jun 2010 15:43:36 +0100
Message-ID: <1275403416.2955.87.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Maintain compatability with Python 2.4
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
X-List-Received-Date: Tue, 01 Jun 2010 14:47:55 -0000
X-Groupsio-MsgNum: 19724
Content-Type: multipart/mixed; boundary="=-T8w49zzKrgPYB6CUVOMy"

--=-T8w49zzKrgPYB6CUVOMy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I just found this patch lying around, I forgot to submit it here.

A user contacted me about requiring Python 2.5 features in
relocatable.bbclass when OE claims Python 2.4 support.

I wrote them this patch and haven't heard any complaints back so assume
it works as intended, however I haven't tested it much myself.

When I raised the Python 2.4 vs 2.5 issue a while back it seems the
consensus was to stick to 2.4 support as RHEL still uses it.

Anyone care to merge?

Thanks,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre

--=-T8w49zzKrgPYB6CUVOMy
Content-Disposition: attachment; filename="0001-relocatable.bbclass-don-t-use-Python-2.5-features.patch"
Content-Type: text/x-patch; name="0001-relocatable.bbclass-don-t-use-Python-2.5-features.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 72399a3064367c92fcb7fe832adca289de0c10b2 Mon Sep 17 00:00:00 2001
From: Joshua Lock <josh@linux.intel.com>
Date: Mon, 10 May 2010 17:01:35 +0100
Subject: [PATCH] relocatable.bbclass: don't use Python 2.5 features

str.partition() is a "new" method for Python 2.5, as we claim Pyhton 2.4 or
above is required in the wiki we shouldn't use methods which aren't available
in Python 2.4.

This patch adds a (horrible) method, string_after() to replace the use of
str.partition()

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 classes/relocatable.bbclass |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/classes/relocatable.bbclass b/classes/relocatable.bbclass
index eb5b9e6..cb82315 100644
--- a/classes/relocatable.bbclass
+++ b/classes/relocatable.bbclass
@@ -3,6 +3,11 @@ SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess"
 CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
+def string_after(target, split):
+    target = target.strip().lstrip()
+    tmp = target[target.rfind(split):len(target)]
+    return tmp[len(split):len(target)]
+
 def process_dir (directory, d):
     import subprocess as sub
     import stat
@@ -44,7 +49,7 @@ def process_dir (directory, d):
                 continue
 
             # Throw away everything other than the rpath list
-            curr_rpath = err.partition("RPATH=")[2]
+            curr_rpath = string_after(err, "RPATH=")
             #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
             rpaths = curr_rpath.split(":")
             new_rpaths = []
@@ -55,15 +60,12 @@ def process_dir (directory, d):
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
                 # base_prefix shared root
                 if rpath.find(basedir) != -1:
-                    depth = fpath.partition(basedir)[2].count('/')
-                    libpath = rpath.partition(basedir)[2].strip()
+                    depth = string_after(fpath, basedir).count('/')
+                    libpath = string_after(rpath, basedir).strip()
                 # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
-                # NOTE: This will not work reliably for cross packages, particularly in the case
-                # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
-                # rpath longer than that which is already set.
                 else:
-                    depth = fpath.rpartition(tmpdir)[2].count('/')
-                    libpath = rpath.partition(tmpdir)[2].strip()
+                    depth = string_after(rpath, tmpdir).count('/')
+                    libpath = string_after(rpath, tmpdir).strip()
 
                 base = "$ORIGIN"
                 while depth > 1:
@@ -74,7 +76,7 @@ def process_dir (directory, d):
             # if we have modified some rpaths call chrpath to update the binary
             if len(new_rpaths):
                 args = ":".join(new_rpaths)
-                #bb.note("Setting rpath for %s to %s" %(fpath,args))
+                #bb.note("Setting rpath for %s to %s" %(fpath, args))
                 sub.call([cmd, '-r', args, fpath])
 
             if perms:
-- 
1.6.6.1


--=-T8w49zzKrgPYB6CUVOMy--
