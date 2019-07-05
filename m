Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 780D07ED20
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w20so7952846edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+a8oo7jHwsTfohCDjN2TPvxCraFzrG3VN4xQdoYv7D8=;
	b=VA4+Z6t7wyI38Zj8nuuoDmpq9XO2IfdJzSHHewtJlOc6vyc3W6DdCdTrhwszGFIYKw
	zBg+RalBu5unB/tZYuHhESPH8WB6wgxn82AB6iRQDa+l/D/Ca3atZdVABAn4cIWFjZB9
	uoTEaaLcS8kfhXlbWUNSYisZaW0fIYF/NGMHKD/NUJRJSOYsBf0phe4KQA/DVvetDyjR
	nRxY+yipatQmeK0Dcd3ePy3yW+xNdb3hx/06fMtTmkH6FVfeyAoUzcOcf0ba0fY+69+1
	U87CjT40ilXjMyjsXAmMsV1zC2tY/Ob4yZM5IGNpFwcxiGinOzT8gnn2mlEBkkZFYGw4
	TfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+a8oo7jHwsTfohCDjN2TPvxCraFzrG3VN4xQdoYv7D8=;
	b=mCttMv/suku/Bd3h+O/5RjyndEYe0ag6iw1f8umuP4jiZM3ZGgqlc8m0VqErTEBasX
	Cf3Ij5rEEz0d5WklldzGCoxeGd5MITUK1+OEgoCqQp3zVYdD8K2qIaBfXNJ2VpCYcYGJ
	EFk2VXDnkCR9EyIh3E5NWc6G5t4jeN7jtu+tOnvV8hzC3QUS9oqw0wiIv8ZRjJ3tDc9V
	MmprkNpRYu5ULf5e0pXeREQFxP99jAv9VPrT/eIUVhdJEo42nw5AZWPrzsk5VUD9gQ9g
	TmfnZY28PVs77Xk1GA5dA33GuzpUYlkWoV6ARc6oHVEEMtJ3R0Kw+cv7AsS17ba3ozY8
	A/rQ==
X-Gm-Message-State: APjAAAWFw5X16/pE9vv4M5jODGw1u9tEqTeP3IdQ5mWYTdahZxnk25qQ
	jLgkbuDo5FZaQembGVdC1GQsjzt4VBc=
X-Google-Smtp-Source: APXvYqxLLtFhpVnWbvkggv6759KM7FJOssZnmCbg1OXgc6wMEiBp3R6Jrduh90xJWODvpj2lvI+r/A==
X-Received: by 2002:a50:9799:: with SMTP id e25mr2836271edb.79.1562325536844; 
	Fri, 05 Jul 2019 04:18:56 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:55 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:10 +0200
Message-Id: <20190705111824.22255-10-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 09/23] rxtx: Fix path of javac
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:57 -0000
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
index d4fbb9d..87d84a8 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Full Java CommAPI implementation"
 DEPENDS = "virtual/javac-native"
 LICENSE = "RXTXv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32303a23463f90b12a7d1dafb8deabf4"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip \
            file://zsystem_init_exception.patch \
@@ -19,7 +19,8 @@ SRC_URI = "http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip \
            file://usb_38400.patch \
            file://fix_snprintf.patch \
            file://format_security.patch \
-           file://0001-Support-Freescale-i.MX-serial-ports.patch"
+           file://0001-Support-Freescale-i.MX-serial-ports.patch \
+           file://javapath.patch"
 
 SRC_URI[md5sum] = "7eedb18e3f33a427e2b0e9be8ce3f94c"
 SRC_URI[sha256sum] = "3c30373e760f444def3650c76c5a00ae12fb1d860ec008750d084f4880495b03"
-- 
2.20.1


