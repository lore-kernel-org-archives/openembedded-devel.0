Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC7260767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so667994pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AZBauUnBHWLWKtTrHIkG6RfCOtvh9WUs/AFoxoROQtQ=;
	b=sB7h8BiMj3nyPtX60ocQ8tptRpP8neMtfQ47DrYK7FbG7Go0sGRSa5373+ZGWPNVil
	NmiBsT6xdRT9olLaOjXL1VB7twgwJjto3OxG81/XNrVKyYFW3cKGksIoPEhgve3vSEwV
	lfyIC1h8HzIq/VJYLk9hwYOMqbpsAPfCB3ijypOLgSrgMifP1qgqpWdFD9sfuiYsTq5o
	1I4WgxXgx2Gl8ZhPK6eTredYd5rsgQcrIGuLkIzpeNNWnjJoLrudwbCrp2Rk5QJa5/Hz
	8fo4xVZN9R1Z67wyn7tVlezippux0c/Jzg9vqHB7+p2jtjKIR16nMxrcEwvZfpQ0wTHi
	VSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AZBauUnBHWLWKtTrHIkG6RfCOtvh9WUs/AFoxoROQtQ=;
	b=V0Ww7FXpBsw9paj/dFxjGCxDoDkRJ+6R7ezb9Qe6mnmZ4x7UsCwZVu/4bs8e+41Ckh
	Br7GLPag0BsIhhB3nbw+SNnAEyi+C1clZmU0G6zbHAfJBGI/sTTWvKcelPVYP6qjtTmk
	sAJ5aK02lf3mbjrFy+zDzpKAhNxarq2GuCRjfc5KTnq+Dgn0/EZpnCekhXtMDqhbC0MH
	KkOI0sgCnVzdna4VCJ9sC7CX+yq7JX+dWTnn2pht8nDPU2d9VcPrBn2lSuaIymlaXL9s
	UE9CtyTIF5WkezpUtvy/ge5t8aoflDpHt3mV0ALQXKpfrZGve7LydF5x5QVROacow11j
	wJfA==
X-Gm-Message-State: AKaTC03WK2egGOZkoLjURjhmmV1j6Vw8v7QKaoldq+bGXwbxbd/jcG8rdQNeB3SwFqxYHg==
X-Received: by 10.84.141.1 with SMTP id 1mr4544154plu.133.1479892947057;
	Wed, 23 Nov 2016 01:22:27 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:33 -0800
Message-Id: <20161123092209.23699-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 13/49] kodi: Fix build with pic on x86_64
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:25 -0000

Upgrade 17.x to latest on master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0012-Always-compile-libcpluff-as-PIC.patch     | 30 ++++++++++++++++++++++
 .../0005-Always-compile-libcpluff-as-PIC.patch     | 30 ++++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_16.bb            |  1 +
 .../recipes-mediacenter/kodi/kodi_17.bb            |  3 ++-
 4 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch
new file mode 100644
index 0000000..f4b22cd
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch
@@ -0,0 +1,30 @@
+From 1fa9026dbcaaf674aedc9734034869934845812a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 13:10:00 -0700
+Subject: [PATCH] Always compile libcpluff as PIC
+
+Fixes errors e.g.
+
+ld: lib/cpluff/libcpluff/.libs/libcpluff.a(pcontrol.o): relocation R_X86_64_PC32 against symbol `cp_stop_plugins' can not be used when making a shared object; recompile with -fPIC
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5d47a4a..cd59129 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2636,7 +2636,7 @@ XB_CONFIG_MODULE([lib/cpluff], [
+     --prefix="${prefix}" --includedir="${includedir}" --libdir="${libdir}" --datadir="${datadir}" \
+     --host=$host_alias \
+     --build=$build_alias \
+-    --target=$target_alias CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
++    --target=$target_alias --with-pic=yes CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
+     #LDFLAGS="$LDFLAGS -Wl,-read_only_relocs,suppress"    
+ ], [0])
+ 
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch
new file mode 100644
index 0000000..f513334
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch
@@ -0,0 +1,30 @@
+From 603e8925a8b1609d483d866346a35fefbc66cfca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 13:10:00 -0700
+Subject: [PATCH 5/5] Always compile libcpluff as PIC
+
+Fixes errors e.g.
+
+ld: lib/cpluff/libcpluff/.libs/libcpluff.a(pcontrol.o): relocation R_X86_64_PC32 against symbol `cp_stop_plugins' can not be used when making a shared object; recompile with -fPIC
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b210b73..52d5f11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2385,7 +2385,7 @@ XB_CONFIG_MODULE([lib/cpluff], [
+     --prefix="${prefix}" --includedir="${includedir}" --libdir="${libdir}" --datadir="${datadir}" \
+     --host=$host_alias \
+     --build=$build_alias \
+-    --target=$target_alias CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
++    --target=$target_alias --with-pic=yes CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
+     #LDFLAGS="$LDFLAGS -Wl,-read_only_relocs,suppress"
+ ], [0])
+ 
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
index 38a53ee..02216fc 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
@@ -76,6 +76,7 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Jarvis \
            file://0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch \
            file://0010-curl-support-version-7.5.0-and-upwards.patch \
            file://0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch \
+           file://0012-Always-compile-libcpluff-as-PIC.patch \
 "
 
 inherit autotools-brokensep gettext pythonnative
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index bdf077a..22b23c6 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -63,13 +63,14 @@ DEPENDS = " \
 
 PROVIDES = "xbmc"
 
-SRCREV = "32c7788e7cce711be5b7f3893c82dddd79658268"
+SRCREV = "7f6abd1dd6d1aefcb4303083f34aaa90a8df9fce"
 PV = "17.0+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
            file://0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
            file://0002-handle-SIGTERM.patch \
            file://0003-add-support-to-read-frequency-output-if-using-intel-.patch \
            file://0004-Disable-DVD-support.patch \
+           file://0005-Always-compile-libcpluff-as-PIC.patch \
 "
 
 inherit autotools-brokensep gettext pythonnative
-- 
2.10.2


