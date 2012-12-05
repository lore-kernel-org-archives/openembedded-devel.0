Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7i-0000Ec-7a
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:24 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2191970eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3fEJjrGrFNN7ZZE+JvIp3zlNbVBa+QLURyoFn7xw8Lk=;
	b=lD4cU0QJP53rgKk3OeJa7vlC1QGLis9j9PBsBR8LKwGrBHWijmKwoOw/+Um2loD1Lt
	o8LnzhwnKZ+qh/dTj6q6TXlgtPkgcRLCp0zpGH86DZqBsFzk/k73jqDa1eg7Sl/hbuy0
	ZerFMGTZJ8JYIWvrdbwaRKEbIUNtDwXn+EY08Hyt4zE7zC4rNQXixsHdBW5JQTGHKEdI
	hRA4u7VOL3gf0LJg/gPo+p0AE5dCZQ5Le/Ac25oTM9MWXrOjEC3Dq9LCAbwpHIEKPRy8
	ve+zL/HOEWiC1Fez+J17doNQCgY20XZmEj/bLInE+eRuQbpdKs9oA9Z1f+jMz+Swyr7i
	3DWA==
Received: by 10.14.178.196 with SMTP id f44mr65286294eem.14.1354744380145;
	Wed, 05 Dec 2012 13:53:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm11749370eel.14.2012.12.05.13.52.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:05 +0100
Message-Id: <4c271be27a25a47724929bd5cb2156237d624b4f.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 82/85] lmbench: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:32 -0000

* fixes:
lmbench-3.0-a9: lmbench: Files/directories were installed but not shipped
  /usr/man
  /usr/lib/lmbench

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 7efdad5..611013e 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 
 inherit autotools
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
 	   file://lmbench-run \
 	   file://rename-line-binary.patch \
@@ -18,7 +20,7 @@ SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8
 
 EXTRA_OEMAKE = 'CC="${CC}" AR="${AR}" RANLIB="${RANLIB}" CFLAGS="${CFLAGS}" \
 		LDFLAGS="${LDFLAGS}" LD="${LD}" OS="${TARGET_SYS}" \
-		TARGET="${TARGET_OS}" BASE="${prefix}"'
+		TARGET="${TARGET_OS}" BASE="${prefix}" MANDIR="${mandir}"'
 
 do_configure() {
 	:
@@ -40,7 +42,6 @@ do_install () {
 	oe_runmake 'BASE=${D}${prefix}' \
 		    -C src install
 	mv ${D}${bindir}/line ${D}${bindir}/lm_line
-	mv ${D}${prefix}/man/* ${D}${mandir}/
 	install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
 	sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${PN},;' \
 	       -e 's,^BINDIR=.*$,BINDIR=${libdir}/${PN},;' \
@@ -51,4 +52,4 @@ do_install () {
 }
 
 RDEPENDS_${PN} = "debianutils"
-FILES_${PN} += "${datadir}/lmbench"
+FILES_${PN} += "${datadir}/lmbench ${libdir}/lmbench"
-- 
1.8.0



