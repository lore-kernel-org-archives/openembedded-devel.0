Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OeUVi-00050u-Do
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 16:55:20 +0200
Received: by ywe9 with SMTP id 9so137263ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=pTUm5oa8FJc/RWry6JWzrRH/39lExnJGhKNe3581sW8=;
	b=GDqqSgY2hYgK9bXIBnfYoXhN51Kp7OEPeurH3oZe02Cxc2AtcCV4oZ7uYzr0/B2fnI
	62HxDFCziTQ2di6X4PbddIdOzAZA7jxWyU7TY7NJrnFjycJi6IzzclXNbDQst3fJtlIc
	/gWZzuZxOUFZzk7H6H024EgYgDQbBZ5atkxH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ro9KkAxK/1Zj0rF3STTHrF2aZBimIVjpGYrNY5Ht3s97ULHbsB2hEAJLVxewu/XEZC
	1TfisGMrOYRLcpk5vG8qn9bqQFsyJ8LzA08BqoLjsZoBSIGc4hTWgzrX45CM8Ckee/Zm
	FbTep9teL2Kb94//3+/rr2JMRLO3K2AVPUi6U=
Received: by 10.150.163.9 with SMTP id l9mr1334469ybe.94.1280415277068;
	Thu, 29 Jul 2010 07:54:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u41sm1002256yba.10.2010.07.29.07.54.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Jul 2010 07:54:35 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jul 2010 09:51:01 -0500
Message-Id: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Thu, 29 Jul 2010 14:55:20 -0000

* This class can be used to copy license files from package
  sources into the deploy directory so they can be distributed.
* By default it searches the top-level source directory for
  files matching COPYING* or LICENSE*
* Search depth and pattern can be modified using the
  LICENSE_SEARCH_DEPTH and LICENSE_FILES variables
  respectively.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/distribute_license.bbclass |   56 ++++++++++++++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 classes/distribute_license.bbclass

diff --git a/classes/distribute_license.bbclass b/classes/distribute_license.bbclass
new file mode 100644
index 0000000..795a404
--- /dev/null
+++ b/classes/distribute_license.bbclass
@@ -0,0 +1,56 @@
+# distribute-license.bbclass will search the sources of a package to
+# a given depth looking for a match to the specified pattern and if
+# found will copy the matching file(s) to the deploy directory.
+#
+# This class is used to collect license files such as COPYING or
+# LICENSE where they are found and save them per package.
+#
+# This package uses the following variables to control its operations:
+#   - LICENSE_FILES         = Pattern of license files to be searched for.
+#                             By default this is COPYING* and LICENSE* but
+#                             this can be changed per package.
+#   - LICENSE_SEARCH_DEPTH  = The maximum depth to search in the package
+#                             sources for files matching the LICENSE_FILES
+#                             pattern.
+
+
+# Files to copy for the licensing.  By default this is looking for
+# files following the patters COPYING* or LICENSING* in the top
+# level sources directory.
+LICENSE_FILES ?= "COPYING* LICENSE*"
+
+# Maximum depth to look for license files
+LICENSE_SEARCH_DEPTH ?= "1"
+
+distribute_license_do_copy_license() {
+    # Change directory to source directory
+    cd ${S}
+
+    # Turn of globbing so that wildcards are not expanded in for loop
+    set -f
+
+    # Check if LICENSE_FILES exist.  If so copy them to DEPLOY_DIR
+    for lic in ${LICENSE_FILES}
+    do
+        res=""
+        res=`find . -maxdepth ${LICENSE_SEARCH_DEPTH} -name "$lic"`
+        if [ "$res" != "" ]
+        then
+            mkdir -p ${DEPLOY_DIR}/licenses/${PN}
+            cp $res ${DEPLOY_DIR}/licenses/${PN}
+        fi
+    done
+
+    # Turn globbing back on
+    set +f
+
+    # Just to be clean change directory back to where we started from.
+    cd -
+}
+
+EXPORT_FUNCTIONS do_copy_license
+
+# Put after do_patch in case a patch adds the license files
+do_copy_license[deptask] = "do_patch"
+
+addtask copy_license after do_patch before do_configure
-- 
1.7.0.4



