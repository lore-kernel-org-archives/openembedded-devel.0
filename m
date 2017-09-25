Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C7DA9782A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:39:19 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id i14so5792150qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=91wWUTnWETXuamv0NVby6bTGECELSHOeNcqsBxqFqe4=;
	b=L6Zu+K0xwCbqtX6NqzA2AgLl8W1/+9w1Z95MjRmeHhMtRt7V//gfD6MY6JytszLjmZ
	02nGD8m5BnbWv5veuN6gtzHYz9l2v/8LednTmrknnHa4XxCbc9wrF6oMOFgBWd/AEFdW
	CAYwRSaBz9ad1PAdB4jorGgY7EqhN6k8+Dt9Gt4sHeSTuWBQz8St4SQTdUwfmxsDMnTY
	roqxudicmfnFy1kF5ucwe6X9WVvFVkcJZ9tWfCKe6Wm+j/Y1iEY4C1BFFBKOdqvVf2SV
	Y/6rWcLWIf5+xPvJW0217SY5IpjPjVI8hzmepD6pbm6ME4uvcG5PNBy15YoSU/UVuses
	7OcA==
X-Gm-Message-State: AHPjjUiZYZ1A69Hqm2seZQHPPffQ686/CpeNyZb3ruySVGr5f9C1Sxnr
	O+G5eqptDcRIW5jwNtQ+M7aHa31K
X-Google-Smtp-Source: AOwi7QAxeTunroRReQDN6OIEZtTKncQMhcDqvKcFbqB+SCS4IolqlMIOzDLLnnOjQXI5UVGAf+p8vQ==
X-Received: by 10.55.114.195 with SMTP id n186mr3412467qkc.269.1506379160745; 
	Mon, 25 Sep 2017 15:39:20 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	r28sm5898184qte.81.2017.09.25.15.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 15:39:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 18:39:13 -0400
Message-Id: <1506379153-12821-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.3.6
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
X-List-Received-Date: Mon, 25 Sep 2017 22:39:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.3.5.bb => python-pyasn1_0.3.6.bb}         | 0
 .../python/{python3-pyasn1_0.3.5.bb => python3-pyasn1_0.3.6.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.5.bb => python-pyasn1_0.3.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.5.bb => python3-pyasn1_0.3.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 4bb214f..dedb191 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "285377a0ebc63a3fe903a08135241997"
-SRC_URI[sha256sum] = "c7a1186416bcdaf19b56f5b2506200306d7d4cf222d3d7c2d4cb600ccacdaf1b"
+SRC_URI[md5sum] = "a2d01c561d4996055641bbbb74eda58f"
+SRC_URI[sha256sum] = "f0380ea97db0ede095a0dd87ce3003d46c197191f924206e43f776fc77e51f09"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.5.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.5.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.5.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.5.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb
-- 
2.7.4


