Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 93D3E73CB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:23:12 +0000 (UTC)
Received: by qgf60 with SMTP id 60so13738206qgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=TNn5kPcvKeOa7vlZzUcXOfIb/Tx+JPIHOnXMDyUeZWM=;
	b=VYQAyKB9XEy2560T+b6sxtkXqByiYtVWeCvmyiwlsCLMpJYU4RNnp/aQUgtmkQcfGJ
	y/Tm/kLchxI4AUl6BAXQsw2kP7V+KgbG3nAdBIhKRxRk182xABk6QxKyqXns1/SblUEP
	v7lCmefcHOjQrvrJfh2ea/cSHOHAOYXA4wAcYItXUFfwxaTKWxV4tg40f0E2g+vMIK7H
	K8mLjJaSJufz48JtHjJnxpqfwZNQbR6bXrqJv62ve3h09pbazQV/D158w437dR+RWmaL
	wZSIikAv3l9JKF5u5iJK/c+mL+XBlPg+kWAAzDpmc6H/vxt1bLzuONmo+u2F1+/HWs1m
	EWxg==
X-Received: by 10.229.122.70 with SMTP id k6mr33674669qcr.27.1427808193618;
	Tue, 31 Mar 2015 06:23:13 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id q129sm9859631qha.4.2015.03.31.06.23.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Mar 2015 06:23:12 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2015 10:22:37 -0300
Message-Id: <1427808158-16502-4-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
References: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 4/5] openjdk-7: add /usr/lib/jni to DEFAULT_LIBPATH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2015 13:23:14 -0000

Some recipes install JNI-based bindings into /usr/lib/jni (e.g.,
rxtx), so it's sensible to add this directory to DEFAULT_LIBPATH
(java.library.path).  That's also how Debian does.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch  | 19 +++++++++++++++++++
 recipes-core/openjdk/openjdk-7-release-25b30.inc      |  2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch

diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
new file mode 100644
index 0000000..fb48879
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
@@ -0,0 +1,19 @@
+From: Mario Domenech Goulart <mario@ossystems.com.br>
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+---
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2015-03-30 13:43:43.433168285 -0300
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2015-03-30 13:45:57.601833592 -0300
+@@ -388,9 +388,9 @@
+  *        7: The default directories, normally /lib and /usr/lib.
+  */
+ #if defined(AMD64) || defined(_LP64) && (defined(SPARC) || defined(PPC) || defined(S390))
+-#define DEFAULT_LIBPATH "/usr/lib64:/lib64:/lib:/usr/lib"
++#define DEFAULT_LIBPATH "/usr/lib64:/lib64:/lib:/usr/lib:/usr/lib64/jni:/usr/lib/jni"
+ #else
+-#define DEFAULT_LIBPATH "/lib:/usr/lib"
++#define DEFAULT_LIBPATH "/lib:/usr/lib:/usr/lib/jni"
+ #endif
+ 
+ #define EXTENSIONS_DIR  "/lib/ext"
diff --git a/recipes-core/openjdk/openjdk-7-release-25b30.inc b/recipes-core/openjdk/openjdk-7-release-25b30.inc
index 3b7d84e..9888ce3 100644
--- a/recipes-core/openjdk/openjdk-7-release-25b30.inc
+++ b/recipes-core/openjdk/openjdk-7-release-25b30.inc
@@ -81,6 +81,7 @@ ICEDTEAPATCHES = "\
 	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
         file://icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch;apply=no \
         file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
+        file://icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch;apply=no \
 	"
 ICEDTEAPATCHES_append_powerpc = " \
 	file://icedtea-jdk-ppc64-jvm-cfg.patch;apply=no \
@@ -112,6 +113,7 @@ DISTRIBUTION_PATCHES = "\
 	patches/icedtea-jdk-nio-use-host-cc.patch \
 	patches/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch \
 	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
+	patches/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch \
 	"
 
 DISTRIBUTION_PATCHES_append_libc-uclibc = "\
-- 
2.1.4


