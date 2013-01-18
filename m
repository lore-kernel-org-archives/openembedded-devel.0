Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwGyL-0008Sx-8R
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 19:47:29 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2268283pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 10:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0SlP+l+yC2fpSk3bQ+MdipoP53P610LKgg42+fN8MU4=;
	b=CfdqntNv2RV8kggjJ23Bup10+NDrOlJek70v2XXH7eRrO42YwZ5Irm4SoA5Sp6bGZk
	gXQCFICG0kNq7dspAr9CJD0A+X2SsmCTFNBFlw2hxbe/u/ISd6QYeDkQYnuQLLFqFAvi
	9JPHkgq6RnSw3NNtj3VIwl6avZ3XAaomgEJruPXMdvyTcpt5Bb6J1rJBpeUkEEznj8Cu
	lksO37RaOmAIvISGZ2mRGSuLJO73cSqe8X+6x8JxNB7eeXhuUClTuMSmzTRzPigZIqa+
	Y2XAPcI24dHQbsxEizMl5nhGNyjekNuTWa0E3u2WYDvEEz+QyDtxCvz6NapAY81F3Fyg
	V2kw==
X-Received: by 10.66.83.6 with SMTP id m6mr26032913pay.52.1358533919724;
	Fri, 18 Jan 2013 10:31:59 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id qo10sm3497675pbc.58.2013.01.18.10.31.57
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 10:31:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2013 10:31:31 -0800
Message-Id: <1358533891-4828-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] lua5.1: Fix multilib install
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
X-List-Received-Date: Fri, 18 Jan 2013 18:47:29 -0000

when we have multilib enabled then there are some hardcoded
assumptions in lua code which needs to be fixed some can
be fixed by simply passing right variable on cmdline for
the one's in sourcecode needs to be edited in place.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
index 9da9e95..f303d87 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
@@ -4,6 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=59bdd99bb82238f238cf5c65c21604fd"
 HOMEPAGE = "http://www.lua.org/"
 
+PR = "r1"
+
 DEPENDS += "readline"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
@@ -21,6 +23,7 @@ EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLD
 
 do_configure_prepend() {
 	sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
+	sed -i -e s:lib/lua/5.1/:${base_libdir}/lua/5.1/:g src/luaconf.h
 }
 
 do_compile () {
@@ -34,6 +37,8 @@ do_install () {
 		'INSTALL_INC=${D}${includedir}/' \
 		'INSTALL_MAN=${D}${mandir}/man1' \
 		'INSTALL_SHARE=${D}${datadir}/lua' \
+		'INSTALL_LIB=${D}${libdir}' \
+		'INSTALL_CMOD=${D}${libdir}/lua/5.1' \
 		install
 	install -d ${D}${libdir}/pkgconfig
 	install -m 0644 ${WORKDIR}/lua5.1.pc ${D}${libdir}/pkgconfig/lua5.1.pc
-- 
1.7.9.5



