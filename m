Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 68A227846C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 20:02:15 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o21so12729046qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dpj0p7CcJHEdhabJp1r1zL23VtxdlyZBk10SznMI9CE=;
	b=hG2Qd9SMmf/jASc+d/I/oUNC3a+TJnXDHVCSkJNL5wypvEidBW5ip3bcfDUR4NDIds
	Wcfi1boYEhf2HFWeuV1c/jZElTry+sQaJPutj9H49tsXkjVV+HfduNZADnMOOCwLNlvE
	Xdk+eyOvL/54DQRpXKXp9cygWhGM9PaoWGGy7092BU4D2GtqlMZ3UAU0eoApiYy9b2Zb
	sVWr04dcnebq2LLi26otOO/QaDMl0aXNmDBU5ze08jczdQhW1zsiJIbfa3992HEmLc1C
	nv4ZI0/dzcovwxhZ9MUUu08jVXUcBR3t6e2ymljYvNxDjRO2lnrAhaSGRIC1uhAkGtXZ
	H0AA==
X-Gm-Message-State: AKS2vOy2fkO+EG9m9Y135cRJ72hrhtW/6sGYBDe23CJPgMyxvyrOc4B4
	8Lcy94qNctBWh5ekd+s=
X-Received: by 10.55.207.5 with SMTP id e5mr13443755qkj.34.1497643337078;
	Fri, 16 Jun 2017 13:02:17 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	p64sm2241860qkl.27.2017.06.16.13.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 13:02:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:02:09 -0400
Message-Id: <1497643329-15641-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.1.2
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
X-List-Received-Date: Fri, 16 Jun 2017 20:02:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.0.6.bb => python-pytest_3.1.2.bb}         | 0
 .../python/{python3-pytest_3.0.6.bb => python3-pytest_3.1.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.0.6.bb => python-pytest_3.1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.0.6.bb => python3-pytest_3.1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index c9c9bbf..2826838 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
 
-SRC_URI[md5sum] = "6639592fa430567d024189f097fcdbd7"
-SRC_URI[sha256sum] = "643434a9f1a188271da35e20064cb8b6c5440976c5bb541dc7b5b0e3cf75d940"
+SRC_URI[md5sum] = "c4d179f89043cc925e1c169d03128e02"
+SRC_URI[sha256sum] = "795ec29fbba70b22a593691ce8bcd4bdde2dc96e8099731f73c7d8bb3ce879bf"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.0.6.bb b/meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb b/meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
-- 
2.7.4


