Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E0E67780ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 21:04:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l39so27913029qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 14:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=knjIhO+109v6YnPOVH9YGBZjXKuffLzQT8zYaGROvhw=;
	b=q6betmWUhXJf8l4HyN/8VCbRSfe5HDTdJ/xdZXdff13aud7pkjQEtIaHjNiaQS6jdR
	lr5XImjb7kbyKjcWJQ36Cc0/M96Wlda82b+sT0BnIOIodg3aRO3tcWpuHLBb/cFQzu+h
	jHdPyC+/kmGLvLB7KU0f6FtMEqlYQIllP3CD7bQnhm1l6skx+KOnpDrGcQyT1P7Gtrxz
	0gEg8dk2d/WMTbkjsI6E3EcHw8cZHABoQqHaH7e/uegwNLH8wcY9Npp2rkKXCKevobEC
	PvBp6QtzbSsVa1fm4mcmQnzc1sZsmoTTRkw0Acl84gN+uRow4ahwIOcrlr3/SNArG4RX
	Jj0w==
X-Gm-Message-State: AODbwcCfTSn748XmjfnzGr4P9y1voBtKiWhoC/de4x9Xr/u84EdChXle
	0jIRjCvp2G5aMEgq1pU=
X-Received: by 10.200.51.27 with SMTP id t27mr36409348qta.10.1495659845660;
	Wed, 24 May 2017 14:04:05 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	x31sm3374022qtx.12.2017.05.24.14.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 May 2017 14:04:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 17:03:54 -0400
Message-Id: <1495659834-30224-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: update to version 2.4.0
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
X-List-Received-Date: Wed, 24 May 2017 21:04:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc                  | 4 ++--
 .../python/{python-babel_2.3.4.bb => python-babel_2.4.0.bb}           | 0
 .../python/{python3-babel_2.3.4.bb => python3-babel_2.4.0.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-babel_2.3.4.bb => python-babel_2.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-babel_2.3.4.bb => python3-babel_2.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index 866ce78..3789863 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
 
-SRC_URI[md5sum] = "afa20bc55b0e991833030129ad498f35"
-SRC_URI[sha256sum] = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"
+SRC_URI[md5sum] = "90e7a0add19b2036a9b415630a0d9388"
+SRC_URI[sha256sum] = "8c98f5e5f8f5f088571f2c6bd88d530e331cbbcb95a7311a0db69d3dca7ec563"
 
 PYPI_PACKAGE = "Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-babel_2.3.4.bb b/meta-python/recipes-devtools/python/python-babel_2.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-babel_2.3.4.bb
rename to meta-python/recipes-devtools/python/python-babel_2.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.3.4.bb b/meta-python/recipes-devtools/python/python3-babel_2.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-babel_2.3.4.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.4.0.bb
-- 
2.7.4


