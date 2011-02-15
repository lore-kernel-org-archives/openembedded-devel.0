Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1PpNZp-0004Yj-S8
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 17:16:34 +0100
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1PpNGv-0002xb-NW from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 07:57:01 -0800
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 16:57:00 +0100
From: Imran Mehmood <imran_mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 21:02:09 +0500
Message-Id: <1297785729-7009-1-git-send-email-imran_mehmood@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 15 Feb 2011 15:57:00.0710 (UTC)
	FILETIME=[FB348460:01CBCD28]
Subject: [PATCH] Fixes wrong comparison
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
X-List-Received-Date: Tue, 15 Feb 2011 16:16:34 -0000

The expression ('' or 'custom') will always result in 'custom' so the expression will become False when the variable (TARGET_OS, SDK_OS) is '' while its expected to be True in this case also.

Signed-off-by: Imran Mehmood <imran_mehmood@mentor.com>
Acked-by: Christopher Larson <chris_larson@mentor.com>
---
 conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 1baecc1..de740bb 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -111,7 +111,7 @@ HOST_EXEEXT = ""
 TARGET_ARCH ?= "INVALID"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "${BUILD_VENDOR}"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) in ('', 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
@@ -119,7 +119,7 @@ TARGET_EXEEXT = ""
 SDK_ARCH ?= "${BUILD_ARCH}"
 SDK_OS ?= "${BUILD_OS}"
 SDK_VENDOR ?= "${BUILD_VENDOR}"
-SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) in ('', 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH ?= "${BUILD_CC_ARCH}"
 SDK_EXEEXT = ""
-- 
1.6.3.3



