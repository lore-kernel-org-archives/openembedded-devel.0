Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 05B0D788E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:29:17 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o184so15760958qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uwmazrWsZ80vsfMpcjxCPN1QBGjNrq2zdoCvnPTUmxk=;
	b=V/zBa9yYZi3UNCDjWInrMC7HaFufOMJCIA1kfipESJQqhbVwJL5MDnGQlXyqIoJXJS
	cUnojJ8CAXWAn4C5Z4Jvml691pM/bIUKlQ3Xv3C7m9B3vtwZ+jxn0ggW4UfAcltjWxf5
	hQY7HEvLgoVyZU3LfJqRbq7GvAtFoKFYGVJbZ1td20UqxbH1DRXyVdvGWGh/cxolBjOV
	N4gt2N1MUd2iqU10wtslmT2jYrgMQmXPZ9rG9XghDMsy3qW9EpOm3rwZdMMLc9TZjAgP
	CZhST5rnAsWoQkGl3WI56jS/D2cG03AUEWu224IF5gXBWztmW5yRSxpHDahdcUF6bZEC
	ziOA==
X-Gm-Message-State: AElRT7G8x6gbIXfApqUsOHyt0WiPQzjcnDDri2VgKV7vpuPtZ1GszKgi
	XAtjeW0XJBP+m6HOqKJG6EHHN1Zw
X-Google-Smtp-Source: AG47ELvdFdrizVwzUAlP93SEmHObZhvZddugKoNGlbAek7P42c1SFlIClzZtAbC9ywORoTO00IGvaQ==
X-Received: by 10.55.78.212 with SMTP id c203mr13163391qkb.351.1521383358630; 
	Sun, 18 Mar 2018 07:29:18 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z67sm8201546qke.19.2018.03.18.07.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:29:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:29:12 -0400
Message-Id: <1521383352-13178-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: update to version 2.7.0
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
X-List-Received-Date: Sun, 18 Mar 2018 14:29:18 -0000

License-Update: Contributions after Dec 1, 2017 are dual license Apache 2.0 and BSD 3-Clause
All contributions before are released under the BSD 3-Clause.  See LICENSE for more info.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc           | 8 ++++----
 .../python/{python-dateutil_2.6.1.bb => python-dateutil_2.7.0.bb} | 0
 .../{python3-dateutil_2.6.1.bb => python3-dateutil_2.7.0.bb}      | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.6.1.bb => python-dateutil_2.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.6.1.bb => python3-dateutil_2.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 0e076b4..36cb43d 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -1,11 +1,11 @@
 SUMMARY = "Extensions to the standard Python datetime module"
 DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
 HOMEPAGE = "https://dateutil.readthedocs.org"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=31f72d4cad3675fb091537b9b2f32de0"
+LICENSE = "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI[md5sum] = "db38f6b4511cefd76014745bb0cc45a4"
-SRC_URI[sha256sum] = "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"
+SRC_URI[md5sum] = "ba7d27d7788cc9dd04a07bd77203ffab"
+SRC_URI[sha256sum] = "8f95bb7e6edbb2456a51a1fb58c8dca942024b4f5844cae62c90aa88afe6e300"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.6.1.bb b/meta-python/recipes-devtools/python/python-dateutil_2.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.6.1.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.6.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.7.0.bb
-- 
2.7.4


