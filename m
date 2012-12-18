Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0fy-00071m-82
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:09:54 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so367294eaa.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=7srs81EJ6jiDyUMsXXDFrNaW5Laq/eaIgLCeayIVOU8=;
	b=t2sMyoNlHYfmPUECY1P1TghaMIqKk7nctWhDwZdxs+b0TWrrU6YwIRu+inm1zGLsil
	Gw6KOuNlGPzDRz5QhfX/zfXRdXoA2u7sPptAijyhHw3Pa/6D/C0oKMGKdaOzbBmRe63P
	cEC+j3/fF2CkDDlQzBtXC/lstsEbAazqiMmKAFvceECpgzC6egom9h+T8bsI4ERI8XFP
	dI0zMiBt53vQ6IRZOUU4cxhXVFQGw/l9Xa4uR6n+1cve29/sRw8CofspzA2SpiSNavBP
	5Qbu7Jp07gjbtxQdn+O8qA0ZasMKxJr667ywe7W7qzqbYqKZTaxCWvrDeLjMog+YKNjm
	P5uQ==
X-Received: by 10.14.194.4 with SMTP id l4mr6962913een.42.1355849712439;
	Tue, 18 Dec 2012 08:55:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm4241706eea.3.2012.12.18.08.55.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:00 +0100
Message-Id: <62b8fad4ebf763652eadc55238362d5ca072401e.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/10] geos: fix typo in FILES_${PN}-dev
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
X-List-Received-Date: Tue, 18 Dec 2012 17:09:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
index eda4ad3..e0c82bc 100644
--- a/meta-oe/recipes-navigation/geos/geos.inc
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "GEOS - Geometry Engine, Open Source"
 HOMEPAGE = "http://trac.osgeo.org/geos/"
 SECTION = "libs"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
@@ -13,7 +13,9 @@ inherit autotools pkgconfig
 
 # libgeos-${PV}.so is needed in PV
 FILES_SOLIBSDEV = ""
-FIELS_${PN}-dev = "${libdir}/libgeos.so \
-                   ${libdir}/libgeos_c.so"
+FILES_${PN}-dev = "${libdir}/*.la \
+                   ${libdir}/libgeos.so \
+                   ${libdir}/libgeos_c.so \
+                   ${includedir}"
 FILES_${PN} += " ${libdir}/libgeos-${PV}.so"
 INSANE_SKIP_${PN} = "dev-so"
-- 
1.8.0.2



