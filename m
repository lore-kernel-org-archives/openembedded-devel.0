Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 21BD9780C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:47:59 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id y201so67028172qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 10:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zjtDMDJOAMKIcXPA8ylHmIwaE/C+tsykLkkhZklicp8=;
	b=TkLHeD/R2OppxbtjcDVV67Qt+Oz8wkx0oxhSbapUFXtFsgTPh26Us45rO/RW0KmyCO
	zjRHCpCYECnbfyNjPpfGxfjQrpa9biXlz6UUyCIpqx87X/u86Yk/01W98YzEOMb5ETW9
	v7kGMvUn3WaJBKY0bmdPtVxUHkqqcAGKeUc549WkboIg90tBo7u5oE+MPv0nibEjUrVR
	XeP+dGqsp4jhnx62EL6iKpotB13tfMNKXWnThb41gFJAuHyMIxsIBxuT1fqLD3BJ1ar3
	SxU0Q4UVT8w1+cWF92UOw8MN68/tFcXEM4d0ba6w5zZ5JEcSPskr7EckwKLIMHEx8brQ
	cN7Q==
X-Gm-Message-State: AODbwcDGRKnWw6LYFFy9rKIg+yaUdwNlLuBJ79AwWhxKlYPvPqCRvGxA
	GH50E6kYc/Gpmw==
X-Received: by 10.55.215.78 with SMTP id m75mr5084581qki.182.1495216081360;
	Fri, 19 May 2017 10:48:01 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	f138sm6112818qke.17.2017.05.19.10.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 10:48:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 13:47:53 -0400
Message-Id: <1495216073-30168-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-markupsafe: update to version 1.0
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
X-List-Received-Date: Fri, 19 May 2017 17:48:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-markupsafe.inc           | 6 +++---
 .../python/{python-markupsafe_0.23.bb => python-markupsafe_1.0.bb}  | 0
 .../{python3-markupsafe_0.23.bb => python3-markupsafe_1.0.bb}       | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-markupsafe_0.23.bb => python-markupsafe_1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-markupsafe_0.23.bb => python3-markupsafe_1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index de61944..e50f8ce 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -3,10 +3,10 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
 
-SRC_URI[md5sum] = "f5ab3deee4c37cd6a922fb81e730da6e"
-SRC_URI[sha256sum] = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
+SRC_URI[md5sum] = "2fcedc9284d50e577b5192e8e3578355"
+SRC_URI[sha256sum] = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
+RDEPENDS_${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-stringold"
diff --git a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb b/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
rename to meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb
rename to meta-python/recipes-devtools/python/python3-markupsafe_1.0.bb
-- 
2.7.4


