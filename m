Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 010616B5B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:47:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2KElYIi013634
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:47:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2KElYZk027991
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:47:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 20 Mar 2014 09:47:33 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s2KElVxQ026179;	Thu, 20 Mar 2014 09:47:32 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Mar 2014 09:47:28 -0500
Message-ID: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 14:47:39 -0000
Content-Type: text/plain

* The power management test utilities from Linaro can be used
  to test multiple PM features such as cpufreq, cpuidle, thermal
  control and suspend operations.
* These utilities are not platform specific and can be used by
  a broader base of users.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../pm-qa-utils/pm-qa-utils_git.bb                 |   63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb

diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
new file mode 100644
index 0000000..610f3a7
--- /dev/null
+++ b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "Utilities from Linaro for testing Power Management"
+HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PV = "0.4.4"
+
+BRANCH ?= "master"
+SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
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
+    install -d ${D}${bindir}/linaro-pm-qa-include
+
+    # Install the compiled binaries the were built in the previous step
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        util_basename=`basename ${util}`
+        install -m 0755 ${util} ${D}${bindir}/${util_basename}
+    done
+
+    # Install the helper scripts in the include directory
+    for script in `find . -name "*.sh" | grep include`
+    do
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${script_basename}
+    done
+
+    # Install the shell scripts NOT in the include directory since those
+    # will be installed elsewhere
+    for script in `find . -name "*.sh" | grep -v include`
+    do
+        # if the script includes any helper scripts from the include
+        # directory then change the include path to the absolute path
+        # to reflect the install location of the helper scripts.
+        sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-include#g" ${script}
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/${script_basename}
+    done
+}
-- 
1.7.9.5


