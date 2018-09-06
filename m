Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 76CB879657
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 14:47:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m84-v6so9538542lje.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=gDXqaEuhzywPNhWj8JyuXIl234UC/vjrwMnOkJkoECs=;
	b=r4m0dA5FWPkgkLyx0CjL4lVI/Qxf/YCVh5RPdLeY1uYiSkWVy3N/joktxYai3ficWl
	gNPA3lPHjP8cqh/gEzWecCRwJ8xMMMvaRRu2ilcLPNCaRsWpXV37K+Xo7UJ8pMve7yib
	m2sGEfgShJBszhJZC+w99lrceijNUk1MFd8Z9iXgkhwA2tWKebwabz3lOBwB49bGpt/Z
	wwOGg47GAJLfDN1sqfOhofnBGdf+1+TjGVYv0eg6B6TtUCgVfUsDkYoIYmnBCNSU2mqW
	wfn8pBhfWvfod1UJdjvf2eoOiJVQ5Lh1Ock2Un8//n6T6vBXCfVm2oYihFsSCRtz/p70
	N5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gDXqaEuhzywPNhWj8JyuXIl234UC/vjrwMnOkJkoECs=;
	b=lISbIkNT9Vnx00Piq5Icomve+1COKStSQRkcORv+AOhWCF2UmvFe72OdIGOpp847sk
	5iYaPpMl/zQwDRRo6p5JK6CfdFwgvg2lfxUUV5ZH/Y+KBS71ctpO9wVmTl69i3YN00YL
	Se9gKPAKoWHGCXeCgUCJTUuWIbwKys1mp3I7HNTIEXEztlwgmFJVOZj4eQiqixUjeXbW
	v0VEkHsx3fOyNyvg2lSupKfdiY0k6h+Wsuugi3pCBZ8K25o09jIN7hNaC0nuSLVtbjxB
	Y2gcLLnvPlB5lx+InrxLmGOFhXHgTFMXboIvVddtlJPIeqe7HbEYpCME2fgKyHVz8Oad
	Lq9Q==
X-Gm-Message-State: APzg51BhCPIW6xsCU5LIbuUKWAS69Ct26JQCyG4A9IM7nU/kZtEoWpZ5
	y//0rdQRTnQz60KkLIUgD8oFOCws6lU=
X-Google-Smtp-Source: ANB0VdZs9+MQFlnBFrPe+RGvyHf/XRiqVUFyOmS79q6Mct9AeuG2tmDGBIUmSSpNKoq3P6xNY89rrQ==
X-Received: by 2002:a2e:8:: with SMTP id 8-v6mr2173433lja.112.1536245246367;
	Thu, 06 Sep 2018 07:47:26 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	v63-v6sm861359lje.20.2018.09.06.07.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 07:47:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 16:07:55 +0200
Message-Id: <20180906140755.95398-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe] libfribidi: delete recipe
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
X-List-Received-Date: Thu, 06 Sep 2018 14:47:26 -0000

Deleted recipe as it is already part of poky.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../libfribidi/fribidi_0.19.7.bb              | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb

diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
deleted file mode 100644
index 423a9148a..000000000
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Fribidi library for bidirectional text"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-BBCLASSEXTEND = "native"
-
-PROVIDES = "libfribidi"
-DEPENDS = "glib-2.0 libpcre"
-
-inherit autotools lib_package pkgconfig
-
-CFLAGS_append = "  -DPAGE_SIZE=4096 "
-SECURITY_CFLAGS_remove_toolchain-clang = "-D_FORTIFY_SOURCE=2"
-
-SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "6c7e7cfdd39c908f7ac619351c1c5c23"
-SRC_URI[sha256sum] = "08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e"
-
-CVE_PRODUCT = "gnu_fribidi"
-- 
2.17.1


