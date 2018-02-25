Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A82A7782FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:35:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f4so16570291qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H8XxiA77YQBC3poIvIlksG1+pq9jAazlBAieurk+UYg=;
	b=cwUr1XbG4K/Wa5ekiBNCt9a/BA3QGVfUtpcKlotw1c9/Dq6WgZGbntYUENbKFzIiR5
	8AucShQX2VtXtNYhYAc0UR1I/fyj4pn+snRk3RGI2wuZRB0WC1A9KJ6Dv0YF5KSPOZ0m
	VkMGZ6uWJteb9+pru7Yr7cXhNlOvEhzjJqwQjmU7WgE1jvdOF+vzOsmOu2Hp66R0rKxv
	23RLpliumlfVumeSNcUCfgys5ixIFgeExYvzedtPoIFpiRG149wGxlX1x5ZZIna2CHVs
	XHYpHaAYRuA4v2bocRsNJmqYFzcC9kRkuiZIbz7EHezh1sbSen1hojZ722lPzxR+y1qL
	6PRg==
X-Gm-Message-State: APf1xPD7KoC1FQNq0Lwkv9F6XcRL7FaQvSqD0f+o0XjqCHq6lEqvi3In
	wXWgxBGW6QmV2Fv5xJnR7KUCbPnW
X-Google-Smtp-Source: AG47ELvCUyonqn7EGdeLvYv8dGsTntvBAjyCxYh6HUYgM4uZ7Nu74bzdX28lT66kSsG5lrI3qWZ4KA==
X-Received: by 10.237.60.243 with SMTP id e48mr13364246qtf.243.1519590911374; 
	Sun, 25 Feb 2018 12:35:11 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	o59sm4156053qte.36.2018.02.25.12.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:35:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:35:02 -0500
Message-Id: <1519590902-18359-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-typing: update to version 3.6.4
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
X-List-Received-Date: Sun, 25 Feb 2018 20:35:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-typing.inc                 | 4 ++--
 .../python/{python-typing_3.6.2.bb => python-typing_3.6.4.bb}         | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-typing_3.6.2.bb => python-typing_3.6.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
index 46be47c..a0ee6b2 100644
--- a/meta-python/recipes-devtools/python/python-typing.inc
+++ b/meta-python/recipes-devtools/python/python-typing.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typing"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
-SRC_URI[md5sum] = "143af0bf3afd1887622771f2f1ffe8e1"
-SRC_URI[sha256sum] = "d514bd84b284dd3e844f0305ac07511f097e325171f6cc4a20878d11ad771849"
+SRC_URI[md5sum] = "5b2ade08d83be488f17b5fe587c27c74"
+SRC_URI[sha256sum] = "d400a9344254803a2368533e4533a4200d21eb7b6b729c173bc38201a74db3f2"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-typing_3.6.2.bb b/meta-python/recipes-devtools/python/python-typing_3.6.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-typing_3.6.2.bb
rename to meta-python/recipes-devtools/python/python-typing_3.6.4.bb
-- 
2.7.4


