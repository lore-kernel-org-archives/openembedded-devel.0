Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id BAB6460667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:09:51 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id n16so4983643ywd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ql3UMVnRiRNf0o11+FLYfyDKflQWYJMPdOIycew6Y6A=;
	b=BCQjc/kmuL2EIOMLormGscYkz+2lOd6fHzPvCwAnlPrERJYyqGVb0inoRxZ/ptoW49
	fftzBzOQvWA6IKPUQfpGJhDYQC2nasiNmiLj2aLQI0TmxBWYBn2EEJTRBmMccUEcaJy8
	zVenL6I4eElKAmyIuPW0sy4ltahho/Gi3rpN4jdU19qqNDEFrg4SJv7nkr3b6IJc2i7t
	Gc/cL9xam/bAq5J+ZNvWwPAiUge2ySPhQBWuyk3+5wwjadh7SYxXgzrd6CkhermfUU8+
	sG2WK6uCEIV6yIU/TEhYqTyqTW7P+6t1WqaShuKx6f95M7LOo3K7eYksWH9DFBU0w+1U
	zutA==
X-Gm-Message-State: AOPr4FU2aqOPbUogK7QZm8N/NFgLhhBYq1Eo/sRKc2m67mthdKrEpGciTPvgmnf6PoSBPg==
X-Received: by 10.37.68.137 with SMTP id r131mr4442638yba.22.1463836192404;
	Sat, 21 May 2016 06:09:52 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	i196sm13965471ywg.33.2016.05.21.06.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:09:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:09:44 -0400
Message-Id: <1463836184-8197-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-monotonic: update to version 1.1
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
X-List-Received-Date: Sat, 21 May 2016 13:09:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_1.0.bb => python-monotonic_1.1.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_1.0.bb => python-monotonic_1.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.0.bb b/meta-python/recipes-devtools/python/python-monotonic_1.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python-monotonic_1.0.bb
rename to meta-python/recipes-devtools/python/python-monotonic_1.1.bb
index 5d237b5..8c5f86c 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.0.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.1.bb
@@ -2,8 +2,9 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "a692bff2c5e07dde22ad2128d818d15c"
-SRC_URI[sha256sum] = "47d7d045b3f2a08bffe683d761ef7f9131a2598db1cec7532a06720656cf719d"
+SRC_URI[md5sum] = "8271b79de174dc3ef00535caef38be85"
+SRC_URI[sha256sum] = "255c31929e1a01acac4ca709f95bd6d319d6112db3ba170d1fe945a6befe6942"
+PYPI_PACKAGE_HASH = "3f3b7ee821b1314fbf35e6f5d50fce1b853764661a7f59e2da1cb58d33c3fdd9"
 
 inherit pypi setuptools
 
-- 
1.9.1


