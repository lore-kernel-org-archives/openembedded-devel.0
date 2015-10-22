Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B40665C8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 19:13:21 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so2573605wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=I5s/7UYzLa55x03vrjLgYoRzdXPWJJOAIXaW+7l+Mqs=;
	b=NTa9e4E9VfAbXlWD1zdcp7PNSNA6NNEK4A/Qne5t0ocyz4Qk7VvtKyc1d3HdbTw9SD
	umf4OQXK9I5J40st04t5kFzKAYuZqe31bXRmigkWTydeE15Fi8ZT+YRxmBvPW/z5Gl3q
	0dB6bC0bZdPNkshsn9092YBbGoLe02yW+hPajEannJ5Az3ED4wxiHchZFscbISSALSU5
	OutUE/uXeEsD7aC5xOOijz0zPKu6exzPjorZvOO1fYEPYMk7PszZwSUmoKkOOEGkx429
	L17dHCVZMbn5mvs2uiKIExCwUr0329gR8ISDKtztBBiWXcsYe4WcIm5q0s2mzvkVss1I
	dBMw==
X-Received: by 10.180.9.173 with SMTP id a13mr85056wib.63.1445541201397;
	Thu, 22 Oct 2015 12:13:21 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1181.dip0.t-ipconnect.de.
	[79.223.17.129]) by smtp.googlemail.com with ESMTPSA id
	h8sm203993wib.8.2015.10.22.12.13.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 12:13:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 21:13:09 +0200
Message-Id: <1445541189-13375-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
References: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] epdf: make it build again and get out of blacklist-exile
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
X-List-Received-Date: Thu, 22 Oct 2015 19:13:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...alias-functions-poppler-has-dropped-them-.patch | 132 +++++++++++++++++++++
 ...r_postscript.cpp-fix-build-for-poppler-AP.patch |  45 +++++++
 meta-efl/recipes-efl/efl/epdf_svn.bb               |   8 +-
 3 files changed, 181 insertions(+), 4 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch
 create mode 100644 meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch

diff --git a/meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch b/meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch
new file mode 100644
index 0000000..728ffa6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch
@@ -0,0 +1,132 @@
+From 6691ac5fcbac0e766d4410ae649a13957ae85289 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 22 Oct 2015 16:27:52 +0200
+Subject: [PATCH 1/2] remove antialias functions - poppler has dropped them in
+ the API
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The functions removed were not used.
+
+Upstream-Status: pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/lib/epdf_main.h                   | 45 -----------------------------------
+ src/lib/mupdf/epdf_mupdf_main.c       | 18 --------------
+ src/lib/poppler/epdf_poppler_main.cpp | 21 ----------------
+ 3 files changed, 84 deletions(-)
+
+diff --git a/src/lib/epdf_main.h b/src/lib/epdf_main.h
+index 54a57ca..0a79bad 100644
+--- a/src/lib/epdf_main.h
++++ b/src/lib/epdf_main.h
+@@ -29,49 +29,4 @@ EAPI int epdf_shutdown();
+  */
+ EAPI const char *epdf_backend_version_get (void);
+ 
+-/**
+- * @brief Return the state of fonts antialiasing in Poppler
+- *
+- * @return EINA_TRUE if fonts antialiasing enabled, EINA_FALSE otherwise.
+- *
+- * Return EINA_TRUE if the state of fonts antialiasing is enabled in
+- * Poppler, EINA_FALSE otherwise.
+- *
+- * @ingroup Epdf_Main
+- */
+-EAPI Eina_Bool epdf_fonts_antialias_get (void);
+-
+-/**
+- * @brief Sets fonts antialiasing mode in Poppler
+- *
+- * @param on EINA_TRUE to enable fonts antialiasing, EINA_FALSE to disable
+- *
+- * Set @p on to EINA_TRUE to enable fonts antialiasing in Poppler,
+- * EINA_FALSE to disable it.
+- */
+-EAPI void epdf_fonts_antialias_set (Eina_Bool on);
+-
+-/**
+- * @brief Return the state of lines antialiasing in Poppler
+- *
+- * @return EINA_TRUE if lines antialiasing enabled, EINA_FALSE otherwise.
+- *
+- * Return EINA_TRUE if the state of lines antialiasing is enabled in
+- * Poppler, EINA_FALSE otherwise.
+- *
+- * @ingroup Epdf_Main
+- */
+-EAPI Eina_Bool epdf_lines_antialias_get (void);
+-
+-/**
+- * @brief Sets lines antialiasing mode in Poppler
+- *
+- * @param on EINA_TRUE to enable lines antialiasing, EINA_FALSE to disable
+- *
+- * Set @p on to EINA_TRUE to enable lines antialiasing in Poppler,
+- * EINA_FALSE to disable it.
+- */
+-EAPI void epdf_lines_antialias_set (Eina_Bool on);
+-
+-
+ #endif /* __EPDF_MAIN_H__ */
+diff --git a/src/lib/mupdf/epdf_mupdf_main.c b/src/lib/mupdf/epdf_mupdf_main.c
+index 17bb830..27c6de2 100644
+--- a/src/lib/mupdf/epdf_mupdf_main.c
++++ b/src/lib/mupdf/epdf_mupdf_main.c
+@@ -37,21 +37,3 @@ epdf_backend_version_get (void)
+ {
+    return "0.5";
+ }
+-
+-Eina_Bool epdf_fonts_antialias_get(void)
+-{
+-   return EINA_TRUE;
+-}
+-
+-void epdf_fonts_antialias_set(Eina_Bool on)
+-{
+-}
+-
+-Eina_Bool epdf_lines_antialias_get(void)
+-{
+-   return EINA_TRUE;
+-}
+-
+-void epdf_lines_antialias_set(Eina_Bool on)
+-{
+-}
+diff --git a/src/lib/poppler/epdf_poppler_main.cpp b/src/lib/poppler/epdf_poppler_main.cpp
+index 9841987..9efdbe8 100644
+--- a/src/lib/poppler/epdf_poppler_main.cpp
++++ b/src/lib/poppler/epdf_poppler_main.cpp
+@@ -46,24 +46,3 @@ epdf_backend_version_get (void)
+ {
+   return POPPLER_VERSION;
+ }
+-
+-Eina_Bool epdf_fonts_antialias_get (void)
+-{
+-  return globalParams->getAntialias();
+-}
+-
+-void epdf_fonts_antialias_set (Eina_Bool on)
+-{
+-  /* Nice API */
+-  globalParams->setAntialias((char*)(on ? "yes" : "no"));
+-}
+-
+-Eina_Bool epdf_lines_antialias_get (void)
+-{
+-    return globalParams->getVectorAntialias();
+-}
+-
+-void epdf_lines_antialias_set (Eina_Bool on)
+-{
+-    globalParams->setVectorAntialias((char*)(on ? "yes" : "no"));
+-}
+-- 
+2.1.0
+
diff --git a/meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch b/meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch
new file mode 100644
index 0000000..c9adaa7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch
@@ -0,0 +1,45 @@
+From a84c16fdc606f22b993f870b1cea56dd060a35e6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 22 Oct 2015 16:55:30 +0200
+Subject: [PATCH 2/2] epdf_poppler_postscript.cpp: fix build for poppler API
+ change
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Poppler API was changed in [1]. The patch not only shows the change but also
+inspires how to fix.
+
+[1] http://cgit.freedesktop.org/poppler/poppler/commit/?id=9caf7525409d699c16896653528486451123b485
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/lib/poppler/epdf_poppler_postscript.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/poppler/epdf_poppler_postscript.cpp b/src/lib/poppler/epdf_poppler_postscript.cpp
+index 0c2836b..656193b 100644
+--- a/src/lib/poppler/epdf_poppler_postscript.cpp
++++ b/src/lib/poppler/epdf_poppler_postscript.cpp
+@@ -82,11 +82,14 @@ epdf_postscript_print (const Epdf_Postscript *postscript)
+ 
+   // FIXME: fix postscript title
+ #ifdef HAVE_POPPLER_0_20
++  std::vector<int> pages;
++  for (int i = postscript->first_page; i <= postscript->last_page; ++i) {
++    pages.push_back(i);
++  }
+   PSOutputDev ps_dev(postscript->filename,
+                      postscript->pdfdoc,
+                      (char *)"PS title",
+-                     postscript->first_page,
+-                     postscript->last_page,
++                     pages,
+                      psModePS,
+                      (int)postscript->width,
+                      (int)postscript->height,
+-- 
+2.1.0
+
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index a2adf6a..e32a5fd 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -11,7 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
 "
 
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
+SRC_URI = " \
+    ${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
+    file://0001-remove-antialias-functions-poppler-has-dropped-them-.patch \
+    file://0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
@@ -22,6 +25,3 @@ EXTRA_OECONF = "\
 
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
-
-# 2_0.1.0+svnr82070-r0/epdf/src/lib/poppler/epdf_poppler_main.cpp:52:24: error: 'class GlobalParams' has no member named 'getAntialias'
-PNBLACKLIST[epdf] ?= "BROKEN: fails to build with newer poppler"
-- 
2.1.0


