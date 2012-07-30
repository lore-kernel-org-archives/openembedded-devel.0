Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SvgEp-0004Lb-5a
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 05:01:43 +0200
Received: by pbbrq2 with SMTP id rq2so7922977pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2012 19:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lTU+V/OpvCcrXJ6ThskPv4B8rq5nP6muJ6opGeiXSMI=;
	b=BbGt6FzxqhZ0vwNVsFcTDcVtx1kdyEfSsgaWWvZ5mirv35r/hAL4rskBvc7fYVgW9W
	tP/hnl9Uf36MQMuGwjxvh7Fxol/HGh0tbcdhzl329640uD438lLT0yzlhBlNsEIEFSAC
	c3rvTvzqOWrl6tIt/thi4Wn1HWICExR5SE1ON0hlg1e3em73a/cFfGYG7e/HYqhbKeOv
	F2crvkae0AFb2y9Kyp7QjYF+IsGg2yu3HK8YqS89wc2sM9fWFz+OvSuVGH9XTPh4GPud
	NpQT6/W7H4FzDEYx5sKdxsGSWoUKyFklcHpWgGEoXOOZRfJpSrBp/oPR6obXdZSSRbYf
	WMpA==
Received: by 10.68.232.197 with SMTP id tq5mr31620360pbc.53.1343616606907;
	Sun, 29 Jul 2012 19:50:06 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ka5sm6917633pbb.37.2012.07.29.19.50.04
	(version=SSLv3 cipher=OTHER); Sun, 29 Jul 2012 19:50:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jul 2012 19:49:52 -0700
Message-Id: <1343616592-11550-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] systemd: Use cross cpp
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
X-List-Received-Date: Mon, 30 Jul 2012 03:01:43 -0000

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



