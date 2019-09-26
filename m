Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id E7D307E6F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 00:52:25 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r134so323016lff.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 17:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sbCUKd5rroJJRHTpAIXhimkopAAd7bYM3mkbEwBirrM=;
	b=z5hQTZa2MDvKukRb+DNIxZHZHcEqAm42EbdLJT8BJv6JWl401A3zuXJEc1bedayOhz
	GeZscVgunUHLFERrzn+QAUUM1m7TN13lXRYTt4PyWTzNpcNxUqthL3erEjDZcWXM9hN0
	8fKS5j3OBAlU6bDrw+EIKCkEqAIRpqREqNElQMKLd4a4oLBDXrHwoESwHEEgy0IgyGDP
	z/mrZTMzZbGl3WKjepyGA/WJ4zd8b5ubVot5gJPwmHRu5iDSD2jTVe/1SY+/8FGuZiDp
	+8wD3cGrrV4GfMhpCvTVzKGSQq0jDZAttCZUyxd/hNKogi/ASCelOx17zpBA7OnNxZKn
	dYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sbCUKd5rroJJRHTpAIXhimkopAAd7bYM3mkbEwBirrM=;
	b=i3doRSuwkO72nCt1UUddb52FA79yAdm+u+A3aV6WzPyeP6gK97ZqlO2epovUq2TtX9
	hgzDkU9Omcyjnp6Z3rlVYWu5qJB0kl0jGKnAwrYCfrZRFcT5mHxcHZfZaUTrWwoPcXPp
	MLvet7hS9n/KHnSIW9VCivzaBQo+dr+ZZCh8igPGKwh4zT+YFQ9WWb9kOioNgkzSCFgd
	OV66r5KHiNYsTCO+g/ynsj+E0VQ99XNAC6sSuggnNGO2gNI4t1HwJRwZ9SKUFmR2xaXn
	ZvJ0e8ni44CqUra9D02JO+HlUKnkgo+wwZJqbeD8Scb3UcZC/aotdfbannbGxYw6VPhj
	ii5A==
X-Gm-Message-State: APjAAAXJOl7P8CplojGR+RlcV8IotKubmIUI2DVxWXprdGSHLYC+c4LG
	r2/nmy7F/qQzB+MNuEPa+Go8E8D6we8=
X-Google-Smtp-Source: APXvYqyLUwy8XV+W23jXM86ri56wWezHEpXHEWMdGiEkZxlD4VJd/Y6P16K5xs5T6q9l6V3OuGmKfw==
X-Received: by 2002:a19:ae0b:: with SMTP id f11mr457811lfc.28.1569459146048;
	Wed, 25 Sep 2019 17:52:26 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id b25sm112925ljj.36.2019.09.25.17.52.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 17:52:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Sep 2019 02:52:22 +0200
Message-Id: <20190926005223.12612-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 1/2] tesseract: update to 4.1.0
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
X-List-Received-Date: Thu, 26 Sep 2019 00:52:27 -0000

License-Update: file that mentioned licencing information was replaced
with an actual license file

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


