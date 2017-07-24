Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id F08D671C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:40:49 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l55so12914642qtl.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iaJNz3d+a5pnd37mmqLtK5bvl+KczZdtjIIwmMeW4Zw=;
	b=ibUfMcteiRPB9IwgrVqG3dIRg4bYuFOiPUPns06ADogGm0mIag6Nll+jmRCdkcNFCl
	slt/gIUFlPyG9DK76408TSW5/RRFRCeMl8gY6xZifLUXqV19RewUrBAh2+soLlbIC1lg
	VRo2vPJ1q+04a3/zxlGI1i2XFW5x1HCmK42SnN+vmk6fPtA1RYT9I5sOud+SLzxmiHRe
	mrTQdOxubA+qYsFNLQcZRyaUfFiAxPvNHt5UOyvt+f1Gaek2YrgrKzHVAyPHPDMthWXy
	cHS03hvolcsR3hIPG9KSbCeEwR3X55qjkOqA+ei2cVccPLbK19KK7WJjyoxfnIm2A/IA
	eoBA==
X-Gm-Message-State: AIVw112rauEDxKnDfNHNR7fClrJXxrgdgSHIngILd3jR6wJir0jl5uYX
	Atl8sHVMuJ20zcwec3k=
X-Received: by 10.200.3.195 with SMTP id z3mr22271148qtg.185.1500921651038;
	Mon, 24 Jul 2017 11:40:51 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	f37sm8619988qtb.43.2017.07.24.11.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:40:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:40:44 -0400
Message-Id: <1500921644-15745-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.77
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
X-List-Received-Date: Mon, 24 Jul 2017 18:40:50 -0000

Update license checksum and verify terms are unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.71.bb => python-pymisp_2.4.77.bb}     | 0
 .../python/{python3-pymisp_2.4.71.bb => python3-pymisp_2.4.77.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.71.bb => python-pymisp_2.4.77.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.71.bb => python3-pymisp_2.4.77.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 6c36cc9..31bbaf9 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=97a1b2b62a1315b13e1d7f1f633624ee"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=235682336bb6202583199ef1a9f7a61a"
 
-SRC_URI[md5sum] = "c82084718360bb3ad92eb48a07ec8914"
-SRC_URI[sha256sum] = "ad36f7c4507dc06afaff4166d83c86da12efb839854752720b6fdbc9bb3e20e8"
+SRC_URI[md5sum] = "7e3f33ba1726d49df590c0d0a56c5672"
+SRC_URI[sha256sum] = "e957f700be919a107d36279e8c75d1e1d56e0bb14daa896df05332a081430158"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.71.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.77.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.71.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.77.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.71.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.77.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.71.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.77.bb
-- 
2.7.4


