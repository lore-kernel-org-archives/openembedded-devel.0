Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PskoD-00025u-NE
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 00:41:21 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH5009KJB1U3Q23@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	24 Feb 2011 17:39:36 -0600 (CST)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 96DAE14AF6A; Thu,
	24 Feb 2011 18:39:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Feb 2011 18:39:17 -0500
Message-id: <1298590758-8843-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4
In-reply-to: <1298590758-8843-1-git-send-email-denis@denix.org>
References: <4D668BB8.1090707@mentor.com>
	<1298590758-8843-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/3] ffmpeg: pass --sysroot to configure script directly
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
X-List-Received-Date: Thu, 24 Feb 2011 23:41:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

ffmpeg's custom configure script fails some checks for specific headers, even
though we pass --sysroot through CFLAGS. Use configure's specific --sysroot
option to fix that.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes/ffmpeg/ffmpeg_0.5.bb   |    3 ++-
 recipes/ffmpeg/ffmpeg_0.6.1.bb |    3 ++-
 recipes/ffmpeg/ffmpeg_git.bb   |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg_0.5.bb b/recipes/ffmpeg/ffmpeg_0.5.bb
index f3a6d21..623c369 100644
--- a/recipes/ffmpeg/ffmpeg_0.5.bb
+++ b/recipes/ffmpeg/ffmpeg_0.5.bb
@@ -2,7 +2,7 @@ require ffmpeg.inc
 
 DEPENDS += "schroedinger libgsm"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEFAULT_PREFERENCE = "1"
 
@@ -47,6 +47,7 @@ EXTRA_OECONF = " \
         --enable-cross-compile \
         --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
         --extra-ldflags="${TARGET_LDFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+        --sysroot="${STAGING_DIR_TARGET}" \
         --enable-hardcoded-tables \
         ${EXTRA_FFCONF} \
 "
diff --git a/recipes/ffmpeg/ffmpeg_0.6.1.bb b/recipes/ffmpeg/ffmpeg_0.6.1.bb
index fb941a5..74a1161 100644
--- a/recipes/ffmpeg/ffmpeg_0.6.1.bb
+++ b/recipes/ffmpeg/ffmpeg_0.6.1.bb
@@ -2,7 +2,7 @@ require ffmpeg.inc
 
 LICENSE = "LGPLv2.1+"
 DEPENDS += "schroedinger libgsm"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://ffmpeg.org/releases/ffmpeg-${PV}.tar.bz2"
 SRC_URI[md5sum] = "4f5d732d25eedfb072251b5314ba2093"
@@ -26,6 +26,7 @@ EXTRA_OECONF = " \
         --enable-swscale \
         --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
         --extra-ldflags="${TARGET_LDFLAGS}" \
+        --sysroot="${STAGING_DIR_TARGET}" \
         --prefix=${prefix}/ \
         --target-os=linux \
         ${EXTRA_FFCONF} \
diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
index 27e88ea..24c81ea 100644
--- a/recipes/ffmpeg/ffmpeg_git.bb
+++ b/recipes/ffmpeg/ffmpeg_git.bb
@@ -6,7 +6,7 @@ DEPENDS += "virtual/libsdl schroedinger libgsm libvpx"
 SRCREV = "a4f5af13fb00d7f55946470bb0f52e1dbf5f3c6a"
 
 PV = "0.6.1+${PR}+gitr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
@@ -47,6 +47,7 @@ EXTRA_OECONF = " \
         --enable-cross-compile \
         --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
         --extra-ldflags="${TARGET_LDFLAGS}" \
+        --sysroot="${STAGING_DIR_TARGET}" \
         --enable-hardcoded-tables \
         ${EXTRA_FFCONF} \
 "
-- 
1.7.0.4



