Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SswUs-0003H6-7h
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 15:46:58 +0200
Received: by pbbrq2 with SMTP id rq2so8196083pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HHEwleNezwtk0xCaZpVD/MecX2ZtU3T2eHg19hgDHcs=;
	b=s0vcKqgeygImIf2El3V98DkhPEUbjm+WQMXK/DPVacxR22wDGcOxfg7c1BwNs6nGVH
	IasZhcB0uFljUsGhaCZ1LYvOScZtjZE+uEIC+k5tejFCMHTCXp8+VlTYBUl1iTXIoPGJ
	f8CuxI+839kAifZtTSisNqxFzElLB6AhbpCaAwps7LMXUsN07vZ0zp9U3Ay4uQoMGr3x
	o+0JOJI7kUkHNDf0ZVEORkQhaY0RivgAIxChh//2qpENkB/ANLE+hbXGPx7upcSXLlm/
	vuD61tB4HJIutz+L9dgvDs+0KE8FWXQ0DtVjwnuqTS+i1XyhqemvtYkMOwL9UjmiLWRF
	lGhQ==
Received: by 10.66.89.40 with SMTP id bl8mr8666908pab.18.1342964131551;
	Sun, 22 Jul 2012 06:35:31 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id mr1sm7932236pbb.62.2012.07.22.06.35.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jul 2012 06:35:30 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Jul 2012 17:35:15 +0400
Message-Id: <1342964116-41035-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [poky 1/2] cmake-native: Update to v2.8.8.
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
X-List-Received-Date: Sun, 22 Jul 2012 13:46:58 -0000

This commit updates the cmake-native recipe to v2.8.8.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |    7 -------
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb |    7 +++++++
 meta/recipes-devtools/cmake/cmake.inc             |    2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
deleted file mode 100644
index 3fe0c2e..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require cmake.inc
-inherit native
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
-SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
new file mode 100644
index 0000000..3c0e524
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
@@ -0,0 +1,7 @@
+require cmake.inc
+inherit native
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
+SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d080e50..c73fc7c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f372516292ff7c33337bf16a74a5f9a8 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=bb2fa3a08736b842556f6171bb9e8ae1 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
 INC_PR = "r2"
-- 
1.7.9.5



