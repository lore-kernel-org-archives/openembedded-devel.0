Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4B5782B5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jul 2017 01:55:53 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id 123so2668808pgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xyk/O5wBNEECj5ODPlD/4HSjdfqiYn/cHqULFEma67w=;
	b=AbL3XY4P3fDL10jBi7zAVk8tG/MzmmbNBQA5xAYOXubTXJkoFukAaw1525XD2bLuot
	XcwQVBRRmQkE2IcMSmtfMc55ZXTJuYV6SJB/FlHT+EQ2l6gHfnD8gWvbQNOaeZX/O5LW
	0KdVsAxiRNdFNDs5SyrOZ1N/3dd+TcVi6Bu7LMJSfF+BV+q/LD2ofRNksAthUNBTxQ7h
	P3fjxjhY8URtDYTY8td18fX31ihRh5+pZ+r2iSxM5FvnrmPxqRTmDSoUosyn9B1G8rPu
	aokhddL4q4oX8smnMNEzoZCdBdhRx4fAEkemp0eY0JbCjEyTpfrACc5FRl5FAR7asrND
	H1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xyk/O5wBNEECj5ODPlD/4HSjdfqiYn/cHqULFEma67w=;
	b=trKAvWZIYYBtmIAoco04iz/X1asKFLbQ4BpbH11EaHQxn0NKIBMpT3mrTbMa/shNnn
	sCB4r0uHYS92oGxNBcLp8KqPf99JZ7dOq4lpVsopSAdJ1fTUVggOEfm+w1f4P/dIHXD5
	ZyPS+v5GsXwO3c18g8NXDJsXzIP/uRYqtKxcXod7lJWfRhnj1UHwUkrBbkdGMjp+pIMk
	C0bEgvyX9rItVqNqy3bWUtR6kYQk96npgzXo6TERY01ZzNUx4m/+V7K5PaBlBNf4zIO8
	GE5FE3gCRx9vfrwWJeb/NShh+vq8ySlJZRBbVQmoUmx73TMS561tlDvdxXApeQK8WPxy
	g7fw==
X-Gm-Message-State: AIVw110D3f4sLCCUqxbgEDbRIBpjMI8sR/hXuiCX/g74oxohTNCGw54E
	4swbykvoROAznFE4
X-Received: by 10.84.241.135 with SMTP id b7mr18907721pll.107.1500083754180;
	Fri, 14 Jul 2017 18:55:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l4sm18189589pgr.21.2017.07.14.18.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 18:55:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 18:55:38 -0700
Message-Id: <20170715015539.31584-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170715015539.31584-1-raj.khem@gmail.com>
References: <20170715015539.31584-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH V2 5/6] monkey: Link in libexecinfo on musl
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
X-List-Received-Date: Sat, 15 Jul 2017 01:55:54 -0000

Needed for backtrace() APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-configure-Respect-LIBS-variable-from-env.patch | 29 ++++++++++++++++++++++
 .../recipes-httpd/monkey/monkey_1.5.6.bb           |  9 +++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch

diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
new file mode 100644
index 000000000..7a229513b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
@@ -0,0 +1,29 @@
+From b0526a9b5325bd4758dad8d14efd85c98ef2ebff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 18:25:23 -0700
+Subject: [PATCH] configure: Respect LIBS variable from env
+
+For musl we need to pass -lexecinfo from env
+this change accomodates that
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 4286c34..f1c65db 100755
+--- a/configure
++++ b/configure
+@@ -620,7 +620,7 @@ LIBDEFS = -DSHAREDLIB -fPIC \$(DEFS)
+ INCDIR  = ./include
+ LDFLAGS = $LDFLAGS
+ DESTDIR = ../bin/monkey
+-LIBS    = -ldl $libs
++LIBS    = -ldl $libs ${LIBS}
+ OBJ     = monkey.o mk_method.o mk_mimetype.o mk_vhost.o mk_request.o \\
+           mk_header.o mk_config.o mk_signals.o \\
+           mk_user.o mk_utils.o mk_epoll.o mk_scheduler.o \\
+-- 
+2.13.3
+
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
index be8ed37b9..97dc2769a 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
+DEPENDS_append_libc-musl = " libexecinfo"
+
 SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
+           file://0001-configure-Respect-LIBS-variable-from-env.patch \
            file://monkey.service \
            file://monkey.init"
 
@@ -24,7 +27,13 @@ EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --disable-plugins=mbedtls \
                 --debug \
                 --malloc-libc"
+
+do_configure_prepend_libc-musl() {
+	export LIBS="-lexecinfo"
+}
+
 DISABLE_STATIC = ""
+CLEANBROKEN = "1"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
-- 
2.13.3


