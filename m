Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 022997E553
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:37:15 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id c195so5747512lfg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=y7jeUpap/y9kM9wuelEimoTleQZ4DeKRRnTFVs9IHQQ=;
	b=fFK95U/2tQ52es3C/hRhRIBLZfeIDvQlPAIea/yhmy0C1kfzAYlHa/mzGTzcLgDXMm
	uw07S4v6VR+LR/tUPuAkED9eOCmyuSdwoeuTgbE395wS9eqLtgfsAVb1Ghi6xAhRoZh5
	PlqTDKP53kuRCOTfizmTPocoDNjEkT1Wj3oOflGjgxL+Hu2qPgPXdcG13nPLaf0C80YE
	l0QKUOMns1L0nRoXDmo8ye8jxyl6ZFiTidQ2HA0zHTVgpp6P2ltTc6tpPfw06ORpp60Y
	BKqz+H/wfrrceP/VjVqgLuE7+kLtw2c6iGlY4+54mplB+1TN80+qH8ZF2sSH0rf72pvg
	5+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y7jeUpap/y9kM9wuelEimoTleQZ4DeKRRnTFVs9IHQQ=;
	b=DjPieXWdBlusnP+/s3aTzs44f3PibXKIXHL+GI23AiBAjGM7ONxK0D6XEP0LQ0mPpK
	m+bmY2uPLySWjOQKgouPYiU2FO0JIe41K+Nb8oZBYN6Yj5gJxQEmupXwS4T4sOf1lilh
	Yi/fXfLt0QCKePe+9fq25snH9RHxBpNWqcsgpoVPYuNqwAmoLxcDshW67byQKKAfY7NA
	20DBRHkg1J9pT6/W3bA0qtMfpytdUjN+OKBvaU0JNMpDchMYosHMKij8LKmWLkvTXkbI
	/LcuB5twgtfwAnc8uZkm8DB/BpsLOXMW3VM/sFyMA7VnXRQX9GdGGY3jI8ClbMPI5F0w
	wriQ==
X-Gm-Message-State: APjAAAXCKKlk1zXNrk3a5YveTwqJcXGWmgsXLbQibL5ASzfeZkQjkyYK
	dFU7sOlAfOsre6wne8SsE0EC4HQ/pVY=
X-Google-Smtp-Source: APXvYqxeYF4jRM+hGf1tDhExHKaJPdlhJOF9JEp8E54VfBg2hYMLph9kYTSEoCd49JBo/FqD2s60uw==
X-Received: by 2002:ac2:43cb:: with SMTP id u11mr4322166lfl.38.1568327836300; 
	Thu, 12 Sep 2019 15:37:16 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id z7sm900684ljc.9.2019.09.12.15.37.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:37:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:37:13 +0200
Message-Id: <20190912223713.26895-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] pcsc-lite: update to 1.8.25
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
X-List-Received-Date: Thu, 12 Sep 2019 22:37:16 -0000

License checksum was changed due to removed license info about remove
code (see @0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} (86%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
similarity index 86%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
index 10f724e6c..1c764f7eb 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
@@ -8,13 +8,12 @@ LICENSE_${PN}-dev = "BSD"
 LICENSE_${PN}-dbg = "BSD & GPLv3+"
 LICENSE_${PN}-spy = "GPLv3+"
 LICENSE_${PN}-spy-dev = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
+LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 DEPENDS = "udev"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
-SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
-
+SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
+SRC_URI[sha256sum] = "d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792"
 
 inherit autotools systemd pkgconfig
 
-- 
2.17.1


