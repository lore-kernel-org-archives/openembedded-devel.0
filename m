Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQIA-0000Zn-72
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:42 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so7124898eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=xlYSlmc+TD2PDalHSu0mjeYc8DWm0ltwo0QJcpCt1Zg=;
	b=KmCZiHunEXQEsZM1xBFhs83peMUSyiRm+c83E685v2AVdJY2vzmfsY12Mhzlm6TpUe
	8LnrrwA0p9elL4AGVw/8OuzaFGSb63LFt9YOgDvGD7iH2r5hatwoTb8CuG2Xat+khd8a
	hboiIg6LlMOCYA4UDN3Jf96UtSPprAsiNgMDI5vMicIag1LJMcpervwIPA/O7r9BwdPz
	Hu0YWWoCnj+zTZtv4VWlQCt9oWoBstRrMaR5esGKHHNtRbJLSRGdCk4NT6YCgGmA2nPb
	U4aRT7VX28iD0BlUXfIDjpOcruW8WEoTx+UA82UIyeg7I3NhRvXotELO4L6fZPE3ldIf
	zRmQ==
X-Received: by 10.14.178.196 with SMTP id f44mr126327151eem.14.1357139800009; 
	Wed, 02 Jan 2013 07:16:40 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:14 +0100
Message-Id: <1357139774-4364-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 10/10] xfce4-session: fix build on X11-less hosts
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
| checking for iceauth... no
| configure: error: iceauth missing, please check your X11 installation

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...03-configure.in-hard-code-path-to-iceauth.patch |   40 ++++++++++++++++++++
 .../xfce4-session/xfce4-session_4.10.0.bb          |    6 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch
new file mode 100644
index 0000000..41a527c
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/files/0003-configure.in-hard-code-path-to-iceauth.patch
@@ -0,0 +1,40 @@
+From a629b051f4e5462150c77b95574bbc7a33bc9666 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 31 Dec 2012 16:35:29 +0100
+Subject: [PATCH] configure.in: hard code path to iceauth
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+workaround AC_PATH_PROG which was meant to find programs required at build-time
+not at run-time.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.in |    8 +-------
+ 1 files changed, 1 insertions(+), 7 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 3cf3510..505e744 100644
+--- a/configure.in
++++ b/configure.in
+@@ -111,13 +111,7 @@ XDT_FEATURE_DEBUG([xfsm_debug_default])
+ dnl Check for linker optimizations
+ XDT_FEATURE_LINKER_OPTS()
+ 
+-dnl Check for iceauth
+-AC_PATH_PROG([ICEAUTH], [iceauth])
+-if test x"$ICEAUTH" != x""; then
+-  AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceauth])
+-else
+-  AC_MSG_ERROR([iceauth missing, please check your X11 installation])
+-fi
++AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$bindir/iceauth"], [path to iceauth])
+ 
+ dnl Find a location for the session desktop file
+ AC_MSG_CHECKING([what xsession-prefix to use])
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 3bd3743..6ad834d 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -4,14 +4,16 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
-PR = "r1"
+PR = "r2"
 
 inherit xfce
 
 SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
 SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a72c46ce"
 SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch \
-            file://0002-Remove-gnome-keyring-remains.patch"
+            file://0002-Remove-gnome-keyring-remains.patch \
+            file://0003-configure.in-hard-code-path-to-iceauth.patch \
+"
 
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
-- 
1.7.4.4



