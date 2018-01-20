Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4488C78740
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 15:04:46 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d54so10865830qtd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 07:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bv0wmGRqGHYAy5NnIJZCK/9xlp/JVn1pCMn5WpqPxzI=;
	b=bfy+zG8UTDLyEazRnjz0jEGD4961dq46EJ4qFuzJHG4RZGq56ONDiZRs4mefaMxF2R
	AOvGeLSVfLusLnN7CI6WVtfpn0f9YH8G9FKVQp+WfJLm8I6fjWjIycrVaw6K1AaxsmCw
	SlNJAJihqe65cCOdFurxbl9qTYeuA2c4uOoz+9h0ZW3ZGulMP2wAde+v81jLBihIIhDG
	McqgaIGWmmmjjGEa7HXkiLln96AhoNVMr4AGHQ0Yjlu8QPdyc8RhcCk7Ra9ubzWJ+lCL
	CmJ/SthhRmWdo0ecndHIjfBZR2nZ0y+o6hEhjFkWgqySHaNdmkotocBVFMzBJYDhOC8u
	JdXw==
X-Gm-Message-State: AKwxytc0WASfoHc8t3yfOK03s6s305SWo0Fzohjh4kXovhZTVMOOxqwl
	TfhQd9tjNr1VZE3ghpNod2Iov2+Y
X-Google-Smtp-Source: AH8x227cxT+KP3iDXL+X5SMjrF9r8KuyaNKAYEF9SsUlkVfByepgk6BYjJGzvzdXjSnZv8AHJDXdzQ==
X-Received: by 10.55.19.30 with SMTP id d30mr2368060qkh.288.1516460687773;
	Sat, 20 Jan 2018 07:04:47 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	p76sm7769918qke.43.2018.01.20.07.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Jan 2018 07:04:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 10:04:38 -0500
Message-Id: <1516460678-19695-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: update to version 2.5.3
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
X-List-Received-Date: Sat, 20 Jan 2018 15:04:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc                  | 4 ++--
 .../python/{python-babel_2.5.1.bb => python-babel_2.5.3.bb}           | 0
 .../python/{python3-babel_2.5.1.bb => python3-babel_2.5.3.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-babel_2.5.1.bb => python-babel_2.5.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-babel_2.5.1.bb => python3-babel_2.5.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index 6d8c05d..b1e8cc1 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
 
-SRC_URI[md5sum] = "60228b3ce93a203357158b909afe8ae1"
-SRC_URI[sha256sum] = "6007daf714d0cd5524bbe436e2d42b3c20e68da66289559341e48d2cd6d25811"
+SRC_URI[md5sum] = "152a6b17fe4110b95675aceb9af9fab2"
+SRC_URI[sha256sum] = "8ce4cb6fdd4393edd323227cba3a077bceb2a6ce5201c902c65e730046f41f14"
 
 PYPI_PACKAGE = "Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-babel_2.5.1.bb b/meta-python/recipes-devtools/python/python-babel_2.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-babel_2.5.1.bb
rename to meta-python/recipes-devtools/python/python-babel_2.5.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.5.1.bb b/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-babel_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
-- 
2.7.4


