Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 641086BF59
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:44:09 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kp14so6267873pab.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DIsHCwtkAKzLJ4MnLe8YVYxn9c01JxtjR+I3scpwCQs=;
	b=QLerBYdxSdWLqjWW40hLQpo2VoqqgfxWmDb1Xzd+wQ+aypjgRv20zoi3HRyQcok3+u
	omwQH+Dx5RrcHgf9dbAfgPSxPaqQxHZvFr1mdQDV6v/RLwcrmXczwhYSblvUjGmLL98w
	jL+4zYVF3wgLr6QqGFLUGr8TU0gCGexA2XDsjAr/t2Eoh/T4Fky8bSFMxAX+uOY/cL83
	+F+b+G1wRgHFrWQVU9jwDmYosbLtDFjpMW72etRi6e9/2fdo4eQuZwf11t8zqMKPDR6R
	UYHq0BVXNxKaMbL4R7BZdkWTgmN1CMYgxuxalsbFEz8Y/UqFL4IPQAIgSh8dAyK4f5ot
	MNBg==
X-Received: by 10.66.157.165 with SMTP id wn5mr216612pab.169.1381653851313;
	Sun, 13 Oct 2013 01:44:11 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id l8sm70753592pbl.22.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 01:44:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:43:51 -0700
Message-Id: <1381653835-32079-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-oe][PATCH 2/6] libdc1394: add recipe
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
X-List-Received-Date: Sun, 13 Oct 2013 08:44:09 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libdc1394/files/install_examples.patch           | 14 ++++++++++++++
 .../recipes-multimedia/libdc1394/libdc1394_git.bb    | 20 ++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100755 meta-oe/recipes-multimedia/libdc1394/files/install_examples.patch
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
diff --git a/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
new file mode 100755
index 0000000..87a12bd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Capture and control API for IIDC compliant cameras"
+HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
+SECTION = "libs"
+LICENSE = "LGPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
+DEPENDS += "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
+
+PV = "2.2.1+gitr${SRCPV}"
+
+SRCREV = "b90342933b4b48634b98b73805f47bd25ed5857e"
+
+SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
+           file://install_examples.patch \
+          "
+
+S = "${WORKDIR}/git/${PN}"
+
+inherit autotools pkgconfig sdl
+
+EXTRA_OECONF += "--disable-doxygen-doc"
-- 
1.8.3.2


