Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 691187E08E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:44:02 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d10so20547978lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TFN2O9nQ85JbX3c6jHcrg0OT+Nb90nQ1GhTs6G4getc=;
	b=KWowpE8TpXWpX60fCBwk4j8ahXKI9sDoKcvb2cYymskiTDFq7ALrubMUIz8gjiGSLA
	SN+X5FLfjiQvBJFCEfpJXqRntYx1IJyR5ECHDycunjU6HXo0s4JWhPfvV58/0VtGaX4d
	SlJXaCp7aYx3/LEBR4vCiBODyXrA1LeNZFSKmFj21lVOU9iCflZHLEigHILrJVMN91fZ
	y6Tsa80EtG/5/A1d4rOMUdICF+ZwZxK4aRdYseOF3ERmTh8nj0ijNgslYYxdJmgKO2mx
	fAzopuFxexXv/U3L93LG3JSuH6c/zYqzd0rOM2MNc6BtApeTU8AmFMrIY+ZiyqhrnNmu
	XF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TFN2O9nQ85JbX3c6jHcrg0OT+Nb90nQ1GhTs6G4getc=;
	b=LfQZEL0XeCheUNgjRSjr+V6RVNVFWjLTDZCWw4ed6wX6qfUgDG5UP77uUdgHlvsV+C
	MA5uxyuea0E1Q+LlLxeZXLB8HD7OAVb4S6z7hcgmSbKpuORV2+Q7r66BWDZR7HvX4t/b
	eULZkasblRNyw0akYjcC/ez7qQheCAdGud4UGMsazvj9imHsLWIatknhZo4zswWtJ6CC
	QduCX0apB3tYUxOXarn7ZoyyFWvrMaS/Mp3hhOQUiSgyxdlXv3UqzZwfkoNtJbwjFJ8Z
	f5cCA7ZRH9uH/042QMxarCugVr/8rjV7thphy2SO3d/t86ovNCvSaA45MQEkoib+7HEu
	zxlA==
X-Gm-Message-State: APjAAAW6nZxxoPPEanu4cRAo//Opfoe4Wu9HrjMg9y+y8/GKeznGg6Kq
	2kNA199pO99ALHbrN+mirXSiEtpSLCM=
X-Google-Smtp-Source: APXvYqxyxrT6SUdx1YmB7iCkj1os+fYDAFY+lXIEarlzGGgqGIUzUp4MtD0rSOxYg9Sg0ugjHTJWvA==
X-Received: by 2002:a05:6512:488:: with SMTP id v8mr313604lfq.37.1568324642831;
	Thu, 12 Sep 2019 14:44:02 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id 6sm6671481lfa.24.2019.09.12.14.44.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:44:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:44:00 +0200
Message-Id: <20190912214400.31763-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libdvdread: update to 6.0.1
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
X-List-Received-Date: Thu, 12 Sep 2019 21:44:02 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libdvdread_5.0.3.bb => libdvdread_6.0.1.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_5.0.3.bb => libdvdread_6.0.1.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.1.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.1.bb
index 050672599..d68e792ba 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.1.bb
@@ -2,12 +2,11 @@ SUMMARY = "DVD access multimeda library"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
-SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "b7b7d2a782087ed2a913263087083715"
-SRC_URI[sha256sum] = "321cdf2dbdc83c96572bc583cd27d8c660ddb540ff16672ecb28607d018ed82b"
+SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b9eeaaaf3c41b1c3cb6c1622e7219aeb"
+SRC_URI[sha256sum] = "28ce4f0063883ca4d37dfd40a2f6685503d679bca7d88d58e04ee8112382d5bd"
 
 inherit autotools lib_package binconfig pkgconfig
 
 CONFIGUREOPTS_remove = "--disable-silent-rules"
-
-- 
2.17.1


