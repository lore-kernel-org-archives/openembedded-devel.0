Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0ni-0007WI-Jl
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:41 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so1562075eak.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pztdJXpLM5hVouaJVSb1M8pu0QuJC6LnpWLtGSH7jf4=;
	b=GH7oRzd6JmC6o7UJxFwkQstFMCSZBw5kEoZwTrSE4Wf5LpPZOP38Qw3XvG0MehVTSI
	k64st2svJyPRsvdk/AEOfUAhl1GrDb3ueE0rHq7cVsj0OO8jaaB+U/I+NDfdxOUyhasZ
	KVbCZyzpAdHBXx5C4RkF+d57kf5mp+otOd3FPCpEYNgXELhcZKvg4F92ZbmLAfmryxR5
	fS5CRQuRsDKO2DsQ7R5LE6DSh4bJR+fKFlbtvB+1KjhJ6QkvRAD60IeQkvhrFUKTFo7A
	dBlnTK5+oOk8r+q0JfIa/pDmyYVmJzFjZkanscsf2l+HzI5ovB4U4LPqaR3cpCFO5jlL
	Mh4A==
X-Received: by 10.14.210.132 with SMTP id u4mr39459865eeo.19.1365859804973;
	Sat, 13 Apr 2013 06:30:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bk42sm16494809eeb.3.2013.04.13.06.30.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:29 +0200
Message-Id: <1365859790-20947-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 12/33] xfce4-session: move systemd support from meta-systemd back to meta-xfce
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend      | 8 --------
 ...001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch | 0
 .../0001-Handle-multiple-interactive-session-save-bug-5379.patch  | 0
 .../0002-Remove-gnome-keyring-remains.patch                       | 0
 .../0003-configure.in-hard-code-path-to-iceauth.patch             | 0
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb      | 4 +++-
 6 files changed, 3 insertions(+), 9 deletions(-)
 delete mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
 rename {meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files => meta-xfce/recipes-xfce/xfce4-session/xfce4-session}/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch (100%)
 rename meta-xfce/recipes-xfce/xfce4-session/{files => xfce4-session}/0001-Handle-multiple-interactive-session-save-bug-5379.patch (100%)
 rename meta-xfce/recipes-xfce/xfce4-session/{files => xfce4-session}/0002-Remove-gnome-keyring-remains.patch (100%)
 rename meta-xfce/recipes-xfce/xfce4-session/{files => xfce4-session}/0003-configure.in-hard-code-path-to-iceauth.patch (100%)

diff --git a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
deleted file mode 100644
index 59c471e..0000000
--- a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-DEPENDS += "systemd"
-
-PRINC := "${@int(PRINC) + 2}"
-
-SRC_URI += "file://0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch"
diff --git a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
similarity index 100%
rename from meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0003-configure.in-hard-code-path-to-iceauth.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0003-configure.in-hard-code-path-to-iceauth.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 6ad834d..2c185a5 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -3,8 +3,9 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
-PR = "r2"
+PR = "r5"
 
 inherit xfce
 
@@ -13,6 +14,7 @@ SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a7
 SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch \
             file://0002-Remove-gnome-keyring-remains.patch \
             file://0003-configure.in-hard-code-path-to-iceauth.patch \
+            file://0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch \
 "
 
 # protect from frightening message that xfce might not work correctly
-- 
1.8.1.5



