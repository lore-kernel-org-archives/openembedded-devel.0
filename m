Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnroE-0003Rf-3R
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 14:13:42 +0100
Received: by werb12 with SMTP id b12so1970514wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 05:06:02 -0800 (PST)
Received: by 10.216.139.147 with SMTP id c19mr7306854wej.11.1326978362481;
	Thu, 19 Jan 2012 05:06:02 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fv6sm66008756wib.8.2012.01.19.05.06.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 05:06:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2012 14:05:53 +0100
Message-Id: <1326978353-5558-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
References: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] systemd: update to v38+git
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
X-List-Received-Date: Thu, 19 Jan 2012 13:13:42 -0000

* This introduces the 'journal' feature.
* Upstream is following the fedora /usr move so EXTRA_OECONF needs to get updated to keep the paths the same for the OE usecase

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../systemd/0001-disable-xsltproc-completely.patch |   36 ------------------
 .../0001-docs-fix-build-without-xsltproc.patch     |   38 ++++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |    9 +++--
 3 files changed, 43 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/0001-disable-xsltproc-completely.patch
 create mode 100644 meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/0001-disable-xsltproc-completely.patch b/meta-oe/recipes-core/systemd/systemd/0001-disable-xsltproc-completely.patch
deleted file mode 100644
index 24940c7..0000000
--- a/meta-oe/recipes-core/systemd/systemd/0001-disable-xsltproc-completely.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2649787d76cfe7d89abb1b5afab7cb7cd54b601b Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 2 Oct 2011 19:54:29 +0200
-Subject: [PATCH] docs: fix build without xsltproc
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-status: Pending
-
- Makefile.am  |    2 ++
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index f4a17aa..01240a5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -750,6 +750,7 @@ EXTRA_DIST += \
-         src/dbus-loop.h \
-         src/spawn-agent.h
- 
-+if HAVE_XSLTPROC
- MANPAGES = \
- 	man/systemd.1 \
- 	man/systemctl.1 \
-@@ -844,6 +845,7 @@ EXTRA_DIST += \
- 	$(XML_IN_FILES) \
- 	${nodist_man_MANS:=.in} \
- 	${XML_IN_FILES:.xml.in=.html.in}
-+endif
- 
- systemd_SOURCES = \
- 	src/main.c
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
new file mode 100644
index 0000000..1fec570
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/0001-docs-fix-build-without-xsltproc.patch
@@ -0,0 +1,38 @@
+From 97719ec99e3bd0040b616b044ab6ae33ae1cfd15 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 2 Oct 2011 19:54:29 +0200
+Subject: [PATCH 1/2] docs: fix build without xsltproc
+
+Make would choke on missing rules for man/systemd.1
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ Makefile.am |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 110a2f4..a5e57b7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -650,6 +650,7 @@ EXTRA_DIST += \
+ 	src/acl-util.h \
+ 	src/logs-show.h
+ 
++if HAVE_XSLTPROC
+ MANPAGES = \
+ 	man/systemd.1 \
+ 	man/systemctl.1 \
+@@ -721,6 +722,10 @@ EXTRA_DIST += \
+ 	$(XML_IN_FILES) \
+ 	${nodist_man_MANS:=.in} \
+ 	${XML_IN_FILES:.xml.in=.html.in}
++else
++MANPAGES =
++MANPAGES_ALIAS =
++endif
+ 
+ systemd_SOURCES = \
+ 	src/main.c
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index bdaaf16..32bdee9 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,14 +14,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r7"
+PR = "r8"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "f6cebb3bd5a00d79c8131637c0f6796a75e6af99"
+SRCREV = "a3f914b2a21decb0c4bd7a763ddd3ace215091cb"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://0001-disable-xsltproc-completely.patch \
+           file://0001-docs-fix-build-without-xsltproc.patch \
            ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
@@ -38,7 +38,8 @@ SYSTEMDDISTRO_angstrom = "angstrom"
 
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
-                 --with-rootdir=${base_prefix} \
+                 --with-rootprefix=${base_prefix} \
+                 --with-rootlibdir=${base_libdir} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --disable-gtk \
                "
-- 
1.7.2.5



