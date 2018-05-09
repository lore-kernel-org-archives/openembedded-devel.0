Return-Path: <sipke.vriend@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDD974BB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 01:38:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id o76so24812683pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2018 18:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hGXKGSNXt2Sc6imgjjVlstVmQaZ90GaJq7kNgCMBrws=;
	b=Zy1NsYb9aNJG1dA6zkf/UuBiEBpV93Ddcd+ixaJb0OJRh0SFReIH0Zyd0XYSDeNZ90
	z185MEUcFwHyAmTMmHW70rkFYlLe7GUOt+TjHJWN/va+8IakBzOzBwzdyC6hm03uaUje
	gLlKdiOhjXyVLa6BXIWXc5480ZRqLrivis+xIrorwa9H2RBJultGOuE+kV62CeOpABfs
	xBylyx2ka5tY+xjdOnLvtCvXG/QBSgZbcFp5T3elNYeUAriaRlcoCU/gh3cV38+CT7ru
	9I+OzsOCtTeOAebvSmvOvRsmbqvaKoaJYS5z907amYfszX/Q7crL3bTzr2ibuYVkegBk
	FcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hGXKGSNXt2Sc6imgjjVlstVmQaZ90GaJq7kNgCMBrws=;
	b=dfPRdl1wUWU8pdWQ22pMb6+ZU0kNmPKRoRsyA9vISduIKdI6HY5ZFwd58B0PFSM0nW
	sdsMuF7YcbbcNFfFiUwvvzE4XtR5cZu9NRyxxDPS6sPoysrUwG2GS6IwMXHjVzIpIDqc
	no7ZNP538gGV0UHe7w0eZ5dakRAIgpQwehCrqadimmcF2rzHYhdlxeD5IkBstpCIxUDo
	gNPkHAYiLZj5VuVkIr8A9KOpENkAg8rytYciu7GeB4xgaXVQGuBiQfISnUYgUu7dA6Jz
	oDGLKIo7gVPbCGfkXMprRgNEVsgTEgcFq9lA1jistpuNEC4MMMXjIl3rcMkchQBPs0nU
	tEew==
X-Gm-Message-State: ALQs6tCS2MPO4UXkSTqsg63Hc7+W7YIFZ6hxb+xXHDuyoQvh/38osKnG
	JjVwYIb69uQaD+c+kU4r155zOA==
X-Google-Smtp-Source: AB8JxZpTw/3W1yM91OvySZSis5hDeMMdWDbN8uTKO+ObBoMrBmBcFJjrBwpxq/cXGVlqRCM3H55CaQ==
X-Received: by 2002:a63:79ce:: with SMTP id
	u197-v6mr35003822pgc.242.1525829907699; 
	Tue, 08 May 2018 18:38:27 -0700 (PDT)
Received: from sipke-dt.bne.opengear.com ([59.167.150.161])
	by smtp.gmail.com with ESMTPSA id
	r68sm63094984pfi.174.2018.05.08.18.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 May 2018 18:38:27 -0700 (PDT)
From: Sipke Vriend <sipke.vriend@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 11:37:47 +1000
Message-Id: <1525829867-22734-1-git-send-email-sipke.vriend@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-robotframework: Add runtime dependencies to robot framework
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
X-List-Received-Date: Wed, 09 May 2018 01:38:27 -0000

Add the runtime dependencies robot framework has so they are available on
images including it.

Signed-off-by: Sipke Vriend <sipke.vriend@gmail.com>
---
 meta-python/recipes-devtools/python/python-robotframework.inc | 11 +++++++++++
 .../recipes-devtools/python/python-robotframework_3.0.2.bb    |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc b/meta-python/recipes-devtools/python/python-robotframework.inc
index cc20d64..78bbbc6 100644
--- a/meta-python/recipes-devtools/python/python-robotframework.inc
+++ b/meta-python/recipes-devtools/python/python-robotframework.inc
@@ -13,3 +13,14 @@ inherit pypi
 
 SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
 SRC_URI[sha256sum] = "2018f233568227f9af8c366f93e243a157b742f3baf5b649ecc9750ac0ee1ff7"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-docutils \
+    ${PYTHON_PN}-ctypes \
+"
diff --git a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
index 16eaa78..ff7dedb 100644
--- a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-robotframework.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-zlib \
+"
-- 
2.7.4


