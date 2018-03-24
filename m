Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A5692786EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 14:20:19 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v11so15432636qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 07:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XaOIDao8YGROQx30jro4WwFthZHUE+b9226YVz/qpSU=;
	b=MypqokxHUWOJXNxwzqCR2p0LMpozDkEH8AKLphKTacy0YjaNLQ6a7cMOgZQZ2P+z+b
	v5xJHVk4xHkw62J2SF/N2krwrJcrAqHzJtuEy0NBITngmSP4YcBDppvxSckwamjGsbvw
	i0S28gk3+M87ibFxHrz72VlIvUHGXGHsbYMUrrdAMG0520guiR+XQwb8cZgKe55tlNET
	6P4kFNElOWOuoSmOKXzXsGSF2FuNDFCGIVHR/cIs9+gGu0pYk5BiRnc+VS0Ih203sbZj
	Sf6zHzApobiNWgE/UvHg1BO7D+aY/whtDNJes/HqKnVRNf72Xj20dCwkEPSDoATVGzCq
	AnEQ==
X-Gm-Message-State: AElRT7E0c4y8W9gZyBjke6Fwf5lV5sWqPZc0kVxRhxSOZ96cLUA4Y72K
	UQRsBybIjOugtVp3bOGrg9CSbwYH
X-Google-Smtp-Source: AIpwx4/m4Wf0ksDuuezp8bqzV7Y3ZcBK0Z3pRDf6H6P+cHPizTTChim0jnQ0bcV12vJ2Df/sSGiNOA==
X-Received: by 10.200.112.142 with SMTP id y14mr2621944qto.287.1521901220365; 
	Sat, 24 Mar 2018 07:20:20 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h21sm7768727qtm.57.2018.03.24.07.20.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 07:20:19 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 10:20:06 -0400
Message-Id: <1521901206-28471-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pip: update to version 9.0.3
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
X-List-Received-Date: Sat, 24 Mar 2018 14:20:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pip_9.0.2.bb => python-pip_9.0.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_9.0.2.bb => python-pip_9.0.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pip_9.0.2.bb b/meta-python/recipes-devtools/python/python-pip_9.0.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pip_9.0.2.bb
rename to meta-python/recipes-devtools/python/python-pip_9.0.3.bb
index fa709a1..b0f7533 100644
--- a/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-pip_9.0.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRC_URI[md5sum] = "2fddd680422326b9d1fbf56112cf341d"
-SRC_URI[sha256sum] = "88110a224e9d30e5d76592a0b2130ef10e7e67a6426e8617bb918fffbfe91fe5"
+SRC_URI[md5sum] = "b15b33f9aad61f88d0f8c866d16c55d8"
+SRC_URI[sha256sum] = "7bf48f9a693be1d58f49f7af7e0ae9fe29fd671cde8a55e6edca3581c4ef5796"
 
 inherit pypi setuptools
 
-- 
2.7.4


