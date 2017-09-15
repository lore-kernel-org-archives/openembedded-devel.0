Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87D3D78599
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:21:02 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d70so2006150qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kH5HKtu0PzvgzlrkWgf0t30r9fZtb0YrhUNRCB5FnYw=;
	b=MMk4sW8rDh1rwNw7skerSZ5q+HjC0X5ifdJp+/PKxu2WSwkGVrDoSz3sZIDSpkeLO9
	J8VSa+t8nBfqv9SOUxVzPTjm7l6ES/NIdS65PXPMNDNTB/9/UqihQdq300Ekp3QT7xin
	HVTiKGMQeC2x7kG2o4A3uuWPyI58gJ3GQBdhIFnofr56WMmvlqTpXKqxBFgQcLccDfP9
	vcxNf4nUd5Ktd4PCTMXK5JTYSAGHOErLsG/jzkToGPoOhmXn3w6NTHQA0Ra/DeOju4qO
	An1qA9/057iiKgs/xpPdmd9xSxP/D/46aNmMVmuRl8JwCTBfChegeI1zLWEdfE+xgnYe
	gDfQ==
X-Gm-Message-State: AHPjjUjQnwzewcWcPbYyikFeWYY6gqK03wLkcxL4JXwvgMnRXoN0DsUo
	TKQCrC1vyL/A7ptV7YQ=
X-Google-Smtp-Source: AOwi7QClFxuqcMtmJOdGwnxbiBEwgsPOxP7OrpXJ+ZYUUBM4q2Ub0RKaLFqeMvBWJ52HG4Eu7ibtHQ==
X-Received: by 10.55.131.129 with SMTP id f123mr9034180qkd.344.1505503263067; 
	Fri, 15 Sep 2017 12:21:03 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id f4sm1044593qtg.35.2017.09.15.12.21.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:21:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:20:54 -0400
Message-Id: <1505503254-15542-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.11.5
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
X-List-Received-Date: Fri, 15 Sep 2017 19:21:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc                 | 4 ++--
 .../python/{python-django_1.11.4.bb => python-django_1.11.5.bb}       | 0
 .../python/{python3-django_1.11.4.bb => python3-django_1.11.5.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.11.4.bb => python-django_1.11.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-django_1.11.4.bb => python3-django_1.11.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 370dc62..58fd70a 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "c851d892cd5ad3a90808703c4f36e3fe"
-SRC_URI[sha256sum] = "abe86e67dda9897a1536a727ed57dbefb5a42b41943be3b116fe3edab4c07bb2"
+SRC_URI[md5sum] = "8cef0d42aabacbc414ec4fbbb6056f3c"
+SRC_URI[sha256sum] = "1836878162dfdf865492bacfdff0321e4ee8f1e7d51d93192546000b54982b29"
 
 PYPI_PACKAGE = "Django"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.4.bb b/meta-python/recipes-devtools/python/python-django_1.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-django_1.11.4.bb
rename to meta-python/recipes-devtools/python/python-django_1.11.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.4.bb b/meta-python/recipes-devtools/python/python3-django_1.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django_1.11.4.bb
rename to meta-python/recipes-devtools/python/python3-django_1.11.5.bb
-- 
2.7.4


