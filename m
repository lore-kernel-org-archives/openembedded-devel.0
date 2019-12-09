Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id E960460807
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:52 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d16so14073134wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/T7/taY5N9+s6KWXg1HSX3I8yJSnQyCLGjwvPp4nxhk=;
	b=TmrchZ7DgTlZjGLL7VpQTOwDP//kGWBJFgPbAImS19RdpV17DD3KjIeUUmeB0JULap
	RQtF1HlvTJPSjXj/BGEtVH3LQZuTWnzLAg5xszxd+T9a8eLpnMqy1vjqnxJgWP3C9EGT
	Tsw0VRrREYFoy3DCAzJUshatcsqTv8Bh4Fj2md+vUzFbLlfqXfkP+tB8H/C5XKXZVEjp
	8KWodOVmsckJT3Aq0l8BHIMQTnyMuAdmZW3srqieknNiWUsFxmAorje/2o5lC63+GgRo
	oXlZDF1FJ1LXnLQ5Yy5oHzaN3p3z5QxbGWMout3M5LyWZ7LvxzWvFcpnoSaLS4NmSlSC
	DdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/T7/taY5N9+s6KWXg1HSX3I8yJSnQyCLGjwvPp4nxhk=;
	b=PZWUwBjJuRuGSsm4K97NfY7M58IQyc5LsgzXVe16PT3Hz45Xt+K/o8dINKiTRvANxz
	QFX9+RwsFwHNjzNytMUoOtI6r7z4H6lQc6BLoIoGxCetG08NIuwZm+LWU3KZ/74oBy85
	lvNJat42tIhr85lcHcGvsn/SlZjK7pUBXlczU6PP0r9D1nLZvoD/Fl1vSqye3JDFf+f2
	2woYeMG1BJcZOIgKrg3pou3PiKq9my2WqJkGkOz3WUC5tUieZAXsAwqNqZZjcnqj5hYO
	bVPofDOqzu5Txc+Zhe9BKmbU6Z7tPqs91e8KyiCpCDWb16xJlVjM/Ky23GKoKo2NMCPv
	Em7A==
X-Gm-Message-State: APjAAAX37pdyWmlam79BQ4g3ZjBWxMrR/zqPZ8JxOvJWQfUS4fTCbrhD
	ZZYL/RBp2ciDD5MsbqMqIhF5cAxf
X-Google-Smtp-Source: APXvYqwi1LldWZR3g+6BkNOdvaTuoacdwW0MYwiNgdsvHxfXG6BpSrGacTmF3/k/PEa/0huC9cXgvg==
X-Received: by 2002:a05:6000:1044:: with SMTP id
	c4mr28442480wrx.204.1575851933374; 
	Sun, 08 Dec 2019 16:38:53 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:13 +0100
Message-Id: <20191209003840.3383-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/29] gnome-keyring: upgrade 3.28.2 -> 3.34.0
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add upstream-version-is-even to inherit
* they moved to gettext-only translation
* add PACKAGECONFIG ssh-agent enabled by default
* RDEPENDS do not seem to make sense these days
* prettify recipe

[1] https://download.gnome.org/core/3.32/3.32.2/sources/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-agent-and-ssh-add-by-configure-opti.patch | 42 +++++++++++++++++++
 ...ring_3.28.2.bb => gnome-keyring_3.34.0.bb} | 33 +++++++++------
 2 files changed, 62 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_3.28.2.bb => gnome-keyring_3.34.0.bb} (40%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
new file mode 100644
index 000000000..32eecf8fb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
@@ -0,0 +1,42 @@
+From e6464e01bc1cdf5496be2942d1bac41aa609f47e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 23 May 2019 23:44:06 +0200
+Subject: [PATCH] Set paths to ssh-agent and ssh-add by configure options
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We have no executables in our sysroot so configuration won't find them.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4b83664..eda0c96 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -351,8 +351,15 @@ if test "$enable_ssh_agent" = "no"; then
+ 	SSH_AGENT=false
+ 	SSH_ADD=false
+ else
+-	AC_PATH_PROG([SSH_AGENT], [ssh-agent], [no])
+-	AC_PATH_PROG([SSH_ADD], [ssh-add], [no])
++    AC_ARG_WITH([ssh-agent-path],
++                [AC_HELP_STRING([--with-ssh-agent-path=PATH],
++                                 [path to ssh-agent])],
++                 [SSH_AGENT=$with_ssh_agent_path], [SSH_AGENT=no])
++    AC_ARG_WITH([ssh-add-path],
++                [AC_HELP_STRING([--with-ssh-add-path=PATH],
++                                 [path to ssh-add])],
++                 [SSH_ADD=$with_ssh_add_path], [SSH_ADD=no])
++
+ 	if test "$SSH_AGENT" = "no" -o "$SSH_ADD" = "no"; then
+ 		AC_MSG_ERROR([the ssh-agent and ssh-add commands were not found])
+ 	else
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
similarity index 40%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
index a84c218e6..52c254b28 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
@@ -9,10 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit features_check gnomebase remove-libtool gettext upstream-version-is-even
-
 DEPENDS = " \
-    intltool-native \
     glib-2.0-native \
     gtk+3 \
     gcr \
@@ -20,21 +17,24 @@ DEPENDS = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
 "
 
-SRC_URI[archive.md5sum] = "284580f954f762caf62aed2ae7358177"
-SRC_URI[archive.sha256sum] = "81171b7d07211b216b4c9bb79bf2deb3deca18fe8d56d46dda1c4549b4a2646a"
-SRC_URI += "file://musl.patch"
+inherit gnomebase gsettings features_check remove-libtool gettext upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
+SRC_URI[archive.md5sum] = "7c8fd85e46ed4ba1add0288b2ead9aec"
+SRC_URI[archive.sha256sum] = "e9cda9542a3e37c61636145e7e9e2513c569092ea8020752a834e1f40ad41943"
+SRC_URI += " \
+    file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
+    file://musl.patch \
+"
 
-EXTRA_OECONF = "--disable-doc \
-                ac_cv_path_SSH_AGENT=${bindir}/ssh-agent \
-                ac_cv_path_SSH_ADD=${bindir}/ssh-add"
+PACKAGECONFIG ??= "ssh-agent"
+PACKAGECONFIG[ssh-agent] = "--enable-ssh-agent --with-ssh-agent-path=${bindir}/ssh-agent --with-ssh-add-path=${bindir}/ssh-add,--disable-ssh-agent,,openssh-misc"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-PACKAGECONFIG[pam] = "--enable-pam --with-pam-dir=${base_libdir}/security, --disable-pam"
-PACKAGECONFIG[ssh-agent] = "--enable-ssh-agent,--disable-ssh-agent,,openssh-misc"
+EXTRA_OECONF = " \
+    --disable-doc \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)} \
+"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1/services \
@@ -42,3 +42,10 @@ FILES_${PN} += " \
     ${base_libdir}/security/*${SOLIBSDEV} \
     ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
 "
+
+# fix | gnome-keyring-daemon: insufficient process capabilities, unsecure memory might get used
+# This does not make it through pseudo so perform on-target - sigh
+pkg_postinst_ontarget_${PN} () {
+    setcap cap_ipc_lock+ep `which gnome-keyring-daemon`
+}
+RDEPENDS_${PN} += "libcap-bin"
-- 
2.21.0


