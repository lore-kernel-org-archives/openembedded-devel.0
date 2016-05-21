Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2FB73199
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:18:43 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id y6so18154702ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hJXgoIaeaGHmSkGve3ihyqJDDacKWKSkRCrk7PQgkOo=;
	b=JZsMn1Zdvc0gZUex6RJpsU4w54AMRpUg01oet1Ifd9gdxngELH/fee4/PtjvAQqrdJ
	j6Z+g4BVmmDs957CBHNH8Y5HYTBbu929MPHwmAiKOXyw3GaNWE/ix4rfmbQFQ8I6dq+r
	jdGkrpMyzsVfIps5S0uq24nu2JaVdOFnBXwMTrobC9KVkl6MG7Vw1ayO83l0Ig/gl8fR
	YUv05AbVxTcqFT57J7Pt/zYtWShIamvI2p7D6BnQCmDIXcd/La9VTjaxF83Bo2txVT0M
	F86qtzkg8VZhfpjD4sfcn897hUdLKkKw9zskr5wSr64yGADvwzQQNAyQrL/e4f7nThu7
	/CoA==
X-Gm-Message-State: AOPr4FV2a5nDpBZdI29wOCTJL9Bx1gCauDmCZbwB/Reg7u3x3IPAYMoMLzC7ci73pJK49w==
X-Received: by 10.129.72.199 with SMTP id v190mr5120358ywa.110.1463836723811; 
	Sat, 21 May 2016 06:18:43 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	w196sm13978562ywa.52.2016.05.21.06.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:18:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:18:35 -0400
Message-Id: <1463836715-10542-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-psutil: update to version 4.2.0
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
X-List-Received-Date: Sat, 21 May 2016 13:18:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-psutil_4.1.0.bb => python-psutil_4.2.0.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_4.1.0.bb => python-psutil_4.2.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-psutil_4.1.0.bb b/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-psutil_4.1.0.bb
rename to meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
index 6a210ee..c3533be 100644
--- a/meta-python/recipes-devtools/python/python-psutil_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
@@ -2,8 +2,9 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "017e1023484ebf436d3514ebeaf2e7e9"
-SRC_URI[sha256sum] = "c6abebec9c8833baaf1c51dd1b0259246d1d50b9b50e9a4aa66f33b1e98b8d17"
+SRC_URI[md5sum] = "713f259f917a0c26acfbb7e6ae632ef7"
+SRC_URI[sha256sum] = "544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace"
+PYPI_PACKAGE_HASH = "a6bf5ce23dc9f50de662af3b4bf54812438c298634224924c4e18b7c3b57a2aa"
 
 RDEPENDS_${PN} += " \
     python-subprocess \
-- 
1.9.1


