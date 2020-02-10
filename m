Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7E060273
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:17:41 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id h9so4650728otj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sd6aWSAQTxg+SKJjynXdDW7POpYY7Jztn8cdnCz/heA=;
	b=b744irjKDyhtj0QlMuVEtVaosXS8Dzr+TdTmHsVTJvPPUJhgA+oV7s5/VbOiPDnL7s
	BSbC0rOPc/dWw5vHIlgWxUjP1rGrYMyL175YcMPkNnJqBsp4LyTyS8IIu2MVeXjLLhlQ
	Rh/cX9Cfpx5p2MsNxKt2n9FcNOU/ZQNYPFQ+w3TEM80YQwTtuwzExFoFDvIafYntBJw0
	z3AY8rHEct9BVhRIYNuiAFyAakITJ/4MSNS3smzlyqUiwizbEpMd/g3YW+nUjtV3aaeu
	Si9UlZM673QYzJK6oLM6v5wyimofaGMf4X3BriE2moYs66VkNHZcCnhT39pq3l+RMp+U
	94ag==
X-Gm-Message-State: APjAAAWTwLtj8y+dbbTIJH7VA7YsnjPujfqPJLJCvcbu40xeig/rwDFi
	bH5VXX6v0wef6ly9KUKhqgJ+z3JCrrU=
X-Google-Smtp-Source: APXvYqxNBKXGJvAgucPazTfNv6hdf811jKQ7uXz5siypjNR9Po16Jdsq/TEKIKVG65KRp1EuN8jq1Q==
X-Received: by 2002:a9d:4c92:: with SMTP id m18mr8101087otf.168.1581293862230; 
	Sun, 09 Feb 2020 16:17:42 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	n19sm3435043oig.57.2020.02.09.16.17.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:17:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:17:29 -0500
Message-Id: <20200210001729.6192-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-appdirs: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:17:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-appdirs.inc |  8 --------
 .../recipes-devtools/python/python3-appdirs_1.4.3.bb   | 10 ++++++++--
 2 files changed, 8 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-appdirs.inc

diff --git a/meta-python/recipes-devtools/python/python-appdirs.inc b/meta-python/recipes-devtools/python/python-appdirs.inc
deleted file mode 100644
index c4826723e8..0000000000
--- a/meta-python/recipes-devtools/python/python-appdirs.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a user data dir."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
-
-SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
-SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
index d24e1d8b6a..6c01580724 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
@@ -1,2 +1,8 @@
-inherit setuptools3
-require python-appdirs.inc
+SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a user data dir."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
+
+SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
+SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
+
+inherit pypi setuptools3
-- 
2.17.1


