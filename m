Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7DA7897A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 13:42:59 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s188so11932160qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 05:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2sgNlpbOeZKHiC0fs23p9NSBYjvjfWU0Q5IAl573dmc=;
	b=DRjppxOrDhtc0KwqEwwrUuTnqy36sis9HsNHvc6H4Yxnt8oYZbiLCGCEXmPFzOWnuZ
	Raj0U82DCEVQhYUmiLdNyqYjJhdHHcS3A7alCDkSRxaXBxzrWm7cwCfeQ0IaMDkIAmja
	yWMw51Ao7/txdr5MpQhmG/EoHEZvQVPtPu5zxu7V/IbKpSdd50oUhfudf0o5vIjmR/Xd
	HnTcXPc1VKVUhApB76L2GBEjybH9WayiStEgXZtEqLdRRjAY0IrFhwv3uHq1BkvR3cTP
	fdKalJykq/zquicZzKx4IO3QI2BHchUegoGpqBLEjQ3dMPJjzwZgK1bT6awT7AUYbJiZ
	LBOg==
X-Gm-Message-State: AElRT7EPjKwPFSshT/F+7M20FYHfHgawRHJfJDbPdk6moScStQgvTKa6
	Gns1GUgKeuRXG1XxFZ6Yaoqx1Y++
X-Google-Smtp-Source: AG47ELt02J79x9t4gpaN9Ce1CPDAZXNaKVODpOe4caL0LoZmP18qjt532StgCtS3jFREFIypH6YG2Q==
X-Received: by 10.55.174.129 with SMTP id x123mr7936730qke.166.1519998180915; 
	Fri, 02 Mar 2018 05:43:00 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c66sm4253365qke.42.2018.03.02.05.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 05:43:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 08:42:51 -0500
Message-Id: <1519998171-359-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: update to version 1.11.4
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
X-List-Received-Date: Fri, 02 Mar 2018 13:43:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.11.4.bb => python-cffi_1.11.5.bb}           | 0
 .../python/{python3-cffi_1.11.4.bb => python3-cffi_1.11.5.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.11.4.bb => python-cffi_1.11.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.11.4.bb => python3-cffi_1.11.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 39ab19f..e6071ee 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "8ef0f852498908b20bc508799901fe93"
-SRC_URI[sha256sum] = "df9083a992b17a28cd4251a3f5c879e0198bb26c9e808c4647e0a18739f1d11d"
+SRC_URI[md5sum] = "ac8492f4ad952360737413e82d661908"
+SRC_URI[sha256sum] = "e90f17980e6ab0f3c2f3730e56d1fe9bcba1891eeea58966e89d352492cc74f4"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb b/meta-python/recipes-devtools/python/python-cffi_1.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.11.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.11.4.bb b/meta-python/recipes-devtools/python/python3-cffi_1.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.11.4.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.11.5.bb
-- 
2.7.4


