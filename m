Return-Path: <timo.jyrinki@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id C532765C8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:38:19 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y19so27273800lfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JrE87f28yRNKOsu6O7ELPxAfOH7GbQvwr3QGHRGMDJM=;
	b=YNcHDTIaX533mGhnTd+xzHLx1jOJWx3xbZGEgqUzMf1p7LqrDSXmrHRlzVw8HAk6oM
	pQBibCgieE1NmjdekhE8QJ8vMyPRlte56J/UMufYOsbAyfOIMpF6N0BthHBDI4nELmmX
	6Z6kJ9aa9CN7ZkcGlDtaG8CT/TXYRDR4NzFeOnEsRyTOp65FQC75VFRQR2ykwqOuELQE
	qs63r227/jb4KAiG0wJnFkJRrqa8xOJxbkV/+zVN2Xs29Ivnav4eA7udr4B209amxIyU
	igAwCM7DGYgUquw8oG052KwiiWoit6WhcAUHE6sByMCgQoJH3suTSINr+z28ZdAo1fXg
	p13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JrE87f28yRNKOsu6O7ELPxAfOH7GbQvwr3QGHRGMDJM=;
	b=RodHilJlKW3XwcXMO9TVoO/udL9rZp2jcuaxzWfl1jLPjT48AbClZSY7ZcOHntL0RU
	HjVnda+xUm0FLqFbiQYH26GGwe4rUksqYxAso8VMRHPS9dIGwvhW5EMbhaUVbsTxVPwA
	o20P8fhOd2s+hU5BuEeuMCF3xUqDoun/Nmhzn15oKlEBQeXdwhLiTDmmKCGzrN8hONz1
	vs0gQHns2NK2xtiqNa1R9+OBEhDOpeqrZfg5/WJmgNtseDomhP+hUHomtD/1dll7xXco
	f8M+6ZwGZ0uIW5P/ynr6jLRl2DtttBxi+5pX5G1+b3xHsh5yHImEQVepwx3Zhn9JpqYi
	QS1w==
X-Gm-Message-State: APf1xPDw0bUR6r3OUOPRwFYhP3Iv9dH00MRTJXV5d1f3v4Uw9b624Yuq
	kC6B7PmspmrJyBXvMDsdKXdX2NUQ
X-Google-Smtp-Source: AG47ELumkvaTsm2zpy7e6sEQ9abxWBSAoaU4VxPMHIToB7wHHr23gKDrSd0V0vVxNeD4NFUMn4kPSA==
X-Received: by 10.46.109.17 with SMTP id i17mr10636663ljc.115.1519735100076;
	Tue, 27 Feb 2018 04:38:20 -0800 (PST)
Received: from localhost.localdomain (n731c1f8ua03636mt-1.v6.elisa-mobile.fi.
	[2001:999:1:4ba6:21b5:9280:e108:7655])
	by smtp.gmail.com with ESMTPSA id r3sm2534819lje.96.2018.02.27.04.38.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Feb 2018 04:38:19 -0800 (PST)
From: Timo Jyrinki <timo.jyrinki@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 14:38:14 +0200
Message-Id: <1519735094-19119-1-git-send-email-timo.jyrinki@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Timo Jyrinki <timo.jyrinki@link-motion.com>
Subject: [meta-qt5][PATCH v2] qtlocation: Add licenses used under mapboxgl.
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
X-List-Received-Date: Tue, 27 Feb 2018 12:38:20 -0000

From: Timo Jyrinki <timo.jyrinki@link-motion.com>

These licenses are in use in the fetched mapboxgl submodule but not
currently listed in the recipe: Apache-2.0, MIT, openssl and BSL-1.0.

Signed-off-by: Timo Jyrinki <timo.jyrinki@gmail.com>
---
 recipes-qt/qt5/qtlocation_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index fce37b8..75bf440 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
+LICENSE = "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://src/3rdparty/mapbox-gl-native/LICENSE.md;md5=0ab9025299bcee16858021d557f09449 \
 "
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
-- 
2.7.4


