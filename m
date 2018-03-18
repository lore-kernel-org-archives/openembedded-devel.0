Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6E10E788F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:23:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z184so15808540qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ThTGC/kLRRKpMIpXMxei2u4sIU4NbXe5xObflwNglyI=;
	b=ukqsYtIaGCNFkx3bJ1eHs81pcT2E3hCFzsaA3QQ2DXThMZVekTHD7B9fflSmQjA54K
	IGhhzBaaf2Ghm0vB1Y1gveQ3BYgqufq0kaLtW+lf6oQHTqNL/xNFbqtuvZgOWHcS5SFC
	6og0gNCpg7qh/AkGUFFVNFleB6fIz8BJgo5zXn/tbSYWI90T9Yu5zXo9gM3kSYMgqtJj
	8lHl1YsFkZPM38v6YumbfY2WhTn1/P5wNQcaPEOCBjn9flrKUWRSz2rQ09s9A3wfL5BL
	SRJiPSc9MyVFXgLWO+NNWeofM+1k269F5rVu+eUz/1vKBdqQPUQXKssXHopN4anoHKQT
	zBhA==
X-Gm-Message-State: AElRT7FQ5KWnMsKqo9pkPopwQxOLHCtkyzr8HnXVX0nu4ugEFJJNpjCQ
	qZS+iV6M1Pq9ThXDkisBPTRJGi26
X-Google-Smtp-Source: AG47ELtyVUdAanx3n0dbSW2wJxlpa35mELxD4JVJyZLFAyxLkBv69G7YkR/scRTpUizSarI1xAhXTg==
X-Received: by 10.55.140.197 with SMTP id o188mr13165470qkd.230.1521383021869; 
	Sun, 18 Mar 2018 07:23:41 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f126sm2342490qkb.56.2018.03.18.07.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:23:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:23:34 -0400
Message-Id: <1521383014-11228-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.6.2
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
X-List-Received-Date: Sun, 18 Mar 2018 14:23:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc                | 4 ++--
 .../python/{python-astroid_1.6.1.bb => python-astroid_1.6.2.bb}       | 0
 .../python/{python3-astroid_1.6.1.bb => python3-astroid_1.6.2.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_1.6.1.bb => python-astroid_1.6.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-astroid_1.6.1.bb => python3-astroid_1.6.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index a01acf9..593a09c 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "a40b1724b586f3cd29e213a5d2109c17"
-SRC_URI[sha256sum] = "f0a0e386dbca9f93ea9f3ea6f32b37a24720502b7baa9cb17c3976a680d43a06"
+SRC_URI[md5sum] = "8d62e34552299ee7334162f9beae17ac"
+SRC_URI[sha256sum] = "a92c1197dd496ef2470e73e1c296fc02a719907ee07259744e26a13bda9d4862"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.1.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-astroid_1.6.1.bb
rename to meta-python/recipes-devtools/python/python-astroid_1.6.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.6.1.bb b/meta-python/recipes-devtools/python/python3-astroid_1.6.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_1.6.2.bb
-- 
2.7.4


