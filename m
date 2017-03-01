Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB72372F24
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 14:50:10 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u188so11152122qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 06:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sc1TB6lkkyzzm8j5VIHj+AtpaIjZVWYRIhGOVMF2whs=;
	b=QscaXXD9S9UnkBc3QqN1QbHL1kh1NQPR7x4WUHgcIGF2Jw5NDu12v3ePCKezun4owL
	ovgszn0cIyZUTCacbhxZdqpH7oBnGbrKXIG4wO/+UAzS+nCmDVQdfMbr080eTOEOxfDF
	oTmv8wThM+EppcTSbbynMgp1O6KSUHkSIulJNC7uaYJGFSy/SMuRyjS/QTqIA6jDTuWQ
	JqjxVAFODeSEt3/7DGpPnYioZnJmgIfvTyaLcYZh/iSSFHQ1+Q8gcM6JaGU7ytebOHgT
	xKHII18utQSA+yrAwV552GF8/WDiKjJYVludSorV0aEvW5s5vLiPMUVHYJkBB85rOBei
	OhVA==
X-Gm-Message-State: AMke39lKBh2HrsZySoTcdhRt00kvfRzDPelxMH5K1z6dAn1Uzux0z5OmVLChRz5uKVhFQg==
X-Received: by 10.55.18.158 with SMTP id 30mr1651281qks.123.1488379811637;
	Wed, 01 Mar 2017 06:50:11 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id v4sm3278274qtg.0.2017.03.01.06.50.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Mar 2017 06:50:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 09:50:03 -0500
Message-Id: <1488379803-31244-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.67
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
X-List-Received-Date: Wed, 01 Mar 2017 14:50:11 -0000

Verify license remains and update checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc             | 8 ++++----
 .../python/{python-pymisp_2.4.65.bb => python-pymisp_2.4.67.bb}   | 0
 .../python/{python3-pymisp_2.4.65.bb => python3-pymisp_2.4.67.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.65.bb => python-pymisp_2.4.67.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.65.bb => python3-pymisp_2.4.67.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 60e7647..fe25b50 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b56d97305d8b2066f2a160d3c8b22f76"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2e1efdc433498cebd33ec277ad8741e5"
 
-SRC_URI[md5sum] = "cc19a249418a3752379e6528813a715b"
-SRC_URI[sha256sum] = "3ab6d990e09ca404ce778ebbe6b2fd733dfbd244fe5a5ba3f86efe897a6c5c1d"
+SRC_URI[md5sum] = "5320f41bf96cf22d13af7eb31e1d321f"
+SRC_URI[sha256sum] = "6c7bd97f0ea9c7eb1935902f1bc6fc1ec27eba86056c5b938234a7229891d5a2"
 
-RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
+RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.65.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.67.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.65.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.67.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.65.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.67.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.65.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.67.bb
-- 
2.7.4


