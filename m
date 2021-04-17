Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3591.1618693598648904047
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B6+T1Ja8;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q10so21544064pgj.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kx6CgdY//+CtIigl/MtyW5gWIe4dsqu3WR78SzuUYPA=;
        b=B6+T1Ja8cB6vWYzaIfOaarTlfora3LbfpEpwHKhhr+oZgoMaAV8WMKKUXzYX4VrCnB
         GTYxU/2/Sem4fTo85CoVjoIxSrbk42KleyRbKjW58Q0ihSufCP+lBU52Oiuf0VzyyJ99
         RJGhPZCJQHNAO9yFn2S7n4sD049l1Sm1BD8/Cp09icqD/knQ+MpH5yttq52Thl9Hvc06
         XfuceeQjjIgGjuxHb3wQyUXIiqKlPWSX1q1pObWhDvHMld80+GvPEElpgGNAv4SEOcDa
         3T15p9L8qvoUNJJ/U6MssjLb+L6Z9ohDGtp1qtoqsBWNi/dM6R6AEI5ZFzCq3TkNNGCX
         1mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kx6CgdY//+CtIigl/MtyW5gWIe4dsqu3WR78SzuUYPA=;
        b=exH5O/eFABs2lLhx7LolRfo9dv0crMyltSdPgM/u05jsEdCvDq7Y7oF0FRnssUGexW
         YJeuO/tPHWzvuY/uAToBIyhG+Mi6+xldqtUVRwkltltTFm9iZMZQ6jCqVDUGxPTKjRXg
         pB93C90t9O5dp6O2R1yIPtUN/qMW/qL2Rb9sEl/eE59+d94Z2ac4zA0XSYxVIKZNweez
         I5peSacvRyDP83NGPIkL5gliaHIrbAMl8oAiRDaDR1bVl/zLdb4St0y74kIinseU3HZT
         KNW71R0+eqaRgvYn0alGXtgYiIInBgRWoVv0xLHM4cjAZnh11RBSVs2hzGk9z6KE2VQX
         c5cQ==
X-Gm-Message-State: AOAM531TAHINNfbNubAs98QAgSde0Qm+/E9O3VAd3K3cDT+wKCpP6qV1
	cOcSNQoalUqRS2XH1Mks3ULTWQMh+Ef7Vw==
X-Google-Smtp-Source: ABdhPJyBsRPjII1c7jEnevWP47SBDibd0BSQONeHX8pN/yGAOfjtt1e2jM5QOq9hxIdXquQvGL4RSw==
X-Received: by 2002:a05:6a00:162c:b029:22b:4491:d63a with SMTP id e12-20020a056a00162cb029022b4491d63amr13641234pfc.28.1618693597919;
        Sat, 17 Apr 2021 14:06:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:37 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 39/50] debootstrap: 1.0.67 -> 1.0.123
Date: Sat, 17 Apr 2021 14:05:48 -0700
Message-Id: <6b937081d958749b0b404af6bfd67a9bf9f985d0.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Hongxu Jia <hongxu.jia@windriver.com>

- Excise all devices.tar.gz code

- Use yocto vars to override hardcoded dir to support native and nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 605cb20bdffa2523a963439b47c21aa23adf5325)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 00000000000..12dd238108c
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
index 00000000000..69329df4ea2
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
index 00000000000..bb43456874b
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
index 8472aca6c1f..00000000000
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
2.17.1

