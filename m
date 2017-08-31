Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF971783A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 08:57:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7V8vYni014480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 01:57:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 Aug 2017 01:57:34 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Thu, 31 Aug 2017 04:57:32 -0400
Message-ID: <20170831085732.183199-1-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd-utils: only rmmod if DRBD is a module
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
X-List-Received-Date: Thu, 31 Aug 2017 08:57:33 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Account for the case if the DRBD drive is built into
the kernel. Otherwise, errors, like the following,
will occur:

root@localhost:~# /etc/init.d/drbd stop
    Stopping all DRBD resources: ERROR: Module drbd does not exist in
    /proc/modules

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...drbd-tools-only-rmmod-if-DRBD-is-a-module.patch | 39 ++++++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_8.9.6.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
new file mode 100644
index 000000000..add0b030c
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
@@ -0,0 +1,39 @@
+Subject: drbd-tools: only rmmod if DRBD is a module
+
+Account for the case if the DRBD drive is built into
+the kernel. Otherwise, errors, like the following,
+will occur:
+
+root@localhost:~# /etc/init.d/drbd stop
+    Stopping all DRBD resources: ERROR: Module drbd does not exist in
+    /proc/modules
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+[ refresh to 8.4.4: squash Aws' and Jason's patches ]
+Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
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
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
index 5f6c43f7e..5979fbb58 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "http://oss.linbit.com/drbd/${BP}.tar.gz \
            file://0001-Makefile.in-fix-permission-bits-for-drbd.service.patch \
+           file://0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch \
           "
 SRC_URI[md5sum] = "76ed6d3190cd77b00890f3365353124b"
 SRC_URI[sha256sum] = "297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913"
-- 
2.11.0


