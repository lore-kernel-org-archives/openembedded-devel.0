Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 048F76FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 16:03:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a186so16576188qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 09:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8YncJA81zAmmmfQtyRohDYrvr8jmivBbnhHaG+MUfuo=;
	b=TH2U33AhGuX5bsCqmgRJPDWe8aYWmZZ2mqQ54W+uvTD8UiYR2sZK/ZXppKFqlTE7tO
	az6tboWXdSucxTd+XBSXggtpThtV9IpHio+XVswTrG2QhVSR6uITYTJiS4rywDXjZuma
	P4YeNqp4mbxO/dzvCYlxFZ2h5Xq5IwYdn1XYo9MSD6U9GEpkBrd3FD6QG91d9sO5Q7l5
	jMRR4quPMWZWk/bWCjjM1ANN1Mt3xHrGL17iIOIthV4lxDlDIJekYivQVD2AiqFvZsOB
	P2HdBBHBfQ8+3AzJlGQor4r/bAAIDV1pcTbLO8CXAOHDATKjeyOImZfhOmBjcxhdRCpI
	WvaQ==
X-Gm-Message-State: ALyK8tLhLrqXU1YH8LWIgd9MEJS4F5Itww34vtjGs2UencuMv3K4t3kOtIFjw4hAmt5++w==
X-Received: by 10.55.40.200 with SMTP id o69mr1010474qko.101.1466697790547;
	Thu, 23 Jun 2016 09:03:10 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id j30sm326078qte.12.2016.06.23.09.03.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 09:03:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 12:03:01 -0400
Message-Id: <1466697781-10128-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-m2crypto: update recipe to use the pypi class
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
X-List-Received-Date: Thu, 23 Jun 2016 16:03:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
index f6f0e1f..73d8bb1 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
@@ -4,17 +4,13 @@ HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=68f7880de949412b2ea248932d97ed54"
 
-SRCNAME = "M2Crypto"
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "89557730e245294a6cab06de8ad4fb42"
 SRC_URI[sha256sum] = "1ac3b6eafa5ff7e2a0796675316d7569b28aada45a7ab74042ad089d15a9567f"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "M2Crypto"
+inherit pypi setuptools
 
 DEPENDS += "openssl swig-native"
 
-- 
1.9.1


