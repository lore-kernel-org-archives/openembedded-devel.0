Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 83A1B78379
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:23 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id j23so2723900wra.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NLhG2yLtqvQx0aHbKVUkbUjtKJ/78DSimRmLG10sRyg=;
	b=bNiOaweXaXiSr+3LuzmTqO0AGdpzrhD4kpl2CKuQxAQ7/pukE9Fz61IiyVeKTwQabd
	nebZahUPnFe/ihEOTdR0o9cVzb2uttg5skkWfP2lDtFzF0ZNncsvlbJUY9SqExWu/+JA
	BqYU18OCoKtuBZql3DJthX3jcSF8S5wbUdlvmz62ORGqGcO2LrmA6RYHsmdxg1RK5Njw
	aoHb2Yzaj3Kq+O4crCIXMEYbAxTLwmGOnjGSdwhwb1o4gEzQ210B0jh+R8R25wScQ1eb
	65PadAIoNVnFKUxOcmskCODT3X63D3573l2Q07oqop8zuu91Zuo3kqVsrjeiopKFBJlr
	CtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NLhG2yLtqvQx0aHbKVUkbUjtKJ/78DSimRmLG10sRyg=;
	b=MdftZcdGn0bXT7VwMVM0YpZFHUDTyiHbNGfnk/IhHE0BmJew41m3C5z32g3tKUov1n
	gpFSf1apGAMd/lyOdzUHIzKIun9ijbgPdtI8fCLKOuzqFZigkrqD0+mc23sEAWfHyn4l
	1AgE3u1AjgbgFKpxNUaLmzupNiQmmqWZTj3mra+KRtfAXpgGlPiiPePsI9yjKKWRuWc6
	HjXyvGLe0RsK4a1nR9wgsiI9dh0X+ioXcyM70k4SBGHfROzHoBclc1ZCu0mdfuLE4ZF0
	EFr6zOlrJ+q3jOBmKfdNDQ95e5rGmK3NMmGvJzQoR7Wr1y7PCPjnMHUr6y5gfvHGylOJ
	Ku/w==
X-Gm-Message-State: AMCzsaXk7y1Pi/qWDo86fIp7M9RBFkfVBX5mIcXWWtrcXz0B7zUJLDub
	60NUO7KD/j7lsuD8J1EKMaoVjpJl
X-Google-Smtp-Source: ABhQp+T2Ej8nSQXbctONbE5oClOCRwaYUFhW0OOys0oV9o2BaiXrbYOHoKOTq+RJA2A5IOlJrt0bpQ==
X-Received: by 10.223.139.221 with SMTP id w29mr10307468wra.43.1509919704133; 
	Sun, 05 Nov 2017 14:08:24 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:23 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:30 +0000
Message-Id: <1509919652-31388-7-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 6/8] htop: Update to v2.0.2
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:23 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../htop/files/0001-Use-pkg-config.patch           | 46 ++++++++++++++++++++++
 .../htop/{htop_1.0.3.bb => htop_2.0.2.bb}          |  9 +++--
 2 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
 rename meta-oe/recipes-support/htop/{htop_1.0.3.bb => htop_2.0.2.bb} (58%)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
new file mode 100644
index 0000000..ff5cd49
--- /dev/null
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -0,0 +1,46 @@
+From 7ebcbf17ad9483c7109e4a83b66966bc02f09bd4 Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Sun, 5 Nov 2017 20:10:10 +0000
+Subject: [PATCH] Use pkg-config
+
+We need to use pkg-config to find the ncurses library instead of the
+ncurses*-config applications.
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Inappropriate
+    (`ncurses*-config` can be used outside of OpenEmbedded)
+---
+ configure.ac | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7e0edd1..c5a8365 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -185,9 +185,9 @@ m4_define([HTOP_CHECK_LIB],
+ 
+ AC_ARG_ENABLE(unicode, [AS_HELP_STRING([--enable-unicode], [enable Unicode support])], ,enable_unicode="yes")
+ if test "x$enable_unicode" = xyes; then
+-   HTOP_CHECK_SCRIPT([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw6-config",
+-    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "ncursesw5-config",
+-     HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "ncurses5-config",
++   HTOP_CHECK_SCRIPT([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw6",
++    HTOP_CHECK_SCRIPT([ncursesw], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncursesw5",
++     HTOP_CHECK_SCRIPT([ncurses], [addnwstr], [HAVE_LIBNCURSESW], "pkg-config ncurses5",
+       HTOP_CHECK_LIB([ncursesw6], [addnwstr], [HAVE_LIBNCURSESW],
+        HTOP_CHECK_LIB([ncursesw], [addnwstr], [HAVE_LIBNCURSESW],
+         HTOP_CHECK_LIB([ncurses], [addnwstr], [HAVE_LIBNCURSESW],
+@@ -200,8 +200,8 @@ if test "x$enable_unicode" = xyes; then
+          [AC_CHECK_HEADERS([ncurses/curses.h],[:],
+             [AC_CHECK_HEADERS([ncurses.h],[:],[missing_headers="$missing_headers $ac_header"])])])])
+ else
+-   HTOP_CHECK_SCRIPT([ncurses6], [refresh], [HAVE_LIBNCURSES], "ncurses6-config",
+-    HTOP_CHECK_SCRIPT([ncurses], [refresh], [HAVE_LIBNCURSES], "ncurses5-config",
++   HTOP_CHECK_SCRIPT([ncurses6], [refresh], [HAVE_LIBNCURSES], "pkg-config ncurses6",
++    HTOP_CHECK_SCRIPT([ncurses], [refresh], [HAVE_LIBNCURSES], "pkg-config ncurses5",
+      HTOP_CHECK_LIB([ncurses6],  [refresh], [HAVE_LIBNCURSES],
+       HTOP_CHECK_LIB([ncurses],  [refresh], [HAVE_LIBNCURSES],
+       missing_libraries="$missing_libraries libncurses"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/htop/htop_1.0.3.bb b/meta-oe/recipes-support/htop/htop_2.0.2.bb
similarity index 58%
rename from meta-oe/recipes-support/htop/htop_1.0.3.bb
rename to meta-oe/recipes-support/htop/htop_2.0.2.bb
index 181661a..395b83f 100644
--- a/meta-oe/recipes-support/htop/htop_1.0.3.bb
+++ b/meta-oe/recipes-support/htop/htop_2.0.2.bb
@@ -8,10 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-SRC_URI = "http://hisham.hm/htop/releases/${PV}/htop-${PV}.tar.gz"
+SRC_URI = " \
+    http://hisham.hm/htop/releases/${PV}/htop-${PV}.tar.gz \
+    file://0001-Use-pkg-config.patch \
+    "
 
-SRC_URI[md5sum] = "e768b9b55c033d9c1dffda72db3a6ac7"
-SRC_URI[sha256sum] = "055c57927f75847fdc222b5258b079a9542811a9dcf5421c615c7e17f55d1829"
+SRC_URI[md5sum] = "7d354d904bad591a931ad57e99fea84a"
+SRC_URI[sha256sum] = "179be9dccb80cee0c5e1a1f58c8f72ce7b2328ede30fb71dcdf336539be2f487"
 
 LDFLAGS_append_libc-uclibc = " -lubacktrace"
 
-- 
2.7.4


