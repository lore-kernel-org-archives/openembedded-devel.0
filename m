Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SBBtu-0005Cu-5n
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 22:19:58 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E179C2232639;
	Fri, 23 Mar 2012 22:11:03 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 189D0223263A;
	Fri, 23 Mar 2012 22:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g230116255.adsl.alicedsl.de
	[92.230.116.255]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Fri, 23 Mar 2012 22:11:02 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1CAC23C4BF; Fri, 23 Mar 2012 22:11:01 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 22:10:58 +0100
Message-Id: <1332537058-13783-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN paths and sanity resulting rpath
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
X-List-Received-Date: Fri, 23 Mar 2012 21:19:58 -0000

* let already exisiting ORIGIN path stay in the binary
  otherwise binaries will not find there libs in directories
  besides the standard defined directories
* remove all whitespaces from the resulting path

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/classes/relocatable.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 072f533..dff12ed 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -6,6 +6,7 @@ PREPROCESS_RELOCATE_DIRS ?= ""
 def process_dir (directory, d):
     import subprocess as sub
     import stat
+    import re
 
     cmd = d.expand('${CHRPATH_BIN}')
     tmpdir = d.getVar('TMPDIR')
@@ -52,6 +53,7 @@ def process_dir (directory, d):
             for rpath in rpaths:
                 # If rpath is already dynamic continue
                 if rpath.find("$ORIGIN") != -1:
+                    new_rpaths.append(rpath)
                     continue
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
                 # base_prefix shared root
@@ -75,6 +77,7 @@ def process_dir (directory, d):
             # if we have modified some rpaths call chrpath to update the binary
             if len(new_rpaths):
                 args = ":".join(new_rpaths)
+		args = re.sub(r'\s', '', args)
                 #bb.note("Setting rpath for %s to %s" %(fpath, args))
                 sub.call([cmd, '-r', args, fpath])
 
-- 
1.7.9.1


