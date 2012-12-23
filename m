Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkoq-0001Cy-Tl
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:38:16 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so3223261eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=lWijYFi9vYcPh0koY974BiAr75bR0E1cEa1AYFv4XFw=;
	b=G4iaatWWsqF453/O14+DWfIJwFG6KWbTg27iFlh6yHRCjmVPmoQOowV++lommf7j5q
	Uustcr14oECfOiQIynqHxp4MwthgWFWIAFwoRFCV3N4Rh/CeoPIAnjq2Rb8+PecbbDV2
	CqCdXnhcYFWncP0amf0kdssiN41mRd2pz/9DjkAGwiXqDeEcEB9vvMo8hjNAvBVekRCN
	FFcrSYBpKRxZxQZBJhkSNwJdzhkGwD9eHLTCGg/p56tIAAlQcHg2nCUjRLmLMBNQpxg6
	vMY2VRdKnFXSx3N3dNYHWIbKMHIunY7+iZSKdoRBouoXaHqJ9OBQ25xjLtz0q4hD0uMC
	ukmQ==
X-Received: by 10.14.215.194 with SMTP id e42mr47941179eep.32.1356265408570;
	Sun, 23 Dec 2012 04:23:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm34563515eem.14.2012.12.23.04.23.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:35 +0100
Message-Id: <6097b49f1fe7183f7b34fa2e4c5a8fbfd805ed26.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/30] links: upgrade to 2.7 to fix build with libpng-1.5
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:17 -0000

* cookies api changed between 2.1pre30 and 2.7
* LIC_FILES_CHKSUM changed because of formal change
296c296
<     This program is free software; you can redistribute it and/or modify
---
>     on, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
>     USAThis program is free software; you can redistribute it and/or
>     modify

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../links/files/cookies-save-0.96.patch            | 106 ---------------------
 ...-2.1pre17-fix-segfault-on-loading-cookies.patch |  20 ----
 ...{links-x11_2.0+2.1pre30.bb => links-x11_2.7.bb} |   7 +-
 meta-oe/recipes-support/links/links.inc            |  12 +--
 .../links/{links_2.0+2.1pre30.bb => links_2.7.bb}  |   4 +-
 5 files changed, 9 insertions(+), 140 deletions(-)
 delete mode 100644 meta-oe/recipes-support/links/files/cookies-save-0.96.patch
 delete mode 100644 meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
 rename meta-oe/recipes-support/links/{links-x11_2.0+2.1pre30.bb => links-x11_2.7.bb} (84%)
 rename meta-oe/recipes-support/links/{links_2.0+2.1pre30.bb => links_2.7.bb} (73%)

diff --git a/meta-oe/recipes-support/links/files/cookies-save-0.96.patch b/meta-oe/recipes-support/links/files/cookies-save-0.96.patch
deleted file mode 100644
index a1e35c0..0000000
--- a/meta-oe/recipes-support/links/files/cookies-save-0.96.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-diff -ru links-0.96/cookies.c links-0.96+cookies-save/cookies.c
---- links-0.96/cookies.c	Mon Sep  3 07:19:37 2001
-+++ links-0.96+cookies-save/cookies.c	Mon Sep  3 07:18:42 2001
-@@ -276,15 +276,99 @@
- 
- void init_cookies(void)
- {
--	/* !!! FIXME: read cookies */
-+	unsigned char in_buffer[MAX_STR_LEN];
-+	unsigned char *cookfile, *p, *q;
-+	FILE *fp;
-+
-+	/* must be called after init_home */
-+	if (! links_home) return;
-+	
-+	cookfile = stracpy(links_home);
-+	if (! cookfile) return;
-+	add_to_strn(&cookfile, "cookies");
-+
-+	fp = fopen(cookfile, "r");
-+	mem_free(cookfile);
-+	if (fp == NULL) return;
-+	
-+	while (fgets(in_buffer, MAX_STR_LEN, fp)) {
-+		struct cookie *cookie;
-+		
-+		if (!(cookie = mem_alloc(sizeof(struct cookie)))) return;
-+		memset(cookie, 0, sizeof(struct cookie));
-+		
-+		q = in_buffer; p = strchr(in_buffer, ' ');
-+		if (p == NULL) goto inv;
-+		*p++ = '\0';
-+		cookie->name = stracpy(q);
-+		
-+		q = p; p = strchr(p, ' ');
-+		if (p == NULL) goto inv;
-+		*p++ = '\0';
-+		cookie->value = stracpy(q);
-+		
-+		q = p; p = strchr(p, ' ');
-+		if (p == NULL) goto inv;
-+		*p++ = '\0';
-+		cookie->server = stracpy(q);
-+		
-+		q = p; p = strchr(p, ' ');
-+		if (p == NULL) goto inv;
-+		*p++ = '\0';
-+		cookie->path = stracpy(q);
-+		
-+		q = p; p = strchr(p, ' ');
-+		if (p == NULL) goto inv;
-+		*p++ = '\0';
-+		cookie->domain = stracpy(q);
-+		
-+		q = p; p = strchr(p, ' ');
-+		if (p == NULL) goto inv;
-+		*p++ = '\0';
-+		cookie->expires = atoi(q);
-+		
-+		cookie->secure = atoi(p);
-+		
-+		cookie->id = cookie_id++;
-+
-+		accept_cookie(cookie);
-+
-+		continue;
-+
-+inv:
-+		free_cookie(cookie);
-+		free(cookie);
-+	}
-+	fclose(fp);
- }
- 
- void cleanup_cookies(void)
- {
- 	struct cookie *c;
-+	unsigned char *cookfile;
-+	FILE *fp;
-+	
- 	free_list(c_domains);
--	/* !!! FIXME: save cookies */
--	foreach (c, cookies) free_cookie(c);
-+
-+	cookfile = stracpy(links_home);
-+	if (! cookfile) return;
-+	add_to_strn(&cookfile, "cookies");
-+
-+	fp = fopen(cookfile, "w");
-+	mem_free(cookfile);
-+	if (fp == NULL) return;
-+	
-+	foreach (c, cookies) {
-+		if (c->expires && ! cookie_expired(c))
-+			fprintf(fp, "%s %s %s %s %s %d %d\n", c->name, c->value,
-+			    c->server?c->server:(unsigned char *)"", c->path?c->path:(unsigned char *)"",
-+			    c->domain?c->domain:(unsigned char *)"", c->expires, c->secure);
-+
-+		free_cookie(c);
-+	}
-+
-+	fclose(fp);
-+	
- 	free_list(cookies);
- }
- 
diff --git a/meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch b/meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
deleted file mode 100644
index 0d3b407..0000000
--- a/meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- links-2.1pre17/cookies.c.pix	2005-05-15 23:05:10.000000000 +0800
-+++ links-2.1pre17/cookies.c	2005-05-15 23:17:21.000000000 +0800
-@@ -41,7 +41,7 @@
- 
- void free_cookie(struct cookie *c)
- {
--	mem_free(c->name);
-+	if (c->value) mem_free(c->name);
- 	if (c->value) mem_free(c->value);
- 	if (c->server) mem_free(c->server);
- 	if (c->path) mem_free(c->path);
-@@ -355,7 +355,7 @@
- 
- inv:
- 		free_cookie(cookie);
--		free(cookie);
-+		mem_free(cookie);
- 	}
- 	fclose(fp);
- }
diff --git a/meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb b/meta-oe/recipes-support/links/links-x11_2.7.bb
similarity index 84%
rename from meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
rename to meta-oe/recipes-support/links/links-x11_2.7.bb
index b71da9f..601742f 100644
--- a/meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.7.bb
@@ -6,6 +6,8 @@ RCONFLICTS_${PN} = "links"
 SRC_URI += " file://links2.desktop \
              http://www.xora.org.uk/oe/links2.png;name=icon"
 
+S = "${WORKDIR}/links-${PV}"
+
 EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
                 --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
                 --without-libtiff --without-svgalib --without-fb \
@@ -19,8 +21,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
 }
 
-
-SRC_URI[md5sum] = "f0f107cc824b71e43f0c6ab620209daf"
-SRC_URI[sha256sum] = "f32314d851e86ec463967ddce78d051e3953b529878cbaeecf882c625ad29c75"
+SRC_URI[md5sum] = "d06aa6e14b2172d73188871a5357185a"
+SRC_URI[sha256sum] = "0c182b1cbcdfd5cdcd2f75a6032d1a4b660d07c1225c1e07757cec81d3302130"
 SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
 SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index abd10f2..e77e2c4 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -3,17 +3,11 @@ browser, similar to Lynx."
 HOMEPAGE = "http://links.twibright.com/"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b0c80473f97008e42e29a9f80fcc55ff"
+LIC_FILES_CHKSUM = "file://COPYING;md5=65e735be2e05d5943803344148f57603"
 DEPENDS = "jpeg libpng flex openssl zlib"
 
-LPV = "${@d.getVar("PV",1).split("+")[1]}"
-
-SRC_URI = "http://links.twibright.com/download/links-${LPV}.tar.bz2 \
+SRC_URI = "http://links.twibright.com/download/links-${PV}.tar.bz2 \
            file://ac-prog-cxx.patch \
-           file://cookies-save-0.96.patch \
-           file://links-2.1pre17-fix-segfault-on-loading-cookies.patch"
+"
 
 inherit autotools
-
-S = "${WORKDIR}/links-${LPV}"
-
diff --git a/meta-oe/recipes-support/links/links_2.0+2.1pre30.bb b/meta-oe/recipes-support/links/links_2.7.bb
similarity index 73%
rename from meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
rename to meta-oe/recipes-support/links/links_2.7.bb
index 2496173..24c1985 100644
--- a/meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
+++ b/meta-oe/recipes-support/links/links_2.7.bb
@@ -9,5 +9,5 @@ EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x --without-sdl"
 
-SRC_URI[md5sum] = "f0f107cc824b71e43f0c6ab620209daf"
-SRC_URI[sha256sum] = "f32314d851e86ec463967ddce78d051e3953b529878cbaeecf882c625ad29c75"
+SRC_URI[md5sum] = "d06aa6e14b2172d73188871a5357185a"
+SRC_URI[sha256sum] = "0c182b1cbcdfd5cdcd2f75a6032d1a4b660d07c1225c1e07757cec81d3302130"
-- 
1.8.0.2



