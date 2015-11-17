Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30876766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 04:23:32 +0000 (UTC)
Received: by igl9 with SMTP id 9so71855086igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 20:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=s8B6gXg8Vw2jW8JJia7v2G2/5wqF5OSPNIpHcoWkHv0=;
	b=weVQcekH8PtK/f9ZxI5TZutphMtLHlzh4mqOQZO1q+KmwIWKOKHvNEx3Q08yzfQsOW
	xvAsvQI8j+wglBjM0/2BLZKJ0bSEF5D/VJZvkzgl+QBIWBe9ZKyNG6EW+ZhBIFyFJIwn
	LYrQ9+aPmHYYSsSxhyjOOtrDUZmphjH08jQ9uKJ0IZJLI0P/zDhng3+FloZwQX9Tena/
	9Xs3kSbSG1Jae4QiU8JX1PP6X4iclgov2Gy3iCbr+n29zOp5dxRgt4GDjd2wa/mqBOD7
	y2ZhsRj7fZ3mAlVwElp88BCoJ7qFigUtTjT9zLoGY+N1KRgewP8StIYIfxbAEiTJs2kQ
	FjgA==
X-Received: by 10.50.171.194 with SMTP id aw2mr19905145igc.83.1447734212930;
	Mon, 16 Nov 2015 20:23:32 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	14sm13083515ior.25.2015.11.16.20.23.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 20:23:31 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Nov 2015 20:23:25 -0800
Message-Id: <1447734205-26801-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] tree: respect the package's own default CFLAGS
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
X-List-Received-Date: Tue, 17 Nov 2015 04:23:35 -0000

The tree Makefile defines default CFLAGS form Linux (-DLINUX, etc)
which are lost if we don't manually include them in the final CFLAGS.

Also break the dependency on EXTRA_OEMAKE containing '-e', disable the
unused configure task and, since package has a very short description,
set SUMMARY instead of DESCRIPTION.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/tree/tree_1.7.0.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes-support/tree/tree_1.7.0.bb
index 507b12a..2e8ebdb 100644
--- a/meta-oe/recipes-support/tree/tree_1.7.0.bb
+++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "a recursive directory listing command"
+SUMMARY = "A recursive directory listing command"
 HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
@@ -8,7 +8,14 @@ SRC_URI = "ftp://mama.indstate.edu/linux/${BPN}/${BP}.tgz"
 SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
 SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
 
+# tree's default CFLAGS for Linux
+CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
+
+EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_configure[noexec] = "1"
+
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${S}/${BPN} ${D}${bindir}/${BPN}
+    install -m 0755 ${S}/${BPN} ${D}${bindir}/
 }
-- 
1.9.1


