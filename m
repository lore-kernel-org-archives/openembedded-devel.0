Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkmx-0006GV-PX
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:17:31 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so2960897pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iawJzjkaAqf0hKKTccrIEoIDq2BWtOXHyYHO+/R7vUM=;
	b=TS98QCPa+2uqE1e6cvRKk1tugE3JUHb+xIQxPYAXB8iDeQnfyYO/Ub59Vkg9o5J7PY
	/VQugSkyjTGTM+nGcQ0o0NMoO0T6xSRajTL6WKKrTyVSM6ciXaAuEQbhmRN8y9UEPHCL
	GmwGLoLZ+N3YAQEp0HQtoXLuWGb1SF1tIXWH7vlZ2oWIGf/5E5Zko4Wlp5cVLH70KV57
	bmgAkAnIi9C2cTG3/c94mm5RvG9ndi+6o2VyHGEIARJwqbUrO/ay3QOI1+SbNv08EeWo
	wZrKWNe3yJLDpxGOIdOU0TR0LqtOweIFjooSz+KOTtoWGg+x/Y94Bowg9+oan3CoQyNj
	or7w==
Received: by 10.68.221.72 with SMTP id qc8mr7215788pbc.63.1344110751193;
	Sat, 04 Aug 2012 13:05:51 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ro7sm427008pbc.8.2012.08.04.13.05.49
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 13:05:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 13:05:33 -0700
Message-Id: <1344110736-6999-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
References: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V4 5/8] systemd: Use cross cpp
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
X-List-Received-Date: Sat, 04 Aug 2012 20:17:32 -0000

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
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    2 +
 2 files changed, 32 insertions(+), 0 deletions(-)
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
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 5d1c28b..b1cc9c3 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -27,6 +27,7 @@ SRCREV = "3fd89536883ea9e24e69f28de0d11cd7cffb42ce"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://use-rootlibdir.patch \
+           file://use-cross-cpp.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -62,6 +63,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 	sed -i /xsltproc/d configure.ac
 
 	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
-- 
1.7.5.4



