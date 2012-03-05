Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4bzD-0007GV-05
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 18:46:15 +0100
Received: by wibhq12 with SMTP id hq12so2178712wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 09:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.96.230 as permitted sender)
	client-ip=10.180.96.230; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.96.230 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.96.230])
	by 10.180.96.230 with SMTP id dv6mr16879825wib.11.1330969060558
	(num_hops = 1); Mon, 05 Mar 2012 09:37:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.96.230 with SMTP id dv6mr13396629wib.11.1330969060470;
	Mon, 05 Mar 2012 09:37:40 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm1396136wib.9.2012.03.05.09.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 09:37:39 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 18:37:30 +0100
Message-Id: <1330969051-9867-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlTjmXIpIM9RHtcSwoxDTGn62cPYMNd2J+MYWRRo1ZbBZwoIrfCMDeLbBBYY6pN43ozmaXl
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/3] systemd: update to latest git
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
X-List-Received-Date: Mon, 05 Mar 2012 17:46:15 -0000

This is in preparation for the v44 release.

* drop 2 patches that aren't needed anymore
* fix more endianness problems

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0001-docs-fix-build-without-xsltproc.patch     |   41 --------------------
 .../0001-systemd-journald-fix-endianess-bug.patch  |   29 --------------
 meta-oe/recipes-core/systemd/systemd_git.bb        |   13 +++---
 3 files changed, 6 insertions(+), 77 deletions(-)
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
deleted file mode 100644
index 390d65c..0000000
--- a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7395173a5af08e9e58aed33e831d0bfc6515891d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 2 Oct 2011 19:54:29 +0200
-Subject: [PATCH 1/2] docs: fix build without xsltproc
-
-Make would choke on missing rules for man/systemd.1
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-status: rejected [fix your docbook install]
-
----
- Makefile.am |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index f1f975f..53f99a1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -649,6 +649,7 @@ EXTRA_DIST += \
- 	src/acl-util.h \
- 	src/logs-show.h
- 
-+if HAVE_XSLTPROC
- MANPAGES = \
- 	man/systemd.1 \
- 	man/systemctl.1 \
-@@ -721,6 +722,10 @@ EXTRA_DIST += \
- 	$(XML_IN_FILES) \
- 	${nodist_man_MANS:=.in} \
- 	${XML_IN_FILES:.xml.in=.html.in}
-+else
-+MANPAGES =
-+MANPAGES_ALIAS =
-+endif
- 
- systemd_SOURCES = \
- 	src/main.c
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch b/meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch
deleted file mode 100644
index b41d5eb..0000000
--- a/meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d228134ff5af3bd0ef1087e9bee66583c1546553 Mon Sep 17 00:00:00 2001
-From: Dirk Eibach <eibach@gdsys.de>
-Date: Wed, 29 Feb 2012 12:45:46 +0100
-Subject: [PATCH] systemd-journald: fix endianess bug
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-status: Submitted
-
- src/journal/journal-file.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
-index 20ca3f6..275caea 100644
---- a/src/journal/journal-file.c
-+++ b/src/journal/journal-file.c
-@@ -238,7 +238,7 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
-         if (fstat(f->fd, &f->last_stat) < 0)
-                 return -errno;
- 
--        f->header->arena_size = new_size - htole64(f->header->arena_offset);
-+        f->header->arena_size = htole64(new_size - le64toh(f->header->arena_offset));
- 
-         return 0;
- }
--- 
-1.7.7.4
-
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 2b549a0..7a8f6e4 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,16 +14,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r18"
+PR = "r19"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "d26e4270409506cd398875216413b651d6ee7de6"
+SRCREV = "82bdec0d65e38333286ae025e5d1aae29b8463f5"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://0001-docs-fix-build-without-xsltproc.patch \
            file://0002-systemd-logind-don-t-kill-user-processes-on-exit.patch \
-           file://0001-systemd-journald-fix-endianess-bug.patch \
            ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
@@ -45,6 +43,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --disable-gtk \
                  --enable-xz \
+                 --disable-manpages \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
@@ -58,7 +57,7 @@ do_install() {
 	rm ${D}${base_libdir}/systemd/system/serial-getty* -f
 
 	# provide support for initramfs
-	ln -s ${base_bindir}/systemd ${D}/init
+	ln -s ${base_libdir}/systemd/systemd ${D}/init
 }
 
 python populate_packages_prepend (){
@@ -131,7 +130,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
 # u-a for runlevel and telinit
 
 pkg_postinst_systemd () {
-update-alternatives --install ${base_sbindir}/init init ${base_bindir}/systemd 300
+update-alternatives --install ${base_sbindir}/init init ${base_libdir}/systemd/systemd 300
 update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
@@ -139,7 +138,7 @@ update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/s
 }
 
 pkg_prerm_systemd () {
-update-alternatives --remove init ${base_bindir}/systemd
+update-alternatives --remove init ${base_libdir}/systemd/systemd
 update-alternatives --remove halt ${base_bindir}/systemctl
 update-alternatives --remove reboot ${base_bindir}/systemctl
 update-alternatives --remove shutdown ${base_bindir}/systemctl
-- 
1.7.2.5



