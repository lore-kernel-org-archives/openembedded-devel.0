Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 177F177373
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:23:34 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c200so228933230wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dfAX78qmx0nQu/Z+YqsayLxev9aJKTjEoRL3Ct1YhME=;
	b=dQVw0UKZ+Ztnxbwq6bNXtpqldjkgr2BwY8gGOBPiY7bmqjjGRuo01Vs9klLerFNYj1
	Msi+JGNXQX/w7Wb6YBzz0zkxeaF2p4K7SsvZaVrkcmuGe+J90MaJDetsfT/Q3vSpaA+8
	ovKLgrQAMVt1djKK8GnOxnDWlGUQZNJ23vj4++YU9WwtwuYOXElXuL42pgsWSobp7pnK
	ZYmCm7Yd0kJKgF9tgbLdTqNN6iHcmF4bViR3ti0TTwwd0B1SOdPEneMvqO/Z92BTT1bJ
	SU9Bx8U7zekAgI6aVVNm5J4fIkRYZeGxcJyQC1gFsDObHnKCrhkprhWbqNSdrRcYT3Dm
	ynlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dfAX78qmx0nQu/Z+YqsayLxev9aJKTjEoRL3Ct1YhME=;
	b=ACl9ZGndBNaKn/Ke2tMZFKcqbwUdnvGflOi7FxrIpnD2NKDqI46zrJ/xpSUqQlrevj
	4WLYMNq7UwyRR4mGGkCmCOsrChYMVL/52CPAEifGAQbGTfs8GVpEbOLy5QnNAtvmS+FN
	9G2U0VvDh1YndyQsToJyDhHYPF5yqPM9cVp2tODDaNsmr1MKt5/0pToW+Ksa2rsk4luu
	I6E4PSJO15czWjEgmjQJxCtBjq0JcNc2Jt9joJnXRuUuV1wWPixK5XhKzRz2nffY+z4w
	QVSCQYSf5gyog2fHZiVdpbiL3bs9jHaSJIX9hXz0MIYlRqYRRGVJBvAxRKB+EJATACC7
	VmTw==
X-Gm-Message-State: AG10YORNLrmUSV58V4AxfKte5xCRp6iC+C+Atni/nbxnjgM6u4bMWz9IVDga0tTqNHIdrg==
X-Received: by 10.194.75.164 with SMTP id d4mr34103690wjw.15.1456244615228;
	Tue, 23 Feb 2016 08:23:35 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o128sm2805671wmb.19.2016.02.23.08.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 08:23:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 17:24:33 +0100
Message-Id: <1456244673-3189-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] zsh: fold .inc into .bb
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
X-List-Received-Date: Tue, 23 Feb 2016 16:23:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh.inc      | 57 ------------------------------
 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb | 58 +++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zsh/zsh.inc

diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
deleted file mode 100644
index b8fce80..0000000
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY = "UNIX Shell similar to the Korn shell"
-DESCRIPTION = "Zsh is a shell designed for interactive use, although it is also a \
-               powerful scripting language. Many of the useful features of bash, \
-               ksh, and tcsh were incorporated into zsh; many original features were added."
-HOMEPAGE = "http://www.zsh.org"
-SECTION = "base/shell"
-
-LICENSE = "zsh"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
-
-DEPENDS = "ncurses bison-native"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-
-inherit autotools gettext update-alternatives
-
-EXTRA_OECONF = " \
-    --bindir=${base_bindir} \
-    --enable-etcdir=${sysconfdir} \
-    --enable-fndir=${datadir}/${PN}/${PV}/functions \
-    --enable-site-fndir=${datadir}/${PN}/site-functions \
-    --with-term-lib='ncursesw ncurses' \
-    --with-tcsetpgrp \
-    --enable-cap \
-    --enable-multibyte \
-    --disable-gdbm \
-    --disable-dynamic \
-    zsh_cv_shared_environ=yes \
-"
-
-ALTERNATIVE_${PN} = "sh"
-ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
-ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
-ALTERNATIVE_PRIORITY = "100"
-
-export AUTOHEADER = "true"
-
-do_configure () {
-    gnu-configize --force ${S}
-    oe_runconf
-}
-
-do_install_append () {
-    rm -fr ${D}/usr/share
-}
-
-pkg_postinst_${PN} () {
-    touch $D${sysconfdir}/shells
-    grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
-    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
-}
-
-FILES_${PN}-dbg += "\
-    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
-"
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
index a7170dc..658f3d9 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -1,5 +1,59 @@
-require zsh.inc
-DEPENDS += "libcap libpcre gdbm groff-native"
+SUMMARY = "UNIX Shell similar to the Korn shell"
+DESCRIPTION = "Zsh is a shell designed for interactive use, although it is also a \
+               powerful scripting language. Many of the useful features of bash, \
+               ksh, and tcsh were incorporated into zsh; many original features were added."
+HOMEPAGE = "http://www.zsh.org"
+SECTION = "base/shell"
 
+LICENSE = "zsh"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
+
+DEPENDS = "ncurses bison-native libcap libpcre gdbm groff-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "6fb0e3e52a0f8de5ca63138391b81ce0"
 SRC_URI[sha256sum] = "b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d15023ff291c2894b4"
+
+inherit autotools gettext update-alternatives
+
+EXTRA_OECONF = " \
+    --bindir=${base_bindir} \
+    --enable-etcdir=${sysconfdir} \
+    --enable-fndir=${datadir}/${PN}/${PV}/functions \
+    --enable-site-fndir=${datadir}/${PN}/site-functions \
+    --with-term-lib='ncursesw ncurses' \
+    --with-tcsetpgrp \
+    --enable-cap \
+    --enable-multibyte \
+    --disable-gdbm \
+    --disable-dynamic \
+    zsh_cv_shared_environ=yes \
+"
+
+ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
+ALTERNATIVE_PRIORITY = "100"
+
+export AUTOHEADER = "true"
+
+do_configure () {
+    gnu-configize --force ${S}
+    oe_runconf
+}
+
+do_install_append () {
+    rm -fr ${D}/usr/share
+}
+
+pkg_postinst_${PN} () {
+    touch $D${sysconfdir}/shells
+    grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
+    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
+}
+
+FILES_${PN}-dbg += "\
+    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
+"
-- 
2.7.1


