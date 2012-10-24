Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzT-0005AM-8T
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:08:03 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so930618wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/9alM5NvIoS531r/54wxruJ398l9JgRcAEjDLFxldSk=;
	b=pZOwx5QoE2uOOxrcyr9bAc1y9MaO0bqv45uluZikghTlmtHbtLz1tmMao0m6/ExzW8
	VQvyw+y7P32XKbPrKkpmLovgdZj1c4YE0ZwgLWHaYIdZhGkAds7GQ/YTk30MjuTNBQ6l
	fCBVuyTsIm6/XUrz01QJ9EDGl8sVGmCXduMfg8S5zcI/iyUDSF713tGs/F665eaoAC0d
	CGc7Tml1GakJ9hNppRs/fW0df2iRzZtwETGHo0E4s5DKwtut/hxOBho1qqvD+E/vhXyJ
	qWLUiYiGgdvQjyb6QNV5S1dcCoSfJKOK3H5ts9SRixKHUpGnO6NIVRhCZzveEZT008nD
	xslQ==
Received: by 10.216.134.168 with SMTP id s40mr10634388wei.158.1351122875303;
	Wed, 24 Oct 2012 16:54:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a10sm7874022wiz.4.2012.10.24.16.54.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:24 +0200
Message-Id: <a4b6b67a28a5831721dbc4a9534dd268bbd4becd.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/8] imlib2: inherit binconfig
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
X-List-Received-Date: Thu, 25 Oct 2012 00:08:03 -0000

* it was installing imlib2-config directly to sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index 4cc124e..eeaaf52 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 # can also depend on tiff34, ungif or gif, z, bz2, id3tag
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
-PV = "1.4.2.001+svnr${SRCPV}"
+PV = "1.4.5+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-inherit efl
+inherit efl binconfig
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
@@ -20,10 +20,6 @@ EXTRA_OECONF = "--with-x \
 OE_LT_RPATH_ALLOW = "any"
 OE_LT_RPATH_ALLOW[export]="1"
 
-do_install_append() {
-    install -m 0755 imlib2-config ${STAGING_BINDIR_CROSS}
-}
-
 PACKAGES =+ "imlib2-loaders-dbg imlib2-filters-dbg imlib2-loaders imlib2-filters"
 FILES_${PN} = "${libdir}/lib*.so.* ${libdir}/imlib2/*/*.so"
 FILES_${PN}-dbg = "${libdir}/.debug/ ${bindir}/.debug/ ${prefix}/src/debug/"
-- 
1.7.12.4



