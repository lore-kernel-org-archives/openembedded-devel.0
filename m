Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D430778DC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w717BuDk001849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:56 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:37 +0800
Message-ID: <eb45ccff5e183f6b1e20ad04d16db4e6cdd60e84.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/16] isomd5sum: 1.2.1 -> 1.2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 07:11:56 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../isomd5sum/files/0001-tweak-install-prefix.patch        | 14 +++++++-------
 .../isomd5sum/{isomd5sum_1.2.1.bb => isomd5sum_1.2.3.bb}   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/isomd5sum/{isomd5sum_1.2.1.bb => isomd5sum_1.2.3.bb} (94%)

diff --git a/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch b/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
index bcfc117..61310cc 100644
--- a/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
+++ b/meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
@@ -1,7 +1,7 @@
-From cffe4767f89ea0b54b57e8bf9065a08a9c38d46e Mon Sep 17 00:00:00 2001
+From a70513ff59da3c593c76330afb445c21761c3268 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 18 Jul 2017 21:53:00 -0400
-Subject: [PATCH] tweak install prefix
+Date: Tue, 31 Jul 2018 17:14:24 +0800
+Subject: [PATCH 1/2] tweak install prefix
 
 Upstream-Status: Inappropriate [oe specific]
 
@@ -11,7 +11,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 14 insertions(+), 14 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index df16a3b..fbdfcb4 100644
+index c98cf35..7c5907f 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -39,26 +39,26 @@ pyisomd5sum.so: $(PYOBJS)
@@ -43,7 +43,7 @@ index df16a3b..fbdfcb4 100644
 -	install -m 0644 libcheckisomd5.h $(DESTDIR)/usr/include/
 -	install -m 0644 libimplantisomd5.a $(DESTDIR)/usr/$(LIBDIR)
 -	install -m 0644 libcheckisomd5.a $(DESTDIR)/usr/$(LIBDIR)
--	sed "s#@VERSION@#${VERSION}#g; s#@includedir@#${DESTDIR}/usr/include#g; s#@libdir@#${DESTDIR}/usr/${LIBDIR}#g" isomd5sum.pc.in > ${DESTDIR}/usr/share/pkgconfig/isomd5sum.pc
+-	sed "s#@VERSION@#${VERSION}#g; s#@includedir@#/usr/include#g; s#@libdir@#/usr/${LIBDIR}#g" isomd5sum.pc.in > ${DESTDIR}/usr/share/pkgconfig/isomd5sum.pc
 +	install -d -m 0755 $(DESTDIR)$(includedir)
 +	install -d -m 0755 $(DESTDIR)$(libdir)
 +	install -d -m 0755 $(DESTDIR)${datadir}/pkgconfig
@@ -51,10 +51,10 @@ index df16a3b..fbdfcb4 100644
 +	install -m 0644 libcheckisomd5.h $(DESTDIR)$(includedir)
 +	install -m 0644 libimplantisomd5.a $(DESTDIR)$(libdir)
 +	install -m 0644 libcheckisomd5.a $(DESTDIR)$(libdir)
-+	sed "s#@VERSION@#${VERSION}#g; s#@includedir@#${DESTDIR}/usr/include#g; s#@libdir@#${DESTDIR}/usr/${LIBDIR}#g" isomd5sum.pc.in > ${DESTDIR}${datadir}/pkgconfig/isomd5sum.pc
++	sed "s#@VERSION@#${VERSION}#g; s#@includedir@#$(includedir)#g; s#@libdir@#$(libdir)#g" isomd5sum.pc.in > ${DESTDIR}${datadir}/pkgconfig/isomd5sum.pc
  
  clean:
  	rm -f *.o *.so *.pyc *.a .depend *~
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
similarity index 94%
rename from meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
rename to meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
index 815113e..d88df5b 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
@@ -30,6 +30,6 @@ PACKAGES += "${PYTHON_PN}-${PN} ${PYTHON_PN}-${PN}-dbg"
 FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
 FILES_${PYTHON_PN}-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug/pyisomd5sum.so"
 
-SRCREV = "69dc036d20761715b734ca9cc59ecc6dc8145026"
+SRCREV = "7860901f726f5d92689cb67243cc7f981f21f74b"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


