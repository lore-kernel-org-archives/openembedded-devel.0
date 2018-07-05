Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3944B788DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 03:29:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w653T1oV026717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 20:29:01 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 4 Jul 2018 20:29:00 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Jul 2018 11:28:58 +0800
Message-ID: <1530761338-46023-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] drbd-utils: add submodule drbd-headers into SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 03:29:01 -0000
Content-Type: text/plain

1. add submodule drbd-headers into SRC_URI

   drbd-headers is git submodule of drbd-utils, so drbd-headers's
code will not fetch during do_fetch. but it will get during
do_compile(there is a logic in drbd-utils's makefile to do this),
but if during do_compile, network is broken,  fetch drbd-headers
will fail, then do_compile will fail since missing header file.

2. add patch for fix drbd init script

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...drbd-tools-only-rmmod-if-DRBD-is-a-module.patch | 43 ++++++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_9.4.0.bb       |  7 +++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
new file mode 100644
index 0000000..c0f3adf
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
@@ -0,0 +1,43 @@
+Subject: drbd-tools: only rmmod if DRBD is a module
+
+Account for the case if the DRBD drive is built into
+the kernel. Otherwise, errors, like the following,
+will occur:
+
+root@localhost:~# /etc/init.d/drbd stop
+    Stopping all DRBD resources: ERROR: Module drbd 
+    does not exist in /proc/modules
+
+Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/2]
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+[ refresh to 8.4.4: squash Aws' and Jason's patches ]
+Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ scripts/drbd | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/drbd b/scripts/drbd
+index 20bf628..de589dc 100755
+--- a/scripts/drbd
++++ b/scripts/drbd
+@@ -241,7 +241,9 @@ case "$1" in
+ 		if [ -d /sys/module/drbd/holders ]; then
+ 			(cd /sys/module/drbd/holders; for tr in *; do [ -d ${tr} ] && ${RMMOD} ${tr}; done)
+ 		fi
+-		$RMMOD drbd && break
++		if [ ! -z "$(cat /proc/modules | grep -w drbd)" ]; then
++			$RMMOD drbd && break
++		fi
+ 	    fi
+ 	done
+ 	run_hook stop
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
index d6e913f..98d4a49 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
@@ -8,10 +8,13 @@ SECTION = "admin"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-SRC_URI = "git://github.com/LINBIT/drbd-utils \
+SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
+           git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
+           file://0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch \
           "
 # v9.4.0
-SRCREV = "eff6423ee72931aa0f8d0eb51742acee7c7cd3e1"
+SRCREV_drbd-utils = "eff6423ee72931aa0f8d0eb51742acee7c7cd3e1"
+SRCREV_drbd-headers = "d9ef0576d0f29992e0539ed7ca14d4f12658cd25"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


