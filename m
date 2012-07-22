Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St5uX-0004yF-04
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 01:50:05 +0200
Received: by pbbrq2 with SMTP id rq2so8698370pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=M1/QroyK9OJsaGnTeAIYcCjd1bo+QSucBhP9orxbDbA=;
	b=u7rkEEOLtjEgK/2xbw4RI1fddbaWlZbrXyY0hfaAdbhvscj2bnm34IxFH/ozEiyX3e
	NQLvKBgBk15sG448F08TH9B/p3HBYo/9f8+OX/YepCyba+Uz5wjcr//g6x+m0bPgz7JM
	C7OCwQKd2wEdrB/cjfaWz2QcKHCnt4uWV7GSAyfRmOVS061Y23c9xDyCOmP7Eg2L87fK
	g3uytmItptqotXI6ccBgsqEsVYlyT5Dvl8SwC6nHYVjIbuNhbNeSArecH/CR4OiQZYPT
	4nJ6KSLYV9nN6KDdpstG2UkRtZfCoChU41s0RjfMhCJFiwwxhgLVS06fh+Z8MQx8/Is+
	15Lg==
Received: by 10.66.86.199 with SMTP id r7mr26770106paz.1.1343000318159;
	Sun, 22 Jul 2012 16:38:38 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id pt2sm8681773pbb.58.2012.07.22.16.38.36
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 16:38:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Jul 2012 16:38:36 -0700
Message-Id: <1343000316-19353-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343000316-19353-1-git-send-email-raj.khem@gmail.com>
References: <1343000316-19353-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 2/2] systemd_git.bb: Fix build for ppc64
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
X-List-Received-Date: Sun, 22 Jul 2012 23:50:05 -0000

ppc64 in OE uses lib64 for default libdir
and this leaves lot of udev/systemd
files unpackaged since 'lib' was hardcoded

Additionally use --split-usr option since
in OE-Core now we want to treat /usr mounted
sepatately.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/use-rootlibdir.patch           |   94 ++++++++++++++++++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   10 ++-
 2 files changed, 100 insertions(+), 4 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
new file mode 100644
index 0000000..2167216
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
@@ -0,0 +1,94 @@
+Upstream-Status: Undecided
+
+This patch removes some of hardcoded references to /lib
+and /usr/lib since on some architectures it should be
+/lib64 and /usr/lib64 atleast in OE
+
+I am not sure about the intention of hardcoded values
+thats why status is undecided
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am	2012-07-22 16:20:38.424405916 -0700
++++ git/Makefile.am	2012-07-22 16:23:21.232406621 -0700
+@@ -61,23 +61,23 @@
+ 
+ # Our own, non-special dirs
+ pkgsysconfdir=$(sysconfdir)/systemd
+-userunitdir=$(prefix)/lib/systemd/user
+-tmpfilesdir=$(prefix)/lib/tmpfiles.d
+-sysctldir=$(prefix)/lib/sysctl.d
+-usergeneratordir=$(prefix)/lib/systemd/user-generators
++userunitdir=$(prefix)/$(rootlibdir)/systemd/user
++tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
++sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
++usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
+ pkgincludedir=$(includedir)/systemd
+ systemgeneratordir=$(rootlibexecdir)/system-generators
+ systemshutdowndir=$(rootlibexecdir)/system-shutdown
+ systemsleepdir=$(rootlibexecdir)/system-sleep
+-systemunitdir=$(rootprefix)/lib/systemd/system
+-udevlibexecdir=$(rootprefix)/lib/udev
++systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
++udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
+ udevhomedir = $(udevlibexecdir)
+ udevrulesdir = $(udevlibexecdir)/rules.d
+ 
+ # And these are the special ones for /
+ rootprefix=@rootprefix@
+ rootbindir=$(rootprefix)/bin
+-rootlibexecdir=$(rootprefix)/lib/systemd
++rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
+ 
+ CLEANFILES =
+ EXTRA_DIST =
+@@ -126,7 +126,7 @@
+ 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
+ 	-DROOTPREFIX=\"$(rootprefix)\" \
+ 	-DRUNTIME_DIR=\"/run\" \
+-	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
++	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/random-seed\" \
+ 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
+ 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
+ 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
+@@ -2535,7 +2535,7 @@
+ 
+ binfmt-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/binfmt.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
+ 		$(DESTDIR)$(sysconfdir)/binfmt.d \
+ 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
+ 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
+@@ -3165,7 +3165,7 @@
+ logind-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
+-		$(DESTDIR)$(localstatedir)/lib/systemd
++		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.login1.service && \
+ 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
+@@ -3284,7 +3284,7 @@
+ 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
+ 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
+ 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
+-		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
++		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
+ 		-e 's,@prefix\@,$(prefix),g' \
+ 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
+ 		-e 's,@libdir\@,$(libdir),g' \
+@@ -3407,9 +3407,9 @@
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(tmpfilesdir) \
+ 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
+-		$(DESTDIR)$(prefix)/lib/modules-load.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
+ 		$(DESTDIR)$(sysconfdir)/modules-load.d \
+-		$(DESTDIR)$(prefix)/lib/sysctl.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
+ 		$(DESTDIR)$(sysconfdir)/sysctl.d \
+ 		$(DESTDIR)$(systemshutdowndir) \
+ 		$(DESTDIR)$(systemsleepdir) \
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 6ae9abb..fa927bd 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,13 +19,14 @@ SECTION = "base/shell"
 #PKGV = "v${GITPKGVTAG}"
 
 PV = "git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 inherit useradd pkgconfig autotools perlnative
 
 SRCREV = "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
+           file://use-rootlibdir.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -37,6 +38,9 @@ S = "${WORKDIR}/git"
 SYSTEMDDISTRO ?= "debian"
 SYSTEMDDISTRO_angstrom = "angstrom"
 
+CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
+			ac_cv_file__usr_share_hwdata_pci_ids=no \
+			ac_cv_file__usr_share_misc_pci_ids=yes"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootprefix=${base_prefix} \
@@ -49,11 +53,9 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-coredump \
                  --disable-introspection \
                  --with-pci-ids-path=/usr/share/misc \
-                 ac_cv_file__usr_share_pci_ids=no \
-                 ac_cv_file__usr_share_hwdata_pci_ids=no \
-                 ac_cv_file__usr_share_misc_pci_ids=yes \
                  --disable-gtk-doc-html \ 
                  --disable-tcpwrap \
+                 --enable-split-usr \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
-- 
1.7.5.4



