Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrbqD-0001Dd-4J
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:31:29 +0200
Received: by wibhq4 with SMTP id hq4so4571382wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PeiZPOnebwyQzgTdq2DGs6ELMHAfRUEqSOjWi98QED0=;
	b=VWZzeyNQDA0ukWmt26Fjz7TCLQms9+O0ZUZY/KwLYII1kohzqDoxRsNzEKqmcGJfEj
	Zy4SxQwDBfqTu++svp0/49cnFpVmpbSeB+9CzggWVgedmFjpiegltF/RblsoANY7SW7s
	nTpP5pdkkV51fdYY/pL4FQ3WY9oqSktpiGlaEhOyFgMN6Ea8k8+7q7WX+R5GcLAtiqdq
	z+ClNp4SAHr1WcOli0gDGAVEV/bHLtTgjUBr0IFIC8+BHg0gWV669T7j0f6ZhM4SD209
	nwGfaosDULQdpeu0AHQgpwjq3rkoLst/2DDJOIPDiDemTqbsIbbApzv6+hq4MlIt/wSz
	8DCQ==
Received: by 10.216.240.10 with SMTP id d10mr492760wer.157.1342646408284;
	Wed, 18 Jul 2012 14:20:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm34713594wiv.11.2012.07.18.14.20.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:17 +0200
Message-Id: <c0837a0b802e9ef0069a515ce49ef67e8a40707e.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 07/14] evas: package cserve2 and its loaders
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
X-List-Received-Date: Wed, 18 Jul 2012 21:31:29 -0000

* cserve2 introduced in http://www.mail-archive.com/enlightenment-devel@lists.sourceforge.net/msg40703.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 99ec3f3..4292c1b 100644
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



