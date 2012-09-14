Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TCTvM-0002I7-Ti
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 13:19:04 +0200
Received: from mail104-am1-R.bigfish.com (10.3.201.233) by
	AM1EHSOBE006.bigfish.com (10.3.204.26) with Microsoft SMTP Server id
	14.1.225.23; Fri, 14 Sep 2012 10:21:06 +0000
Received: from mail104-am1 (localhost [127.0.0.1])	by
	mail104-am1-R.bigfish.com (Postfix) with ESMTP id DF1BB3400EB;
	Fri, 14 Sep 2012 10:21:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzd6f1izz1202h1d1ah1d2ahzz8275ch8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh12e5h1315h1155h)
Received: from mail104-am1 (localhost.localdomain [127.0.0.1]) by mail104-am1
	(MessageSwitch) id 1347618065186777_31584;
	Fri, 14 Sep 2012 10:21:05 +0000 (UTC)
Received: from AM1EHSMHS011.bigfish.com (unknown [10.3.201.243])	by
	mail104-am1.bigfish.com (Postfix) with ESMTP id 225AB4E0019;
	Fri, 14 Sep 2012 10:21:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS011.bigfish.com
	(10.3.207.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 14 Sep 2012 10:21:03 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Fri, 14 Sep 2012 05:21:01 -0500
Received: from sbuilder137.localdomain ([10.192.208.137])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q8EAKujC032735;
	Fri, 14 Sep 2012 03:20:59 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Sep 2012 18:17:19 +0800
Message-ID: <1347617839-16453-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com, Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe v2][for-denzil][PATCH] systemd: use system variables instead of hardcoded paths
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
X-List-Received-Date: Fri, 14 Sep 2012 11:19:05 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Back port commit 980b338fb5100ff4c779335a86f3d9450ea8c54a
Below is the original commit message:

Fix build for ppc64

Consider /lib64 and /usr/lib64

Some 64bit architectures chose lib64 instead of lib
for default library dirnames. So we dig this from metadata
vars base_libdir and libdir instead of hardcoding 'lib'

ppc64 in OE uses lib64 for default libdir
and this leaves lot of udev/systemd
files unpackaged since 'lib' was hardcoded

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/classes/systemd.bbclass                    |    5 +-
 .../systemd/systemd/use-rootlibdir.patch           |   94 ++++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |    3 +-
 3 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index a2c8ddf..0d88c64 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -154,7 +154,10 @@ python populate_packages_prepend () {
 
 	# check service-files and call systemd_add_files_and_parse for each entry
 	def systemd_check_services():
-		searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+		base_libdir = d.getVar('base_libdir', 1)
+		searchpaths = '/etc/systemd/system/' + ' '
+		searchpaths += d.getVar('base_libdir', 1) + '/systemd/system/' + ' '
+		searchpaths += d.getVar('libdir', 1) + '/systemd/system/' + ' '
 		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
 		has_exactly_one_service = len(systemd_packages.split()) == 1
 		if has_exactly_one_service:
diff --git a/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
new file mode 100644
index 0000000..26973c4
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
@@ -0,0 +1,94 @@
+From 5210f67d0c637f4fbd8bb0a94e9b11da25a9c76c Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Fri, 14 Sep 2012 16:56:30 +0800
+Subject: [PATCH] use rootlibdir
+
+Back port from meta-oe 980b338fb5100ff4c779335a86f3d9450ea8c54a.
+Below is the original message in the patch:
+
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
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ Makefile.am |   20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 219d8de..b96ac74 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -50,19 +50,19 @@ bashcompletiondir=$(sysconfdir)/bash_completion.d
+ 
+ # Our own, non-special dirs
+ pkgsysconfdir=$(sysconfdir)/systemd
+-userunitdir=$(prefix)/lib/systemd/user
+-tmpfilesdir=$(prefix)/lib/tmpfiles.d
+-sysctldir=$(prefix)/lib/sysctl.d
++userunitdir=$(prefix)/$(rootlibdir)/gcsystemd/user
++tmpfilesdir=$(prefix)/$(rootlibdir)/gctmpfiles.d
++sysctldir=$(prefix)/$(rootlibdir)/gcsysctl.d
+ usergeneratordir=$(pkglibexecdir)/user-generators
+ pkgincludedir=$(includedir)/systemd
+ 
+ # And these are the special ones for /
+ rootprefix=@rootprefix@
+ rootbindir=$(rootprefix)/bin
+-rootlibexecdir=$(rootprefix)/lib/systemd
++rootlibexecdir=$(rootprefix)/$(rootlibdir)/gcsystemd
+ systemgeneratordir=$(rootlibexecdir)/system-generators
+ systemshutdowndir=$(rootlibexecdir)/system-shutdown
+-systemunitdir=$(rootprefix)/lib/systemd/system
++systemunitdir=$(rootprefix)/$(rootlibdir)/gcsystemd/system
+ 
+ CLEANFILES =
+ EXTRA_DIST =
+@@ -93,7 +93,7 @@ AM_CPPFLAGS = \
+ 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
+ 	-DROOTPREFIX=\"$(rootprefix)\" \
+ 	-DRUNTIME_DIR=\"/run\" \
+-	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
++	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/gcrandom-seed\" \
+ 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
+ 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
+ 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
+@@ -1408,7 +1408,7 @@ nodist_systemunit_DATA += \
+ 
+ binfmt-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/binfmt.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcbinfmt.d \
+ 		$(DESTDIR)$(sysconfdir)/binfmt.d \
+ 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
+ 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
+@@ -1940,7 +1940,7 @@ polkitpolicy_in_files += \
+ logind-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
+-                $(DESTDIR)$(localstatedir)/lib/systemd
++                $(DESTDIR)$(localstatedir)/$(rootlibdir)/gcsystemd
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.login1.service && \
+ 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
+@@ -2196,9 +2196,9 @@ systemd-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(tmpfilesdir) \
+ 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
+-		$(DESTDIR)$(prefix)/lib/modules-load.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcmodules-load.d \
+ 		$(DESTDIR)$(sysconfdir)/modules-load.d \
+-		$(DESTDIR)$(prefix)/lib/sysctl.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcsysctl.d \
+ 		$(DESTDIR)$(sysconfdir)/sysctl.d \
+ 		$(DESTDIR)$(systemshutdowndir) \
+ 		$(DESTDIR)$(systemgeneratordir) \
+-- 
+1.7.5
+
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index b9c8a19..21a6326 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,13 +14,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r28"
+PR = "r29"
 
 inherit useradd pkgconfig autotools vala perlnative
 
 SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
+           file://use-rootlibdir.patch \
            ${UCLIBCPATCHES} \
            file://var-run.conf \
           "
-- 
1.7.5




