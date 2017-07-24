Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93F5977CF1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 16:54:24 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y43so17890853wrd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=glLjJt/Zj1xH8BQWcLOWFqirB+i8N2qJhyWWMby2P3g=;
	b=aE3saRIEh618n3wEaWKfkbMhQqreKieZdStagI2iaOmXtGdyw9ylkoKrxZCDRuiliP
	rYZAL/AWG6dqUe083+ROfFvIylgr98lrU0FkDL05ukaAFk8/fJWaIqMUVM8Y1eXCNcb4
	cCf1z4Hak7Tchc4sg74IZzd3If1ywIGUZI0zUvOxGUM85KZjZYIF0Um9YrV6qeySEvPJ
	LwUXu5puma7TNn1fKyw/Hcx0k12JJhrNvheyqjKfMlzrFV+wlJ/nZ7kT2llQL/xqkJNn
	oKI5BhrDN6/4Cy9xlumcgiAkT2xnUSyvxQTOTQMaFMjsE/3k5nsuVfPkNveFhvB9TczF
	1HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=glLjJt/Zj1xH8BQWcLOWFqirB+i8N2qJhyWWMby2P3g=;
	b=Q8BhKKEbRdbQOYsMk8VN7jXoNK3FrSHlnd1UTMGKx1Wq2JIz1hwk94fx96CtcbCAQZ
	NtSRetMLFabHoU1SyFEvV8/WJuuS81EMePDVILW36+WB4QXs/uSmlcgDgO5czwcS9i5F
	Fn1zSi9L62k6OS+6s01JCGzTeeKP++1yQ6IIn0RtRPDLTqNrdGCz5AdL8GBThf2nQFk2
	e2phGF8HMDxqjU+E025MW2oT8CyqwrF7jEKdswrZBdsr87fEricu+c/9sJtwn3DW1QbB
	Ri/bkyZnw2WKxlDwRIsm5O74MVCDO8+uKPK2BPzeaeo0ZfvZvKcfgLpmyiAX4n4lsa9I
	Gsvw==
X-Gm-Message-State: AIVw111aY95orFlTBM5dtHjU45TfF+EfEb7fbdynDTJ1HvDI6EhjryWt
	d7rU4BfoVQ3my1yV
X-Received: by 10.223.147.164 with SMTP id 33mr11916659wrp.107.1500915264834; 
	Mon, 24 Jul 2017 09:54:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	35sm10080386wrf.72.2017.07.24.09.54.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 09:54:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 18:55:21 +0200
Message-Id: <20170724165521.3432-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH][meta-oe] pidgin-otr: unblacklist
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
X-List-Received-Date: Mon, 24 Jul 2017 16:54:25 -0000

* pidgin was already unblacklisted
* add dependency on glib2-native for glib-gettextize
* remove manual -dbg definition
* fix indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
index 47cdc7242..e8539c902 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -2,20 +2,15 @@ SUMMARY = "(OTR) Messaging allows you to have private conversations over instant
 HOMEPAGE = "http://www.cypherpunks.ca/otr/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
-DEPENDS = "libgcrypt libotr pidgin intltool-native"
-
-PNBLACKLIST[pidgin-otr] ?= "depends on blacklisted pidgin - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+DEPENDS = "libgcrypt libotr pidgin intltool-native glib-2.0-native"
 
 SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
-           file://ignore_extra-portability_warnings.patch \
+    file://ignore_extra-portability_warnings.patch \
 "
 
 SRC_URI[md5sum] = "eadb953376acc474e56041d4c12aa2c8"
 SRC_URI[sha256sum] = "d56b3f092dbe9ee6597641c7d2dd294884dc04ba47aaf4ec571cd54977df4691"
 
-
 FILES_${PN} = "${libdir}/pidgin/*"
-FILES_${PN}-dbg = "${libdir}/pidgin/.debug"
-FILES_${PN}-dbg += "${libdir}/pidgin/.debug/pidgin-otr.so"
-FILES_${PN}-dbg += "/usr/src/debug/pidgin-otr/${PV}-${PR}/${P}/*"
+
 inherit autotools pkgconfig
-- 
2.13.3


