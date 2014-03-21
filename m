Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id D02D96FA0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 14:06:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LE6wka024733
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:06:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LE6weC020370
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:06:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Mar 2014 09:06:58 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s2LE6tI1006477;	Fri, 21 Mar 2014 09:06:57 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Mar 2014 09:06:53 -0500
Message-ID: <1395410813-10461-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2] pm-qa: Add power management test utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Mar 2014 14:07:00 -0000
Content-Type: text/plain

* The power management test utilities from Linaro can be used
  to test multiple PM features such as cpufreq, cpuidle, thermal
  control and suspend operations.
* These utilities are not platform specific and can be used by
  a broader base of users.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Updated version to 0.4.8 to address feedback from Fathi Boudra
    * Removed reference to Linaro in DESCRIPTION field to address
      feedback from Fathi Boudra
    * Changed installation directory for helper scripts to
      ${libdir}/${PN} instead of ${bindir}/linaro-pm-qa-include
      as per feedback from Koen Kooi
    * Changed name of the package to pm-qa instead of pm-qa-utils
      to bring the name in line with the name at he SRC_URI, etc.
      This addresses feedback from Koen Kooi
    * Updated comments to reflect the above changes
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb |   65 +++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
new file mode 100644
index 0000000..4d33975
--- /dev/null
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "Utilities for testing Power Management"
+HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PV = "0.4.8"
+
+BRANCH ?= "master"
+
+# Corresponds to tag pm-qa-v0.4.8
+SRCREV = "6a8c2ae8a6035b15a7fbe61b6ca56841e056fa37"
+
+SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+CFLAGS += "-pthread"
+
+do_compile () {
+    # Find all the .c files in this project and build them.
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        oe_runmake ${util}
+    done
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${libdir}/${PN}
+
+    # Install the compiled binaries that were built in the previous step
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        util_basename=`basename ${util}`
+        install -m 0755 ${util} ${D}${bindir}/${util_basename}
+    done
+
+    # Install the helper scripts in a subdirectory of $libdir
+    for script in `find . -name "*.sh" | grep include`
+    do
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${libdir}/${PN}/${script_basename}
+    done
+
+    # Install the shell scripts NOT in the $libdir directory since those
+    # will be installed elsewhere
+    for script in `find . -name "*.sh" | grep -v include`
+    do
+        # if the script includes any helper scripts from the $libdir
+        # directory then change the source path to the absolute path
+        # to reflect the install location of the helper scripts.
+        sed -i -e "s#source ../include#source ${libdir}/${PN}#g" ${script}
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/${script_basename}
+    done
+}
-- 
1.7.9.5


