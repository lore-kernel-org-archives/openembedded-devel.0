Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXG-00036r-0F
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so8162818dak.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=y8uav/NqvhxmTv1BoneRLKHatHH6rRWs3r9SBgbOGJQ=;
	b=DS245wwAGi1Z5Zehs0pKPLqShRXWEFCa9OUivpzvce2AQeF/CfDsQpyg6wEgg/A84G
	MG0Tm9x3By7kH4Xb537xQUoBqU73vR+iDV78p57FRCt33APUr3LGdl1mbTBHZRsVLrRH
	/99pvsUADgeTNzGJnISLUsxY4d5qIGrp5aTcMHnRTNc9O8UKK+G3BHNH4909viNOhUIU
	+B37GnUmSgrW1TFSMSRiGRwR0OaJrlvh5RNc4qWLS/I6d2UDE+mhHx3QcrAwWKDUISvl
	YlGT2aoH5EtVOFI0WQxyfCGZPXeAqM4iJN/YY2AwDT4K4b3rIN6pLuoq5gRJyE+FXn18
	LRjw==
X-Received: by 10.68.129.233 with SMTP id nz9mr174760810pbb.139.1357463625726; 
	Sun, 06 Jan 2013 01:13:45 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:35 -0800
Message-Id: <1357463568-26241-12-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 12/25] luajit: Add recipes
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

LuaJIT is for JIT'ting LUA code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../disable_lj_vm_foldarith_for_spe.patch          |   13 +++++
 meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb    |   53 ++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb

diff --git a/meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch b/meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch
new file mode 100644
index 0000000..c96fc77
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch
@@ -0,0 +1,13 @@
+Index: LuaJIT-2.0.0/src/lj_vmmath.c
+===================================================================
+--- LuaJIT-2.0.0.orig/src/lj_vmmath.c	2012-11-08 02:10:00.000000000 -0800
++++ LuaJIT-2.0.0/src/lj_vmmath.c	2012-11-19 22:15:28.613527136 -0800
+@@ -22,7 +22,7 @@
+ LJ_FUNCA double lj_vm_tanh(double x) { return tanh(x); }
+ #endif
+ 
+-#if !LJ_TARGET_X86ORX64
++#if !(LJ_TARGET_X86ORX64 || LJ_TARGET_PPCSPE)
+ double lj_vm_foldarith(double x, double y, int op)
+ {
+   switch (op) {
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
new file mode 100644
index 0000000..ac769cf
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = " a Just-In-Time Compiler for Lua"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9511885992e4900014e3b13ca6372b7d"
+HOMEPAGE = "http://luajit.org"
+
+DEPENDS += "lua5.1"
+PR = "r0"
+SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
+           file://disable_lj_vm_foldarith_for_spe.patch \
+          "
+SRC_URI[md5sum] = "97a2b87cc0490784f54b64cfb3b8f5ad"
+SRC_URI[sha256sum] = "deaed645c4a093c5fb250c30c9933c9131ee05c94b13262d58f6e0b60b338c15"
+
+S = "${WORKDIR}/LuaJIT-${PV}"
+
+inherit pkgconfig binconfig
+
+do_configure_prepend() {
+	sed -i -e s:/usr/local:${prefix}:g ${S}/Makefile
+	sed -i -e s:/lib:${base_libdir}:g ${S}/Makefile
+}
+
+EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX}'
+EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
+EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
+EXTRA_OEMAKE_append_i586 = ' HOST_CC="${BUILD_CC} -m32"'
+EXTRA_OEMAKE_append_powerpc64 = ' HOST_CC="${BUILD_CC}"'
+EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"'
+EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+	rmdir ${D}${datadir}/lua/5.1 \
+	      ${D}${datadir}/lua \
+	      ${D}${libdir}/lua/5.1 \
+	      ${D}${libdir}/lua
+}
+
+PACKAGES += 'luajit-common'
+
+FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
+		${libdir}/libluajit-5.1.so.2.0.0 \
+	       "
+FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
+		    ${libdir}/libluajit-5.1.so \
+                    ${libdir}/pkgconfig/luajit.pc \
+                   "
+FILES_luajit-common = "${datadir}/${BPN}-${PV}"
+
-- 
1.7.9.5



