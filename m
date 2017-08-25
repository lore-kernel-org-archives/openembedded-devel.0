Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C12D3783C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 07:14:31 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 63so2735397pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gHU8IxIcq/YWD3gnmbc51RQb8qnfJrDjZgmCX/z5Ag0=;
	b=PEgtFd3E7AKJmeaC4qH1QTrs3KR7yV+5SfkUdrQQni5CUxb7P8Nlq+f3PmtuOI5WXj
	A2KL1kpLn/A5mzRyMiADr/4OO+mwfVEbohLis1ilmtLSxZOop0XsPRsH3fynmoVNSXCD
	ZfiiPma6mKuP4M0RE2hTGSJmJbq7qHByVxs3SeX0rNfbQVxyQojRZsJmJ8INguv2KX9h
	37eXsbA1r1bU8uaVepyF1sAA1uQitGe4GhRTUlW1Q5BbTXH+W1WOkrxewhrWdqN6TAZK
	RI0wvGNzju88eV0w7UGdMY9Tm3rtmJ8SeqldWFWjrMPzLOyPwHLUfFwmkKu22pEmaHSK
	66NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gHU8IxIcq/YWD3gnmbc51RQb8qnfJrDjZgmCX/z5Ag0=;
	b=I/kTXThv8uiW3qcvC8/1NybN2zefTEQdTvQkvoEZpV8BJ+RZmgyaFLWwwB1Q6PHCq/
	bXKl4covBVqD+77P6Ro4aPkZbB9KB5dG9qyhp5VY4XsQnWgmiUfmzARqRzf6wUDaJtDU
	iJzLdAcO1IfpOHRzQCXdhX3lM+94bsiSrG6qk2om3s211UebGNmc26uCrw1Yj+L8KRUQ
	qeq0h3SlaShbUr/lXko79xcywUB1ck0D2zax6fW/tWp8OyB/APY4C+cj7xMYdY66r7NM
	UFbPl3DFijdFN6cA+S4h7tfmkVCyuqIYwMfIrRBmENJTamLs64ytnzneu2EnpCIyCnDk
	oOYg==
X-Gm-Message-State: AHYfb5jeJnB7mdzpcPOPWRcusEwAk98sOgfKv2NzY8bTAogabIl1HAGf
	ff/bd8n+K9lyYNn9
X-Received: by 10.98.79.214 with SMTP id f83mr9103911pfj.147.1503645273020;
	Fri, 25 Aug 2017 00:14:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	x11sm11730377pfk.43.2017.08.25.00.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 00:14:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 00:14:20 -0700
Message-Id: <20170825071422.3969-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170825071422.3969-1-raj.khem@gmail.com>
References: <20170825071422.3969-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] wvstreams: Fix parallel build
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
X-List-Received-Date: Fri, 25 Aug 2017 07:14:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wvstreams/0001-build-fix-parallel-make.patch   | 76 ++++++++++++++++++++++
 .../0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch      | 29 +++++++++
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |  4 +-
 3 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
new file mode 100644
index 000000000..6bc34331d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
@@ -0,0 +1,76 @@
+From 90de630f21ac744a37b3adac1bd84654471744ff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Aug 2017 22:30:01 -0700
+Subject: [PATCH 1/2] build: fix parallel make
+
+Imported from Gentoo
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile         | 15 +++++++++++++--
+ wvrules-posix.mk |  7 +++++--
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 72c8bef..5a4cfb2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -131,12 +131,19 @@ utils/tests/%: PRELIBS+=$(LIBWVSTREAMS)
+ # libwvstreams: stream/event handling library
+ #
+ TARGETS += libwvstreams.so
+-TARGETS += crypto/tests/ssltest ipstreams/tests/unixtest
++TARGETS += crypto/tests/ssltest                                                                                                                             
++crypto/tests/ssltest: $(LIBWVSTREAMS)                                                                                                                       
++
++TARGETS += ipstreams/tests/unixtest
++ipstreams/tests/unixtest: $(LIBWVSTREAMS)
++
+ TARGETS += crypto/tests/printcert
++crypto/tests/printcert: $(LIBWVSTREAMS)
+ 
+ ifndef _MACOS
+   ifneq ("$(with_readline)", "no")
+     TARGETS += ipstreams/tests/wsd
++    ipstreams/tests/wsd: $(LIBWVSTREAMS)
+     ipstreams/tests/wsd-LIBS += -lreadline
+   else
+     TEST_SKIP_OBJS += ipstreams/tests/wsd
+@@ -179,7 +186,11 @@ uniconf/tests/%: PRELIBS+=$(LIBUNICONF)
+ #
+ ifneq ("$(with_dbus)", "no")
+   TARGETS += libwvdbus.so
+-  TARGETS += dbus/tests/wvdbus dbus/tests/wvdbusd
++  TARGETS += dbus/tests/wvdbus
++  dbus/tests/wvdbus: $(LIBWVDBUS)
++
++  TARGETS += dbus/tests/wvdbusd
++  dbus/tests/wvdbusd: $(LIBWVDBUS)
+   TESTS += $(call tests_cc,dbus/tests)
+   libwvdbus_OBJS += $(call objects,dbus)
+   libwvdbus.so: $(libwvdbus_OBJS) $(LIBWVSTREAMS)
+diff --git a/wvrules-posix.mk b/wvrules-posix.mk
+index f94d2cd..2e99f36 100644
+--- a/wvrules-posix.mk
++++ b/wvrules-posix.mk
+@@ -80,12 +80,15 @@ define wvlink_ar
+ 	$(AR) s $1
+ endef
+ 
+-CC: FORCE
++CC:
+ 	@CC="$(CC)" CFLAGS="$(CFLAGS)" CPPFLAGS="$(CPPFLAGS)" \
+ 	  $(WVSTREAMS)/gen-cc CC c
+ 
+-CXX: FORCE
++CXX:
+ 	@CC="$(CXX)" CFLAGS="$(CXXFLAGS)" CPPFLAGS="$(CPPFLAGS)" \
+ 	  $(WVSTREAMS)/gen-cc CXX cc
+ 
++#All files must depend on the above two rules. This is a godawful hack.
++$(shell find -type f '(' -name '*.c' -o -name '*.cc' ')' ): CC CXX
++
+ wvlink=$(LINK_MSG)$(WVLINK_CC) $(LDFLAGS) $($1-LDFLAGS) -o $1 $(filter %.o %.a %.so, $2) $($1-LIBS) $(XX_LIBS) $(LDLIBS) $(PRELIBS) $(LIBS)
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch
new file mode 100644
index 000000000..59f70e380
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch
@@ -0,0 +1,29 @@
+From 4afff42714a15cb796d3589d87c6fac4558b2c95 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Aug 2017 22:33:32 -0700
+Subject: [PATCH 2/2] wvrules.mk: Use _DEFAULT_SOURCE
+
+Fixes warnings with newer glibc
+warning: "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wvrules.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wvrules.mk b/wvrules.mk
+index 877f700..124bffd 100644
+--- a/wvrules.mk
++++ b/wvrules.mk
+@@ -83,7 +83,7 @@ runtests:
+ 
+ INCFLAGS=$(addprefix -I,$(WVSTREAMS_INC) $(XPATH))
+ CPPFLAGS+=$(INCFLAGS) \
+-	-D_BSD_SOURCE -D_GNU_SOURCE $(OSDEFINE) \
++	-D_DEFAULT_SOURCE $(OSDEFINE) \
+ 	-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 \
+ 	-DUNSTABLE
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 0ac175251..e3d5e7d20 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch \
            file://0004-wvcrash-Replace-use-of-basename-API.patch \
            file://0005-check-for-libexecinfo-during-configure.patch \
+           file://0001-build-fix-parallel-make.patch \
+           file://0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch \
            "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
@@ -26,8 +28,6 @@ SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8eb
 
 inherit autotools-brokensep pkgconfig
 
-PARALLEL_MAKE = ""
-
 TARGET_CFLAGS_append = " -fno-tree-dce -fno-optimize-sibling-calls"
 
 LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
-- 
2.14.1


