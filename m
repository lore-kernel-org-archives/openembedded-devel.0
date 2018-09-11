Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9E11A79641
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 18:17:08 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r1-v6so8464551wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 11:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9WeLUJ/Xjqs5WRvRiwS4DkZMUe5VOOeam75G3yRytl0=;
	b=J8vIdbU+ZEuJTUD1hz585ZY0ybLg8QhZIWXl+21TTkH4W1+nbEGNGhNURb3VZTEXnQ
	psj7h+nCoB9xWQwdD1dy3Vp6CqBBSCPkgTmEfjC5n6Z6CskQy54QXcEefNiYh8s1bKV+
	Ez3sWjnMX/xniEDvK9RdSnu4tTVxHg8G42ELcXZunbNAp/3mJ6Dtz5aACA6qNSDrxA5x
	/xOkd4XWXnlir74jDtsvCWdvwgs6RvtRUPWikrjazCfUTMRiabU4UEK6xbyrxijBwW/t
	QmYyH2TdOtoRqMnSlQv6HOQrrXNUNzHDe2DLx6Gw9NPt7qJvyRUyfnsZRSy+Lmfeku2K
	KbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9WeLUJ/Xjqs5WRvRiwS4DkZMUe5VOOeam75G3yRytl0=;
	b=toOZVSGYUhCfS94KKi9/MmCXWbapuLUE+lyfkd8siwhP9F8v4Ys/kwblDzltHB5n1L
	IEBWEhTy1RHXg26lhh3ToFqEBZED4XsOkHVIKkheKrv/9ATJ930R0ZB98dX6jvE/8xgW
	YfEVi0Zd9VvXFBm92HZZoJtMQdZnqyG0hdC4Vf3zDO2Rf+iMKpF2lyjmKHbCS7iRRl31
	9OUXFIwbU0LMSF/DeC4Z0Ca1BHoPohsYudWRO/6dYq0zH2ryKt8Yo6PWXS8pKaQozjnN
	rYu8WD5ZjUeJv+kT0JakFch3LLat649JtWc/4ozfQQd41GDLDQJydfdHNx/mxSgBaxOa
	pftw==
X-Gm-Message-State: APzg51CIx4CXqIEj8hIj16Sqj+5LjgDQmifq3xgaHNt4/PNw2FE0798m
	wER8EkXNamIixPLGW/gbKbvI531A
X-Google-Smtp-Source: ANB0VdaYNWGOA6VjgXnHlKlQ4EcM0RkUbfGOo0yB78fdN58SKh4F+za3qQKYa1z8TchJYBAkDJ0qwQ==
X-Received: by 2002:a1c:ac04:: with SMTP id v4-v6mr2095531wme.51.1536689828966;
	Tue, 11 Sep 2018 11:17:08 -0700 (PDT)
Received: from baba-localdomain.home
	(LFbn-REN-1-585-132.w81-53.abo.wanadoo.fr. [81.53.163.132])
	by smtp.gmail.com with ESMTPSA id
	1-v6sm2322221wmf.47.2018.09.11.11.17.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Sep 2018 11:17:08 -0700 (PDT)
From: Baptiste Durand <baptiste.durand@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2018 20:17:04 +0200
Message-Id: <20180911181704.8223-1-baptiste.durand@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v3] minidlna: restore & fix recipe
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
X-List-Received-Date: Tue, 11 Sep 2018 18:17:08 -0000

Restore minidlna recipe and bump it to v1.2.1
Move it to meta-multimedia
Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
 .../0001-Update-Gettext-version.patch         | 34 +++++++++++++++
 .../minidlna/minidlna/minidlna-daemon.init.d  |  0
 .../minidlna/minidlna/minidlna.service        |  0
 .../minidlna/minidlna_1.2.1.bb                |  4 ++
 5 files changed, 79 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
 rename {meta-oe => meta-multimedia}/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d (100%)
 rename {meta-oe => meta-multimedia}/recipes-multimedia/minidlna/minidlna/minidlna.service (100%)
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
new file mode 100644
index 000000000..187ff536a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
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
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
new file mode 100644
index 000000000..c18095d42
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
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
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d b/meta-multimedia/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
similarity index 100%
rename from meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
rename to meta-multimedia/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service b/meta-multimedia/recipes-multimedia/minidlna/minidlna/minidlna.service
similarity index 100%
rename from meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
rename to meta-multimedia/recipes-multimedia/minidlna/minidlna/minidlna.service
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb b/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb
new file mode 100644
index 000000000..999d85ce7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRCREV = "c760a338e07ebd11d62fef701e3de824a91f8625"
+LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-- 
2.17.1


