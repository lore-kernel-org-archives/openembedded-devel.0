Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.4917.1617866981356978755
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 00:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1387Tbr0015689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Apr 2021 00:29:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 00:29:37 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 00:29:36 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] debootstrap: 1.0.67 -> 1.0.123
Date: Thu, 8 Apr 2021 15:29:36 +0800
Message-ID: <20210408072936.1461640-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Excise all devices.tar.gz code

- Use yocto vars to override hardcoded dir to support native and nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...t-to-override-usr-sbin-and-usr-share.patch |  41 +++++++++++++++
 ...upport-to-override-usr-bin-arch-test.patch |  47 ++++++++++++++++++
 .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -> 0 bytes
 .../debootstrap/debootstrap_1.0.123.bb        |  23 +++++++++
 .../debootstrap/debootstrap_1.0.67.bb         |  35 -------------
 5 files changed, 111 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
new file mode 100644
index 000000000..12dd23810
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
@@ -0,0 +1,41 @@
+From 87d0174e8d56e7458dc94f05f82ab7a67a5cf7d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 8 Apr 2021 14:06:05 +0800
+Subject: [PATCH 1/2] support to override /usr/sbin and /usr/share
+
+Upstream-Status: Submitted [https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8516803..a2d8c00 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,14 +5,16 @@ all:
+ 
+ clean:
+ 
+-DSDIR=$(DESTDIR)/usr/share/debootstrap
++datadir ?= "/usr/share"
++sbindir ?= "/usr/sbin"
++DSDIR=$(DESTDIR)${datadir}/debootstrap
+ install:
+ 	mkdir -p $(DSDIR)/scripts
+-	mkdir -p $(DESTDIR)/usr/sbin
++	mkdir -p $(DESTDIR)$(sbindir)
+ 
+ 	cp -a scripts/* $(DSDIR)/scripts/
+ 	install -o root -g root -m 0644 functions $(DSDIR)/
+ 
+-	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)/usr/sbin/debootstrap
+-	chown root:root $(DESTDIR)/usr/sbin/debootstrap
+-	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
++	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)$(sbindir)/debootstrap
++	chown root:root $(DESTDIR)$(sbindir)/debootstrap
++	chmod 0755 $(DESTDIR)$(sbindir)/debootstrap
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
new file mode 100644
index 000000000..69329df4e
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
@@ -0,0 +1,47 @@
+From f0420b201f2fb5286ccf5657faa6b38cd2680e10 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 8 Apr 2021 14:08:06 +0800
+Subject: [PATCH 2/2] support to override /usr/bin/arch-test
+
+Upstream-Status: Submitted [https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ debootstrap | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/debootstrap b/debootstrap
+index 9b9e58d..a3cf3af 100755
+--- a/debootstrap
++++ b/debootstrap
+@@ -51,6 +51,10 @@ INRELEASE_PATH=""
+ DEF_MIRROR="http://deb.debian.org/debian"
+ DEF_HTTPS_MIRROR="https://deb.debian.org/debian"
+ 
++if [ -z "$ARCH_TEST" ]; then
++	ARCH_TEST="/usr/bin/arch-test"
++fi
++
+ # set $CONTAINER
+ detect_container
+ 
+@@ -645,12 +649,12 @@ fi
+ 
+ ###########################################################################
+ 
+-if [ -x /usr/bin/arch-test ] && am_doing_phase second_stage; then
++if [ -x ${ARCH_TEST} ] && am_doing_phase second_stage; then
+ 	if doing_variant fakechroot; then
+-		ret=0; arch-test "$ARCH" || ret=$?
++		ret=0; ${ARCH_TEST} "$ARCH" || ret=$?
+ 	# Avoid failure with old arch-test package
+-	elif arch-test --version > /dev/null 2>&1; then
+-		ret=0; arch-test -c "$TARGET" "$ARCH" || ret=$?
++	elif ${ARCH_TEST} --version > /dev/null 2>&1; then
++		ret=0; ${ARCH_TEST} -c "$TARGET" "$ARCH" || ret=$?
+ 	else
+ 		ret=3
+ 	fi
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz b/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
deleted file mode 100644
index 20eaba3ad22b1e47f6037dea2a0db73eb262ab25..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 767
zcmZwCeNfAB0LSqWmeAtza1IGwl2gu8?#%BF38A~LD<bo7h$gz-O%L*wNtiRbQnsk`
z(3pqn#&sTlp0iDMQABENY{##e)U{2&eLs%Bz5jXr{SHz33;x#M&souaLK7WS=$o3O
zXx$>ZsnQ25NgZhQuh6w=YnJPhSA_*FtCl6pGAj<PKe_LvYWpB{Z(CFF=|<g|kc_w7
z?`-GPXd&0V`I^2X#r|-cu)U#Y?zq5hM`kwW@BS8ZS^bh#b}cRRrnE%5cOGWy!e#!&
zo_Q|Y)^Blk6aQ|-GQOyuUOn~9A`}`d;uOb8k0lZJ7vOs#WB%p%Fz((I8j)YVl@8sB
z)oNd!Qi@SVS~kOpjVKXKZewGuBvbwZTy89NwU^*c*W9OXvZQxqw`I*dTI=(3`b1G5
z)5IAF_1DAnm>tjwtw&-whEU0bhh3G^$714fW_S;+>2E{qdMet5KqIYj-)Lh{ukV$_
zD-qv-6PR!mNf>EIju8bM+wUlXaeX>{w5fqC(vwYIM%YP3Nz{E|{P|jsdH%sk4P>d6
z99tZDjmGg>x;G+se=71kWJV?;eQaSbjz6~ywz=xO7g~sNLygAH)b_DMpIhQ>F2C92
z@^5pwT0UmVSF%J!UAN~K2h++Jn0TAmU^Ra>SRx?iNz?vkqmVH2CW<%&Xb>2vW)(Ul
z^f6INMqwv&Hq$aEo36eUfubL%Y9ta(Ynh#`rY^1O0Eac*A@wmAt-Wj}oy8WM!yyhs
zu40fd4Ox4-na6gfyw*XgcwG89Ot6k;)}}*LinC#_$RY=MFFN4Gofwq*NT-hpM&9RP
zpAP#fO_I0{JZeXnl!gb%sYKBgmHXh|8PfU4EWVCo)7==jgBQy&T1V$q+kL6!FnUF%
zo(j|^dWhAlDp_bW6aGm)^+riUD={L7BiiioTiyj&UE09`UmU1%V&#rLi34eKTF8|i
lg`pYfzz_{`no;0}G-+Dtic5)C{)_x|f?q~cv>;m`_yZJ@!>9lN

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
new file mode 100644
index 000000000..bb4345687
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Install a Debian system into a subdirectory"
+HOMEPAGE = "https://wiki.debian.org/Debootstrap"
+SECTION = "devel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
+
+SRC_URI  = "\
+    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
+    file://0001-support-to-override-usr-sbin-and-usr-share.patch \
+    file://0002-support-to-override-usr-bin-arch-test.patch \
+"
+
+SRC_URI[md5sum] = "b959c7ac01839e9b96a733d27b19e59e"
+SRC_URI[sha256sum] = "5e5a8147ecdd6be0eea5ac4d6ed8192cc653e93f744dd3306c9b1cc51d6ca328"
+
+S = "${WORKDIR}/debootstrap"
+
+fakeroot do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+    chown -R root:root ${D}${datadir}/debootstrap
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
deleted file mode 100644
index 8472aca6c..000000000
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Install a Debian system into a subdirectory"
-HOMEPAGE = "https://wiki.debian.org/Debootstrap"
-SECTION = "devel"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
-
-inherit pkgconfig
-
-SRC_URI  = "\
-    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_1.0.67.tar.gz \
-    file://devices.tar.gz;unpack=0 \
-"
-
-SRC_URI[md5sum] = "eacabfe2e45415af60b1d74c3a23418a"
-SRC_URI[sha256sum] = "0a12e0a2bbff185d47711a716b1f2734856100e8784361203e834fed0cffa51b"
-
-S = "${WORKDIR}/${BP}"
-
-# All Makefile does is creation of devices.tar.gz, which fails in OE build, we use
-# static devices.tar.gz as work around
-# | NOTE: make -j 8 -e MAKEFLAGS=
-# | rm -rf dev
-# | mkdir -p dev
-# | chown 0:0 dev
-# | chown: changing ownership of `dev': Operation not permitted
-# | make: *** [devices.tar.gz] Error 1
-# | WARNING: exit code 1 from a shell command.
-do_compile_prepend() {
-    cp ${WORKDIR}/devices.tar.gz ${B}
-}
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-    chown -R root:root ${D}${datadir}/debootstrap
-}
-- 
2.27.0

