Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.3784.1617180375406338604
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 01:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12V8ja3m018326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 01:45:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 01:45:54 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 31 Mar 2021 01:45:53 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] debootstrap: 1.0.67 -> 1.0.123
Date: Wed, 31 Mar 2021 16:45:52 +0800
Message-ID: <20210331084552.1743345-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Excise all devices.tar.gz code

- Use yocto vars to replace hardcoded dir to support native and nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-yocto-vars-to-replace-hardcoded-dir.patch |  39 ++++++++++++++++++
 .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -> 0 bytes
 .../debootstrap/debootstrap_1.0.123.bb        |  22 ++++++++++
 .../debootstrap/debootstrap_1.0.67.bb         |  35 ----------------
 4 files changed, 61 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch
new file mode 100644
index 000000000..77f45e1bf
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch
@@ -0,0 +1,39 @@
+From d780062d8d417bf2aefdf5f73c4b09a0eea4d097 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 31 Mar 2021 15:30:52 +0800
+Subject: [PATCH] user yocto vars to replace hardcoded dir
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8516803..f183c7a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,14 +5,14 @@ all:
+ 
+ clean:
+ 
+-DSDIR=$(DESTDIR)/usr/share/debootstrap
++DSDIR=$(DESTDIR)${datadir}/debootstrap
+ install:
+ 	mkdir -p $(DSDIR)/scripts
+-	mkdir -p $(DESTDIR)/usr/sbin
++	mkdir -p $(DESTDIR)${sbindir}
+ 
+ 	cp -a scripts/* $(DSDIR)/scripts/
+ 	install -o root -g root -m 0644 functions $(DSDIR)/
+ 
+-	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)/usr/sbin/debootstrap
+-	chown root:root $(DESTDIR)/usr/sbin/debootstrap
+-	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
++	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)${sbindir}/debootstrap
++	chown root:root $(DESTDIR)${sbindir}/debootstrap
++	chmod 0755 $(DESTDIR)${sbindir}/debootstrap
+-- 
+2.27.0
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
index 000000000..7a8c220ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Install a Debian system into a subdirectory"
+HOMEPAGE = "https://wiki.debian.org/Debootstrap"
+SECTION = "devel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
+
+SRC_URI  = "\
+    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
+    file://0001-user-yocto-vars-to-replace-hardcoded-dir.patch \
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

