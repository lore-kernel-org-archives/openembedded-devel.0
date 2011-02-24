Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Psko3-00025N-59
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 00:41:11 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH500KP2B1V8M31@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	24 Feb 2011 17:39:37 -0600 (CST)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 55BE514AF6D; Thu,
	24 Feb 2011 18:39:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Feb 2011 18:39:18 -0500
Message-id: <1298590758-8843-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4
In-reply-to: <1298590758-8843-1-git-send-email-denis@denix.org>
References: <4D668BB8.1090707@mentor.com>
	<1298590758-8843-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/3] gst-ffmpeg: remove 4-year old hack that sets CC directly
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
X-List-Received-Date: Thu, 24 Feb 2011 23:41:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

The hack that sets CC variable directly is 4 year old and no longer required.
On the other hand, it now breaks setups when --sysroot needs to be passed to
the toolchain. Hence, remove the hack.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes/gstreamer/gst-ffmpeg_0.10.11.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
index 3a6533a..563521e 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
@@ -5,6 +5,8 @@ LICENSE = "LGPL"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
 
+PR = "r1"
+
 inherit autotools pkgconfig
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
@@ -23,7 +25,3 @@ EXTRA_OECONF = " --with-system-ffmpeg "
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
 PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
-
-- 
1.7.0.4



