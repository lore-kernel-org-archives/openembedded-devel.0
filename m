Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5290278044
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:22:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id c69so2334296qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2+YPbFtwdIiUvA354dh6C5BXrph94E1yZcuey26DQ54=;
	b=dI85q41aLGcoazIRCm+x7WdEo/wypOnZhXStVk+7nClqNISwmLueK12mDQWXjtRV8E
	RXXr7s9wgmkSuOhTW496Y00htjRkhrIudP5OH8ICjPNz4sm9MlugJVHSPW5s1L/QhmLl
	HyoPmOsXqfkXl64H3Mutnbp1KOUARFYfymj4OpCAp+fzNERARhj9aCuwjClLXGJ+TFC3
	CrfzDRT+CtuiLmOVZI56mumB1AcVqg6pQDT+FaGoLjXrUlq5e3iAkldFMTctZkK9sudl
	zaghKYvuggwHyRnn7AH3wOupm8LVatigSJnWIa9+CxP7o/P8OdOzxQoWbc2f9ijcE/AI
	4oIQ==
X-Gm-Message-State: AHPjjUgzEO1rPrmDChQMYcBRCQvq7HbH/aQT5yd8eBGsm9TkSxclqgCS
	d7ftmvA69HfZm6AsAhvyq+yEfVEp
X-Google-Smtp-Source: AOwi7QD0UNXtzBsglrzFUIISHqPoRmDY8z//AC4eQ1iHuTZlEhXqBj/GLiEjr9hM9unlq/h3HJbNfw==
X-Received: by 10.55.135.197 with SMTP id j188mr2099682qkd.277.1505830921852; 
	Tue, 19 Sep 2017 07:22:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id y15sm7115442qtc.4.2017.09.19.07.22.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:22:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:21:54 -0400
Message-Id: <1505830914-25232-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-grpcio-tools: update to version 1.6.0
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
X-List-Received-Date: Tue, 19 Sep 2017 14:22:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-grpcio-tools_1.4.0.bb => python-grpcio-tools_1.6.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio-tools_1.4.0.bb => python-grpcio-tools_1.6.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb
rename to meta-python/recipes-devtools/python/python-grpcio-tools_1.6.0.bb
index f9cfd99..2b82ca6 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.0.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "b0d585872c69f207a05c55566e8afb38"
-SRC_URI[sha256sum] = "bddc98f063755a5df9d285666db49c49201f93d416c45d4f4924cf752b68c99c"
+SRC_URI[md5sum] = "74a02d8218c2680a7ca10d6dec2123ef"
+SRC_URI[sha256sum] = "6efe56bc6565edf6bc52c97f29131a7a125261716576d9e824b43cabf354bf45"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


