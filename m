Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 283DA78883
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 15:01:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b15-v6so4460540wrv.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IcNqLa5Kk7ty3CvUZNJ4VvK1h0LkzBDiOkV/KR9cDmM=;
	b=yTOseLeMwFOeeLA9guyFqRSNpvrI1fmnc++LpJ4tgsuF0tBdePFNxXwHkC1FYQUlqg
	dKCWwshO+5GE1ijTstGyKnpUj2xZ+L+HW/vnkijoFioOYFHi0SlPNBJ9trvMNJaNXWba
	f2n6BbSMoT8SHKGL+mdKUjPV09bRQmEMwwaaRTHIilqx+gVxv88zWOjsuHF9AhE6t5jR
	2Yd8neY+QBi2UViBIXrnYSNeTtMyyrn6wA55hcfMtgXgzxDiARcE1W2Akv+6zz155mUA
	CLegmIdVqC6SMgC1IFdvClhzRPG76Q3YKb9jY2iMFBraiHhfyknGmuFkaJ6lBaSrH/7r
	yqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IcNqLa5Kk7ty3CvUZNJ4VvK1h0LkzBDiOkV/KR9cDmM=;
	b=GEHEXEUVAMkt00aA9YRTGSXwWrMHxpCFcMRdMklHwVRhoeKC3cuvmW1xVx7GpHBFgo
	wolIaawUPr7LbvhHFxpmrIqeMtCcFp44pghLo2d/8akWVe8/I9dtCQ86bURTvNsM6Utl
	/2HKKvMdv6Zo16PMG/E2QeJL8Ll+12kDXTVzSVxla6jCxE1TXAQI19Vnb8g23EN+S3W5
	ICzhIHnEIYQ9lRfL4Rg+iINpcExZYPTHfhhkoQCdvjiWLIBi4j5s58lUb6u3Af3+pVQK
	npJ+RcLCYPN6jvJsU5y1n5H0SiK4MkRxD01NF9AVV77f7T72UOvqmYSXsKWL0inrduww
	6i2Q==
X-Gm-Message-State: AOUpUlFpnlBQLQtaU7zDiSRPlHbzBojmyI5wsPEaefBovIo5Hlk6uRFE
	67dfHJiSYWnMJURqyFTBqAyo+A==
X-Google-Smtp-Source: AAOMgpeaDl8AeZuayTsrFJvBs+DPR4wRlhrWj5L2VdffmrHV0zQHrWoTTMy1u8O3LkqDq1fRwLkOmw==
X-Received: by 2002:adf:8481:: with SMTP id 1-v6mr12307457wrg.34.1532444463663;
	Tue, 24 Jul 2018 08:01:03 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local
	(AStLambert-681-1-38-117.w90-86.abo.wanadoo.fr. [90.86.157.117])
	by smtp.gmail.com with ESMTPSA id
	z14-v6sm1755115wma.18.2018.07.24.08.01.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 08:01:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2018 17:01:01 +0200
Message-Id: <20180724150101.12609-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libgpiod: bump version to v1.1.1
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
X-List-Received-Date: Tue, 24 Jul 2018 15:01:03 -0000

This is a bug-fix release that fixes a couple memory leaks and bugs in
python bindings discovered in the v1.1 release.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../libgpiod/{libgpiod_1.1.bb => libgpiod_1.1.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.1.bb => libgpiod_1.1.1.bb} (78%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
similarity index 78%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
index ab0bc980d..9d3d759fe 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "80237a047a9d653a14c5d71e5ce9d641"
-SRC_URI[sha256sum] = "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1"
+SRC_URI[md5sum] = "e5e946cb01a35e5046a1a7a108d6a96d"
+SRC_URI[sha256sum] = "172fa1544ecb51f37533b3e67862298d50c0a5cc84975f3c0706dc15467f0dfd"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 
-- 
2.17.1


