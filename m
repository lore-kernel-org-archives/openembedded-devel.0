Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7A47724D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 20:38:17 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n21so55844048qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 12:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b3zt+uuL+czCj7PLnBu5aHYMLbxGwI2p4l+h3LQW62o=;
	b=H1cPC6hVj+vSaIo0/VWQ3FDzqmd1JdPX3cqDX6kuWvabJeqxdHqtHmQalTTLvX/VaU
	YHXjDjTGkX55GNq12pcDRXiGuz2Gz+uTiS5NwgoV7AXeGVTp3eLq6/WxjrGK88guq7iC
	xUEHs6pXHCoVNrRnVMreU80LUky13wPlOQ/fnWEVCMyoeZOpt3NN+YPAjaE+cn16OxFn
	P9nhIwem+VFB15Z/IVeGt1/XKRQa670nTYw/t74TWMGV/JSxbfenH12SKksCj+IKdR5q
	sAWwavDVxArboKNDxv90qv0a/ifpKUxUjJLaiPZemfgjdD4da5OxfIS1noQBnoTSK0pC
	/qQQ==
X-Gm-Message-State: AIkVDXKZMU0JR81wbDzOiDhOHcbSeRDZiOm84saFs69CJCwoCfkBkjAvlRF0UsL8QkVkrA==
X-Received: by 10.55.210.131 with SMTP id f125mr1503514qkj.98.1482266298603;
	Tue, 20 Dec 2016 12:38:18 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	x127sm13871963qkd.37.2016.12.20.12.38.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 12:38:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2016 15:37:49 -0500
Message-Id: <1482266269-19166-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.19.1
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
X-List-Received-Date: Tue, 20 Dec 2016 20:38:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc                | 4 ++--
 .../python/{python-urllib3_1.19.bb => python-urllib3_1.19.1.bb}       | 0
 .../python/{python3-urllib3_1.19.bb => python3-urllib3_1.19.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.19.bb => python-urllib3_1.19.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.19.bb => python3-urllib3_1.19.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 70035af..ef0b3ae 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "4aa7c6c310cd938683e9b1831e110bac"
-SRC_URI[sha256sum] = "87f362d061184191d07ced0b947d8526f3e1884f21b0fe97fab313dedcb895be"
+SRC_URI[md5sum] = "7c4edfc86680c8467cfab204ed4ab2dc"
+SRC_URI[sha256sum] = "53bc34c8ee268c3bd83ecf5e9c80fa783f3148484579bd4e20f4a7c1bb2dd6a0"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.19.bb b/meta-python/recipes-devtools/python/python-urllib3_1.19.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.19.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.19.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.19.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.19.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.19.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.19.1.bb
-- 
2.7.4


