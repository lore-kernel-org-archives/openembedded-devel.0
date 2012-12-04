Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfyI7-0003Gk-81
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:36:27 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2422155eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=n1JeG+fY8BmzOAn1gYF+iktLKvU6lPIjevvnSVuVefw=;
	b=MxNCC8G3P2godvvyBQ4JVJe/+lrS3e+1W0Z8FZ/ugIEU8XXpHjXKDy3WILQvTr5hoq
	WeG71HowUhKjdU0Byyvu2yaHy24abXIDP0Uc9RocOxk5ruwmfizFtiI3nGX2vxguni5w
	JxbDqoh/ABncJblY+ekNobVklFPlcSoW4vT9ieVDmNu0YFA4h/4X1gqgKLWbSGP56GVv
	i11/5lVAdviH/rLXnSCoB0G3Dj9Psdh/NFlCOoUND96mT0WRhUd2yOTdVDLzdrLr11d8
	0/8j1GbrdCOAlasmtMkYjQGwtHvYNyV6LrRxO2mW1LBoiYtylcAldjoVTwQrIwem2vnq
	zlKg==
Received: by 10.14.216.70 with SMTP id f46mr51560298eep.12.1354648926616;
	Tue, 04 Dec 2012 11:22:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm4319991eep.5.2012.12.04.11.22.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 11:22:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:21:32 +0100
Message-Id: <57320e28a369aaf06648139c7e5a74e5e09ccf68.1354646880.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354646880.git.Martin.Jansa@gmail.com>
Subject: [PATCH 63/64] python-efl: fix do_configure_prepend to be reentrant
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
X-List-Received-Date: Tue, 04 Dec 2012 19:36:27 -0000

* without '=' it added ${STAGING_DIR_HOST} prefix again when
  do_configure was executed twice in the same WORKDIR
  causing issues when looking for header files in python-edje,
  python-ecore, python-elementary and python-emotion
  ./python-edje/configure.ac:CYTHON_EDJE_INCLUDEDIR=`$PKG_CONFIG --variable=includedir "python-evas >= ${python_evas_version}"`
  ./python-ecore/configure.ac:CYTHON_ECORE_EVAS_INCLUDEDIR=""
  ./python-ecore/configure.ac:CYTHON_ECORE_EVAS_INCLUDEDIR=`$PKG_CONFIG --variable=includedir "python-evas >= ${python_evas_version}"`
  ./python-elementary/configure.ac:CYTHON_ELEMENTARY_INCLUDEDIR=`$PKG_CONFIG --variable=includedir "python-evas >= ${python_evas_version}"`
  ./python-emotion/configure.ac:CYTHON_EMOTION_INCLUDEDIR=`$PKG_CONFIG --variable=includedir "python-evas >= ${python_evas_version}"`

* config.log diffs confirms duplicated ${STAGING_DIR_HOST} prefix
  < CYTHON_ECORE_EVAS_INCLUDEDIR='/OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/include/python-evas'
  ---
  > CYTHON_ECORE_EVAS_INCLUDEDIR='/OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/include/python-evas'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 77d4114..2bcc434 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -6,7 +6,7 @@ AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 # the extension modules.
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
 RDEPENDS_${PN} += "python-lang"
-INC_PR = "r0"
+INC_PR = "r1"
 
 # necessary to let the call for python-config succeed
 export BUILD_SYS
@@ -24,7 +24,7 @@ S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
 
 do_configure_prepend() {
     # prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
-    sed -i "s#\`\$PKG_CONFIG --variable=includedir \"python-evas#${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
+    sed -i "s#=\`\$PKG_CONFIG --variable=includedir \"python-evas#=${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
 }
 
 do_install_append() {
-- 
1.8.0



