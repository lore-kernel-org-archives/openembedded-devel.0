Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4702C7DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:39 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id k21so25763263edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KzPG5/RnCb+bY9Uzcrgbfzb1VeIKixroYm8IcOgm5Pw=;
	b=eyMuOHTIeDqERQxfWsYE9U+ZfULaCeMxuZ0ydfaShnpx3dcR6B0a/GmxNGx+NkIzrF
	vY16un9OO1weTtLPFTvaPLZMbldXY4fgnxAu0QVOFOhGce+FyxuLUPyEManrrxXfDd2i
	JUopVtAO5gUFC3V8WP6QfW6xhOXLhaev/KMlAtKllDzRj/j+aAAt6HV45Oqra07qnMIP
	OosMAidoUhRKx8ttb6jOxvP8V0mfIb/QEChsQjm2A2nakmfo8STGGhOptjavjQ+j7i3Q
	xgdPOReudR+nyKnhJ/MuJ44AWeycm2WHIjvUIa3S0kvU+WHEdQd51OBEzoc/F+CJk6r/
	e42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KzPG5/RnCb+bY9Uzcrgbfzb1VeIKixroYm8IcOgm5Pw=;
	b=gC5koNwmVYfegfD04tW9y0+WONtUQmrQ7Uh/yDphq/Lk80zmjS/qwiQLwqa879/+Ti
	pMvUt6aMod38C1TZuu/ImqytfwfYVC6KiEMUZwdqwyQMXTdOnk8eEPhlLyPUayJIMT4J
	FOAJccjtDGttxkF3BrtBtcOrOwqDLahfajKz8MsZBC+TbOOYI9xAgAqKyArZ7c2jOSXI
	BI2/Xs2nb97L3BeAH/5OFg9Fp3pZHOyxLWpY392/VcDDdpg2MoDQZhSavSkoeW5Mv9Lz
	eEr8AJ5fm/7SjhUhTUSqueFbKZhP+YbnLEHPWHPCmAczyw2hGTZxwq7RMs7KiOUTQ0AE
	KWqA==
X-Gm-Message-State: APjAAAWGdFZc4at6hXNpZ/C227cuHN8vFXDusQ38kdsq4O5MNsIs6dnY
	Sufz6JmBaIo6t6wZXuFjesB3NS010DA=
X-Google-Smtp-Source: APXvYqyGnQOYb3AU/qApDLawCTsa6aO1pyQLTdU2T3KA2b0KPNCyd4BaB5sSzyPec66zLe6NyKMqqQ==
X-Received: by 2002:a17:906:4b18:: with SMTP id
	y24mr22670571eju.108.1561449159778; 
	Tue, 25 Jun 2019 00:52:39 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:38 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:09 +0200
Message-Id: <20190625075223.13585-10-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 09/23] rxtx: Fix path of javac
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:39 -0000
Content-Transfer-Encoding: 8bit

rxtx was wrongly using the patch from cacao sysroot.

Fixes:

| /bin/bash: /workdir/build/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/recipe-sysroot-native/usr/bin/javac: No such file or directory
| Makefile:834: recipe for target '/workdir/build/tmp/work/dbfp4-poky-linux/rxtx/2.2.0-r2/rxtx-2.2pre2/gnu/io/UnsupportedCommOperationException.class' failed
| make: *** [/workdir/build/tmp/work/dbfp4-poky-linux/rxtx/2.2.0-r2/rxtx-2.2pre2/gnu/io/UnsupportedCommOperationException.class] Error 127
| make: *** Waiting for unfinished jobs....

Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-extended/rxtx/files/javapath.patch | 23 ++++++++++++++++++++++
 recipes-extended/rxtx/rxtx_2.2.0.bb        |  5 +++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/rxtx/files/javapath.patch

diff --git a/recipes-extended/rxtx/files/javapath.patch b/recipes-extended/rxtx/files/javapath.patch
new file mode 100644
index 0000000..e0c1737
--- /dev/null
+++ b/recipes-extended/rxtx/files/javapath.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+
+diff --git a/configure.in b/configure.in
+index 1778a52..344f5ac 100644
+--- a/configure.in
++++ b/configure.in
+@@ -484,10 +484,10 @@ if test "$CC" = "gcc" || test "$CC"="egcs"; then
+ 		;;
+ 	*)
+ 		find_java_native_include jni_md.h
+-		JAVAH="\$(JPATH)/bin/javah -classpath \$(CLASSPATH) -d \$(DEST) -jni"
+-		JAVAC="\$(JPATH)/bin/javac -classpath \$(CLASSPATH) -d \$(TOP)/ -O -source 1.3 -target 1.3"
+-		JAR="\$(JPATH)/bin/jar"
+-		JAVADOC="\$(JPATH)/bin/javadoc"
++		JAVAH="gjavah -classpath \$(CLASSPATH) -d \$(DEST) -jni"
++		JAVAC="javac -classpath \$(CLASSPATH) -d \$(TOP)/ -O -source 1.3 -target 1.3"
++		JAR="fastjar"
++		JAVADOC="javadoc"
+ 		CFLAGS=$CFLAGS" -D_BSD_SOURCE"
+ 		;;
+ 	esac
diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index d4fbb9d..8216e26 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Full Java CommAPI implementation"
 DEPENDS = "virtual/javac-native"
 LICENSE = "RXTXv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32303a23463f90b12a7d1dafb8deabf4"
-PR = "r2"
+PE = "1"
 
 SRC_URI = "http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip \
            file://zsystem_init_exception.patch \
@@ -19,7 +19,8 @@ SRC_URI = "http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip \
            file://usb_38400.patch \
            file://fix_snprintf.patch \
            file://format_security.patch \
-           file://0001-Support-Freescale-i.MX-serial-ports.patch"
+           file://0001-Support-Freescale-i.MX-serial-ports.patch\
+           file://javapath.patch"
 
 SRC_URI[md5sum] = "7eedb18e3f33a427e2b0e9be8ce3f94c"
 SRC_URI[sha256sum] = "3c30373e760f444def3650c76c5a00ae12fb1d860ec008750d084f4880495b03"
-- 
2.20.1


