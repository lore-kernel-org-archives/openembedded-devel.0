Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHnd-0001Cd-8Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:09 +0200
Received: by ghbz2 with SMTP id z2so5748472ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lTU+V/OpvCcrXJ6ThskPv4B8rq5nP6muJ6opGeiXSMI=;
	b=Fw4HrrRzCx9sHRM0HwWTs4+6Br1rk3IubZfS09QH27Z3Qw//+3Z2CqvKIvV+yShgbl
	Ci1Sl7KBmgRv466PhJbGb2lt0ywkJmT0NRXI1+ASEbKs57ByVnLmp6tEbgOoT6mF1Eq1
	pDJ1NIHUD4dMh9VqnMC7RakcWeMJV/yL8MyWVdXGN+PdjBt691qOFFoDEopJnaxkCwJG
	Y+iRHPVrOIMyV/JhABQtpa+sNdvVYApFMB+CvNSdsHRjrK1p5OVyaNFR9TDY0TD7ZznC
	VjhV7VBCtSGd2omkRc0Mo45ALVLObQTanN6vH9oCwzCZFFM2POfXokNX+Bs1LIApdTH/
	R79A==
Received: by 10.68.231.132 with SMTP id tg4mr46391804pbc.159.1343760991310;
	Tue, 31 Jul 2012 11:56:31 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hw6sm798801pbc.73.2012.07.31.11.56.29
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 11:56:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:56:14 -0700
Message-Id: <1343760977-3290-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 4/7] systemd: Use cross cpp
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
X-List-Received-Date: Tue, 31 Jul 2012 19:08:09 -0000

While building for non x86 arch (ppc) found that build
was using host's cpp which was not generating exact
syscall list for ppc since it was using the include files
from host

With this patch will use $(CPP) instead of hardcoding
cpp in makefile.am and then set CPP properly in recipe

Fixes build failures on cross builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/use-cross-cpp.patch            |   30 ++++++++++++++++++++
 meta-systemd/recipes-core/systemd/systemd_187.bb   |    5 +++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch b/meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch
new file mode 100644
index 0000000..8a4371e
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/use-cross-cpp.patch
@@ -0,0 +1,30 @@
+hardcoding cpp does not work when cross compiling systemd.
+since it will use the include headers from host system and
+syscalls are different for different architectures.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: systemd-187/Makefile.am
+===================================================================
+--- systemd-187.orig/Makefile.am	2012-07-29 16:39:57.628405921 -0700
++++ systemd-187/Makefile.am	2012-07-29 16:40:37.248405921 -0700
+@@ -1026,7 +1026,7 @@
+ 	src/core/syscall-to-name.h
+ 
+ src/core/syscall-list.txt: Makefile
+-	$(AM_V_GEN)cpp $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include sys/syscall.h < /dev/null | $(AWK) '/^#define[ \t]+__NR_[^ ]+[ \t]+[0-9]/ { sub(/__NR_/, "", $$2); print $$2; }' > $@
++	$(AM_V_GEN)$(CPP) $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include sys/syscall.h < /dev/null | $(AWK) '/^#define[ \t]+__NR_[^ ]+[ \t]+[0-9]/ { sub(/__NR_/, "", $$2); print $$2; }' > $@
+ 
+ src/core/syscall-from-name.gperf: src/core/syscall-list.txt Makefile
+ 	$(AM_V_GEN)$(AWK) 'BEGIN{ print "struct syscall_name { const char* name; int id; };"; print "%null-strings"; print "%%";} { printf "%s, __NR_%s\n", $$1, $$1 }' < $< > $@
+@@ -2199,7 +2199,7 @@
+ 
+ src/udev/keymap/keys.txt: Makefile
+ 	$(AM_V_at)mkdir -p src/udev/keymap
+-	$(AM_V_GEN)cpp $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include linux/input.h < /dev/null | $(AWK) '/^#define[ \t]+KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 != "KEY_MAX") { print $$2 } }' | sed 's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
++	$(AM_V_GEN)$(CPP) $(AM_CPPFLAGS) $(CPPFLAGS) -dM -include linux/input.h < /dev/null | $(AWK) '/^#define[ \t]+KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 != "KEY_MAX") { print $$2 } }' | sed 's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
+ 
+ src/udev/keymap/keys-from-name.gperf: src/udev/keymap/keys.txt Makefile
+ 	$(AM_V_GEN)$(AWK) 'BEGIN{ print "struct key { const char* name; unsigned short id; };"; print "%null-strings"; print "%%";} { print $$1 ", " $$1 }' < $< > $@
diff --git a/meta-systemd/recipes-core/systemd/systemd_187.bb b/meta-systemd/recipes-core/systemd/systemd_187.bb
index a6f6281..a52e5a8 100644
--- a/meta-systemd/recipes-core/systemd/systemd_187.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_187.bb
@@ -15,10 +15,14 @@ SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
 
 SECTION = "base/shell"
 
+PR = "r1"
+
+
 inherit useradd pkgconfig autotools perlnative
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/${P}.tar.xz \
            file://use-rootlibdir.patch \
+           file://use-cross-cpp.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -55,6 +59,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 	sed -i /xsltproc/d configure.ac
 
 	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
-- 
1.7.5.4



