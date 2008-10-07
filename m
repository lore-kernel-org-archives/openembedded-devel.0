Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC76-0007Gj-VD
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:33 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkWn021255;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00014v-9X; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:34 +0200
Message-Id: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
References: <>
 <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 01/13] Add BUILD/HOST/TARGET _EXEEXT variables for (ab)use by canadian sdk
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:33 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 classes/cross.bbclass  |    1 +
 classes/native.bbclass |    2 ++
 classes/sdk.bbclass    |    1 +
 conf/bitbake.conf      |    3 +++
 4 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index a35f4df..5136236 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -13,6 +13,7 @@ HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_EXEEXT = "${BUILD_EXEEXT}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 4022cb0..0f3ada2 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -14,12 +14,14 @@ TARGET_OS = "${BUILD_OS}"
 TARGET_VENDOR = "${BUILD_VENDOR}"
 TARGET_PREFIX = "${BUILD_PREFIX}"
 TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
+TARGET_EXEEXT = "${BUILD_EXEEXT}"
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_OS = "${BUILD_OS}"
 HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_EXEEXT = "${BUILD_EXEEXT}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index a94332b..b746426 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -11,6 +11,7 @@ HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_EXEEXT = "${BUILD_EXEEXT}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 75eab15..51a18fd 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -71,6 +71,7 @@ BUILD_VENDOR = ""
 BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 BUILD_PREFIX = ""
 BUILD_CC_ARCH = ""
+BUILD_EXEEXT = ""
 
 HOST_ARCH = "${TARGET_ARCH}"
 HOST_OS = "${TARGET_OS}"
@@ -78,6 +79,7 @@ HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
+HOST_EXEEXT = ""
 
 TARGET_ARCH ?= "INVALID"
 TARGET_OS = "INVALID"
@@ -85,6 +87,7 @@ TARGET_VENDOR = "${BUILD_VENDOR}"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
+TARGET_EXEEXT = ""
 
 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
-- 
1.5.4.3



