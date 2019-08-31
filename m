Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD4D7F4B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:52 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id m9so4888804pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dC2tLRwL+tA/s2f4YvQI8cJLe5N7eWNBzh1Sd9I26qg=;
	b=Tx0xXadbez1nRlYgQktm6xmVoRTCEXiYqxvK+og4KkJyGyZMo9RBvrvjPVU733TrAt
	HdsnBR03WprfyAavOTQNy3wu5C48G7z3Z49AvOE7XhOBLjIRdcWoM9V913HwsgMamuil
	FLiv8D3szt8L6VIdZGSXVJg3IS7ZS5LIbg+GOnPp5b/TJOqIdgJRqmQsfgCyxCRGtSsc
	CRdskRHIkmsgz+18MbeoiOsbGwKFWbhgzXEr3D/tk3BPHlqr+KdiQygRTQFyqYqd1SB4
	jrfzG/0QqPIKVw4umBqmg1/epzMEN0lta4HxxsZ/yTnbmz9FYfc41bmGFiUpTxv/zSTe
	YZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dC2tLRwL+tA/s2f4YvQI8cJLe5N7eWNBzh1Sd9I26qg=;
	b=XwovGFr8cZz6gUYujIF4x0GL5RC5sd25rTLXlXpAfppJUMw959h6QjGirHCu2qj8fB
	FpP41cVdX81Wtr5T386YizMn90GzZMjlsVvrC6K4wT0se+B4SrsVGBKk/MfuKKgaGqYx
	3HEDtVPsRqprO4LYnAvG/Andp0q+/9qbr2CrH9hdNd8ZaOy3wZyV1Q2d/3TaXZuLSxCn
	QMq36D4sQDjJJ4ABEvwW8HWsCEd9TgPyld7TXydK0XoTPKMGOk2yMBKoFEc7Kjmvx/mO
	98upzZd20dr82wyALHAzEl0QyycX4gLcViSHPkxOnVMz/Fb14fEpE/KHkBvzGRJ9Xb5X
	N0Ig==
X-Gm-Message-State: APjAAAV3nYCxeesKEpZGGL9GrWuKcZmqXf7J4xsjGY5Q4AYpGAs/F8vg
	EG42CSa5EeLd2v6Y+mI0xdbfYWi+
X-Google-Smtp-Source: APXvYqxbaH3JaD8oIuB27y92p5wt0LEDcu2atbttXN/ul0Yy4geMLi42wHGTN6meDZOcDHvWkCehLg==
X-Received: by 2002:a17:902:8f95:: with SMTP id
	z21mr22746570plo.42.1567287113442; 
	Sat, 31 Aug 2019 14:31:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:27 -0700
Message-Id: <72154da2b68a465119435842228b645e54f58a72.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 06/23] isomd5sum: fix "Nothing RPROVIDES" when multilib enabled
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:53 -0000

From: Changqing Li <changqing.li@windriver.com>

Multilib enabled, and add IMAGE_INSTALL_append = " python3-isomd5sum"
in local.conf

fix below problem:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-python3-isomd5sum']

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
index 83e8385..b7899a1 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tools for taking the MD5 sum of ISO images"
 DESCRIPTION = "Tools for taking the MD5 sum of ISO images"
 
 DEPENDS = "popt python3 openssl curl popt-native"
-RDEPENDS_${PN} = "openssl curl"
+RDEPENDS_${BPN} = "openssl curl"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
@@ -25,11 +25,11 @@ do_install () {
     oe_runmake install
 }
 
-PACKAGES += "${PYTHON_PN}-${PN}"
+PACKAGES += "${PYTHON_PN}-${BPN}"
 
-RPROVIDES_${PN}-dbg += "${PYTHON_PN}-${PN}-dbg"
+RPROVIDES_${BPN}-dbg += "${PYTHON_PN}-${BPN}-dbg"
 
-FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
+FILES_${PYTHON_PN}-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
 
 SRCREV = "7860901f726f5d92689cb67243cc7f981f21f74b"
 
-- 
2.7.4


