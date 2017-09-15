Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 295D478595
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:04:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l25so2045566qtf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ymAnCiTXQonUWAGEt4OoNxWIMS/MDBi4W3qc6JlJGOc=;
	b=f2qBWcsSOfOPGZpLlbb3A7UoqBvO1ydq1tYo2Tw4wAYdy4RlOCV/4u5TsDqRdKPNBS
	J8C3L3+GHS65ngoChdKLTjHexbsQs1OZFcfeliDjXjOmpwigtSFAv0uiefKPv0JQ/+HB
	fTwsqlXFxaEe8TFa9EuPZpY/fvTgd6DQn+gF1XC0mHTTChkPd7nbiKbpdjXif1EBVPdJ
	kLPJiMS5isVgpUFXFHj8a2v7C/4JtIBqXNOVABh/dSh2vn9E+JpjDFI8ZG7YEy4WwbNo
	HJ5UGKSuqAoCPRxVuZL3nCkFtBXtV7z9mvIaYnhMPZQ9zJ6ar81VH3kt4LChrZ7necog
	nruQ==
X-Gm-Message-State: AHPjjUhWrWHGhnx5reQPNTwyJBG6FtGZK/HmpmboyHw50dYilD4R8hzM
	6Ft53fqQ1eLCOeCNC2s=
X-Google-Smtp-Source: AOwi7QDxnWt6O7s/gMR/kk3e3dnpit0XgFVjQyCs/r1Pbklqym/Z4P7dhRKyaYDsHV3BaHWgqSVnAA==
X-Received: by 10.200.35.186 with SMTP id q55mr38479555qtq.193.1505502251166; 
	Fri, 15 Sep 2017 12:04:11 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id a50sm999441qtc.87.2017.09.15.12.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:04:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:04:02 -0400
Message-Id: <1505502242-24329-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.3.4
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
X-List-Received-Date: Fri, 15 Sep 2017 19:04:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.3.2.bb => python-pyasn1_0.3.4.bb}         | 0
 .../python/{python3-pyasn1_0.3.2.bb => python3-pyasn1_0.3.4.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.2.bb => python-pyasn1_0.3.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.2.bb => python3-pyasn1_0.3.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index b234a1d..4166b89 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "a014715fe010038dc773cec810cd5ad9"
-SRC_URI[sha256sum] = "90bd82e0db59d4319eaf01c2549b34c817d645275fce9ad41bac7429aa380690"
+SRC_URI[md5sum] = "738e645ff075c9eb95fbee0411529323"
+SRC_URI[sha256sum] = "3946ff0ab406652240697013a89d76e388344866033864ef2b097228d1f0101a"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.2.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.2.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.2.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.4.bb
-- 
2.7.4


