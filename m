Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6D77D3AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 16:23:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v19so2699338wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5UEM2qtTEcMvz0TPb8O0kmMSO2uya0hZtkGSjO7JKx4=;
	b=YGyR1EhlPK1+3dTXBkoorNZmKrqAs8WRm/MGVU+CNx82ZkyLoKviKDowRdlJNl6l+Y
	Um+CwQ3xdG1YvRSPPK1FS0/SejKZBlLAEfoKkoZGaB6V+kqKD+csaSxfYpCVPblSfJ8r
	VoOf9O6vW6tosrAYlXO2ApX1BGbPRWAcLQvfUDtsjb6gWTs0pKM0EC9whdZChdiyVcMt
	rbDZpWAr03q847FsLLjKYQ1EoFCLCy/MAO+xrzZ3ibm8vYsSE+c+4pkE867Ixh8Rh0T0
	gdRXh7Pd4g6PmOY7/SObRweSlHY6zncqk9rHrOB0AUx4vV1W+Po7Er45gC8Y22zIM7Ad
	gjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5UEM2qtTEcMvz0TPb8O0kmMSO2uya0hZtkGSjO7JKx4=;
	b=pHDb2Xay631z+A9VL7G74d5es0iQmSqGV0IDMvQ0livGbGPbh6Dv3OoS3FlIXY8tIS
	5cBgRgJWjGOWhj6HuYSts2p6EX+fb25UjGtugZjryKBobTXt0DGuFtfiZ/viwZRYT6Db
	Rozfb2D+gY39BFBKGPtKdQUHgnV9qN/FQbtQM7zKTe+FxGlha40SscX9TI1OIXgFR6FN
	bkZWmRbNqoeVzZD/IN9s1/fiRBC0QPQqj2D2b2MiZ4YmN0Avs7KG9+tT5C1CtmgzWnZX
	/PEn99aB1rdjHpiIo0ZURHVxqlbDUx5NdoETNg042/rkDpBuxJulCduLg4EV6QNamDVq
	G2Sg==
X-Gm-Message-State: APjAAAUmmsfWZA081JDXB4ohnw4zP096GId91RQYJm09fCDCAj50lQwy
	utKK8Xy0zBrmIHF/2BWpVQA618SM
X-Google-Smtp-Source: APXvYqzLJSIubkaeqkQnN7zfDe5YL1JYzgClljFwt2Te/cdJqqsU6qxT7YWBpwyRE6Z1eGryhHFw8g==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr3643503wmc.98.1559060582664; 
	Tue, 28 May 2019 09:23:02 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d11sm14081860wrv.72.2019.05.28.09.23.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 09:23:01 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 17:18:57 +0100
Message-Id: <20190528161856.14582-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] uthash: do not use unstable github archive tarballs
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
X-List-Received-Date: Tue, 28 May 2019 16:23:02 -0000
Content-Transfer-Encoding: 8bit

Since commit [21f84fc insane: add sanity checks to SRC_URI] applied
in oe-core, do not use unstable github archive tarballs.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-oe/recipes-support/uthash/uthash_2.1.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
index 7eb1383053..d01a06cae0 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
@@ -9,15 +9,14 @@ HOMEPAGE = "https://troydhanson.github.io/uthash/"
 SECTION = "base"
 LICENSE = "BSD-1-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a2513f7d2291df840527b76b2a8f9718"
+SRCREV = "8b214aefcb81df86a7e5e0d4fa20e59a6c18bc02"
 
 SRC_URI = "\
-    https://github.com/troydhanson/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+    git://github.com/troydhanson/${BPN}.git \
     file://run-ptest \
 "
-UPSTREAM_CHECK_URI = "https://github.com/troydhanson/${BPN}/releases"
 
-SRC_URI[md5sum] = "4d0a33f6393260926032f1fad4bad39a"
-SRC_URI[sha256sum] = "152ccd8e64d0f495377232e3964d06c7ec8bb8c3fbd3217f8a5702614f9a669e"
+S = "${WORKDIR}/git"
 
 inherit ptest
 
-- 
2.20.1


