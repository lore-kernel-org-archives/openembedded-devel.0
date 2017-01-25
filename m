Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2140671E08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:23:39 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id 11so75210024qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 07:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GqnvQAPPNy6dpjeiGZr4FHjwWcDxsP2y2q4NfRr9v4c=;
	b=PsyFaTlUadPFpDM7QOvihv2kjrQKyVVvBhsN/O6hLtmdo1JIoD9IKnlRK2dqTuvavg
	yDGzgBGgp/TqzaUqSTrkCxH4K9kkBf2K8miCoMRU4kpVYEqH0TjwB37drwlCDKu/Gs0X
	01OuHlKh4Z6Wj7z/04p+H6UvAAwcX7iuWMXOZJ0M0mf+AmE0kavz4225ea5p8DFBq/WE
	Ta5LZH1QnccNkgzwHOz+/NgLI4Dfw+AzPjfCFdjvdDqxNFdnggCN+1bCUjXEifgAY++Z
	nQUP9VGo6j2a5owNkJ2dnfSkOaA0sUUDsrjlefKVJNm/8S4fvFzWbxW8rDTq6oEPI7wZ
	kjGw==
X-Gm-Message-State: AIkVDXL1oD5h+rIYBsPGuQhvIxXy1P/otZcixAnRztepDMAtubqzlz73a9kfUQPbE55bQQ==
X-Received: by 10.55.15.91 with SMTP id z88mr4375225qkg.264.1485357820099;
	Wed, 25 Jan 2017 07:23:40 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	y189sm517294qky.39.2017.01.25.07.23.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 07:23:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 10:22:56 -0500
Message-Id: <1485357777-6007-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485357777-6007-1-git-send-email-derek@asterius.io>
References: <1485357777-6007-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python-serpent: add new recipe for version 1.16
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
X-List-Received-Date: Wed, 25 Jan 2017 15:23:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent_1.16.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-serpent_1.16.bb

diff --git a/meta-python/recipes-devtools/python/python-serpent_1.16.bb b/meta-python/recipes-devtools/python/python-serpent_1.16.bb
new file mode 100644
index 0000000..2f31e3a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-serpent_1.16.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Serialization based on ast.literal_eval"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=506280bc092b1a0be25c79fb0ed4aaa6"
+
+SRC_URI[md5sum] = "9d0cfe1f57f468100d3ae94c4de47950"
+SRC_URI[sha256sum] = "c26e98c2155228a69eb0dc14ba7b888cb70099b6c4ca47fd9d1f099f7d561c3e"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    "    
-- 
2.7.4


