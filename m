Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0A89B7FC57
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 17:06:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w15so21044683wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YamHWC5lBi7TonvKL0z+abtZo7LGL76YjrSCSXeOw/Q=;
	b=oYVc/VQ+PrVYyNzuwO4Z2EVaBG45OSD17BmuVQ8gnunK6g1jSaeLtu3USb/26OJP5K
	eso9NZlaZMJ6JETXhvORDqJOtu1UnyZR7VcoRNFqRJ54dghWZHWjGcgJma4BFUDknSSK
	5nwVGT306HoGkOmXbBkf+u5Fx7g9fhI/IacfYhwSGvPzgZeG1jL4hvXYGmQWQOvy0+7O
	r1jkQ9a1D5yYhBotlXCbSdifXs8OEGcr+4bL9OQCXV+LAsqKLOglz39ykgBsxKkuv1ke
	8kFPm2JfBuWNO95au77NSP9EVT7AZot3m5J5iu3qGtOK8mhOYv/SPCBvf4maaQc/FPcx
	zxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YamHWC5lBi7TonvKL0z+abtZo7LGL76YjrSCSXeOw/Q=;
	b=cuoRKHF4oBnSwuRSE0Zztxepgfi4kWmilPQ3djqFCL3IG+8ZgwgNbKd6r3AlrgR1PT
	6+K2bOdY/Q6jkbgX/vpdb8g067yiZpO462ayFJSGytyM+gQVlsnRm6N5I05XQ05FeVe1
	PHM50Hf15+3gdmMutyxmmnGxtHAxv/KnDdOA13x3ynef33imZBwtyp8aqNDLVKUZlDCK
	l+it956IXqwm4aVOQIwMmhwie5RYnSX1jp5/kkl5Pv0iCkRgwZ3u+egcCnAAz1J7Nj1q
	VLvMaYqNZHKFtCOkEUgZo0JXGgphzOuHTNYoFps5BbNYrOcVuq9eGleDd00i7dj0e0oD
	EAAg==
X-Gm-Message-State: APjAAAUW3X2OUV56GXLHzFCn9PzUBMXjBmWywrzVugxP6tXKz9cbTngg
	X0ySqzwqaZv8hVu4NFdpIRm1dH8/D2c=
X-Google-Smtp-Source: APXvYqxh2L1Lx5fezRi/kVw3n/TRHC+Z0gDMjfHw+QxwE+Gj2wVCGk+pDPxSTjSM0OA3TlkN/dYXXQ==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr4358181wrp.292.1575997585555; 
	Tue, 10 Dec 2019 09:06:25 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q3sm3998443wrn.33.2019.12.10.09.06.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 09:06:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 17:06:17 +0000
Message-Id: <20191210170618.29764-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210170618.29764-1-ross.burton@intel.com>
References: <20191210170618.29764-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH][meta-python 4/5] python-lxml: remove redundant sed (fixed in 4.3.0 onwards)
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
X-List-Received-Date: Tue, 10 Dec 2019 17:06:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 1f7e5abe8b..5dc95e5026 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -45,10 +45,6 @@ DEBUG_OPTIMIZATION_append_mipsel = " -O"
 BUILD_OPTIMIZATION_remove_mipsel = " -Og"
 BUILD_OPTIMIZATION_append_mipsel = " -O"
 
-do_configure_prepend() {
-    sed -i -e 's/--version/--modversion/' ${B}/setupinfo.py
-}
-
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
-- 
2.20.1


