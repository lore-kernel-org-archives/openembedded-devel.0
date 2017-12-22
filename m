Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 639F87867B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 19:14:56 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id j137so18129808qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 11:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qSoL8YhTmxnD7/IvexWWVW9CoOMIE50ta/7aDmzBXOg=;
	b=Iak7h5BkFoy4NBpKd62HGlawIYv8oXXl1I6ffbdn/Mdygjixg3jiudY2ZQrnc31yX4
	+pLQmyFqC3/DxjD8xFhPWWFTyTGSp9ou9pcKYemvD2Vv9iNVQn5hoOvhAdCqU+FpDNE4
	y/MSeaOBt/C/AlmJKgXv2AtH9YVLuC7t8WVw8qel9lj0DxESP72/jzOOtbP+LHdErpQ0
	0t2Y4C+A4UkDvkmXoaMocIjIoMk3YcvEAFE6bn5SnlkCSInEiYvCClQWA4bMkB9RAulP
	AgI8B1WW867nAJR94A9z2rP25DowGhRe1tegRsTwAqU3OiZrxyqqwfjcZUJj7m4F8cEt
	XaVg==
X-Gm-Message-State: AKGB3mI0HniE8RGPdl6ALZhysTcYjtgj+Lz2fFbl51zCMzid302nHm4t
	043YvZsdi385Jc61YDGjX0Xhrpb4
X-Google-Smtp-Source: ACJfBouhkDI4GZnuVe6bZR4N7kiSxmbxnFZWVYahJRjX0/HAL/WJMXu/P+KX9deD75IWOU6xN79ybg==
X-Received: by 10.55.22.167 with SMTP id 39mr20848330qkw.297.1513970097190;
	Fri, 22 Dec 2017 11:14:57 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	102sm10000282qkx.85.2017.12.22.11.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 11:14:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 14:14:50 -0500
Message-Id: <1513970090-2130-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest-runner: update to version 3.0
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
X-List-Received-Date: Fri, 22 Dec 2017 19:14:56 -0000

Verified license terms remain the same and updated checksum for copyright data modification

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest-runner.inc        | 6 +++---
 .../{python-pytest-runner_2.12.1.bb => python-pytest-runner_3.0.bb} | 0
 ...python3-pytest-runner_2.12.1.bb => python3-pytest-runner_3.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-runner_2.12.1.bb => python-pytest-runner_3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_2.12.1.bb => python3-pytest-runner_3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
index c173a18..262448d 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
 
-SRC_URI[md5sum] = "a8dd57c80cde37a587dd8c37740c1ab1"
-SRC_URI[sha256sum] = "5c9093e7a18780409d9a389f20366f2fd39acfb1db61545fdb2e90cdbd0bcae4"
+SRC_URI[md5sum] = "8f8363a52bbabc4cedd5e239beb2ba11"
+SRC_URI[sha256sum] = "0f7c3a3cf5aead13f54baaa01ceb49e5ae92aba5d3ff1928e81e189c40bc6703"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_2.12.1.bb b/meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-runner_2.12.1.bb
rename to meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_2.12.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_3.0.bb
-- 
2.7.4


