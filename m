Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF807D9E5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:49 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id v11so3414363pgl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OfgY++drjHG4Nay1KFg9l0oGNXHPFLPliWnKWNjsVF4=;
	b=q/BdrEY0k2Kw90otO2mGayTdRY1MK6QGSFk9l8ssMZ1ueLq73qPHbW0gMOrH2wZIOh
	pYq7vKhAirPWWinLP1qWzDQR4HtviFuUg10XlyfRCibSyrLN7GUiUnwPNZPn+CASJ1W8
	myWEtP/k3ys4UJGBqB5veyi3/MLVoEF+Gpdz+XQCHoCKf+GXV5KFXBkttwe9lv5GJbe8
	lut/upEhltJVKYWO6is4piw61b5p7UVDd35UyPEyUqsauOj0Af32QPpa9qGfo6poWOSZ
	YrzR7IFKuVPNdxi1ZBHYR5uQMI117P39iY5iyE9pbeGKk2zsotF3oJsr4Zmcm/RvwD03
	Ra8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OfgY++drjHG4Nay1KFg9l0oGNXHPFLPliWnKWNjsVF4=;
	b=PiNNKsffdbxpQbfLYmfiqVOREEJ0OxPRI8XQhvEYPebchkg/A28TvDHs00hIsSSUrg
	h6g4Bsn5rlq0Ld2YcqbZRPJOUL0cMjVGaZVl2tFTuGaWqyeB10QWpE9yE4PpSljx/W2H
	kkpOoPk3EojjB8luGqg3ZdTVT7GmCgC+HsWC8GWWPq71Hs2DhmPAoZZiKjOMU+dJQ+PU
	rM+425NAgEPagm0niQU50QLf65/TCpGddb3nuPkaiQD39p6CP1+9rR/S/lVZYhl76NWC
	SkqOD+LbeYVoyjhdeVTq9OZ4TslZX/DHl6X/VyiPwvoGd0tDkwUD/gIjnOLdmJpKNgsH
	D0zg==
X-Gm-Message-State: APjAAAWraSGrCTHu4NaY9BCP15F8vSvS/ZUa7X/fdklaoSrLMCJjawYd
	lweU1KYZAiDf6cXA7vp+SyhxCTmR
X-Google-Smtp-Source: APXvYqx6CZFX3eEzDJL8vaAS8MgcxCSqNGcd6ofrxqFFmPn1d3sSZ02fHHvQYqfUkz1M9hKoy25PmA==
X-Received: by 2002:a17:90a:7787:: with SMTP id
	v7mr14168051pjk.143.1560621470741; 
	Sat, 15 Jun 2019 10:57:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:25 -0700
Message-Id: <624b41537a60683169185f479d85c32b0b4b2157.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 21/23] uthash: do not use unstable github archive tarballs
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:49 -0000

From: nick83ola <nick83ola@gmail.com>

Since commit [21f84fc insane: add sanity checks to SRC_URI] applied
in oe-core, do not use unstable github archive tarballs.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/uthash/uthash_2.1.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
index 7eb1383..d01a06c 100644
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
2.7.4


