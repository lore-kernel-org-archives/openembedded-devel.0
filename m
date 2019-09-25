Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 82A737E71B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:36:21 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y127so108668lfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uRPgpJV3oolOWSu41Gz3QaoNSlaw+M8ScK0xFxlUoZY=;
	b=VuzPWdicj7Kfdps7puj717Klv5Z7e7emOWCC4FSswE9lJT/jhxGvryD1P7ZLItMBWp
	T8LEwSMeEFpYPTbgp4BYXs1o3Qj0xH7G91z/4/UfrrL4WAAfAws0GD0wTq6kK7Wy4Z14
	Pm3lxzWgpWlO5txhemR3vgGp7pXDnWTZeCiIVa5quz/dWPfaCFxAxNreQqXsrVFXOrrw
	6TidhhdfBc7K3WteQB+XIzfD04DYQh6FwLBjiimGreFWk8Y0p6lEyjJJpPf+xBo+dO1r
	xq3DMf3tvRAUH9eK4LtVaUCTC7YVZKChyBKHupuRE+Lvru17f67j/EiACRVKTXv04miA
	F6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uRPgpJV3oolOWSu41Gz3QaoNSlaw+M8ScK0xFxlUoZY=;
	b=KvTsuzlKHL7iABUVwr+lgQiP7fHlIQ989SxBl3eC8VgupTdEBiYVXhaJknIqpxjJ6R
	2sNm8OhJf/EE1wEfM1F+RypgVVYwRkcb8EiT1RVj3iEkOFNofIR+bVbzJOI5xpvUx/kl
	1dcnX63EHOCVox23JuH0HltcfcBtbvIBFHBCRjGvpxuNSuIPCBTALl19F98FInfFRrUp
	tQz8Ff+51j3byo02jY6w4MxZpr598ElBeSdo7JVBIlstJOoy1hII9aWF8/Zd8qhVxPju
	NvLzjFXKE/TOOaD9xy6lCWRoKZ4bQAETMOhjmQ5x6i6OqQttH4/8P9ZrRgkVXB3/E7m4
	Uovw==
X-Gm-Message-State: APjAAAVVe0M0agG776VcW+ohonDrb2ZjdhzEJmZCsB/4DRvqt3GceE7J
	qlAqdOMw6+sHo3q/M/KhJI8RqFH4uYQ=
X-Google-Smtp-Source: APXvYqyQCcVLKYTwY21/dcCLpQE5UwLTDprCvpX6P3zOHrPKq0lvnfK9aKKkNU42mHll/nGHDsWeTQ==
X-Received: by 2002:a19:7413:: with SMTP id v19mr81266lfe.176.1569447381670;
	Wed, 25 Sep 2019 14:36:21 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id n3sm47967lfl.62.2019.09.25.14.36.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:36:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:36:18 +0200
Message-Id: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 1/2] tesseract: update to 4.1.0
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
X-List-Received-Date: Wed, 25 Sep 2019 21:36:21 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{tesseract_git.bb => tesseract_4.1.0.bb}          | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_git.bb => tesseract_4.1.0.bb} (57%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
similarity index 57%
rename from meta-oe/recipes-graphics/tesseract/tesseract_git.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
index 89d09a0f5..fde3bc180 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
@@ -1,19 +1,20 @@
 SUMMARY = "A commercial quality OCR engine "
+HOMEPAGE = "https://github.com/tesseract-ocr/tesseract"
+BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7ea4f9a43aba9d3c849fe5c203a0ed40"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-BRANCH = "3.05"
-PV = "${BRANCH}.01+git${SRCPV}"
-SRCREV = "215866151e774972c9502282111b998d7a053562"
+BRANCH = "4.1"
+SRCREV = "5280bbcade4e2dec5eef439a6e189504c2eadcd9"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH}"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = "leptonica"
 
 EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
 
-
 inherit autotools pkgconfig
 
 FILES_${PN} += "${datadir}/tessdata"
-- 
2.17.1


