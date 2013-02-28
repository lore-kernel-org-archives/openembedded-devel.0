Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UB2jf-0005Ck-3x
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:37:19 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so1038288pbc.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9mjGTH3+q50nhcWGZORBAz8qBTnwZyoZ4iAk9d2rNj0=;
	b=ksVK38nJs9r8Wfs+2oPEQeAr8v/zfsMvQIhfRB4JXC2NTRJQWmkD1oAm3VyWkUd2/C
	FwALRqH8FXX6uNT++0kvs6Oc4nHSHFBLoViFJzK6Hko7chHh8CGpyi0BG8XRURDmkGNp
	/bTLgs648VdZZnSpI5v8Q0aU+2jkIdkBdZqOjXFIJLuAKBa+Mq3iv2H4Ep11Af/czNck
	hhYSuP5KGgpVTzNvCTkMdwTnxB8YGGVdG8JJBMxqxp8QiukbmVwxzimywwHLL2tJ2ujr
	MyPCvuYsgmyZagNrlQ1ebiZGJvLStf1XcD2lV9LqaQPl9V8wprha8FGO/aIbasE9V8sL
	lK3A==
X-Received: by 10.66.158.2 with SMTP id wq2mr12857789pab.113.1362054056516;
	Thu, 28 Feb 2013 04:20:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id xr3sm8205488pbc.46.2013.02.28.04.20.53
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:20:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 13:20:08 +0100
Message-Id: <417491b702214b90b5aeaac53e88aaff831a2f14.1362053615.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1362053615.git.Martin.Jansa@gmail.com>
References: <cover.1362053615.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1362053615.git.Martin.Jansa@gmail.com>
References: <cover.1362053615.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny 2/3] ruby: Add from OE-Classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 12:37:21 -0000

From: Jackie Huang <jackie.huang@windriver.com>

* No modifications in this commit
* MJ: PR reset, PRIORITY dropped, LICENSE fix, LIC_FILES_CHKSUMs added

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc           | 38 ++++++++++++++++++++++
 ...onf-hardcode-wide-getaddr-info-test-outco.patch | 31 ++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/ruby/extmk.patch   | 13 ++++++++
 .../recipes-devtools/ruby/ruby/extmk_run.patch     | 15 +++++++++
 meta-ruby/recipes-devtools/ruby/ruby_1.8.7-p302.bb | 12 +++++++
 5 files changed, 109 insertions(+)
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby_1.8.7-p302.bb

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
new file mode 100644
index 0000000..a70f951
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -0,0 +1,38 @@
+DESCRIPTION = "Ruby is an interpreted scripting language \
+for quick and easy object-oriented programming."
+SECTION = "devel/ruby"
+LICENSE = "GPLv2 & LGPLv2+ & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=99f88e67b65504d289a0326c59f9c148 \
+                    file://LEGAL;md5=7d502ae3b621dc406b220dadddb72e16 \
+                    file://LGPL;md5=7fbc338309ac38fefcd64b04bb903e34 \
+"
+
+DEPENDS = "ruby-native zlib openssl"
+DEPENDS_virtclass-native = ""
+
+INC_PR = "r0"
+
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
+           file://extmk_run.patch \
+           file://extmk.patch \
+"
+
+S = "${WORKDIR}/ruby-${PV}"
+
+inherit autotools
+
+# fix building of socket extension
+EXTRA_OECONF = "--enable-wide-getaddrinfo"
+
+# This snippet lets compiled extensions which rely on external libraries,
+# such as zlib, compile properly.  If we don't do this, then when extmk.rb
+# runs, it uses the native libraries instead of the target libraries, and so
+# none of the linking operations succeed -- which makes extconf.rb think
+# that the libraries aren't available and hence that the extension can't be
+# built.
+
+do_configure_prepend() {
+	sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#; s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk
+	rm -rf ${S}/ruby/
+}
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch b/meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
new file mode 100644
index 0000000..64f093a
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
@@ -0,0 +1,31 @@
+From 9341293e71c03fe606edc9157bf1e13e3dd5b507 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 17 Dec 2010 11:35:38 +0100
+Subject: [PATCH] socket extconf: hardcode wide-getaddr info test outcome to true
+
+Without this the socket extension doesn't build correctly
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ ext/socket/extconf.rb |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/ext/socket/extconf.rb b/ext/socket/extconf.rb
+index ece6158..5fba46c 100644
+--- a/ext/socket/extconf.rb
++++ b/ext/socket/extconf.rb
+@@ -222,6 +222,11 @@ main()
+   exit(EXIT_FAILURE);
+ }
+ EOF
++
++# Ignore the actual result of the above test and assume that
++# everything is OK.
++getaddr_info_ok = true
++
+ end
+ if ipv6 and not getaddr_info_ok
+   abort <<EOS
+-- 
+1.6.6.1
+
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/extmk.patch b/meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
new file mode 100644
index 0000000..8b68450
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
@@ -0,0 +1,13 @@
+diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
+--- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
++++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
+@@ -354,8 +354,8 @@
+   $ruby = '$(topdir)/miniruby' + EXEEXT
+ end
+ $ruby << " -I'$(topdir)'"
++$ruby << " -I'$(top_srcdir)/lib'"
+ unless CROSS_COMPILING
+-  $ruby << " -I'$(top_srcdir)/lib'"
+   $ruby << " -I'$(extout)/$(arch)' -I'$(extout)/common'" if $extout
+   $ruby << " -I./- -I'$(top_srcdir)/ext' -rpurelib.rb"
+   ENV["RUBYLIB"] = "-"
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch b/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
new file mode 100644
index 0000000..57926f5
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
@@ -0,0 +1,15 @@
+============================================================
+--- packages/ruby/ruby-1.8.5/extmk_run.patch	d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
++++ packages/ruby/ruby-1.8.5/extmk_run.patch	d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
+@@ -0,0 +1,11 @@
++--- ruby-1.8.5/common.mk.orig	2006-12-30 13:07:32.000000000 +1100
+++++ ruby-1.8.5/common.mk	2006-12-30 13:08:32.000000000 +1100
++@@ -56,7 +56,7 @@
++ 		--make="$(MAKE)" \
++ 		--mflags="$(MFLAGS)" \
++ 		--make-flags="$(MAKEFLAGS)"
++-EXTMK_ARGS    =	$(SCRIPT_ARGS) --extout="$(EXTOUT)" --extension $(EXTS) --extstatic $(EXTSTATIC) --
+++EXTMK_ARGS    =	$(SCRIPT_ARGS) --with-ldflags="%%TARGET_LDFLAGS%%" --with-cflags="%%TARGET_CFLAGS%%" --extout="$(EXTOUT)" --extension $(EXTS) --extstatic $(EXTSTATIC) --
++ 
++ all: $(MKFILES) $(PREP) $(RBCONFIG) $(LIBRUBY)
++ 	@$(MINIRUBY) $(srcdir)/ext/extmk.rb $(EXTMK_ARGS)
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.8.7-p302.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.8.7-p302.bb
new file mode 100644
index 0000000..299187c
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.8.7-p302.bb
@@ -0,0 +1,12 @@
+require ruby.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch"
+
+SRC_URI[md5sum] = "f446550dfde0d8162a6ed8d5a38b3ac2"
+SRC_URI[sha256sum] = "5883df5204de70762602ce885b18c8bf6c856d33298c35df9151031b2ce044a1"
+
+FILES_${PN}-dbg += "${libdir}/ruby/1.8/*/.debug \
+                    ${libdir}/ruby/1.8/*/*/.debug"
+BBCLASSEXTEND = "native"
+
-- 
1.8.1.4



