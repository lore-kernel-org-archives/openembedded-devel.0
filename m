Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6B979715
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 15:17:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id u12-v6so22321037wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IE8qnCBF7AY8x3yPq1365FDWohuW8VXeF8fgtQAsNaU=;
	b=kVFaZGptTsCfQsM89WgXOelvFsGnzKHC3RFK0XbaGQc/Q86fS0FuCEwg1YztZroU4E
	gQfrKwK88j937wFrfERClJUgPamPYxBTZBXfgwayZxmBOj1yYNXfhtTeVHeFh1z77vQ3
	9l2bns9f/ibexeMsKN9NYL1zNHY03PmGeePTaUkfxGgE8zMmv+yiRRuyfXZcBV96bI5/
	IQ5V3zuyL1MwPE1Yud0HqaA8A02HVdHPRCQGIBh+rGv3tsyHA38AzLxpHylhKg5tsOGC
	z+UyEITCQ7OfNmYo6mi118TK4LBVmxaQFA/JBSQT5BqLuuK/LY89NA20jaga0dkBl5Js
	l9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IE8qnCBF7AY8x3yPq1365FDWohuW8VXeF8fgtQAsNaU=;
	b=ZWVmisDJq4jnxwFCZri97rpuviG3kWfNoKBHKtJvR9fVPIgBV6mRz5AEpXu26t9IUN
	vU8WqnrT7IgpD+VamKh0seRm0dmSvQIuoalFeGimz8TUs2DqjGYmOKdVN14IknAJ7wJH
	dbU2GZfvrPUTB326MkL6p3lNt1zmmcb6EiLQLLI4h1p7usEwzYI8GFigX/tF/ZBLeAyy
	AhAzbP0ls5cEiaOVcPPkyu9lS6he5xeCyEB7uJuL0nx4j0hfT2/lLXi8WOKclyRT8a5Z
	jS9xeP3qJnn9YyvoNuCDmctCgFKA3vrW4DyI6HPL/qi3xJQCZ9aJpmyHI6xAyd0HRouc
	JykA==
X-Gm-Message-State: APzg51B2gRWOv8h4mJ0u2IZKHl2OFiDn6fJC2TcRrZ006nyU7EnQ8CW2
	8bASLmEF9I7DHDeppixdLT80TRsu
X-Google-Smtp-Source: ANB0VdbyFKAqcIQg0pG+om+uXvoxkBOMB1Fprr1zIf749OhUIfuj3kuSgW0aaEWIXNpaB85dLUCsyw==
X-Received: by 2002:a5d:4cc8:: with SMTP id
	c8-v6mr15906402wrt.210.1536592639575; 
	Mon, 10 Sep 2018 08:17:19 -0700 (PDT)
Received: from baba-localdomain.home
	(LFbn-REN-1-585-132.w81-53.abo.wanadoo.fr. [81.53.163.132])
	by smtp.gmail.com with ESMTPSA id
	t132-v6sm23637467wmf.24.2018.09.10.08.17.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Sep 2018 08:17:19 -0700 (PDT)
From: Baptiste Durand <baptiste.durand@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 17:17:00 +0200
Message-Id: <20180910151700.9281-1-baptiste.durand@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] minidlna: restore & fix recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 15:17:24 -0000

Restore minidlna recipe and bump it to v1.2.1

Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
 .../0001-Update-Gettext-version.patch         | 34 +++++++++++++++
 .../minidlna/minidlna_1.2.1.bb                |  4 ++
 3 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb

diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
new file mode 100644
index 000000000..187ff536a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
@@ -0,0 +1,41 @@
+DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
+being fully compliant with DLNA/UPnP-AV clients."
+LICENSE = "GPL-2.0|BSD"
+DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag libvorbis"
+
+# because it depends on libav which has commercial flag
+LICENSE_FLAGS = "commercial"
+
+inherit gettext autotools-brokensep update-rc.d systemd
+
+SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
+           file://minidlna-daemon.init.d \
+           file://minidlna.service \
+           file://0001-Update-Gettext-version.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+# This remove "--exclude=autopoint" option from autoreconf argument to avoid
+# configure.ac:30: error: required file './ABOUT-NLS' not found
+EXTRA_AUTORECONF = ""
+
+do_install_append(){
+    install -d ${D}${sysconfdir}
+    install -m 0755 minidlna.conf ${D}${sysconfdir}
+
+# Systemd script
+    install -d ${D}${nonarch_base_libdir}/systemd/system
+    install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
+
+# Sysvinit script
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
+
+}
+
+SYSTEMD_SERVICE_${PN} = "minidlna.service"
+
+INITSCRIPT_NAME = "minidlna"
+INITSCRIPT_PARAMS = "defaults 90"
+
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
new file mode 100644
index 000000000..c18095d42
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
@@ -0,0 +1,34 @@
+From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
+From: Baptiste Durand <baptiste.durand@gmail.com>
+Date: Sun, 9 Sep 2018 20:50:41 +0200
+Subject: [PATCH] Update Gettext version
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f343d21..a556b33 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,7 +14,7 @@
+ # License along with MiniDLNA; if not, write to the Free Software
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ # USA.
+-AC_INIT(MiniDLNA,1.1.3,,minidlna)
++AC_INIT(MiniDLNA,1.2.1,,minidlna)
+ #LT_INIT
+ 
+ AC_CANONICAL_TARGET
+@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC_USE_SYSTEM_EXTENSIONS])
+ 
+ AM_ICONV
+ AM_GNU_GETTEXT([external])
+-AM_GNU_GETTEXT_VERSION(0.18)
++AM_GNU_GETTEXT_VERSION(0.19)
+ 
+ # Checks for programs.
+ AC_PROG_AWK
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
new file mode 100644
index 000000000..fe6bebce2
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRCREV = "v1_2_1"
+LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-- 
2.17.1


