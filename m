Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D86586D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 15:39:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a10so10217708ljf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=m8XqCxI9I+MQQhe7Bske5BiVxXO4oJDMEi8t96ughSE=;
	b=q4ZREtYw0Ibozk6/zLTguuqIDDUpui1+VXA0/Z0QvvNEiVGmVyTthoPo489H8Z+b0I
	qh7chSRIJrhKDPyIGQMgrSfQp5n/bMKPaHjmdlHUMch12ru32L3beeT1hX26EJ2dMurl
	nun3R/66fbmEXyZfG8ezgYafif23o3xiAxq9dC5Smj59TlAgYdxCCxt5yHK1lGki02aR
	hZvEXqkwL4mbQoQ39XnQ6uv6D2LdUTLfJb/XbnPTOuC6CHc3dbGfabb8uBlfSEeevYSv
	oKRSuRxgRzFsEaC8WxcFwWDPB7oTp7NE2bHk6zPUR3y1OXcn82mS7Kthf+bUkBnbM5Rm
	rZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m8XqCxI9I+MQQhe7Bske5BiVxXO4oJDMEi8t96ughSE=;
	b=E6di60GwORcNzdxNzQyjgNFkXDY6EqGwojqi5SeAKD6Z0loAKlNvkcsbwJ/z+kFEYF
	h2/c7rDs44YdQCACAgrSEF97a5TTRZAb3g43AAqROV8SUhNvGXfecsz22c3dt7jLt2mG
	SezBO3z8NfEmhJI7+lH9ghzQSU6SEz/SCBZXfvR4OGXVvkwo3sMSVCfEyLqiaXxdu6WC
	1uNkFWUeO1eX0RF1wQVKaTUpemxQEfZ8slOpwLOcpzAj8Y+Yv8iynCp2+CXopUiIgShz
	qcettaLZhYV8i8tNB73nMZlxeRnowQCr2gMXMLtss1bXKOKcvEg3L2aO9jRn22IS+jky
	OUrg==
X-Gm-Message-State: APjAAAVg/6zS0HeivnB0bw9jBEmXT27LKQmmliROzd8pDzJ6xWUTOD2E
	aZ4HQlnBXMYm1Cw70wJN7sJBzPcKxsM=
X-Google-Smtp-Source: APXvYqw9Dw597wKsDkAi44C6ihnopy+XAbs2/UvA+jtD/k/Wprab2SJPHdlXCWj1H3kpbGj8+xzndw==
X-Received: by 2002:a2e:597:: with SMTP id 145mr6795472ljf.127.1558280381051; 
	Sun, 19 May 2019 08:39:41 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x20sm3210371ljc.15.2019.05.19.08.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 08:39:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2019 17:39:35 +0200
Message-Id: <20190519153935.15357-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] libowfat: update to 0.32
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
X-List-Received-Date: Sun, 19 May 2019 15:39:41 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ncp/{libowfat_0.31.bb => libowfat_0.32.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb} (80%)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
similarity index 80%
rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
index 4b072f7e7..a5e2c21cf 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
-SRC_URI[sha256sum] = "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
+SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
+SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
 
 EXTRA_OEMAKE = "\
     DIET= \
@@ -19,7 +19,7 @@ EXTRA_OEMAKE = "\
 do_install() {
     make install \
         DESTDIR=${D} \
-        INCLUDEDIR=${includedir}/${BPN} \
+        INCLUDEDIR=${includedir} \
         LIBDIR=${libdir} \
         MAN3DIR=${mandir}/man3
 }
-- 
2.17.1


