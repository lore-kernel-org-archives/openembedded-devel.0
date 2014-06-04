Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 304126B7D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 04:29:33 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rr13so6442852pbb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 21:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vLSifu/ICX98ykmVQHc6hiAjhhxdCrON3h7SE+99yB8=;
	b=GCZqlpsGC76Jh3fOLYjrQz0COA0RV/9wwqEYXXltEpcqeca6kNnWoevKfTugUToGXW
	6cKyeYCfXt6EWcUvZu3yeKuSYSab+R6j1602HSRTIxOv+Twu8Sal8UggMI0q88td0vr2
	X7HZs1wwTybyn+uoLFRZ+myehgCAqKbziX/yB5RVxYsifsDyxyDvnUy4BD6fGhTKpJ/j
	WbOOxYkoddKulfnHC0/l6egyF9nMQwYvCznMO1xG9qo6De6aMzL+CxvWjK1F3Br2Gy06
	0hb+iL9Ly2e2n1sYWsnCduU1oOBHMbP7hOefsGltDIhiJ+hsgGbGkQGFLvqJlFPhwkBq
	KeCw==
X-Gm-Message-State: ALoCoQlKNVfwadVwlOYyVm40UhvTflcU61T/ih0zJXg7mJUQr+ZJguk8c4rettR4voHsfEtrtK0D
X-Received: by 10.68.248.2 with SMTP id yi2mr53635489pbc.158.1401856173675;
	Tue, 03 Jun 2014 21:29:33 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	pz10sm4442883pbb.33.2014.06.03.21.29.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jun 2014 21:29:32 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jun 2014 21:29:30 -0700
Message-Id: <1401856170-9151-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] postgresql: B!=S fix
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
X-List-Received-Date: Wed, 04 Jun 2014 04:29:43 -0000

This fixes a configure issue do to incorrect directory reference.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index e1374fb..2858a84 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -107,14 +107,14 @@ do_configure() {
 	# do_configure_append
 	# workaround perl package related bugs
 	sed -i -e "s:-L/usr/local/lib:-L=/usr/local/lib:g" \
-	    ${S}/src/Makefile.global
+	    ${B}/src/Makefile.global
 	LIBPNA="\${STAGING_LIBDIR_NATIVE}/perl-native"
 	LIBNA="\${STAGING_LIBDIR_NATIVE}"
 	BLIBNA="\${STAGING_BASE_LIBDIR_NATIVE}"
 	sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
-	    ${S}/src/Makefile.global
+	    ${B}/src/Makefile.global
 	sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
-	    ${S}/src/Makefile.global
+	    ${B}/src/Makefile.global
 	# remove the rpath, replace with correct lib path
 	sed -i \
 	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${LIBNA}::g" \
@@ -124,7 +124,7 @@ do_configure() {
 	    -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
 	    -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
 	    -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
-	${S}/src/Makefile.global
+	${B}/src/Makefile.global
 
 	# workaround perl package's libperl.so problem
 	# we are using perlnative so this perl should have same version
@@ -158,11 +158,11 @@ do_install_append() {
     oe_runmake DESTDIR=${D} -C contrib install
     # install tutorial
     install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
-    install ${S}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
+    install ${B}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
 
     # install COPYRIGHT README HISTORY
     install -d -m 0755 ${D}${docdir}/${BPN}
-    for i in ${S}/{COPYRIGHT,README,HISTORY} ${S}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
+    for i in ${B}/{COPYRIGHT,README,HISTORY} ${B}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
         [ -f $i ] && install $i ${D}${docdir}/${BPN}
     done
 
-- 
1.9.1


