Return-Path: <leo.yan@linaro.org>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 035F761580
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:26:15 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id j17so480459pjz.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 21:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R6V/H3WZ1KIqgckgzTZHJxiXpLOeB8Wy/6mCLmcrDpU=;
	b=Dia9UWEnNOEQp87aoCnmJwVk/4NPoyiCIX1c41eQjqX+ceTf0rtzVHVTCA+ZUd0Q9X
	mTPb9hm0Kz1GTKuOAC/T3+LweYdKQUUryhv/55n+rTe6/CHDraLVzlpACUDYBXR6mxxJ
	dWUbmgtM1Bi/UJJh4ZToMe5Tg3d6p2zfee7E8cks6DBfy1CYKG2h89wMC73p47vn+hr3
	eToW2FGGXaK1ulLda2yMB4z4lq21JITXc4zvr+Fyts1uz/XenczzKDaYVBu4zPYDjLMa
	yNO1GqJF3+zTcC5324q2yI005OvJmFaOReG7HYVm/Cn6fn7ciQlRSZLef6RjyBT4jRPS
	4VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R6V/H3WZ1KIqgckgzTZHJxiXpLOeB8Wy/6mCLmcrDpU=;
	b=YO+I+KMh7+pbRBiTqt8D342Tqf7QYEBekwJre3FJ/IpM6BtYztYhy4WWuv6CD7qvqp
	VhVaotLSjKMVxf4T6BmEVGeI6GkC8sLKezEMgUqL4EwtLi2BCx9oXs23hb41xS3uo2G/
	Xjpvh4SbOgdTYfizEdxj3EgeDflZt87ltKYFcDjTxoZJ5YwU+f8yBesOdPrE7I+hXiQ7
	63/kVGD/4EPDudUZrXXuZkXFyfYRyDf1/Kn64aVbDOFHx6Ki9FvkrOJ/YWfsNIJLAjUy
	dso6rbdWWDrDqRibFhdXbOMbVNxozhB7DBtkTuAkJNbb0Jc9iwfJLRguUPFaYUkj8vHb
	CQ0g==
X-Gm-Message-State: APjAAAVwc2/+Bdz2IaQAogoWa0K+NAYJhBDbk9IX/D8fOp8WiK7DQIJD
	//+OjgBV9iRA6NcVs8ym0JSeA1gFrnDtLw==
X-Google-Smtp-Source: APXvYqxRNBIJZbBmXcgh7YpEeb0ZMnVZCPyevgRz1NwYW3HxYGT9XNYoVZiq44AJK3RTu2LXYY8tpA==
X-Received: by 2002:a17:902:123:: with SMTP id
	32mr19689552plb.38.1582003576928; 
	Mon, 17 Feb 2020 21:26:16 -0800 (PST)
Received: from localhost.localdomain (li1441-214.members.linode.com.
	[45.118.134.214])
	by smtp.gmail.com with ESMTPSA id z4sm2214427pfn.42.2020.02.17.21.26.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 21:26:16 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 18 Feb 2020 13:25:42 +0800
Message-Id: <20200218052544.9467-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218052544.9467-1-leo.yan@linaro.org>
References: <20200218052544.9467-1-leo.yan@linaro.org>
Subject: [meta-oe][PATCH v1 2/4] luajit: Add luajit 2.1.0-beta3 recipe
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
X-List-Received-Date: Tue, 18 Feb 2020 05:26:16 -0000

Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
misses to support aarch64, this patch adds recipe for luajit
2.1.0-beta3 building.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../recipes-devtools/luajit/luajit_2.1.0.bb   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb b/meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb
new file mode 100644
index 000000000..167b5d229
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb
@@ -0,0 +1,92 @@
+SUMMARY = "Just-In-Time Compiler for Lua"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
+HOMEPAGE = "http://luajit.org"
+
+PV .= "+git${SRCPV}"
+SRCREV = "v2.1.0-beta3"
+SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig binconfig siteinfo
+
+BBCLASSEXTEND = "native"
+
+# http://luajit.org/install.html#cross
+# Host luajit needs to be compiled with the same pointer size
+# If you want to cross-compile to any 32 bit target on an x64 OS,
+# you need to install the multilib development package (e.g.
+# libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
+# (HOST_CC="gcc -m32").
+BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
+
+# The lua makefiles expect the TARGET_SYS to be from uname -s
+# Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
+LUA_TARGET_OS = "Unknown"
+LUA_TARGET_OS_darwin = "Darwin"
+LUA_TARGET_OS_linux = "Linux"
+LUA_TARGET_OS_linux-gnueabi = "Linux"
+LUA_TARGET_OS_mingw32 = "Windows"
+
+# We don't want the lua buildsystem's compiler optimizations, or its
+# stripping, and we don't want it to pick up CFLAGS or LDFLAGS, as those apply
+# to both host and target compiles
+EXTRA_OEMAKE = "\
+    Q= E='@:' \
+    \
+    CCOPT= CCOPT_x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
+    \
+    'TARGET_SYS=${LUA_TARGET_OS}' \
+    \
+    'CC=${CC}' \
+    'TARGET_AR=${AR} rcus' \
+    'TARGET_CFLAGS=${CFLAGS}' \
+    'TARGET_LDFLAGS=${LDFLAGS}' \
+    'TARGET_SHLDFLAGS=${LDFLAGS}' \
+    'HOST_CC=${BUILD_CC}' \
+    'HOST_CFLAGS=${BUILD_CFLAGS}' \
+    \
+    'PREFIX=${prefix}' \
+    'MULTILIB=${baselib}' \
+    'LDCONFIG=:' \
+"
+
+do_compile () {
+    oe_runmake
+}
+
+# There's INSTALL_LIB and INSTALL_SHARE also, but the lua binary hardcodes the
+# '/share' and '/' + LUA_MULTILIB paths, so we don't want to break those
+# expectations.
+EXTRA_OEMAKEINST = "\
+    'DESTDIR=${D}' \
+    'INSTALL_BIN=${D}${bindir}' \
+    'INSTALL_INC=${D}${includedir}/luajit-$(MAJVER).$(MINVER)' \
+    'INSTALL_MAN=${D}${mandir}/man1' \
+"
+do_install () {
+    oe_runmake ${EXTRA_OEMAKEINST} install
+    rmdir ${D}${datadir}/lua/5.* \
+          ${D}${datadir}/lua \
+          ${D}${libdir}/lua/5.* \
+          ${D}${libdir}/lua
+}
+
+PACKAGES += 'luajit-common'
+
+# See the comment for EXTRA_OEMAKEINST. This is needed to ensure the hardcoded
+# paths are packaged regardless of what the libdir and datadir paths are.
+FILES_${PN} += "${prefix}/${baselib} ${prefix}/share"
+FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
+    ${libdir}/libluajit-5.1.so.${PV} \
+"
+FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
+    ${libdir}/libluajit-5.1.so \
+    ${libdir}/pkgconfig/luajit.pc \
+"
+FILES_luajit-common = "${datadir}/${BPN}-${PV}"
+
+# mips64 is not supported in this release
+COMPATIBLE_HOST_mipsarchn32 = "null"
+COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.17.1


