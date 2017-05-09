Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 44B3771A91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v14so12830366pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sJDtEc6NWL6/qlqhqvYh0gFFK51TNHQWuJM0DgVHRj8=;
	b=BpSEPIvOWRsJL90MmTrn/+iJTF/k63NmY9EoPVmfXB2rkitMBsNC7eqmAKKaqIKzA3
	W4Tt9E7Act6OngPvxW6qA83PjilUo+7JZAlcmXCVaevrqNXcCy4WB4P7BZAIZ4dUfAXC
	SxXGS4QHWJcm72mtVUyuiv8CtvkY6ACZbIrZEVG1NTpZodK+vceC9+j3CIriNUZEGJH+
	cicyKZ4BUXhpVYaUERwkwWg9YpANg1r8SBvWOZfGpbEAaeAzhPj4WgG8gnAp+7WLbjiJ
	QXpC4vZp5YPNMn+aGvNp6VaD2Af11n9+cqAKAwxWYr1XnwqCvkHIilPTArshBPlKn016
	9ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sJDtEc6NWL6/qlqhqvYh0gFFK51TNHQWuJM0DgVHRj8=;
	b=QYGTJCeqfEcJ2u38dHMhFA6OcWgQESPGoMWMYOsX5lXJMP9/UbQq62hXBLdYkBb+rO
	VEc9QvDxYn8NH55XOQCDsgoRnkfzP35eGu5xrg3wpfX7vVe27HAjUoivudJzjKwZt+2b
	LtsH1dXyK9l4K7Y244QVsZD6EzcbSO+WtgKAPevsxmAz91unoHkj4f/4/4cNEZPLCEHn
	3tpKXi7r85NfNdFdHYvmJMPB0qgl5lKH+M/flLcaNggUEl26vXmesTdz8Tomrt9lLeI1
	NQnbeoK2VQxrqLJii3J+Hz6jdXYAZslRKerAb8AXdow7FSQUNdBc+CGkAlNdlEIyP8SL
	4oQQ==
X-Gm-Message-State: AN3rC/7bh2orRR2lNb62iH81aBMPpIjbWgUdeZq4X9aeN057Vf3MpRqK
	7AHwrNDMo72Jew==
X-Received: by 10.84.248.12 with SMTP id p12mr28160194pll.155.1494316651333;
	Tue, 09 May 2017 00:57:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:10 -0700
Message-Id: <20170509075711.1575-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/9] libsdl2-ttf: Check for x11 and opengl in distro features
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
X-List-Received-Date: Tue, 09 May 2017 07:57:30 -0000

when X11 is not in distro features it tries to link with
libGL which does not exist and compile fails

Add a patch to add foreign option to AUTOMAKE_OPTIONS
which lets it configure and relax automake rules to not
check for some GNU specific files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libsdl-ttf/files/automake_foreign.patch | 13 +++++++++++++
 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb    | 11 +++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch

diff --git a/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch b/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
new file mode 100644
index 000000000..2d5bd6d91
--- /dev/null
+++ b/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
@@ -0,0 +1,13 @@
+Index: SDL2_ttf-2.0.14/Makefile.am
+===================================================================
+--- SDL2_ttf-2.0.14.orig/Makefile.am
++++ SDL2_ttf-2.0.14/Makefile.am
+@@ -1,6 +1,8 @@
+ # Makefile.am for the SDL truetype font loading library and viewer
+ lib_LTLIBRARIES = libSDL2_ttf.la
+ 
++AUTOMAKE_OPTIONS = foreign
++
+ libSDL2_ttfincludedir = $(includedir)/SDL2
+ libSDL2_ttfinclude_HEADERS =	\
+ 	SDL_ttf.h
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
index f2441f9cf..4601593ad 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
@@ -1,23 +1,25 @@
 SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl2 freetype"
+DEPENDS = "virtual/libsdl2 freetype virtual/libgl"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=cb33e7c4df9fbde389f149ad6bc93ce5"
 
 SRC_URI = " \
     http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz \
     file://use.pkg-config.for.freetype2.patch \
+    file://automake_foreign.patch \
 "
 SRC_URI[md5sum] = "e53c05e1e7f1382c316afd6c763388b1"
 SRC_URI[sha256sum] = "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276"
 
 S = "${WORKDIR}/SDL2_ttf-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
-do_configure_prepend() {
-    touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
+# links to libGL.so
+REQUIRED_DISTRO_FEATURES += "x11 opengl"
 
+do_configure_prepend() {
     # Removing these files fixes a libtool version mismatch.
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
 
@@ -25,3 +27,4 @@ do_configure_prepend() {
         rm -f ${S}/acinclude/$i
     done
 }
+ASNEEDED = ""
-- 
2.12.2


