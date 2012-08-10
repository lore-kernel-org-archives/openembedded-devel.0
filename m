Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzphT-0001uj-F3
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:27 +0200
Received: by mail-wi0-f177.google.com with SMTP id hn17so398297wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YFwbJtCCIn9kyKlQJR3dirtlBnDoZqG0SYMy7OTHjq0=;
	b=eL1jebvKz4TNDw9JIpFia93g/FuS1eJ3FNJCi/QYnQkLe1ZxMcaxZZdmSOeBRhbsAd
	xL3/ElOSKxqoL5xhblcGEL9itWFOjZf7yWIvc55ddzZ9YwDd9B09QX5H4SLX//D7IE8B
	fZssbX4K7iGt4mwFyBYhcdP3yhkWeGqMXZsCbhA8N8nIlGyctL+jbWE53oM/gETrK2XQ
	3uqOzU6xr/s+iv/i6uCgtHXAoyR70HBHBwb4JsfNgSWjMkznGjfLEJO9cj4w643lxwOE
	Z+JN+sL5ufqrzl5LTciy3gO9R0zw7hSaBM+mRMWp1LLqHgx5DbrPp2go7ZPFzNtZQCDO
	srEg==
Received: by 10.180.20.204 with SMTP id p12mr6269086wie.7.1344606279949;
	Fri, 10 Aug 2012 06:44:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm11619391wid.7.2012.08.10.06.44.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:02 +0200
Message-Id: <7e4a68be76504fe6aff13a96fcb13a64879832a8.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 07/46] evas: package cserve2 and its loaders
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:27 -0000

* cserve2 introduced in http://www.mail-archive.com/enlightenment-devel@lists.sourceforge.net/msg40703.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index b0a42ea..5254ee4 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -20,6 +20,15 @@ python populate_packages_prepend () {
         output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
         description = 'Evas module %s',
         allow_dirs=True, recursive=False, extra_depends="" )
+        
+        plugin_type = "cserve2"
+        bb.note( "splitting packages for evas %s..." % plugin_type )
+        basedir = bb.data.expand( '${libdir}/evas/%s/loaders' % plugin_type, d )
+
+        do_split_packages(d, basedir, '^(.*)',
+        output_pattern = 'evas-' + plugin_type + "-%s",
+        description = 'Evas csever2 loader module %s',
+        allow_dirs=True, recursive=False, extra_depends="" )
 }
 
 do_install_append() {
@@ -27,9 +36,11 @@ do_install_append() {
 }
 
 FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
-FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/"
+FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/ ${libdir}/evas/cserve2/loaders/*/*/.debug/"
+FILES_${PN}-cserve2 += "${libexecdir}/evas_cserve2* ${libexecdir}/dummy_slave"
 
-PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-*"
+PACKAGES += "${PN}-cserve2"
+PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-* evas-cserve2-*"
 
 RRECOMMENDS_${PN} = " \
   evas-engine-fb \
-- 
1.7.8.6



