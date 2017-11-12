Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3089978594
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 18:02:37 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b85so1847308qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 10:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=99ecQiYYqd7GZt8kULlYcCpx5PFCyRNYKqkeZOJFgg4=;
	b=FvxRdljuBrQLEH0YUZbB7KSwnWUG1e3cGkJ/s7dULtoXjWntzJl7V5QL3DMiSHNOGw
	mDqZPm0DLkicc8pRTh+IubBlefMzbdX4kElPOH2O5GEprduMniW95p8D1B19bn8muwCM
	agr4ww1qN0qB/m8qNGjcmMrt41Q2NyrkKOZl0gditCP70k5Td3P4ei+OEl6ms7w4v264
	kh6zU76yceXMmRNfSQTD7Y/eg0Dx4aGk7qFWY2MLVS3sq9zufjyf9jQbaJnW7AAIkvY/
	FiRqtLhg3zXR7oHFx6l4NF5HvQrP7xYK6S2oBNLTH7q/rRcKUsfT4AvMzQrj5QAWlYwX
	4CWw==
X-Gm-Message-State: AJaThX5MrwBFnT2yMH0+TzEKOcUBe3wN7GQ90tQaSNWsAdrJyQTqwl/O
	fou32bHrnV8Y0vgfTn4kvkVMogfm
X-Google-Smtp-Source: AGs4zMYradXOfQrJcYRWO3jO9Nfyd5+HIXNTeJEqmGxN+rSjnGNONHIh1XdBE2ucMWuAMWH4jswzkw==
X-Received: by 10.55.111.193 with SMTP id k184mr10952151qkc.244.1510509758926; 
	Sun, 12 Nov 2017 10:02:38 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 6sm9770019qtz.68.2017.11.12.10.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 10:02:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 13:02:31 -0500
Message-Id: <1510509752-23427-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography: update to version 2.1.3
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
X-List-Received-Date: Sun, 12 Nov 2017 18:02:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_2.1.2.bb => python-cryptography_2.1.3.bb}    | 0
 .../{python3-cryptography_2.1.2.bb => python3-cryptography_2.1.3.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.1.2.bb => python-cryptography_2.1.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.1.2.bb => python3-cryptography_2.1.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 371ba73..c21c59d 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "f0565d3e85cea64f0f01382e525a33dd"
-SRC_URI[sha256sum] = "d7f348e4f5df146a0e75998544bab6d42313cf19a81a6e49990ab7b27cc9c73b"
+SRC_URI[md5sum] = "65c0963048a88fcf725cfa265ed2fd5c"
+SRC_URI[sha256sum] = "68a26c353627163d74ee769d4749f2ee243866e9dac43c93bb33ebd8fbed1199"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.2.bb b/meta-python/recipes-devtools/python/python-cryptography_2.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.1.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.1.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.1.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.1.3.bb
-- 
2.7.4


