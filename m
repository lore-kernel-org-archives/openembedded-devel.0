Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC807834A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:13:36 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i19so2227669qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NGFy1N0HCZaty7iXkesl6ZMbHqCdbl3NU5Nn+UF6zFw=;
	b=tTTswOLC8vzYSiVxN8pjmwPpoATR4JIJK3cnoc61h2Z3k/wWyuNwiJy8JmMAm4P/S1
	KuPzoK5TzVp43H2S3sQJq4NyBwkdMKrZZO0qMLErQ/SZgZzAdld04G/PmPenFvWoU32C
	YXWWLH9HnMNe2N6grFOIPWJfpl2SOM+/yPQJCN3tdDnjGJ1IUxsY3UEDGojbpll4BV0b
	2o1rhu7noAATzBEeeBGfIF0j6WeERoVYgxsEYb1lqAdWOp8UkT1E/bqmZBVkvHGuw3hQ
	tEjeUS4rH27C9gRdw41SdndRb2GvULuLxLO22BI2WCRvXpfX7Yi9vCRenZFeK8qmwLST
	Ea7g==
X-Gm-Message-State: AIVw111BDS+McjciLzwlXVJGbMNV/N9d2Ai4b8tL+ZVMDxzV0PRyvnHu
	fgRpoqmTguGyF7iElxE=
X-Received: by 10.200.38.136 with SMTP id 8mr21301316qto.301.1500920017823;
	Mon, 24 Jul 2017 11:13:37 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id c55sm9010594qta.8.2017.07.24.11.13.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:13:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:13:27 -0400
Message-Id: <1500920007-14740-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: update to version 2.6.1
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
X-List-Received-Date: Mon, 24 Jul 2017 18:13:37 -0000

Updated license checksum and verified terms remain unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc             | 6 +++---
 .../python/{python-dateutil_2.6.0.bb => python-dateutil_2.6.1.bb}   | 0
 .../python/{python3-dateutil_2.6.0.bb => python3-dateutil_2.6.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.6.0.bb => python-dateutil_2.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.6.0.bb => python3-dateutil_2.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index d0ebc70..ca51059 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -2,10 +2,10 @@ SUMMARY = "Extensions to the standard Python datetime module"
 DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
 HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31f72d4cad3675fb091537b9b2f32de0"
 
-SRC_URI[md5sum] = "6e38f91e8c94c15a79ce22768dfeca87"
-SRC_URI[sha256sum] = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"
+SRC_URI[md5sum] = "db38f6b4511cefd76014745bb0cc45a4"
+SRC_URI[sha256sum] = "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.6.0.bb b/meta-python/recipes-devtools/python/python-dateutil_2.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.6.0.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.6.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.6.1.bb
-- 
2.7.4


