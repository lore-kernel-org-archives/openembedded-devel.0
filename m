Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC6D788E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 13:40:48 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j4so11876823qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 05:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FApvYVa+rY+vZLdG9igqWXVYXI8sq7mEGtrYCdOt7lQ=;
	b=KuA+Uu9Me/56+gSf2nDF1nuMxjzKBQ1++bFWR9Z1aC9+oEr3At7x9liWYIZr35ay/b
	Ft9aC5BfO3VzB8phWx6gmDU3k9Oj9eqNpyeQdzjaPALruDkptDiEQRk1wnq0U0qx80+u
	TYDIxG+c+0kovCY0uk9T6Cpdl86FmvI9GfEq2r49dOt+7p/jrJrzlW8ZgMIxcxgp4H+t
	Pkco6Ta4Vpevv2h8NrHEvrAmUdbdYjEreE6Yq7/OTWw1bcls90vn7qU/7r7EsiZPDx0U
	F3MGY41KHtAdHSQkM68f0bNjLqSJyKvno9RaPt4hDsE5yVQoY8/zmijXWWDRUF//qURi
	P/zA==
X-Gm-Message-State: AElRT7HJvfzajQbYr2YZeiE91x5sloUtlrbNZ7Q4D8dbWbj8UajzLBeG
	vROlEz4Iv49ci6ldE9SaZOpqMc9i
X-Google-Smtp-Source: AG47ELufSMXVg4s+5pzj+8Pa4LofjsprD8/iZDQSke4AbO9+snP/NdFsp08PiUcxrw8qYoBxNMWmuA==
X-Received: by 10.55.203.156 with SMTP id u28mr8540973qkl.95.1519998049712;
	Fri, 02 Mar 2018 05:40:49 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	q81sm4507082qkl.23.2018.03.02.05.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 05:40:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 08:40:09 -0500
Message-Id: <1519998009-29295-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.6.1
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
X-List-Received-Date: Fri, 02 Mar 2018 13:40:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.6.0.bb => python-pymongo_3.6.1.bb}       | 0
 .../python/{python3-pymongo_3.6.0.bb => python3-pymongo_3.6.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.6.0.bb => python-pymongo_3.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.6.0.bb => python3-pymongo_3.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 2bb075a..baf3dd5 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "2f64fa7691c77535b72050704cc12afb"
-SRC_URI[sha256sum] = "c6de26d1e171cdc449745b82f1addbc873d105b8e7335097da991c0fc664a4a8"
+SRC_URI[md5sum] = "0d72c87fb93cea0759529befafefce54"
+SRC_URI[sha256sum] = "f7ebcb846962ee40374db2d9014a89bea9c983ae63c1877957c3a0a756974796"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.6.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.6.1.bb
-- 
2.7.4


