Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B40B17888E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 00:29:44 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d206so9686456qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 17:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y9v93yIhALVk0L2bvz24MJAR17wq/S2mgiTbMeKRoYU=;
	b=bFZmUeXcHeaZX4jI2ax9nMgv+7GlgPPr3RB33nnHnD9W8qptTDJBxV4bg/1mRaLCfY
	SMBNcTpvSbaRk1pnBr3X6t1rO8/syrnlM8VzZFMjI8AW/a0vQTh1ivIOOaMHCgbgYb3m
	AQMXcg8C9g9S1NNjT7Tje1vZUGrx/LiMaGHF3ZZdrAmMvhFeT5PDZ/LfGHN+vrAB/h3d
	DppSWw8Bo8V9NYwVaNsY4QDSWvFNGvE1Z8N5MfLmLdk3Hpi8RFUz9i6lISWNVyz+Uy4c
	hczm7FX2xG6Gk2CJLhBw8512E8skGeo/9FrV6HVGhrHukBzWoMtMgOSGEsLwtjQhIMQ3
	R+qQ==
X-Gm-Message-State: AElRT7E/kRS4hJPWpu5qxOMzo0v4LQHcYHQPoILeIM0azwcBnrfgb8As
	dnON3edEcqIuUKA+Em8xfClYq0iB
X-Google-Smtp-Source: AG47ELtF6ic70q88MMDPDAaC629E9kWzDheZiLeRnwdyfgzPD9eM7EdRYxiaHzDPRX5wwnYgftPCQA==
X-Received: by 10.55.59.131 with SMTP id i125mr9412094qka.169.1520814585470;
	Sun, 11 Mar 2018 17:29:45 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	i63sm4264356qke.86.2018.03.11.17.29.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 17:29:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 20:29:37 -0400
Message-Id: <1520814577-2196-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-protobuf: update to version 3.5.2
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
X-List-Received-Date: Mon, 12 Mar 2018 00:29:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-protobuf.inc               | 4 ++--
 .../python/{python-protobuf_3.5.1.bb => python-protobuf_3.5.2.bb}     | 0
 .../python/{python3-protobuf_3.5.1.bb => python3-protobuf_3.5.2.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.5.1.bb => python-protobuf_3.5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.5.1.bb => python3-protobuf_3.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 07346d3..b84983d 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi
 
-SRC_URI[md5sum] = "27b52592aab674f96a1762d66d48a57c"
-SRC_URI[sha256sum] = "95b78959572de7d7fafa3acb718ed71f482932ddddddbd29ba8319c10639d863"
+SRC_URI[md5sum] = "393a53483224cb338df5c643646c0300"
+SRC_URI[sha256sum] = "09879a295fd7234e523b62066223b128c5a8a88f682e3aff62fb115e4a0d8be0"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.5.1.bb b/meta-python/recipes-devtools/python/python-protobuf_3.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.5.1.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.5.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.5.2.bb
-- 
2.7.4


