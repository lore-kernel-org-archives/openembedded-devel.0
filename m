Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EEA5471AD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:15:38 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d9so27868744qtd.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VLXUqD3XovK+ljn5TPzNFqfN9/b23cN3y1DESKGVOH4=;
	b=s+mEa4aUwEwlur5h/nB6tGXEbwCa2CJ3hmP0V8vN1AWzYjWblsL/ZxQMV2VZIks2rY
	x1KYYNthLLk8c6zA057JolFt1tsxBOpN7T1p9gJdVjo9lruny9xZhvt4FOjcAb8devJf
	gLVN2WVVfK7tU15eoqR4uKZKskU3Lc0D17kC109C6O5HOwxXsfCO+AQxRCnDkuRUP35f
	zD2PiEbzf9Iir5c2ulvnEZeipPWTQfzv88eHhI46YX8Bd1BzTf8DJO7C4i+eGeOQYNWC
	xFtyAoC2y2LP/Vc8U6rj0pTP749To8dmqpVJoaITfUB9wJ/7oTBAwtSXWCUcJ0QM0MjP
	1nIg==
X-Gm-Message-State: AMCzsaXGhlFwwUkyvQ/mzvr8dF67dwCSlU17hva+9H1gZYkozW4id6dB
	MEPCzoAI/nV51hnMgvA740NCTQJO
X-Google-Smtp-Source: ABhQp+QYMaSrc5F21QIH2yvI8zLC/AB82v13PVngfv0MXy7qFucEBe45rYw7veDwPwPh8JYLJRKXAw==
X-Received: by 10.237.43.99 with SMTP id p90mr30182922qtd.171.1508937339739;
	Wed, 25 Oct 2017 06:15:39 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	q28sm1933451qkq.33.2017.10.25.06.15.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:15:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:15:32 -0400
Message-Id: <1508937332-507-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pep8: update to version 1.7.1
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
X-List-Received-Date: Wed, 25 Oct 2017 13:15:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pep8_1.7.0.bb => python-pep8_1.7.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pep8_1.7.0.bb => python-pep8_1.7.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python-pep8_1.7.0.bb b/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python-pep8_1.7.0.bb
rename to meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
index 262b862..b12d72d 100644
--- a/meta-python/recipes-devtools/python/python-pep8_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
 
-SRC_URI[md5sum] = "2b03109b0618afe3b04b3e63b334ac9d"
-SRC_URI[sha256sum] = "a113d5f5ad7a7abacef9df5ec3f2af23a20a28005921577b15dd584d099d5900"
+SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
+SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
 
 inherit pypi setuptools
 
-- 
2.7.4


