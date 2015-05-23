Return-Path: <akuster808@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 927E360962
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2015 15:35:16 +0000 (UTC)
Received: by yhom41 with SMTP id m41so11928180yho.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2015 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=wqgYmZmrSgsLUIqPktBX9fRkBWw3dxxcvDEwrA4UrG0=;
	b=VCuPx/ZUhmtrCrvDHtWA0fksK2agNguqvwbWkJNHgGqxNp57ogiQciuqFKv4iidEOF
	30uIvE3G+5J/YQibmISRdKD5cqj1VptLOkofRY54zCQQlCvrswm7iFJtZTE7cy2Kf/CF
	oSzcQ9iG3nqZT3f6tbuk3vbbn0APTdlsYefx8/UU1QPnCOvQgfYfcV/HwtmlurJfbP1i
	2kn7qEEUM8w9IXWGiYZKo5a9kI1Uv/MWe2Wg+IYgUnS/mGz20K+ekBzhiZOmYXzlZ4u9
	qcMT+DhC0heB9o57jj0th9SXN4IRZBxEYEMPKB1RQWVls9Zb7zJmfse3G5CYK9InTE1s
	5SgQ==
X-Received: by 10.236.46.48 with SMTP id q36mr13643402yhb.37.1432395317381;
	Sat, 23 May 2015 08:35:17 -0700 (PDT)
Received: from localhost.localdomain ([97.84.99.160])
	by mx.google.com with ESMTPSA id j67sm4288227yhj.30.2015.05.23.08.35.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 May 2015 08:35:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Sat, 23 May 2015 08:35:13 -0700
Message-Id: <1432395313-12070-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-xfce][PATCH][V2] xfce: add image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 May 2015 15:35:18 -0000

This allow an easier method of getting a XFCE image to demo and use.

V2: allow IMAGE_LINGUAS override

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/images/core-image-minimal-xfce.bb      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
new file mode 100644
index 0000000..63900f8
--- /dev/null
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A XFCE minimal demo image."
+
+IMAGE_INSTALL = "packagegroup-core-boot \
+    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
+    packagegroup-core-x11 \
+    packagegroup-xfce-base \
+"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+IMAGE_LINGUAS ?= " "
+
+LICENSE = "MIT"
+
+export IMAGE_BASENAME = "core-image-minimal-xfce"
+
+inherit core-image
-- 
2.3.5


