Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 651E260589
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 12:37:48 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id n16so4923159ywd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 05:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OIA88CheAxrkmUdF20abhiGlz+E0nXU6jh6uyYPPwV4=;
	b=cuBCIuSiJiPmoNxVyFGVkOvd8TgbR147TzklUcpgayROwrgGMWb5CUgmEuVFN/TKpv
	d4ATyrCLT89QvFTNQ+U2P6J5d60Po7nB2tX7y6lwID5i+HHapOi37LplBLf6FnFn98vN
	7WNgUEl5SqkObb2OanVzVlIJ18omNIJB5odOhDuNAgdw76gjLqrKwI2X6TeW33mLfCd9
	B2vwO0sA07tZ1rvl0Dt1GJkjDbLxGGCaNP2IXwTeUswygxeaO4CFFe6WbE+Wg2JhCv0c
	/Vsf0QnZVtB4bQC8rG0/iQ2puGuh8kDpz3A4vkPU3ox1cPOMbwk7yOOLAzPDrO0b4yPE
	LPsw==
X-Gm-Message-State: AOPr4FWAGywp2CKrMccBFSUl0bGv99jx9IUmIWBv2qNESiiDOu30AXCG4PyEkBjmCVOvrg==
X-Received: by 10.129.46.141 with SMTP id u135mr4421570ywu.180.1463833421568; 
	Sat, 21 May 2016 05:23:41 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.70])
	by smtp.gmail.com with ESMTPSA id o5sm7734669ywo.38.2016.05.21.05.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 05:23:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 08:23:34 -0400
Message-Id: <1463833414-6615-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-cffi: update to version 1.6.0
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
X-List-Received-Date: Sat, 21 May 2016 12:37:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cffi_1.5.2.bb => python-cffi_1.6.0.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.5.2.bb => python-cffi_1.6.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.5.2.bb b/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-cffi_1.5.2.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
index 8b25877..bd42abb 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
@@ -3,8 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi python-pycparser"
 
-SRC_URI[md5sum] = "fa766133f7299464c8bf857e0c966a82"
-SRC_URI[sha256sum] = "da9bde99872e46f7bb5cff40a9b1cc08406765efafb583c704de108b6cb821dd"
+SRC_URI[md5sum] = "2fae9160991afefb20ff0fbde3b14faf"
+SRC_URI[sha256sum] = "a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db"
+PYPI_PACKAGE_HASH = "b69811feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a"
 
 inherit pypi setuptools
 
-- 
1.9.1


