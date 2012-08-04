Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkmv-0006GV-C2
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:17:30 +0200
Received: by pbbrq2 with SMTP id rq2so2960897pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CmwHwlTRSwF5J+pXCpoGH69lLqwq5HBDEZpckJpLRBs=;
	b=vme7PL82aNmaDBBcTP/ISnuNu3spMJmUpZYHpQCPAsrr7VeCztpTmPyXHn2eVYRBta
	Iz9T9j6vcXLG2y3FyvNq7fXoGVToMiUfwZf39LRoNYvdejmvp9TI8tqhGjPotiCoiu1y
	PxQ2zkHhae3SsUajfhBukYw+QY5AIsE3zdQGeD9IzQymUJC7xdQdVZekMCGVWXdxpc5i
	Tm/SEnZpRhqUMaRO6wCZYaGIC2rD9H6bGMcKfdZrZoUW3t0d/jWXMjj9YV+QPsZjCpnd
	3RC8VgaRPMAF0a0pCsEd6wNCh0ewPMubA01pvdR0qsVgzFirw+I4TKbgglgFzYa+H8oK
	NbtA==
Received: by 10.68.238.72 with SMTP id vi8mr7310929pbc.118.1344110746242;
	Sat, 04 Aug 2012 13:05:46 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ro7sm427008pbc.8.2012.08.04.13.05.44
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 13:05:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 13:05:30 -0700
Message-Id: <1344110736-6999-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
References: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V4 2/8] systemd: Upgrade to 187 tag
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
X-List-Received-Date: Sat, 04 Aug 2012 20:17:30 -0000

Dont inherit vala not needed anymore

Fix build for ppc64

Consider /lib64 and /usr/lib64

Some 64bit architectures chose lib64 instead of lib
for default library dirnames. So we dig this from metadata
vars base_libdir and libdir instead of hardcoding 'lib'

ppc64 in OE uses lib64 for default libdir
and this leaves lot of udev/systemd
files unpackaged since 'lib' was hardcoded

Additionally use --split-usr option since
in OE-Core now we want to treat /usr mounted
sepatately.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass               |    5 +-
 .../systemd/systemd/use-rootlibdir.patch           |   94 ++++++++++++++++++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   15 ++--
 3 files changed, 107 insertions(+), 7 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index dd9f326..4036f91 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -154,7 +154,10 @@ python populate_packages_prepend () {
 
     # check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+        base_libdir = d.getVar('base_libdir', 1)
+        searchpaths = '/etc/systemd/system/' + ' '
+        searchpaths += d.getVar('base_libdir', 1) + '/systemd/system/' + ' '
+        searchpaths += d.getVar('libdir', 1) + '/systemd/system/' + ' '
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:
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
index 39b883a..5d1c28b 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,18 +19,20 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r4"
+PR = "r5"
 
-inherit useradd pkgconfig autotools vala perlnative
+inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
+SRCREV = "3fd89536883ea9e24e69f28de0d11cd7cffb42ce"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
+           file://use-rootlibdir.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
            file://var-run.conf \
           "
+
 LDFLAGS_libc-uclibc_append = " -lrt"
 
 S = "${WORKDIR}/git"
@@ -38,6 +40,9 @@ S = "${WORKDIR}/git"
 SYSTEMDDISTRO ?= "debian"
 SYSTEMDDISTRO_angstrom = "angstrom"
 
+CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
+			ac_cv_file__usr_share_hwdata_pci_ids=no \
+			ac_cv_file__usr_share_misc_pci_ids=yes"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootprefix=${base_prefix} \
@@ -50,11 +55,9 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
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



