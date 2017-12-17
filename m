Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 79AB677E87
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:21:59 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id w95so1247437wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PFe5XTS2SqZ2oy0aBPOc+ggOFotHJs2FdidNAi922sY=;
	b=gRuyr31tlauygAKHO8xq/CHJZT6sR4Nv76mSZIunBLXS06TdCTF1sz6C++664Z6ym/
	vVYIX9uGeksvkIHq+9Tp4eIZQwp8KfIUwDFIvnk3UBYTY0LhpL133KEaC9BHYcXGNxMi
	IytyItiphoUZGVm8bq2cLU1ep5hOmo6fZ62oJ5DNODS5gPnA8cbKOnVZLQEUGT6J6Dj0
	Sjm/tmA3YVhG3HdyZHTSyM8JdF2Lv29mEyTm5IHjBBbc6esmHrFtdxyH7JShYOzemqwh
	5WVrPB/erj10baeoR7NM55om2Gv68RQxMEk3SKp4cSQwZ0P/+Zk0U/eBUr85BeWZYiju
	QzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PFe5XTS2SqZ2oy0aBPOc+ggOFotHJs2FdidNAi922sY=;
	b=Qh+UYqw0hv75nFVKMx7Auqxxj1SrkBF5n7lt6ovuP+YNQFGq/YwPNA6axzB2uDL8i8
	TdHBG+raIRV8wVeSawa59Qv8/SDlsgVsqeqFhP800LQdz7mJG/+P9rbHM2BCsVpJ9TCz
	rAY8Djrd/QD1LzwxLwGk96NwCQsj2ANDW/5CUAOq5RF7GeZRTYWakEiJowuO17t1Whby
	FLrFyfblJd/xSbTEZ2jZJXPXIEQZPPy9Mqahn5u9VOYQXQOqkLIX8/SpV+H+QKY5b/0Z
	zUOY0aJVTVueNpXUHB6cS1QU2U/y6loTOoQqRDAyeQLB2FGWxzuBsjKkSGBEVt9+aPtO
	94cA==
X-Gm-Message-State: AKGB3mI+PmsbK7/A8ESCkoarvI9l6JGWGJui1p0KfJjWTXURVWHafIw8
	CKzQbbh9oZ7QEZKc7UeYmNH3rQ==
X-Google-Smtp-Source: ACJfBov0yxZ85nBjFV2/axlFkpkmcQmiryNXaRjsuZR7hJdaPzzdDOgmSUFLK+gr0jFCWmhHb3FQmg==
X-Received: by 10.223.180.69 with SMTP id v5mr14852527wrd.193.1513534919874;
	Sun, 17 Dec 2017 10:21:59 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.21.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:21:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:40 +0100
Message-Id: <20171217182144.21123-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 4/8] plymouth: fix path to systemd-tty-ask-password-agent
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
X-List-Received-Date: Sun, 17 Dec 2017 18:22:00 -0000
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


