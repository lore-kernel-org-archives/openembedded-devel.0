Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id D8085610B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:45:28 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id l136so10372361oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RMEcmOkhT9Hxfl9P9SYE1bAXLb73ONgjXDmG+n0iywo=;
	b=uYORxFLK9F0nAsgFrUKXJBpmsR8Nv6lQXof6tSc635CXFmFcYLsb1UHhuQV63DrJvk
	URvG8DbGF33osy9KvrkOZZyDMhzRhtRFU77UdlyMiEC175bZG/Z/O57w2qoxq+B6QB6Q
	uXjqtyjbihqJP3i6QqhRjk8OoZFohVHsWNTYI3bjr2RZrWeb1YGRF1MR2Ua4sdodb0gJ
	FhjxxeUyAowsr4HCYECqi/DXbxV2Mw4l/FZwY2g+0vjN62lBWyrCH4z1CFBBBnrTfhC4
	KmXlKL1h3lgKioFNUZMpTKdt39c4UZUZ7f3bKmXU3Jx3Lwjr5SmZM+9UMFAS6uOFh5/U
	2vXA==
X-Gm-Message-State: APjAAAWPBE+vUu+IJnVjS1vV1hBVlNpnPleY0Nsobfmv8CRT0B8HkSRE
	t1q1AoQyylfQc3Vj3eoTcVtMsqMdVRo=
X-Google-Smtp-Source: APXvYqyd0wKHZ6W8dgbT2kIFkjlAD+qWz/a95iOLVA3DWobQVGzP2pnGJmLs68VbCTPREqt0oW1pnQ==
X-Received: by 2002:a05:6808:a8e:: with SMTP id
	q14mr2718985oij.173.1581705929474; 
	Fri, 14 Feb 2020 10:45:29 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id j5sm2240699otl.71.2020.02.14.10.45.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 10:45:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 13:45:18 -0500
Message-Id: <20200214184518.18006-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-bcrypt: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 18:45:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-bcrypt.inc | 17 -----------------
 .../python/python3-bcrypt_3.1.7.bb            | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-bcrypt.inc

diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc b/meta-python/recipes-devtools/python/python-bcrypt.inc
deleted file mode 100644
index a264003293..0000000000
--- a/meta-python/recipes-devtools/python/python-bcrypt.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Modern password hashing for your software and your servers."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
-
-DEPENDS += "${PYTHON_PN}-cffi-native"
-
-SRC_URI[md5sum] = "5d6f93b575ce52470af37a8e7dce76fe"
-SRC_URI[sha256sum] = "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-"
diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
index d2ec9e386c..0f2d31f537 100644
--- a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-bcrypt.inc
+DESCRIPTION = "Modern password hashing for your software and your servers."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
+
+DEPENDS += "${PYTHON_PN}-cffi-native"
+
+SRC_URI[md5sum] = "5d6f93b575ce52470af37a8e7dce76fe"
+SRC_URI[sha256sum] = "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-six \
+"
-- 
2.17.1


