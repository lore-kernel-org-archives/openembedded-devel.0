Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXK-00036x-LP
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:29:01 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so9962412pbc.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=NndTvqHaCba44pYY00SkkfpAxLi8/b8QA+5J8MfmKiw=;
	b=KOzo3ePpiB52ITZ2r5ck3Vwz4JLbHZRavJ9zbkCmYTYwt5J+zsxLykhm7A/+MmBDyE
	rdMmfPR5wFvHUSSDnI8LtSGKYBAKmOyQwO+YdIxprpIa7l2ZJ66xzIKIXIjlcg6GHGrk
	7GS0KktK83RK9mW3GHrxLPGkfZCXp5EDjKnS9GWMJtIZZra8/rAhGt4B2JFUlNBC/T1z
	RDyDRwN68SXM5Gimb/r1JO24vlI5U8VZCRhRyJiqg1gr4TyrSobcuaAf1h4kx3qY2/ba
	u0zav90NZnpeak4BVLNB9VNvUl3Vdfr0iwyuvUYpwX0UqC9ciFrSCkJ7LyOY/Jxvkctt
	wZfQ==
X-Received: by 10.66.73.230 with SMTP id o6mr168368868pav.57.1357463630249;
	Sun, 06 Jan 2013 01:13:50 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:40 -0800
Message-Id: <1357463568-26241-17-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 17/25] uml-utilities: Forward port recipe from OE classic
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Imported at SHA e12cf65f2fd58135039d73b9290ebee763161416

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uml-utilities-20040406/fix-ldflags.patch       |   16 ++++
 .../uml-utilities-20040406/unstrip.patch           |   84 ++++++++++++++++++++
 .../uml-utilities/uml-utilities_20040406.bb        |   26 ++++++
 3 files changed, 126 insertions(+)
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
new file mode 100644
index 0000000..05cc537
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
@@ -0,0 +1,16 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- tools/mconsole/Makefile~fix-ldflags	2003-02-08 05:10:08.000000000 +0100
++++ tools/mconsole/Makefile	2004-04-01 15:37:37.000000000 +0200
+@@ -7,7 +7,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) -lreadline -lncurses
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS) -lreadline -lncurses
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
new file mode 100644
index 0000000..868001d
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
@@ -0,0 +1,84 @@
+Dont strip during install let the packaging handle it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: tools/jailtest/Makefile
+===================================================================
+--- tools.orig/jailtest/Makefile	2003-02-07 20:10:27.000000000 -0800
++++ tools/jailtest/Makefile	2012-09-05 12:13:56.061615854 -0700
+@@ -14,4 +14,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
++	install $(BIN) $(DESTDIR)$(BIN_DIR)
+Index: tools/mconsole/Makefile
+===================================================================
+--- tools.orig/mconsole/Makefile	2012-09-05 12:05:09.869607043 -0700
++++ tools/mconsole/Makefile	2012-09-05 12:14:07.725607469 -0700
+@@ -14,4 +14,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
++	install $(BIN) $(DESTDIR)$(BIN_DIR)
+Index: tools/moo/Makefile
+===================================================================
+--- tools.orig/moo/Makefile	2003-06-26 09:27:00.000000000 -0700
++++ tools/moo/Makefile	2012-09-05 12:14:20.981604580 -0700
+@@ -22,4 +22,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
++	install $(BIN) $(DESTDIR)$(BIN_DIR)
+Index: tools/port-helper/Makefile
+===================================================================
+--- tools.orig/port-helper/Makefile	2003-02-07 20:05:31.000000000 -0800
++++ tools/port-helper/Makefile	2012-09-05 12:14:39.429609678 -0700
+@@ -14,4 +14,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(LIB_DIR)
+-	install -s $(BIN) $(DESTDIR)$(LIB_DIR)
++	install $(BIN) $(DESTDIR)$(LIB_DIR)
+Index: tools/tunctl/Makefile
+===================================================================
+--- tools.orig/tunctl/Makefile	2003-02-07 20:05:04.000000000 -0800
++++ tools/tunctl/Makefile	2012-09-05 12:14:49.985606470 -0700
+@@ -14,4 +14,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
++	install $(BIN) $(DESTDIR)$(BIN_DIR)
+Index: tools/uml_net/Makefile
+===================================================================
+--- tools.orig/uml_net/Makefile	2003-02-07 20:04:55.000000000 -0800
++++ tools/uml_net/Makefile	2012-09-05 12:15:00.961607290 -0700
+@@ -21,4 +21,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s -m 04755 $(BIN) $(DESTDIR)$(BIN_DIR)
++	install -m 04755 $(BIN) $(DESTDIR)$(BIN_DIR)
+Index: tools/uml_router/Makefile
+===================================================================
+--- tools.orig/uml_router/Makefile	2003-02-07 20:04:39.000000000 -0800
++++ tools/uml_router/Makefile	2012-09-05 12:15:10.649607571 -0700
+@@ -20,4 +20,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
++	install $(BIN) $(DESTDIR)$(BIN_DIR)
+Index: tools/watchdog/Makefile
+===================================================================
+--- tools.orig/watchdog/Makefile	2003-02-07 20:04:25.000000000 -0800
++++ tools/watchdog/Makefile	2012-09-05 12:15:35.561612203 -0700
+@@ -14,4 +14,4 @@
+ 
+ install : $(BIN)
+ 	install -d $(DESTDIR)$(BIN_DIR)
+-	install -s $(BIN) $(DESTDIR)$(BIN_DIR)
++	install $(BIN) $(DESTDIR)$(BIN_DIR)
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
new file mode 100644
index 0000000..80b3c9a
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -0,0 +1,26 @@
+SECTION = "console/utils"
+DESCRIPTION = "Utilities for User-Mode-Linux"
+LICENSE = "GPL-2.0"
+DEPENDS = "zlib ncurses readline"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_utilities_${PV}.tar.bz2  \
+           file://fix-ldflags.patch \
+           file://unstrip.patch \
+          "
+SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
+SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
+
+PR = "r1"
+
+S = "${WORKDIR}/tools"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${libdir}"
+FILES_${PN}-dbg += "${libdir}/uml/.debug"
-- 
1.7.9.5



