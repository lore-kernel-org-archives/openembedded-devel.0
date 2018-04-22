Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id EE91871C54
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 15:25:17 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id v2so13632729qkh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZmXIchM2XBzJ2kQo0cVE12dveL2ebtlz9nvAIlLeSiE=;
	b=oj0Bsb6247ZbF2iwqRRu2Valw+hIq7FJBZPmnvjTXmYKQvaovaP68HRPQPR8CxCD43
	7dd7u2zqyonKxQdqmBsOToBj3yah+Je0QgIJ9OUKKUlhSlM3YZtgWtfw+LEiSJqKxryz
	k4nO+FdItzcJX0iQG80grW8mOGD1gcPBRRavcpfZVIqTYpdBSflLsXwDy3g2ZQiEGQVg
	fQb1dxCD3mmqosOdEBL4ad93k6r+q6WxsqAaM2fZyV8sgpOQzhU+wB/7TQ7fwI28oFO5
	oHwLIkoFTy0qixhx03RpJJXtiSWgVFRb4nSX5CXl0zbG/biWnbWUfxZQc/wp4BIXqkBx
	n4Yw==
X-Gm-Message-State: ALQs6tA5AtHO01waFhVQ6mTcRu7yGnT5BFzKc4URb0jKLgn7dgSXScCg
	CwPspqrwGoabzVGV5A7qHdzpI0hW
X-Google-Smtp-Source: AB8JxZpzm6xMTaNKbf8ZVmHxsYaKSbhRtG2tX2Fb9P2TNc+j7jBdc1IO+HinmGPr8CghTv0tV6tIiQ==
X-Received: by 10.55.215.84 with SMTP id m81mr18494442qki.278.1524410718091;
	Sun, 22 Apr 2018 08:25:18 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s16sm8884688qks.78.2018.04.22.08.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Apr 2018 08:25:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:25:11 -0400
Message-Id: <1524410711-4945-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.28.2
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
X-List-Received-Date: Sun, 22 Apr 2018 15:25:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.28.bb => python-cython_0.28.2.bb}         | 0
 .../python/{python3-cython_0.28.bb => python3-cython_0.28.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.28.bb => python-cython_0.28.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.28.bb => python3-cython_0.28.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 550d9a3..5d3b9d5 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "459a7980c508e61fc37b3245612969ac"
-SRC_URI[sha256sum] = "518f7e22da54109661e483a91a63045203caf9fd78da4a69185a7622f759965f"
+SRC_URI[md5sum] = "0e0568d6bed4b09ad01afe0a38805305"
+SRC_URI[sha256sum] = "634e2f10fc8d026c633cffacb45cd8f4582149fa68e1428124e762dbc566e68a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.28.bb b/meta-python/recipes-devtools/python/python-cython_0.28.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.28.bb
rename to meta-python/recipes-devtools/python/python-cython_0.28.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.28.bb b/meta-python/recipes-devtools/python/python3-cython_0.28.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.28.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.28.2.bb
-- 
2.7.4


