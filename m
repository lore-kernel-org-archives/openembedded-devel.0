Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1315772E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:09:30 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id u25so4311125qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jcx60kmn5iBnK3AEEFr73JbS17vH6Fjr2uTTR7yhfhM=;
	b=GToVWC/FH/nmBXFYyarICLm8BcbhyWXztdge9nS4SEw2YRGR6BVM5aNffNCIbBxzZm
	cLCIHrEw9mxF1wE5e4yJxt1xTA7iKNiWPrJQbygVGSsERCqt2TpwNp3aXoHY4Mhv5lUr
	M7v4DM1FZyyHDVfoeC7OaYvXdWdqtmKYt6y4cB972Gu7USN126i83y9wRsV1mTCgMVrq
	vXNymlHQ/MdYyDKd0BgY4/lIsH5re6rQyl0p4tyTzYek0YKldVKnNNCB2E8lJ0ImLAa8
	oGEoO/5O5KwH8ekteSBlo2fV2cFuQOTJzy/zEhBMn1vPMt8dhmXJN7XlRPqgLoR8cu8+
	ASoQ==
X-Gm-Message-State: AMke39n13kqjShqYOLQHEAf4h/VpM8WtUtWnmpi8btrCYA9kJc0Zh3g1yiu6EqVumlRiTw==
X-Received: by 10.55.33.7 with SMTP id h7mr4328928qkh.250.1487282970553;
	Thu, 16 Feb 2017 14:09:30 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	m62sm5235928qkf.31.2017.02.16.14.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:09:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:09:21 -0500
Message-Id: <1487282961-7016-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysocks: update to version 1.6.6
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
X-List-Received-Date: Thu, 16 Feb 2017 22:09:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pysocks.inc                | 4 ++--
 .../python/{python-pysocks_1.6.5.bb => python-pysocks_1.6.6.bb}       | 0
 .../python/{python3-pysocks_1.6.5.bb => python3-pysocks_1.6.6.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysocks_1.6.5.bb => python-pysocks_1.6.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pysocks_1.6.5.bb => python3-pysocks_1.6.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
index edf98fe..5aec6fc 100644
--- a/meta-python/recipes-devtools/python/python-pysocks.inc
+++ b/meta-python/recipes-devtools/python/python-pysocks.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
-SRC_URI[md5sum] = "06524b15a3a96fe05212f12cfb87c57d"
-SRC_URI[sha256sum] = "7962f4d7c76e8414ae168c677a77f19cf8926143911f7e8d37a5d4c4eb910c6f"
+SRC_URI[md5sum] = "571f4c23982fa86bf0e7a441f1b6c881"
+SRC_URI[sha256sum] = "02419a225ff5dcfc3c9695ef8fc9b4d8cc99658e650c6d4718d4c8f451e63f41"
 
 PYPI_PACKAGE = "PySocks"
 
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.6.5.bb b/meta-python/recipes-devtools/python/python-pysocks_1.6.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pysocks_1.6.5.bb
rename to meta-python/recipes-devtools/python/python-pysocks_1.6.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.6.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pysocks_1.6.5.bb
rename to meta-python/recipes-devtools/python/python3-pysocks_1.6.6.bb
-- 
2.7.4


