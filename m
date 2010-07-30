Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oepno-00087a-2s
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 15:39:09 +0200
Received: by yxi11 with SMTP id 11so663987yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=7ARqWjTnNgeK830usDeptjWJvkdNtEmbIjcIvm5DR6w=;
	b=jSMrkMSJ6HgpyIkU3u5iEp077oVNOoKRxcpvBQjaXrHpa4i2nlzibM9OxF0ouIVV/a
	8/wo+eutojwYFWN5hPPvCL/hUX6IqamcV3TjuTxt8GjhvsoAx0mZaahoWiDl2UZezHKu
	WzMS+eF8aVl6HFdnjQgkm6GQ7CMA94lc8+3Kk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=q/GPMNVgTkHD5HsnE3R4vGJkfO1bp17k8isTO3n2PJY58jcCaX9PjsAuOFEOBw/5se
	8JLq1gWXyWisq6ns9cxGg6iLK0NhRgVDbofOrOyVCM2+4mkZVSV6U6QI1wxrx0yh51Uv
	8N9TOtYsHNgqNwFZw7kU5ag2PqlXuOUN8TEJ4=
Received: by 10.150.1.9 with SMTP id 9mr3397817yba.5.1280497123877;
	Fri, 30 Jul 2010 06:38:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q1sm2170377ybk.8.2010.07.30.06.38.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 06:38:42 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 08:34:59 -0500
Message-Id: <1280496899-382-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Fri, 30 Jul 2010 13:39:09 -0000

* This class can be used to copy license files from package
  sources into the deploy directory so they can be distributed.
* By default it searches the top-level source directory for
  files matching COPYING* or LICENSE*
* Search depth and pattern can be modified using the
  LICENSE_SEARCH_DEPTH and LICENSE_FILES variables
  respectively.
* Thanks to Koen Kooi and Bernhard Reutner-Fischer for their
  inputs and suggestions.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/distribute_license.bbclass |   51 ++++++++++++++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 classes/distribute_license.bbclass

diff --git a/classes/distribute_license.bbclass b/classes/distribute_license.bbclass
new file mode 100644
index 0000000..b9bde77
--- /dev/null
+++ b/classes/distribute_license.bbclass
@@ -0,0 +1,51 @@
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
+    # Turn off globbing so that wildcards are not expanded in for loop
+    set -f
+
+    # Check if LICENSE_FILES exist.  If so copy them to DEPLOY_DIR
+    # Keep the relative path of licenses the same in the DEPLOY_DIR
+    for lic in ${LICENSE_FILES}
+    do
+        find ${S} -maxdepth ${LICENSE_SEARCH_DEPTH} -name "$lic" | \
+            while read f
+            do
+                bn=$(basename $f)
+                bd=$(dirname $f | sed -e "s|${S}||")
+                install -D $f ${DEPLOY_DIR}/licenses/${PN}/$bd/$bn
+            done
+    done
+
+    # Turn globbing back on
+    set +f
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



