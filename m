Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1TN7sI-0003EP-QP
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Oct 2012 21:59:55 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so3301010pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Oct 2012 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Y8VDxHa8RMk+wF3qeiqAzMWyccb2ZN+5hNt5Xopg6EQ=;
	b=Yveca9QaRkTkQXfR3g8AAYK6BbzHCjvgAsTQpCAGOXR7Uy4rvaVnUeOXwOwCbC2uz7
	g1VqImJk7fp4fkE7W68yp5IOPUCAQNKtH5fLcvu3NacdOpO7K8WR0t/fAMgMsC5VFlGH
	BRqZc0AUBGKr0RseYplQUkgHvnrmFILyfmlpLVZ1gyIItAgTkhD0ADjzJY6372gu6Gil
	lKHkoCScKPSIye5RVL/QwiGC93VDRIXNJSf/sY6tWTlFVEWbZzrXvkkreOdTrw+Elojn
	D6dQLA4sRkGYyk6jT+YH0rtgkDEpR+fxk3GvNhwVqf+PQwlKY4W27fLcyPKhJzQZI0xx
	Y1yw==
Received: by 10.68.216.131 with SMTP id oq3mr23745913pbc.147.1350157600694;
	Sat, 13 Oct 2012 12:46:40 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.220])
	by mx.google.com with ESMTPS id pw2sm6416726pbb.59.2012.10.13.12.46.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Oct 2012 12:46:39 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Oct 2012 23:46:29 +0400
Message-Id: <1350157590-14336-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-zynq-balister 1/2] zc702-proto-image: Replace apps-console-core image feature with splash.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Oct 2012 19:59:55 -0000

This commit fixes a warning related to apps-console-core, since it has been
removed, and replaces it with the splash image feature.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-core/images/zc702-proto-image.bb |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes-core/images/zc702-proto-image.bb b/recipes-core/images/zc702-proto-image.bb
index a6e4b11..02a6af2 100644
--- a/recipes-core/images/zc702-proto-image.bb
+++ b/recipes-core/images/zc702-proto-image.bb
@@ -1,14 +1,12 @@
-DESCRIPTION = "A foundational basic image without support for X that can be \
-reasonably used for customization."
+DESCRIPTION = "A console-only image with more full-featured Linux system \
+functionality installed."
 
-IMAGE_FEATURES += "apps-console-core ssh-server-openssh tools-sdk \
+IMAGE_FEATURES += "splash ssh-server-openssh tools-sdk \
                    tools-debug debug-tweaks"
 
 IMAGE_INSTALL = "\
-    task-core-boot \
-    task-core-basic \
+    packagegroup-core-boot \
+    packagegroup-core-basic \
     "
 
-#    ${CORE_IMAGE_BASE_INSTALL} 
-
 inherit core-image
-- 
1.7.9.5



