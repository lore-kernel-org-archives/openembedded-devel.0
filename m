Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB87780B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:32:35 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id t46so2426153qtj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gCP+OsNcK8vIrP205MRmSIjT6aYNek8fyHHbkSNJ+fo=;
	b=TUIQfRK6sVlJG5rg+XcnsAFu6euQ0i0+NOCMMdyfO+TL6aoEQ4L5IfI8Y0TGW4nN2G
	JhgsGeinrGiTFIQQ2Z9zEMDqLie2I/ugqico+vjxhor0ZnlqPfL5cxO1Xrk69drQk1Jq
	x6/xM5OPwqPAf01h1JlCN2BaLQ4D3EUMMobJGafnm8uwOBH65r6VOLBV1wUkiVlPzcVR
	cKx87V0cIaF2EuuxIb8PV5xSQGq5Jv0cIEMzTK97DKOZF+4Uo3Up5vtBBi6vT8/5IKu1
	YrVCtiKAdV/CKWXd6CRGlW0xkN+JGlvFU3a38VcSrVEg5KfSJwsCcXkxoZQCnBr3cH5l
	0ZMA==
X-Gm-Message-State: AHPjjUjYlix3sRgikSw2MBvsBRfqBRX4A5Ro8t8jJNCplgrP1R4HJ9nX
	vAl0RPBIkJD3P7wzcYIGlicQTBk6
X-Google-Smtp-Source: AOwi7QAqnTbuRlJcxvumH9dkztNHWCOAOpgg0UEgiz2yR405YBz34JefA/MH8HHb/eEBlMFIIrVl4g==
X-Received: by 10.200.44.123 with SMTP id e56mr2297514qta.308.1505831556171;
	Tue, 19 Sep 2017 07:32:36 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	v92sm6894981qte.69.2017.09.19.07.32.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:32:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:32:29 -0400
Message-Id: <1505831549-30213-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-tornado: update to version 4.5.2
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
X-List-Received-Date: Tue, 19 Sep 2017 14:32:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-tornado.inc                | 4 ++--
 .../python/{python-tornado_4.4.2.bb => python-tornado_4.5.2.bb}       | 0
 .../python/{python3-tornado_4.4.2.bb => python3-tornado_4.5.2.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.4.2.bb => python-tornado_4.5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.4.2.bb => python3-tornado_4.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 9b1cf41..2c58655 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://setup.py;startline=2;endline=15;md5=5ab7571a79ad62d0ca7aea308bac7560"
 
-SRC_URI[md5sum] = "b4816ea209118667ffc52ce9ff06ac85"
-SRC_URI[sha256sum] = "2898f992f898cd41eeb8d53b6df75495f2f423b6672890aadaf196ea1448edcc"
+SRC_URI[md5sum] = "ab41f6765d58089f30ba51e8ec084a7b"
+SRC_URI[sha256sum] = "1fb8e494cd46c674d86fac5885a3ff87b0e283937a47d74eb3c02a48c9e89ad0"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email ${PYTHON_PN}-subprocess \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading"
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.4.2.bb b/meta-python/recipes-devtools/python/python-tornado_4.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_4.4.2.bb
rename to meta-python/recipes-devtools/python/python-tornado_4.5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_4.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_4.5.2.bb
-- 
2.7.4


