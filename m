Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1E079D13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 20:29:44 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id t13so10788218lji.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=E60L5VNgZUMErO9r0C8jNO3U9XX1NiJsLaRU4+YYJYw=;
	b=ZnVJpex0XoEHa1dqW8tNnRgse3MnN32DUS1m90TOo06kXRSse3MOAsQeujg4jNAx8r
	djLAgYsd0hzcc6VG2fB3aZ0PIkO7HujzRWIWtk7aex4Gog8RWExvzPXKstISYp5bUUNZ
	sYkootZo64BR5pfhr2bKXai76KidN5sXl7aBGxHNyotmN0raBn2C/0egL5kXqJ9zRiw9
	SR6edTwCVGrLibG9NNKzGyKVwsDt57nfBoAvMiQ5UGMNYg3+hogQ210JgRzPIHriM6YF
	UI5vJW2B9yGlBb2Iqhq+uIkvdMaW7v5Max57gapZw2ExkH69KpneltrLjDlFEab05vWc
	th7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E60L5VNgZUMErO9r0C8jNO3U9XX1NiJsLaRU4+YYJYw=;
	b=Yp3jF8K5v81U5nTxNoXIGHXhwg7zJQp70OY/EJ57nj8VYVlaSlRDrLbRVGcSByyRqj
	+veG0g+QCjGU8UQxXlxKhXIJhlPyQVvqOsFJufVR2+EeLpqmpByiaedBUuBWcsUq39Jd
	UeO1rTS9W7u8idpjad5WbxedASwL7XWMYts/QRWl5yrMrFuuoSLXtojgZ2wfx3Sy3FUv
	8yCdVOjuma6Y8LPR42Ue3dyEvnG2WEyA+bKopLjkf8E+RQIi7vakX0B+kuYNHAh+jsJe
	lbC/0a712AGtxqRQEjCo2nII142+owCEPPOTConLmF1An6yoyfVaNGgvmTHgyohLTUYM
	lNEQ==
X-Gm-Message-State: APjAAAX7kpW3LbJ4dqB+CeN2zmlFlJl1QANdPejD9IyZ7/CNS9nsQf5u
	6O6jarmnMb50GxfQsMM6nMlVkzMKSf0=
X-Google-Smtp-Source: APXvYqwI1+MrxJ1llDmF6ERdhiaDEZTB8KbEBhkaNyq2zAtKnNmt+vCI3blmRWzXEKji6dcZuac+9g==
X-Received: by 2002:a2e:8089:: with SMTP id i9mr1184552ljg.137.1552768184312; 
	Sat, 16 Mar 2019 13:29:44 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t81sm1099864lff.21.2019.03.16.13.29.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 13:29:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 21:29:40 +0100
Message-Id: <20190316202940.11888-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libuv: update to 1.27.0
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
X-List-Received-Date: Sat, 16 Mar 2019 20:29:44 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libuv/{libuv_1.20.3.bb => libuv_1.27.0.bb}             | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.20.3.bb => libuv_1.27.0.bb} (66%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.20.3.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
similarity index 66%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.20.3.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
index a11ff9d2c..c8239443c 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.20.3.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
@@ -4,10 +4,9 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-S = "${WORKDIR}/git"
-SRCREV = "8cfd67e59195251dff793ee47c185c9d6a8f3818"
-BRANCH = "v1.x"
-SRC_URI = "git://github.com/libuv/libuv.git;protocol=https;branch=${BRANCH};"
+SRC_URI = "https://github.com/libuv/libuv/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "cc2cf259442fbe85404e75691e8244e1"
+SRC_URI[sha256sum] = "4afcdc84cd315b77c8e532e7b3fde43d536af0e2e835eafbd0e75518ed26dbed"
 
 inherit autotools
 
-- 
2.17.1


