Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7214878589
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:10:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8E8AAqS022669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 01:10:10 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 01:10:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 01:10:09 -0700
Message-ID: <20170914081009.24809-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd-utils: remove 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
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
X-List-Received-Date: Thu, 14 Sep 2017 08:10:09 -0000
Content-Type: text/plain

It is already in the source, fixed do_patch failure:
Patch 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch is already applied; check your series file
ERROR: drbd-utils-8.9.6-r0 do_patch: Function failed: patch_do_patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...drbd-tools-only-rmmod-if-DRBD-is-a-module.patch | 39 ----------------------
 .../recipes-support/drbd/drbd-utils_8.9.6.bb       |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
deleted file mode 100644
index add0b030c..000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Subject: drbd-tools: only rmmod if DRBD is a module
-
-Account for the case if the DRBD drive is built into
-the kernel. Otherwise, errors, like the following,
-will occur:
-
-root@localhost:~# /etc/init.d/drbd stop
-    Stopping all DRBD resources: ERROR: Module drbd does not exist in
-    /proc/modules
-
-Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-[ refresh to 8.4.4: squash Aws' and Jason's patches ]
-Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- scripts/drbd | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/drbd b/scripts/drbd
-index 20bf628..de589dc 100755
---- a/scripts/drbd
-+++ b/scripts/drbd
-@@ -241,7 +241,9 @@ case "$1" in
- 		if [ -d /sys/module/drbd/holders ]; then
- 			(cd /sys/module/drbd/holders; for tr in *; do [ -d ${tr} ] && ${RMMOD} ${tr}; done)
- 		fi
--		$RMMOD drbd && break
-+		if [ ! -z "$(cat /proc/modules | grep -w drbd)" ]; then
-+			$RMMOD drbd && break
-+		fi
- 	    fi
- 	done
- 	run_hook stop
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
index 5979fbb58..5f6c43f7e 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "http://oss.linbit.com/drbd/${BP}.tar.gz \
            file://0001-Makefile.in-fix-permission-bits-for-drbd.service.patch \
-           file://0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch \
           "
 SRC_URI[md5sum] = "76ed6d3190cd77b00890f3365353124b"
 SRC_URI[sha256sum] = "297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913"
-- 
2.11.0


