Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 23F056C3E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:17:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p8so1958732plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E96nwAxuqlQ0RC6b6WXoqcd5gxMnEMezSQg0vcD9Its=;
	b=TX6G1iXeAXoOyW0xWWZf8vh16Ali0e/+NiYmJYnPgyLjrhAi99Qwy1MYorasBRcf2x
	hEa+9SfhvVdyxS3wykgZMtejRpHZ0sjgOkC/TqiUarnQ+ByglWMCEWooyzK3dNSjOfNS
	1g9lCo2zqUPjYzRxt9MTfTJtzBPsa7t96HRzruyIUrMLewcJowyhN+4y6I+LpL76gF3M
	qpraeUKok15b6zWsu0G+ddb5kDUTTe9GSMkyvrUY/ob+XkB1s8618lhZwqwsG5FKs1RP
	LGbS605/pK9kc9TiagXJ4usXQaYTYpXZ02NxLoPmY08Bu1EWGfxQccKs/m2YwCoyQ217
	0h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E96nwAxuqlQ0RC6b6WXoqcd5gxMnEMezSQg0vcD9Its=;
	b=WMHfxYYlJEL1vQ2umIZ+XHMF8jrOlGGOXuOo5xiO5XEULqo4nXT2H8iBOZB/ksDn0l
	vS1mWqyB7mRpHai+7D5k3tgtybdF8vNNvys1WBxDToq0H/Axj+K7sQZ+d3cW+jzz2WMo
	5rl1hEdppDR7CUZ0+MtrVenY0VWoJdvdS5/ufUBK0s5PgtwuMiuNpxzcVi3sh0vHwyuC
	v4n3QggzKLgqeXUfWh1mRnXfzXArW5hHSx/xXwhZSI4oxwnkywu2XiGU5aHLe48dQ1pa
	plGY4vewxf85/ENGgbbj2fbGW25wlsb0hZiYHEgZnpxiC6Ijxbq3juj6G64QILCMzzuq
	fMxw==
X-Gm-Message-State: AJcUukeXKam6HPdK3XnBqXPKS01SKzgD9XU6a/vHlWykm1XSvH8my3A6
	7Eum92V1n+4IizePthi0ZPuUhhcD
X-Google-Smtp-Source: ALg8bN6JdM8adJvxsp91QhHgSlKX3kzokrZ/4vUUsbXh8PP5EK2lwjX2kM23ZrEJ5fRYIfieWJcdIA==
X-Received: by 2002:a17:902:1101:: with SMTP id
	d1mr6363004pla.136.1547590669756; 
	Tue, 15 Jan 2019 14:17:49 -0800 (PST)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	d129sm7227655pfc.31.2019.01.15.14.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Jan 2019 14:17:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:17:42 -0800
Message-Id: <1547590662-6831-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] tcpdump: misc recipe cleanup + drop obsolete workarounds
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
X-List-Received-Date: Tue, 15 Jan 2019 22:17:49 -0000

Remove obsolete workarounds and improve the workarounds that remain.
For example, it hasn't been necessary to set ac_cv_linux_vers since
tcpdump 4.6.0:

  https://github.com/the-tcpdump-group/tcpdump/commit/a42fc6e764abfe4a99eef993784733f735f6c874

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...-absolute-path-when-searching-for-libdlpi.patch | 30 ++++++++++++++++++++++
 .../tcpdump/unnecessary-to-check-libpcap.patch     | 23 ++++++++++-------
 .../recipes-support/tcpdump/tcpdump_4.9.2.bb       | 27 ++++++++-----------
 3 files changed, 54 insertions(+), 26 deletions(-)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
new file mode 100644
index 0000000..d82c160
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
@@ -0,0 +1,30 @@
+From a2bfd28034d9aa48d8ff109c1314e53bc9779752 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 24 Oct 2018 22:26:08 -0700
+Subject: [PATCH] avoid absolute path when searching for libdlpi
+
+Let the build environment control library search paths.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index c882909..52aefd6 100644
+--- a/configure.in
++++ b/configure.in
+@@ -542,7 +542,7 @@ don't.])
+ fi
+ 
+ # libdlpi is needed for Solaris 11 and later.
+-AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi" LDFLAGS="-L/lib $LDFLAGS", ,-L/lib)
++AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi")
+ 
+ dnl
+ dnl Check for "pcap_list_datalinks()", "pcap_set_datalink()",
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
index 8cefadf..69d68ba 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
@@ -1,10 +1,8 @@
-From 741d77e42fc4af49804f7ee43b7237e01633cbcd Mon Sep 17 00:00:00 2001
+From dd023c133980fcc0cff5896e85377675e0571894 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Tue, 8 Jul 2014 13:20:47 +0800
 Subject: [PATCH] unnecessary to check libpcap
 
-Upstream-Status: Pending
-
 since the check of libpcap did not consider the cross-compile, lead to the
 below error:
 	This autoconf log indicates errors, it looked at host include and/or
@@ -13,22 +11,29 @@ below error:
 In fact, the libpcap has been added into the tcpdump's DEPENDS, not need to
 check if libpcap existed.
 
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Upstream-Status: Inappropriate [OE specific]
 
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index b2305a5..b3b5dbf 100644
+index b2305a5..c882909 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -418,7 +418,7 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
+@@ -418,7 +418,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
  AC_SEARCH_LIBS(getrpcbynumber, nsl,
      AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
  
 -AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
-+#AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
++# Simplified (more cross compile friendly) check for libpcap. All we really
++# need is to sanity check that libpcap is available and add -lpcap to LIBS.
++AC_CHECK_LIB(pcap, pcap_compile, LIBS="$LIBS -lpcap")
  
  #
  # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
index d38540e..038c161 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
@@ -1,13 +1,15 @@
 SUMMARY = "A sophisticated network protocol analyzer"
 HOMEPAGE = "http://www.tcpdump.org/"
+SECTION = "net"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
-SECTION = "net"
+
 DEPENDS = "libpcap"
 
 SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://unnecessary-to-check-libpcap.patch \
+    file://avoid-absolute-path-when-searching-for-libdlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
 "
@@ -15,34 +17,25 @@ SRC_URI = " \
 SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
 SRC_URI[sha256sum] = "798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79"
 
-export LIBS=" -lpcap"
-
 inherit autotools-brokensep ptest
-CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
-PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
-PACKAGECONFIG[libcap-ng] = "--with-cap-ng=yes,--with-cap-ng=no,libcap-ng"
+PACKAGECONFIG ?= "openssl"
+
+PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
+PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl --without-crypto,openssl"
+PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
 
-EXTRA_AUTORECONF += " -I m4"
+EXTRA_AUTORECONF += "-I m4"
 
 do_configure_prepend() {
     mkdir -p ${S}/m4
     if [ -f aclocal.m4 ]; then
         mv aclocal.m4 ${S}/m4
     fi
-    # AC_CHECK_LIB(dlpi.. was looking to host /lib
-    sed -i 's:-L/lib::g' ./configure.in
-}
-do_configure_append() {
-    sed -i 's:-L/usr/lib::' ./Makefile
-    sed -i 's:-Wl,-rpath,${STAGING_LIBDIR}::' ./Makefile
-    sed -i 's:-I/usr/include::' ./Makefile
 }
 
 do_install_append() {
-    # tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
+    # make install installs an unneeded extra copy of the tcpdump binary
     rm -f ${D}${sbindir}/tcpdump.${PV}
 }
 
-- 
1.9.1


