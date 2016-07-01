Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id EE32560111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 13:14:07 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so234206qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=XlrIeEtxDV/yl7hfRrbchoDO6YLvn7TaN2V/JSfParQ=;
	b=d1IoMO4yW4mg8IXnT7Bg0kYsbVHlIsVubB9+xBQRrkv14c4MITDOioByg8+7Sugdsa
	8hgWo/yAyhpk4XPVpZYGNDFwiaqT4MJUYsKb8Y1mlQoQgCsH7HwYo8miqeYJHA0r0CUl
	xeJNtPbHYw/XzENlQECfuCZGw99A4rEIWwlTKalhXC3gOSx7LEvUMgKB034W7xm9qIQV
	sa9W3/QiQLBjUxYnm6ZZy6Lb4u80+uEHqpA2pxXAIg8RBpjtmSBpAQClH9+XdzhnchN+
	8EWjMUbBUSTzZfT6x9UgSqBzW8BmtwTym2+LILv86oh6kws0mJamymxvnX0IgFvgvupl
	WsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=XlrIeEtxDV/yl7hfRrbchoDO6YLvn7TaN2V/JSfParQ=;
	b=G8egMv9IsvUjt1rpk8xPA6emlIzY5QW3WZH8p2QSyJBcmoaE9TJqp0/LbsHOzhKqKD
	KRpnwpJsHNzDdSCDRsbmOCpRH5TNEalG0s7JaXId3psukzjdbVsrmTyGy4dGcZBhWDsw
	YkJyblgzv6aSqdHH0OVILHL5qZo3C4ZMZ4Do+H21+JuPuWbUxv/s8CJIveYHaEN5q/Vv
	ixSWDT0dHyi9u8E2w8gtFJZ9kOeEG66wf9pl8N3wwIIiLinuPR/UrYcyW6TA5YeBje4Q
	E/9ByggVJ1I+EzsNLGFFZJLCJ170/qMzdGYcRotBLy/uOCi7GnvklCRKYRRrWWM5T/HY
	WZxg==
X-Gm-Message-State: ALyK8tJ+HzZ7p0+efI774wu2ksaHIF/c/Y6dnsfPzz+nYgsplNahOyPnnl5OiS23sjNJdw==
X-Received: by 10.55.132.193 with SMTP id g184mr25655261qkd.209.1467378848335; 
	Fri, 01 Jul 2016 06:14:08 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([179.105.243.72])
	by smtp.gmail.com with ESMTPSA id p39sm448793qtp.14.2016.07.01.06.14.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 06:14:07 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2016 10:13:44 -0300
Message-Id: <1467378824-13923-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-browser][PATCH] firefox: Fix build using gcc 6
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
X-List-Received-Date: Fri, 01 Jul 2016 13:14:10 -0000

Append CFLAGS and CXXFLAGS to set work around code which gcc6 would
otherwise regard as out-of-specification and allow it to produce a
working program.
Add patch to to correct the source to be compatible with gcc6 by
preventing c++ scope errors.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...-source-to-be-compatible-with-gcc6-by-pre.patch | 29 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_38.8.0esr.bb       | 19 +++-----------
 2 files changed, 33 insertions(+), 15 deletions(-)
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch

diff --git a/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
new file mode 100644
index 0000000..643fef2
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
@@ -0,0 +1,29 @@
+From fd21526d36bd579f2a227b3add38bd615e59db5e Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 30 Jun 2016 16:57:00 -0300
+Subject: [PATCH] Correct the source to be compatible with gcc6 by preventing
+ c++ scope errors
+Organization: O.S. Systems Software LTDA.
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ nsprpub/config/make-system-wrappers.pl | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nsprpub/config/make-system-wrappers.pl b/nsprpub/config/make-system-wrappers.pl
+index fa0873a..bf09583 100644
+--- a/nsprpub/config/make-system-wrappers.pl
++++ b/nsprpub/config/make-system-wrappers.pl
+@@ -19,7 +19,9 @@ while (<STDIN>) {
+     open OUT, ">$output_dir/$_";
+     print OUT "#pragma GCC system_header\n";  # suppress include_next warning
+     print OUT "#pragma GCC visibility push(default)\n";
++        print OUT "#define _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
+     print OUT "#include_next \<$_\>\n";
++        print OUT "#undef _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
+     print OUT "#pragma GCC visibility pop\n";
+     close OUT;
+ }
+-- 
+2.1.4
+
diff --git a/recipes-mozilla/firefox/firefox_38.8.0esr.bb b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
index bd9b82c..94e5e04 100644
--- a/recipes-mozilla/firefox/firefox_38.8.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://debian-hacks/Work-around-binutils-assertion-on-mips.patch \
            file://debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch \
            file://fixes/Fix-firefox-install-dir.patch \
+           file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
            "
 
 SRC_URI[archive.md5sum] = "af46898414a433f8260c5373efb97d19"
@@ -63,6 +64,9 @@ EXTRA_OEMAKE += "installdir=${libdir}/${PN}"
 
 ARM_INSTRUCTION_SET = "arm"
 
+CFLAGS +=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"
+CXXFLAGS +=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"
+
 do_install_append() {
     install -d ${D}${datadir}/applications
     install -d ${D}${datadir}/pixmaps
@@ -105,18 +109,3 @@ PRIVATE_LIBS += " \
     libssl3.so \
     libsoftokn3.so \
 "
-
-# | i586-oe-linux-gcc  -m32 -march=i586 --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -o WebMElement.o -c
-#  -I../../dist/system_wrappers -include /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/config/gcc_hidden.h -DMOZ_GLUE_IN_PROGRAM -DAB_CD=en-US -DNO_NSPR_10_SUPPORT
-#  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv -I. 
-#  -I../../dist/include   -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nspr -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nss   
-#  -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/pixman-1   -fPIC   -include ../../mozilla-config.h -DMOZILLA_CLIENT -MD -MP -MF .deps/WebMElement.o.pp  -Wall -Wdeclaration-after-statement -Wempty-body -Wpointer-to-int-cast -Wsign-compare -Wtype-limits -Wno-unused -Wcast-align -Os -fsigned-char -fno-strict-aliasing -std=gnu99 -fgnu89-inline -fno-strict-aliasing -fno-math-errno -pthread -pipe  -DNDEBUG -DTRIMMED -freorder-blocks -Os -fomit-frame-pointer     /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv/WebMElement.c
-# | In file included from ../../../dist/system_wrappers/stdlib.h:3:0,
-# |                  from ../../../dist/include/mozilla/mozalloc.h:15,
-# |                  from ../../../dist/stl_wrappers/cstdlib:39,
-# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/inc/Main.h:29,
-# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/CmapCache.cpp:28,
-# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/gfx/graphite2/src/Unified_cpp_gfx_graphite2_src0.cpp:11:
-# | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/c++/6.1.1/stdlib.h:38:12: error: 'std::abort' has not been declared
-# |  using std::abort;
-PNBLACKLIST[firefox] ?= "BROKEN: fails to build with gcc-6"
-- 
2.1.4


