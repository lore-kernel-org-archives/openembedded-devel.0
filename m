Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4856ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:18:18 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id k14so8102117wgh.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z7kay4Lg6S5LfGX1vaGOEQLe00zW+TeKfPMOJ5mRXRI=;
	b=qPrscS5aD9xLeCoaw1ARpqk+J1D59ihztZC7y8jvGUnhPRt0jzMZ+AwgQmqzTe6Fxl
	zZ7FklX0dcOUM1/c4YVXLC5eLMPiYrCIppnzDvZT6nVO8IzjIGTsd7F3Yn8KIg/4E7a3
	JxMGs9PIEnYjeBojLYaR0hGT3iRwMoNbmn1VeAzZfGhXXim3Ne0UOmk8HAbx18mMk4zE
	wA2efoBc65MmRmp25tnqVYojf8gVVLnfsXahdiNEjutPZYkJ6wVFYEv9uQt4dCGONuN0
	03gJAxB8RZfG7Yyd/jC19ziaqR8MmBWI0uEG6P3vkHhM/VM5FanxG+XSMSTvzZ+QHV9D
	T0tQ==
X-Received: by 10.180.221.229 with SMTP id qh5mr3203612wic.33.1401873499334;
	Wed, 04 Jun 2014 02:18:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cz8sm2945991wjc.11.2014.06.04.02.18.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:18:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:18:22 +0200
Message-Id: <1401873504-32120-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/7] luajit: upgrade to 2.0.3, add native support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 09:18:19 -0000

* http://luajit.org/changes.html says:
  This release has the new PS4 port and various important bugfixes over
  2.0.2 - an update is recommended.
* add native support (used by efl-native)
* drop lua dependency, it doesn't need lua to be built before luajit
* LIC_FILES_CHKSUM change is only from copyright year update
  < Copyright (C) 2005-2013 Mike Pall. All rights reserved.
  ---
  > Copyright (C) 2005-2014 Mike Pall. All rights reserved.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../luajit/{luajit_2.0.2.bb => luajit_2.0.3.bb}         | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.2.bb => luajit_2.0.3.bb} (76%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.2.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
similarity index 76%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.2.bb
rename to meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index b719b48..de3a40b 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.2.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -1,14 +1,13 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1793ef52a5d577794cd886a501a7f861"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=97b6446bbf9d55616838f821585c5978"
 HOMEPAGE = "http://luajit.org"
 
-DEPENDS += "lua5.1"
-SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz;name=tarball \
+SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
-          "
-SRC_URI[tarball.md5sum] = "112dfb82548b03377fbefbba2e0e3a5b"
-SRC_URI[tarball.sha256sum] = "c05202974a5890e777b181908ac237625b499aece026654d7cc33607e3f46c38"
+"
+SRC_URI[md5sum] = "f14e9104be513913810cd59c8c658dc0"
+SRC_URI[sha256sum] = "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79"
 
 SRC_URI_append_fslmachine = " file://ppc-fixplt.patch "
 
@@ -16,6 +15,8 @@ S = "${WORKDIR}/LuaJIT-${PV}"
 
 inherit pkgconfig binconfig
 
+BBCLASSEXTEND = "native"
+
 do_configure_prepend() {
     sed -i -e s:/usr/local:${prefix}:g ${S}/Makefile
     sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
@@ -35,9 +36,9 @@ do_compile () {
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
-    rmdir ${D}${datadir}/lua/5.1 \
+    rmdir ${D}${datadir}/lua/5.* \
           ${D}${datadir}/lua \
-          ${D}${libdir}/lua/5.1 \
+          ${D}${libdir}/lua/5.* \
           ${D}${libdir}/lua
 }
 
-- 
2.0.0


