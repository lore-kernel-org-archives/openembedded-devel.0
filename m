Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF7B56093D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 16:35:26 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id f8so17011889qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 08:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+HhYJFhpHu90uPCCxGtel16jeRGwtVVyIGrYY8OH5CU=;
	b=gznMon1PI+olib6fGfaP04WIg4oNrdDLnj6Xr0EQS8PZsQvUQR9c0XWjQg/hMyW0rt
	DVSR+rE4CINRreng/RcIQ8yvL9ft+RAI2kL7Ks8IhGmy/pIUXD7KG2yRoyc2lZmJ+jNg
	kVJdLh9E7oeTgoThpGFC2cRoYatd5qyCFncapArxOkFZYdndz1ReuzL1VWUuJgyN/Nlc
	Ol287VhDwwfgdqrtR1a+rZwxnwwaZNSd+6oJdstF5kg229deb6psaeNjLCSUeDVx/Nu/
	qA2vEUcsUUVbBAaqvq1ItPfshX6V4uTED+FAIkILHM6uTo+MGbpFW4D5zPbDQpEWr1Pc
	jIpA==
X-Gm-Message-State: AJaThX4Z3X4BOoAh0nwr1XzDvEin2PoyBy98K7IrYCAAFUzXDK4pIMpK
	ZuyDejiqDPEvEF3ZL3lrFskO1C1p
X-Google-Smtp-Source: AGs4zMYwAsQsWJQmQajEzublHvJOQ87EPLKFezQUqXGsiRoFnlR6BuHJlPvKY2vn0yyC9xvldyKPgw==
X-Received: by 10.200.26.216 with SMTP id h24mr10244391qtk.175.1510504527624; 
	Sun, 12 Nov 2017 08:35:27 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id o49sm2506111qtf.4.2017.11.12.08.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 08:35:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 11:35:10 -0500
Message-Id: <1510504510-2170-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.82
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
X-List-Received-Date: Sun, 12 Nov 2017 16:35:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.81.2.bb => python-pymisp_2.4.82.bb}     | 0
 .../python/{python3-pymisp_2.4.81.2.bb => python3-pymisp_2.4.82.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.81.2.bb => python-pymisp_2.4.82.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.81.2.bb => python3-pymisp_2.4.82.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index bb9305a..1a0f869 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "77c6276039a7e48d8ae1d335564f20c9"
-SRC_URI[sha256sum] = "2ce6d8a9c59fe5f63b406b667fd40df8ebba0dee63844dfec95fb9d2892ae6af"
+SRC_URI[md5sum] = "160988f4f6bd56670b28c9791f8a8b55"
+SRC_URI[sha256sum] = "21834f562632cbb87c867c5cd4839799832b5714cc3c8e2797e56c4a72f6e26c"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.81.2.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.82.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.81.2.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.82.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.81.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.82.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.81.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.82.bb
-- 
2.7.4


