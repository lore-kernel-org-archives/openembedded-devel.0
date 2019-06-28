Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2CF7EAC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 14:55:24 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id a25so4185730lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wY8RZCOKqeMlKvvlzK8Oqugq1TbKA8mm6/oNm9VI874=;
	b=E4FcG8+tL9Y+TePL+UF2vQ9WEn7/C3jpMbcF670M/hnVj+MKY88vd/4GDFlyOx0vOI
	fX6lm/gqf34Zcxet1XKZlS3H4XN69lPL9GDsd3hlTHeC6WZ4tX9Voyp1/RM/whMXTiDh
	5ECVe9SGUqVPh785MFl4uVeCOZAAWz1QFpXCNobHO6t0xfPtEjy1WAIBibWCamWt+h+C
	nY05MePSKeZFQ1YbtHMfO6jEYgVz3rCSgUezRzCP5MeibIJIsWhB9nAXgDeZlT/Vhte4
	BUkCBwizNuZ74ri8XCx5DGGwGKFFTSmTJsAe+/nKRm4Bc2uQdOF3BS9DC8AiIRb3Y/Fj
	OZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wY8RZCOKqeMlKvvlzK8Oqugq1TbKA8mm6/oNm9VI874=;
	b=cXHWXm07bAig4A9h4kRZUXq8acBOXuUl/VxgoUKyImgzbt1ombGxZPHK9JW3mt7+0G
	I7kdNWgn0hrK8DL6UEArXuKwB+7jC0251/wRoQ1gUzFUnHMJb5pWE91V3bflG5OKLnhp
	XsvIkkSwPYJBAkxBakHzW9gg37iuL9lanvCdQ+x0XFayn25w9uVsEWPqfq6OMnIRBWEP
	sRxzgzVwvfh9QfkdclTQolx0oMnsCUvCm2tLhEI3MO9Sy2wCG6MbAGJtAknddSrsPDg2
	ECjvhUGulzPpp4EIMJCVFi6kBmtk9QCCJG3mFkm/rXq7uPznN2Pmy/wyU1PHWvDPfCn0
	1xXQ==
X-Gm-Message-State: APjAAAUz75S3C3NJNRgpHvkTMTFwdHg/DkPZZsGAN4HpWwpwW0KJBrB2
	eMVFQhSSvxFjFmOAJlxhRc9AFld83sk=
X-Google-Smtp-Source: APXvYqyRlxcW5rLXL7q2U+BOrJLIUz1YgoqEzIa0vP4Eg+wdpQAGBCet9WV5O9R9YRlM3t8uEV4mFA==
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr4312452lfg.19.1561733724741; 
	Fri, 28 Jun 2019 07:55:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id w1sm857419ljm.81.2019.06.28.07.55.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 07:55:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jun 2019 16:55:22 +0200
Message-Id: <20190628145522.31829-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] freediameter: update to 1.2.1
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
X-List-Received-Date: Fri, 28 Jun 2019 14:55:25 -0000

License checksum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{freediameter_1.2.1.bb => freediameter_1.3.2.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-protocols/freediameter/{freediameter_1.2.1.bb => freediameter_1.3.2.bb} (95%)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.3.2.bb
similarity index 95%
rename from meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
rename to meta-networking/recipes-protocols/freediameter/freediameter_1.3.2.bb
index b8818fa6c..8e928c989 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.3.2.bb
@@ -23,13 +23,13 @@ SRC_URI = "\
     file://0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch \
     "
 
-SRC_URI[md5sum] = "61b1062aa144b5f12eed514611e6d697"
-SRC_URI[sha256sum] = "bd7f105542e9903e776aa006c6931c1f5d3d477cb59af33a9162422efa477097"
+SRC_URI[md5sum] = "73ce230b4789f9f28fff77cbc83c65af"
+SRC_URI[sha256sum] = "ce05b4bf2a04cd2f472e77ba4b86fbfca690bfc83e51da8ce0e575804b763eda"
 
 S = "${WORKDIR}/${fd_pkgname}-${PV}"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=892b2ed6ae815488a08416ff7ee74a35"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=69bdc1d97648a2d35914563fcbbb361a"
 
 PTEST_PATH = "${libdir}/${fd_pkgname}/ptest"
 
-- 
2.17.1


