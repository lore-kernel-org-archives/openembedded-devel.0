Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T3dxp-0004mi-81
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 04:13:05 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8799196pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 19:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=o3bUFrAcyqkL3t5pheO5m/yz4vJ8A50IJCxwsxM67w8=;
	b=K4+46KAemRLlNAifSyZSMFMUsx6YZgqawtNVEeogJkJP3W8oyt/Nq9c2TPAWA/tZTq
	vaIat9bmImlSCuyQr7PLP6n5uxGjzvDQ1delS0i86+ln99EITxg6SFbJDWctXIN0EdsN
	wB7nU3Iyzm70FJEHQ3tNbmdj/8XV/c/FKN4bISadiFYRcECxYZ+X//uEDyO95uy/76qH
	5ygNlfYr9uiExHAie4048w/kPVvSxsS3FshRJtaSH6pZ+uR0e8GPK1FVSVByiSAoqRuD
	KrdXFsZ0wjQds9J8iEVnc/Ao8XJnk+B7P8C0uLVxI+RNrj5Fldcxz9BpM+KRSiBxtMEI
	5SXg==
Received: by 10.66.73.69 with SMTP id j5mr34249023pav.8.1345514463957;
	Mon, 20 Aug 2012 19:01:03 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id gh9sm329808pbc.20.2012.08.20.19.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 19:01:03 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2012 11:54:27 +1000
Message-Id: <1345514067-16394-3-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1345514067-16394-1-git-send-email-marc@cpdesign.com.au>
References: <1345514067-16394-1-git-send-email-marc@cpdesign.com.au>
Subject: [Patch V2 2/2] qwt: convert tabs to spaces.
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
X-List-Received-Date: Tue, 21 Aug 2012 02:13:05 -0000

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 meta-oe/recipes-qt/qwt/qwt.inc |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index a9289f7..50f4e2a 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -12,22 +12,22 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
 S = "${WORKDIR}/qwt-${PV}"
 
 do_configure_prepend() {
-	sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
-	sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.prf
-	sed -e 's/# QWT_CONFIG     += QwtExamples/QWT_CONFIG     += QwtExamples/g' -i qwtconfig.pri
-	sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
+    sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
+    sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.prf
+    sed -e 's/# QWT_CONFIG     += QwtExamples/QWT_CONFIG     += QwtExamples/g' -i qwtconfig.pri
+    sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
 }
 
 do_install() {
-	oe_runmake -e install
-	install -d ${D}${datadir}/doc/${PN}
-	mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
-	cd ${S}/examples
-	install -d ${D}/${bindir}
-	cd bin${QT_LIBINFIX}/
-	for i in * ; do
-		cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
-	done
+    oe_runmake -e install
+    install -d ${D}${datadir}/doc/${PN}
+    mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
+    cd ${S}/examples
+    install -d ${D}/${bindir}
+    cd bin${QT_LIBINFIX}/
+    for i in * ; do
+        cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
+    done
 }
 
 PACKAGES_prepend = "${PN}-examples "
-- 
1.7.7



