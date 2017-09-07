Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0581E71C56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 06:45:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f84so2215747pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 23:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Di50247HqvmxyxKHgGJzP1cxkPWnjEUYgNYSYjh4P5I=;
	b=heXokYx5X+tIdOkdfpvaSLbTkjgPAHmdm/JDL8tgyDpUPpOTIvlp2n2+fRiFU5f1Bm
	NJzi7jcfqznQB6SfVS8IetLPhPeq5XfTwhmb8WHREm3LKfUDMxDnMC5sfzcNfvnSw3wu
	Xf04bO/dhDTUitNQigPr0Ja2LiH/BidffjQl8MWnHq5zRrB8P1mKumVtzHNUosD4gQMh
	+k2IYPtkOrdV3U5DrNXZwFoosLQLLfbduOx1q4bUKlw0E998HLx3goyH7YvP0xLfspqA
	CwOXH889fdYqYqeO5KmPOnZygrVaFcU2YMK2J179oGOsS+icI6tsMvxFf2RFu7bB4WMP
	jSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Di50247HqvmxyxKHgGJzP1cxkPWnjEUYgNYSYjh4P5I=;
	b=X4kusLGaIRJkR9PiClbvxNNjkiZeYHpzzascYYh/F/AxtgUtiVLDzHjN9oG+F/cQCx
	tu5DiC4rKBqkp7jVXueazmJcGHR/kRXeTeYdPWXx5V1sEmw2T+lSCnmopEb4UEuh+hoP
	Xf/vwmp27suh37i7TXswNkLp3y1BXhKhiZg281w1TcBXuEnQB0cM2IOeAT5OmUc5x3gK
	JBFwIMTlH3u0grs+OLj62gRLkE0c+tbJ5ErbZlJ/8OzcJYNifFD7UyxSM5NuwDvcePll
	QML+hIMzGmRyWjVivNe42BeQoqFhl3niCj/MOK/H7T+YtcIiH3DGKurEstT93poN5TOV
	lspA==
X-Gm-Message-State: AHPjjUjS7Reo+X4vTCRTEorNLEggY3vXcjThuIQa0z2+RaAmRUnrlSH8
	yUKjb7HZbGRGMmgt
X-Google-Smtp-Source: ADKCNb7i/8zpNRGFcAQvYP9DzV4OYexkkBnf4nHzpi1iHuLKxXMo2QP675rmCGRP/jcSN/YtwKtwlw==
X-Received: by 10.84.240.203 with SMTP id l11mr1931368plt.80.1504766754853;
	Wed, 06 Sep 2017 23:45:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	x28sm2187951pgc.91.2017.09.06.23.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 23:45:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 23:45:42 -0700
Message-Id: <20170907064543.11580-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170907064543.11580-1-raj.khem@gmail.com>
References: <20170907064543.11580-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] tesseract: Upgrade to 3.05.01
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
X-List-Received-Date: Thu, 07 Sep 2017 06:45:54 -0000

LIC_FILES_CHKSUM changes are typo corrections in COPYING file
https://github.com/tesseract-ocr/tesseract/commit/5a3ccf06bf2d4f92ec2fd87389affd9c8c625225#diff-7116ef0705885343c9e1b2171a06be0e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/tesseract/tesseract_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
index c2675cddb..89d09a0f5 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
@@ -1,11 +1,12 @@
 SUMMARY = "A commercial quality OCR engine "
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c0c94b3c86ad0c386bb6dec70ca8a36a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ea4f9a43aba9d3c849fe5c203a0ed40"
 
-PV = "3.04.00+git${SRCPV}"
-SRCREV = "228317caa1ced217e6d264aafc901f361ecd7e90"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git"
+BRANCH = "3.05"
+PV = "${BRANCH}.01+git${SRCPV}"
+SRCREV = "215866151e774972c9502282111b998d7a053562"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
 DEPENDS = "leptonica"
-- 
2.14.1


