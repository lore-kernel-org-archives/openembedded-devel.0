Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id A53F365CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:03:53 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id j92so2103836qgj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tnXO/WGKYZkiaBHL+KDHHzFqUlW0zarGKJHGf15KKdU=;
	b=l4aZrK+CZB0Cfqtoc/C1RdQ3a4QXjnG2wYMrR4tz7W8JIWfYgogsg+2aE03pI3T/bX
	GEE13GjXn5NOWF9rLS7deE/a+x+OzVf8kwDGz2N+i1FNvPy6iCgOtY/7QZozIJwiUPPa
	Gq/Xjf5j35vpNefUGXV4BvKwR4a1w8wiDAr3HtpE/dg8GrHFCgG0ip02oxXY9tqV8OA1
	fqT8AG2Y+Thc4zachMvfgKphH5l3NExRze5Q8aostukUuxjW9cIarMn82vSbWgtIC9dk
	s3O0gGqWrJKN79083QnuaJBrlneEKTc28XIQ9n517lWpFj9xLn8UOjGhZRI4bM8SHaoj
	kXSQ==
X-Gm-Message-State: AD7BkJLQa7hy3Htq4i8dgREBX17d5Epnm6+umdfTruMRQkgJPi9ncM90dMx1SbtlErJMwg==
X-Received: by 10.140.18.114 with SMTP id 105mr6048651qge.41.1458763434493;
	Wed, 23 Mar 2016 13:03:54 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	b103sm1771859qge.2.2016.03.23.13.03.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:03:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:03:42 -0400
Message-Id: <1458763422-30827-5-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763422-30827-1-git-send-email-derek@asterius.io>
References: <1458763422-30827-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 5/5] python-pyhamcrest: add initial recipe for version 1.9.0
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
X-List-Received-Date: Wed, 23 Mar 2016 20:03:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
new file mode 100644
index 0000000..02d4f54
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Hamcrest framework for matcher objects"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
+
+PYPI_PACKAGE = "PyHamcrest"
+
+SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
+SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
+
+inherit pypi setuptools
-- 
1.9.1


