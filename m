Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1E3780BD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 19:48:55 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 130so11910203qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 11:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fOZZDrY27mbGB2QaKkbtips80rfZKk49ZMZPenYwUJo=;
	b=WNB2eSu0DvuISeDP0OnLyFt+t38AJnfO9cXihFgjyywvPBEf3TMcX5YsLPhuJ/8w7B
	reK6+VQqKCWrNG/rul0zVo/nkkY1E20aIE8HTn3s/kYDjKdkFOl4ivGk+XL+lnNy4wxY
	s7hS5dxcExnlVAO9dA0LdKXRQS2XmLvtKBjUFsP52CWeSkSVzdQBp8GcflNBoyRlrECH
	aukOOQbhL8X7acFatb2qJ/0dsS+8a8Y3eGT5dRQGS7yUuUCMOkgKLO/hxB+Tl5zqjVzI
	B5Yv+ab+6WcDm1/HeJ6DRkPTUTdmj8Q0Brr12qIEsHLPctxdap4wA4XMCAXIxU3Sd2RH
	6SWg==
X-Gm-Message-State: APf1xPCDGsyFNFq5RZPWAh5Ue/CeMHtd7N91ybkNyUGqnttOL0rjXKIs
	JKoc8fJ18BMMi6b06DTnPua4YVon
X-Google-Smtp-Source: AG47ELtNVSqs2ICfkhkCi4SK9r4SISDDK5BIGMcWgXIFUxGfkfpwbMXh84/xHPCuvFbZLHzv7+VUVg==
X-Received: by 10.55.200.197 with SMTP id t66mr13006344qkl.93.1519588136054;
	Sun, 25 Feb 2018 11:48:56 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d191sm3803492qkb.32.2018.02.25.11.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 11:48:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 14:48:25 -0500
Message-Id: <1519588105-8101-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pybind11: update to version 2.2.2
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
X-List-Received-Date: Sun, 25 Feb 2018 19:48:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pybind11.inc             | 6 +++---
 .../python/{python-pybind11_2.2.1.bb => python-pybind11_2.2.2.bb}   | 0
 .../python/{python3-pybind11_2.2.1.bb => python3-pybind11_2.2.2.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pybind11_2.2.1.bb => python-pybind11_2.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.2.1.bb => python3-pybind11_2.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
index e273a8d..e441dc6 100644
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Seamless operability between C++11 and Python"
 HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9b27fac7e937323e3de9ca3a7db38e37"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
 
-SRC_URI[md5sum] = "f454d8991f47befe56d4126df861fc96"
-SRC_URI[sha256sum] = "a96a924fae6e2721efbf24f47561284fd1ea0b655619a8621c4423036183b824"
+SRC_URI[md5sum] = "2c651a75a20dabbaa18a8b023ffd54c0"
+SRC_URI[sha256sum] = "cbb036a8aad59a199ad672f98813f85c672642c6a67b4ff3868b1d6abc5fae3e"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_2.2.1.bb b/meta-python/recipes-devtools/python/python-pybind11_2.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pybind11_2.2.1.bb
rename to meta-python/recipes-devtools/python/python-pybind11_2.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.2.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.2.2.bb
-- 
2.7.4


