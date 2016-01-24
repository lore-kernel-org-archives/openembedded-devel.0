Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 26A1376E2E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:01 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id b35so8313221qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HcluAA1dxwcBCjDbtUUMOJ35NXI0I+hsdZYSYQcJXJk=;
	b=Kn1YBu70X4QBXTZOm57Kd12ULTFm4shG4JnUaHINt9Kkp/SQKOG73UhYoXySJ+sPOQ
	lfgMFEdEWiLKn2OpkhfLh1vtJMqVhxNAeRC2i1quTSo31UwiOWu6bg98I+3u6ZBMaryh
	tUhklz/kl6A8BeyAcYmsbe07/e0FiYrTC6SHYF3slPPUeRFDK0A6urU8MrlJb8bcLLAJ
	5tNJpK7SO3FVVQB9550UdQm1gf1J0w05pE0cu5QTEm7MsbACbDXFPzlEiSHkCEkoW0iK
	yXzYla0b5dNNfrCh88/QAT3L4K/jundplOJKVGfMBdBlZvtEnlKKkFrDUHU5ORqc3V20
	xJ0Q==
X-Gm-Message-State: AG10YOQHSvyn6TVSPd5wqbCrUGdbUiD0sdj5HqKQNjPFwVpzOUh6soW0ZRIkuqgJpbQpSA==
X-Received: by 10.140.92.35 with SMTP id a32mr15095814qge.92.1453641482684;
	Sun, 24 Jan 2016 05:18:02 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:38 -0500
Message-Id: <897be8375c4d9ac673b1e4f6e2f0383a95c5f9a7.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 05/13] python-decorator: update to 4.0.6
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:04 -0000

---
 meta-python/recipes-devtools/python/python-decorator.inc            | 6 ++++--
 .../python/{python-decorator_4.0.2.bb => python-decorator_4.0.6.bb} | 0
 .../{python3-decorator_4.0.2.bb => python3-decorator_4.0.6.bb}      | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.2.bb => python-decorator_4.0.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.0.2.bb => python3-decorator_4.0.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index a599fd8..65598c1 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,7 +9,9 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
 
-SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
-SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
+PYPI_PACKAGE = "decorator" 
+
+SRC_URI[md5sum] = "b17bfa17c294d33022a89de0f61d38fe"
+SRC_URI[sha256sum] = "1c6254597777fd003da2e8fb503c3dbf3d9e8f8d55f054709c0e65be3467209c"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.0.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.0.6.bb
-- 
1.9.1


