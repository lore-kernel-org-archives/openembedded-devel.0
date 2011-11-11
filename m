Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <todd.kempel@gmail.com>) id 1ROyaB-0008Me-RN
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 22:24:19 +0100
Received: by ywt2 with SMTP id 2so1776215ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 13:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=cRyMN4u7uEdiCTZuB7aZ6NlM+YM6X44NCpR+Z86ifRU=;
	b=fYPW3UW6awM/YJWjPziOmdfnGmstL6SB3ZMISJC9H00ee/QxTkEKGcPvfXLJDylrq1
	RLoNoVbGf7RIX0Su+mWSZUeciaB1pmWQJB2ZnKTw8xT5sngGV+FfcHTLcsgPq6eXlzxM
	TCgl4JEDhwIB06UKvJFJMe8DZfjKg9dv/VJCY=
Received: by 10.146.48.37 with SMTP id v37mr50343yav.6.1321046279752;
	Fri, 11 Nov 2011 13:17:59 -0800 (PST)
Received: from localhost.localdomain
	(173-165-236-123-minnesota.hfc.comcastbusiness.net.
	[173.165.236.123])
	by mx.google.com with ESMTPS id f47sm18848695yhh.8.2011.11.11.13.17.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 13:17:59 -0800 (PST)
From: Todd Kempel <todd.kempel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 15:17:52 -0600
Message-Id: <1321046272-3745-1-git-send-email-todd.kempel@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] commiting recipe for batctl
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
X-List-Received-Date: Fri, 11 Nov 2011 21:24:20 -0000

From: Todd Kempel <todd@todd-VirtualBox.(none)>

Signed-off-by: Todd Kempel <todd@todd-VirtualBox.(none)>
---
 recipes/batctl/batctl-2011.3.0/makefile-fix.patch |   18 +++++++++++++
 recipes/batctl/batctl.inc                         |   28 +++++++++++++++++++++
 recipes/batctl/batctl_2011.3.0.bb                 |    6 ++++
 recipes/batctl/files/makefile-fix.patch           |   18 +++++++++++++
 4 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 recipes/batctl/batctl-2011.3.0/makefile-fix.patch
 create mode 100644 recipes/batctl/batctl.inc
 create mode 100644 recipes/batctl/batctl_2011.3.0.bb
 create mode 100644 recipes/batctl/files/makefile-fix.patch

diff --git a/recipes/batctl/batctl-2011.3.0/makefile-fix.patch b/recipes/batctl/batctl-2011.3.0/makefile-fix.patch
new file mode 100644
index 0000000..45bd69e
--- /dev/null
+++ b/recipes/batctl/batctl-2011.3.0/makefile-fix.patch
@@ -0,0 +1,18 @@
+--- batctl-2011.3.0.orig/Makefile	2011-11-09 16:22:58.088166320 -0600
++++ batctl-2011.3.0/Makefile	2011-11-09 16:33:21.181006028 -0600
+@@ -24,7 +24,6 @@
+ MANPAGE = man/batctl.8
+ 
+ # batctl flags and options
+-CFLAGS += -pedantic -Wall -W -std=gnu99 -fno-strict-aliasing -MD
+ LDLIBS += -lm
+ 
+ # disable verbose output
+@@ -38,7 +37,6 @@
+ endif
+ 
+ # standard build tools
+-CC ?= gcc
+ RM ?= rm -f
+ INSTALL ?= install
+ MKDIR ?= mkdir -p
diff --git a/recipes/batctl/batctl.inc b/recipes/batctl/batctl.inc
new file mode 100644
index 0000000..71dd948
--- /dev/null
+++ b/recipes/batctl/batctl.inc
@@ -0,0 +1,28 @@
+DESCRIPTION = "Routing protocol daemon for multi-hop ad-hoc mesh networks."
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPL"
+HOMEPAGE = "http://www.open-mesh.net/"
+
+INC_PR = "r2"
+
+RDEPENDS_${PN} = "kernel-module-tun"
+
+SRC_URI = "http://downloads.open-mesh.net/batman/stable/sources/batctl/batctl-${PV}.tar.gz \
+           file://makefile-fix.patch \
+          "
+
+S = "${WORKDIR}/batctl-${PV}"
+
+do_compile() {
+  oe_runmake
+}
+
+do_stage() {
+  :
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0755 batctl ${D}${bindir}
+}
diff --git a/recipes/batctl/batctl_2011.3.0.bb b/recipes/batctl/batctl_2011.3.0.bb
new file mode 100644
index 0000000..2b32e63
--- /dev/null
+++ b/recipes/batctl/batctl_2011.3.0.bb
@@ -0,0 +1,6 @@
+require batctl.inc
+PR = "${INC_PR}.1"
+
+
+SRC_URI[md5sum] = "8eb197896049bb04a6beef56015a16b6"
+SRC_URI[sha256sum] = "94922fd167d2bca5193cc7465bfc212c2c3595da70e653506493dfc65e4410fb"
diff --git a/recipes/batctl/files/makefile-fix.patch b/recipes/batctl/files/makefile-fix.patch
new file mode 100644
index 0000000..45bd69e
--- /dev/null
+++ b/recipes/batctl/files/makefile-fix.patch
@@ -0,0 +1,18 @@
+--- batctl-2011.3.0.orig/Makefile	2011-11-09 16:22:58.088166320 -0600
++++ batctl-2011.3.0/Makefile	2011-11-09 16:33:21.181006028 -0600
+@@ -24,7 +24,6 @@
+ MANPAGE = man/batctl.8
+ 
+ # batctl flags and options
+-CFLAGS += -pedantic -Wall -W -std=gnu99 -fno-strict-aliasing -MD
+ LDLIBS += -lm
+ 
+ # disable verbose output
+@@ -38,7 +37,6 @@
+ endif
+ 
+ # standard build tools
+-CC ?= gcc
+ RM ?= rm -f
+ INSTALL ?= install
+ MKDIR ?= mkdir -p
-- 
1.7.4.1



