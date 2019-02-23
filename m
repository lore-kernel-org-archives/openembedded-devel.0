Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B68E6B5C5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:25:03 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h8so1498659pgp.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xtB2I+bJ2XBdD0GbotVGDZAbOxG6H1YBN7HfEEXiAfM=;
	b=dRaB1O0VnaMtId/eBFFsu3rWL4+b/N88T9XMfwP8ngnY2y5b3uqvYPmiyMF0djb198
	rDJ0MrOocqoOUDUj4HtJop4E44/yITtHhT3QkDGd0LLBeYBye3rtKHQDqe3e0GoP0LAQ
	lePIHWQJR8W4Envc+msVMri3O9oCZ9MxuSt2lMR6f832ENcVUiJ3Vy4atjiq1a/SwxuR
	FkCZNZhV/Ul/f0tnQ/nPRxCxoEheFIc/xwwFlr4wAYo4MBwOGazft+Qqtd4ZnmtF0Tsf
	JDTIqNAj4/mE1kzFNdllZbS47IlT7Z4tlUorqJUK7A8fW0o5SZ0dSLtcsqBBXtQX6+3p
	VHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xtB2I+bJ2XBdD0GbotVGDZAbOxG6H1YBN7HfEEXiAfM=;
	b=VHWhFSqzNKkOxSkrQoUen4fguc46eyXd4Quuyun3D9LWCkS0PjZhTTgrXuaMA5OU+r
	hvOCfA5Tti+TItiG1hBmS8CG9K7MNkZfamol5Ku4cQGqUx+KDu0+Hkycs4pKpzEgpTxb
	QzMy3izSZt23xltD1T32UTjqMSJHFrHfEsPXHWkU+fSEcNhfuYOMDKpn+ugQME1Yw9o+
	/cUZzeRKvR4YR0ClFiAMC0HSqhpYbeNEGdGxMMcvMfSjozQqz6RqJQeD2hVZbeuU2twb
	cauoKVkNZqsp4aS4NtNuTcn3VumdD8wT+b4KqKH1lA8qsBECR3Bm+3x6Zer4c4bF39rh
	RqGw==
X-Gm-Message-State: AHQUAuZWjtifzEaDTAwn2V5OnKFxfQm1wiFoOfref5rhebZ3hs7jRBx1
	nYjF/EbSGcYqIvXJT8JEjnC4JhisSBc=
X-Google-Smtp-Source: AHgI3IZYcp/IdGEPe896LfFo+2w/tO5r7uaWcpHtmwZp3KX/wNgbbJeygVQuWcXdDnIVW5MAAeOjhQ==
X-Received: by 2002:a63:a11:: with SMTP id 17mr3345721pgk.310.1550895904163;
	Fri, 22 Feb 2019 20:25:04 -0800 (PST)
Received: from localhost.localdomain ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id
	k74sm7128249pfb.172.2019.02.22.20.25.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 20:25:03 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Feb 2019 11:24:51 +0700
Message-Id: <20190223042452.8704-1-tuanha@viosoft.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] tk_8.6.9: Add tkConfig.sh in crossscript
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
X-List-Received-Date: Sat, 23 Feb 2019 04:25:03 -0000

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
index 9eec4bba7..459ae8253 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
@@ -50,6 +50,11 @@ do_install_append() {
     ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
     oe_libinstall -so libtk${VER} ${D}${libdir}
     ln -sf wish${VER} ${D}${bindir}/wish
+
+    sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
+    sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tkConfig.sh
+    install -d ${D}${bindir_crossscripts}
+    install -m 0755 tkConfig.sh ${D}${bindir_crossscripts}
 }
 
 PACKAGECONFIG ??= "xft"
@@ -69,3 +74,23 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*Config.sh"
+
+inherit binconfig
+
+SYSROOT_DIRS += "${bindir_crossscripts}"
+
+# Fix some paths that might be used by Tcl extensions
+BINCONFIG_GLOB = "*Config.sh"
+
+# Cleanup host path from ${libdir}/tclConfig.sh and remove the
+# ${bindir_crossscripts}/tclConfig.sh from target
+PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
+tcl_package_preprocess() {
+        sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
+               -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
+               -e "s;${STAGING_INCDIR};${includedir};g" \
+               -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+               ${PKGD}${libdir}/tkConfig.sh
+
+        rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh
+}
-- 
2.17.1


