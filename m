Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TjaJP-000067-Jw
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 19:48:43 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6224589ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=G35UPxgbvh0H4Ao0bDz1fgCDZrS4odPpl5SybzQn+ds=;
	b=AFc80UkPBYnXS2B182jvmlhwZoKp/GQrNATZ2sFmK/fnMcXpe8kAMT+4f9/JQHbeN7
	QUoHEcfnYO1ss0GCV5wz0qX7hhIwHKZLICkVDRdS4hxe1+Itn4cAJq7TZqZKIk3pKnP/
	6foLWD83lXb8mt1dPOrBg7SaClqrVYgLWQyFm9XuwRg6PqI3LXvPVpIuMScp2gZ+o8vv
	n8bcIWJ0Oa/1BkxIynNdVNIv0mJfYbelg/PCdK1vXzDnjTz1FMPBWJsoWIlzyh+AeWgm
	uQi+tmg0Rjo3UKi+9uCW8GymzhEYH/37UvVgKjDBNT1kuzJ1sdcbQxz/ZtVZ3xYqqdqW
	oBNg==
Received: by 10.42.249.80 with SMTP id mj16mr5340311icb.53.1355510046693;
	Fri, 14 Dec 2012 10:34:06 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id s3sm4536424igb.14.2012.12.14.10.34.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 10:34:06 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:33:42 -0500
Message-Id: <1355510023-17096-3-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
References: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH 2/3] libdc1394: add recipe
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
X-List-Received-Date: Fri, 14 Dec 2012 18:48:44 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 .../libdc1394/files/install_examples.patch             | 14 ++++++++++++++
 .../recipes-multimedia/libdc1394/files/libdc1394.png   |  0
 meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb  | 18 ++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
 create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png
 create mode 100755 meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb

diff --git a/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
new file mode 100755
index 0000000..89133ad
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
@@ -0,0 +1,14 @@
+Index: libdc1394/examples/Makefile.am
+===================================================================
+--- libdc1394.orig/examples/Makefile.am	2012-06-30 17:50:46.000000000 -0700
++++ libdc1394/examples/Makefile.am	2012-06-30 19:02:13.822646430 -0700
+@@ -36,8 +36,7 @@
+ AM_LDFLAGS = -framework CoreFoundation -framework Carbon
+ endif
+ 
+-noinst_PROGRAMS = $(A)
+-bin_PROGRAMS = $(B)
++bin_PROGRAMS = $(A) $(B)
+ 
+ LDADD = ../dc1394/libdc1394.la
+ 
diff --git a/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png b/meta-oe/recipes-multimedia/libdc1394/files/libdc1394.png
new file mode 100755
index 0000000..e69de29
diff --git a/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
new file mode 100755
index 0000000..41547d9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Capture and control API for IIDC compliant cameras"
+HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
+SECTION = "libs"
+LICENSE = "LGPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
+DEPENDS += "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
+SRCREV = "fa2b5b5a56e2c306cd3e756e810cceb68ab55b8f"
+
+SRC_URI = "git://libdc1394.git.sourceforge.net/gitroot/libdc1394/libdc1394/;branch=master;protocol=git \
+           file://install_examples.patch \
+           file://${PN}.png \
+          "
+
+S = "${WORKDIR}/git/${PN}"
+
+inherit autotools pkgconfig sdl
+
+EXTRA_OECONF += "--disable-doxygen-doc"
-- 
1.8.0.2



