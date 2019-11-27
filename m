Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 490787F7B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:00:41 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 193so10551019pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 00:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A9mBYLfh6Ls0mwfssQLeOQSV62wC4ZpCmk4EZTZInG4=;
	b=i8DhhnjdLjgQTqanH9bWF103z4kMYWuRjKKwL09SOyht1Yn/7ZQ1R4KGTW0b9clr22
	mXLeschCNzWZO99+vv3X52vO7z7PofstaSldD6bnaNwFDVHFxG/Cnf0/R2oVX47+Iv2+
	tyrBNU09sPj/OMANfCXcsa3omwCU0WxZZxKrt/w2Wx7gxNkfPU3VgWfU6+wyw/7TMtDe
	rLs4NdTvO7aE8cCTAQiSO2zTsQiVZ5iYpkbGxI8rfi6pPvQQXX8K2j5ZkB3CrV9LdUmT
	EK9Dg23TF4pchtJCodEv6GV2s4sV/t+e+133xrvtWgrkRYsCKxZsHqgpO/jgaamuH8ZB
	Wjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A9mBYLfh6Ls0mwfssQLeOQSV62wC4ZpCmk4EZTZInG4=;
	b=UXF4zFZXv9jO4infWQlpj60lp3LtKUuPG+pDjB8z47RN4TonsOEdGW/TLvALHR9lWp
	gGbHqh/3rXoDEzM6zzh/Ny6RvJ17AMRl+AEagtedTmqT4Kklrg5miBqu8Q12m2J5OsiW
	gEZL4Fb+xJ80zHIYVkECr8frtGZG7fC0RAm/n3dyBwGvTMCVD/Pq6A1NALFOXIY8BSOa
	tstMxn+O050YxQJdZYifIZ4qC09pkhPcwV4ks2X8I/5K8xAR7SL5KQ5bsF06AxOR9hr8
	2vUvUtI3V6BK2jtTOUyulVMIAeDhb58Xx61olMlc81jnC8jq7Ajh3UWjt/BPJI6KGNDL
	e2vQ==
X-Gm-Message-State: APjAAAWVsWKzTy/kiHrQw2df7UK1cTlC7Mg8zFP1qViKr8Rt2bUsXeKo
	xzD7yNXEN7kceLTLr3BnaXzfUIQeok0=
X-Google-Smtp-Source: APXvYqyu+B3HiZ6qIkXixO/RxWC8XwtGTUa3dwp9tqcSkxBea6/IzOoqnwylnyOslqvqz1HpexHrEg==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr3460358pgl.271.1574841641563; 
	Wed, 27 Nov 2019 00:00:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	c28sm15070979pgc.65.2019.11.27.00.00.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 00:00:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 00:00:28 -0800
Message-Id: <20191127080028.823495-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pidgin: Use python3 during build
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
X-List-Received-Date: Wed, 27 Nov 2019 08:00:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pidgin/pidgin/use_py3.patch               | 20 +++++++++++++++++++
 .../recipes-support/pidgin/pidgin_2.13.0.bb   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/use_py3.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch b/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
new file mode 100644
index 0000000000..c7b4163cb5
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
@@ -0,0 +1,20 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -1488,7 +1488,7 @@ AC_ARG_WITH([python],
+ 
+ if test "x$enable_dbus" = "xyes" || test "x$enable_consoleui" = "xyes" ; then
+ 	if test -z "$PYTHON" -o "x$PYTHON" = "xyes"; then
+-		AC_PATH_PROG([PYTHON], [python], [no])
++		AC_PATH_PROG([PYTHON], [python3], [no])
+ 	fi
+ 
+ 	if test x"$PYTHON" = x"no" ; then
+@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently
+ dnl (Thanks to XChat)
+ if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
+         AC_MSG_CHECKING(for Python compile flags)
+-        PKG_CHECK_MODULES(PY, python, [
++        PKG_CHECK_MODULES(PY, python3, [
+                 AC_SUBST(PY_CFLAGS)
+                 AC_SUBST(PY_LIBS)
+         ], [
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
index b4944258fa..fdc79e81b2 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
     file://sanitize-configure.ac.patch \
     file://purple-OE-branding-25.patch \
     file://pidgin-cross-python-265.patch \
+    file://use_py3.patch \
 "
 
 SRC_URI[md5sum] = "423403494fe1951e47cc75231f743bb0"
-- 
2.24.0


