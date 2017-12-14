Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 63C88788A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 10:10:13 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b76so10377092wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PFe5XTS2SqZ2oy0aBPOc+ggOFotHJs2FdidNAi922sY=;
	b=YTA7uywjBIQThe1UI2wPrBrINpThaIjz5tjlifWHx5gY7iqQIBrXgrZ75qxJFY1vPG
	gJ5nNABQXuaOSz4A14UhrQu2+Xl74x7MFV3p8IpmQpnrOPvFSEVpeh/bMdHUecl5A6x1
	ZwSgcALAEC9VANH/IZjx1IsLXo8WHKo4KyQkD93kvGqmoJ1GmeCrxbY09WdrByzmdpI1
	TjEUi/hV4REIaZLLt6tjM+FMKPkr37eVhsZ4bzZuKERFfgRDg5z2g8My06yEZ/k7WUnM
	JM2gLx07L5A9KuFV+8OPeRuKAWAU1nXeUVG8JAdHjQ/wgsZ8Oq+RIUwESumrZpvKGmTc
	X13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PFe5XTS2SqZ2oy0aBPOc+ggOFotHJs2FdidNAi922sY=;
	b=oJsrEgId34sKQ0LqBjVuOWEzD7NCTNuvu4tL8AXjWbGkMzqYwDCAw5x3H885t2vyBF
	L4XLgqU/FZKP+HN+LjtwUKU4pqesPNMkzCcxUCXUqS5r2QZLFzXAFm7H9m4sDy5YdRp0
	GILvbcRjPvJmSGkPIvvB0jHtnntqJ7m+A2cWrKLtMlNCH4AFOO3C+a7hEssR6h4qGL13
	3fDnE1As6QBMqnwe3u41a8YcYsNRiXPydks24Et6mooDxbr3hGzZmsU0sgsTl/yhSGKx
	nCWdM7Ntpwn1/WthW16IB9Tl56yaV80OgWiRkTChRbdrffReWxhCTV32niJCQ/tpxdT0
	ypkA==
X-Gm-Message-State: AKGB3mKneL6DXs6RjUA3zEYgASAaeDXq4L34VBwUuQEAQYiNSZRtqxsb
	9Vh0fG/rAKcqKyfGouTiSEfsUA==
X-Google-Smtp-Source: ACJfBovZ4Bx6NwWa+CsyfIdipCLtY+5OtnCoedqXWO39BV9k5AigFeHZUbyBnHn06WpTHTZTDHKDHQ==
X-Received: by 10.28.125.85 with SMTP id y82mr1472859wmc.25.1513246214620;
	Thu, 14 Dec 2017 02:10:14 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id c3sm1840174wrf.21.2017.12.14.02.10.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 02:10:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:09:29 +0100
Message-Id: <20171214100929.11094-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171214100929.11094-1-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] plymouth: fix path to systemd-tty-ask-password-agent
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
X-List-Received-Date: Thu, 14 Dec 2017 10:10:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In pre recipe specific sysroot times AC_PATH_PROG detected host's
systemd-tty-ask-password-agent. In my case that path was wrong and
systemd-ask-password-plymouth.service failed silently.
Now with recipe specific sysroot and no link in PATH to buildhost,
SYSTEMD_ASK_PASSWORD_AGENT remains empty and that causes:

| systemd[1]: /lib/systemd/system/systemd-ask-password-plymouth.service:12: Executable path is not absolute, ignoring: --watch --plymouth
| systemd[1]: systemd-ask-password-plymouth.service: Service lacks both ExecStart= and ExecStop= setting. Refusing.

For both environments this patch fixes log-off from X-session to
display-manager. Before this patch screen went dark and it seemed that X-server
was restarted.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ath-to-systemd-tty-ask-password-agent-con.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb    |  7 +++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch b/meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
new file mode 100644
index 0000000..6a86c76
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
@@ -0,0 +1,34 @@
+From 746c690f57b52e6fe21cc2a11b5bb71d25af3128 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 13 Dec 2017 16:15:57 +0100
+Subject: [PATCH] Make full path to systemd-tty-ask-password-agent configurable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index aad673e..6b37179 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,7 +48,10 @@ PLYMOUTH_LIBS="-lm -lrt -ldl"
+ AC_SUBST(PLYMOUTH_CFLAGS)
+ AC_SUBST(PLYMOUTH_LIBS)
+ 
+-AC_PATH_PROG([SYSTEMD_ASK_PASSWORD_AGENT], [systemd-tty-ask-password-agent])
++AC_ARG_WITH(systemd-tty-ask-password-agent, AS_HELP_STRING([--with-systemd-tty-ask-password-agent],[path of systemd-tty-ask-password-agent]),SYSTEMD_ASK_PASSWORD_AGENT=${withval},SYSTEMD_ASK_PASSWORD_AGENT=/bin/systemd-tty-ask-password-agent)
++AC_SUBST(SYSTEMD_ASK_PASSWORD_AGENT)
++
++# checked: UDEVADM is not used
+ AC_PATH_PROG([UDEVADM], [udevadm])
+ 
+ AC_ARG_ENABLE(pango, AS_HELP_STRING([--enable-pango],[enable building with pango, disabled there is no encryption prompts]),enable_pango=$enableval,enable_pango=yes)
+-- 
+2.9.5
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 6b24ed2..7e8d6e3 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -16,13 +16,16 @@ DEPENDS = "libcap libpng cairo dbus udev"
 PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash virtual-psplash-support"
 
-SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2 \
+    file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
+"
 SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
 SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
     --with-logo=${LOGO} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '', d)} \
 "
 
 PACKAGECONFIG ??= "pango initrd"
-- 
2.9.5


