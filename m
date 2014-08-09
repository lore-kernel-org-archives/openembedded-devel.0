Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D2A0170A7A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:53 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so6771228wgh.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iU6RGvvb0wNnrgyQXj3hNvfSHTiI91K8vwOpT5O3jy0=;
	b=PHx6zx2f027sAn49v2lTKCypU/xxaeG39S606VJZo0oIjS01p0PNWzSLPuoryFt9oY
	FAXhX7ju+Nbaj2uYpwNCGygQjPF8xAEJfxJ0Ed1aW1fng0J3/Ovv0v6tXSEesbfEfbbb
	ESMLRsAhvtdMVyPhz6+1uuI0O3K6arbcYJI+hmugzoAVcoJrhXgsanJdtjQXtjOU+m8d
	2AnoIZbaaKFgP+17M/F9TkKVoC/fjgR41HBY0n3qXudbMoobIkc/0hEC/YkZuE6niOeR
	dFH0wODYKHJe6Zf4GHbQoJ7SdWhu7Vhq9am87Zt6LK3CmUfVlcspg2OHO5JlEw1LYqYd
	qSCw==
X-Received: by 10.181.5.39 with SMTP id cj7mr11823296wid.79.1407600534516;
	Sat, 09 Aug 2014 09:08:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm20401001wic.24.2014.08.09.09.08.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:43 +0200
Message-Id: <1407600537-10857-22-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 22/36] links, links-x11: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:54 -0000

* fixes following QA warnings:
  links-2.7: links: configure was passed unrecognised options:
    --enable-javascript --with-libfl --without-sdl
    [unknown-configure-option]
  links-x11-2.7: links-x11: configure was passed unrecognised options:
    --enable-javascript --with-libfl --without-sdl
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/links/links-x11_2.7.bb | 4 ++--
 meta-oe/recipes-support/links/links_2.7.bb     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/links/links-x11_2.7.bb b/meta-oe/recipes-support/links/links-x11_2.7.bb
index 601742f..8766653 100644
--- a/meta-oe/recipes-support/links/links-x11_2.7.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.7.bb
@@ -8,11 +8,11 @@ SRC_URI += " file://links2.desktop \
 
 S = "${WORKDIR}/links-${PV}"
 
-EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
+EXTRA_OECONF = "--enable-graphics \
                 --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
                 --without-libtiff --without-svgalib --without-fb \
                 --without-directfb --without-pmshell --without-atheos \
-                --with-x --without-gpm --without-sdl"
+                --with-x --without-gpm"
 
 do_install_append() {
     install -d ${D}/${datadir}/applications
diff --git a/meta-oe/recipes-support/links/links_2.7.bb b/meta-oe/recipes-support/links/links_2.7.bb
index 24c1985..e80dd7b 100644
--- a/meta-oe/recipes-support/links/links_2.7.bb
+++ b/meta-oe/recipes-support/links/links_2.7.bb
@@ -3,11 +3,11 @@ require links.inc
 DEPENDS += "gpm"
 RCONFLICTS_${PN} = "links-x11"
 
-EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
+EXTRA_OECONF = "--enable-graphics \
                 --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
-                --without-x --without-sdl"
+                --without-x"
 
 SRC_URI[md5sum] = "d06aa6e14b2172d73188871a5357185a"
 SRC_URI[sha256sum] = "0c182b1cbcdfd5cdcd2f75a6032d1a4b660d07c1225c1e07757cec81d3302130"
-- 
2.0.4


