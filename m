Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C32D78907
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:13:10 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id g184so15756311qkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0zuvux2KsX2qFbXzMRSdDOv0jOFZl9Y+uU0mF65Y4xM=;
	b=LrdEX/JHOIGOvDdcrhhY1lZ3nAQ3I6l14TB+1G13WreIiH28nzSmBT80mGYyAgyamE
	itScO0SA5t8fU+K9d2DvzLUm5Pl2M3eJyZuK7EAk7/Vnv1/Ck2kr1aBvUcILZ2M52OOj
	gFCiVApaxlAzMxZkJWBclWE2ykLsp1RBbvZQ/WbENMcdxCVJH6FOYEagx6wiTq/QshTm
	8nIXbECpf2O0BkoP/Lcps4ozZD2Gh5JuiX6dKBd0v7+wpAxTBSjRghZKTUK2fKJh5XMN
	rmdkiA/OLl2Lk/PZupHtP1qZXGm16kdtjmmJml/NdnsfnVaZO8A5kqbozahF30hEZzzZ
	OYgg==
X-Gm-Message-State: AElRT7HMofR7cxmgFhvK+uU5xB/HGY6ABNYwSDIt9ZneJS8IdO2+J31x
	+TQO1VzE2zbKzwdj4n7J1IxkqpgL
X-Google-Smtp-Source: AG47ELsA133ohnHJDF5mDb9Tnsj1DgseHUpkpMLh1h3dOnp69kAbA/X3+Nysx2jgwbv6qFfwZmVh/g==
X-Received: by 10.55.121.4 with SMTP id u4mr13173697qkc.139.1521382391649;
	Sun, 18 Mar 2018 07:13:11 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id y2sm8212641qkj.32.2018.03.18.07.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:13:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:13:01 -0400
Message-Id: <1521382381-16370-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pylint: update to version 1.8.3
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
X-List-Received-Date: Sun, 18 Mar 2018 14:13:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pylint.inc                 | 4 ++--
 .../python/{python-pylint_1.8.2.bb => python-pylint_1.8.3.bb}         | 0
 .../python/{python3-pylint_1.8.2.bb => python3-pylint_1.8.3.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.8.2.bb => python-pylint_1.8.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pylint_1.8.2.bb => python3-pylint_1.8.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
index fd4739f..ba85b98 100644
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "f6c290e2ff171e83694e82096f13fd4f"
-SRC_URI[sha256sum] = "4fe3b99da7e789545327b75548cee6b511e4faa98afe268130fea1af4b5ec022"
+SRC_URI[md5sum] = "2eb5f3cb8fe567eaf5420dd415012202"
+SRC_URI[sha256sum] = "c77311859e0c2d7932095f30d2b1bfdc4b6fe111f534450ba727a52eae330ef2"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.8.2.bb b/meta-python/recipes-devtools/python/python-pylint_1.8.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pylint_1.8.2.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.8.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.8.2.bb b/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pylint_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
-- 
2.7.4


