Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g4-00072H-WF
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:09 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so475257eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Ux8nCZpT5JYaf1rxOJc7wiI9FldjUj8TjSmNUpUyTN4=;
	b=R6F8lTjMAWnVzuuf2f1+v0Rv/PtlmDyau97C2QcqgU2b1u9XLg3B9KZ/dFLmnzNodj
	7TKFQgv0GF654baNeeBEQqaMC8dQiggCCGPeOJySX6atO9IEUzwHq5Mi20XlCMH+HniP
	yZ+mfCmSTgSiLFb9KJ7xm/DEmuvneSvfw2lulgrqWwh56BeVFODZIm4tGfVp+qQ07MJ0
	5bl5WG/6zU59SUVDcyS/CeoZ/DFrHh5H2NFsMgGYUIHv70Udlnq3u5G7EoNUQv95GhGD
	vA9ayrhPsdnlZK+/b8T/hL1TjFphnTijPowv2iihUBsssAST2lJx7kG9QWnGrlwqtsct
	t6aA==
X-Received: by 10.14.207.195 with SMTP id n43mr6387230eeo.38.1355849719297;
	Tue, 18 Dec 2012 08:55:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm4253020eek.0.2012.12.18.08.55.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:05 +0100
Message-Id: <d0d3977290c706f4b71d1a3228df889288583c8e.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/10] azy: rename lemon provided by azy-native to azy_lemon
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

* meta-openembedded/meta-oe/recipes-devtools/lemon/lemon_3.5.4.bb provides almost the same lemon
  but lemon.c in azy sources is a bit modified (and completely reformatted :/)

* rename it to resolve:
  WARNING: The recipe azy-native is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/lemon
   Matched in manifest-x86_64-lemon-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index 43f9b7d..8082196 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 PV = "1.0.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRCREV = "${EFL_SRCREV}"
 
@@ -15,14 +15,14 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += " --disable-mysql-tests"
 
 do_configure_prepend_class-target() {
-  sed -i "s#\./lemon#${STAGING_BINDIR_NATIVE}/lemon#g" ${S}/src/bin/Makefile.am
+  sed -i "s#\./lemon#${STAGING_BINDIR_NATIVE}/azy_lemon#g" ${S}/src/bin/Makefile.am
   sed -i "s#\$(top_builddir)/src/bin/azy_parser -H -p -o#${STAGING_BINDIR_NATIVE}/azy_parser -H -p -o#g" ${S}/src/tests/Makefile.am
   sed -i "s#\$(top_builddir)/src/bin/azy_parser -eHn -m#${STAGING_BINDIR_NATIVE}/azy_parser -eHn -m#g" ${S}/src/tests/identi.ca/Makefile.am
 }
 
 do_install_append_class-native() {
   install -d ${D}/${bindir}
-  install -m 0755 ${S}/src/bin/lemon ${D}/${bindir}
+  install -m 0755 ${S}/src/bin/lemon ${D}/${bindir}/azy_lemon
 }
 
 inherit efl
-- 
1.8.0.2



