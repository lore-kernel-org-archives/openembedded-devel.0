Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61BCD784F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 18:59:55 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o21so12352423qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 11:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rjiItO2233yii4bNVjgJT3DvYlFMfJgopR+1c7wec/8=;
	b=tHBaQhgqlK+tBDx9mSP7bMb1EbrDURNAuEjnWZBagxGO+0/HmWotKCG5tKQvg9Bc8y
	IUYqqtVUZgTgWk6/CZrbZ42NSNsW2vy6brY9i7+LQ3LLIKC6iCNnaSwr7xuFFCRbizZo
	ClA26mBJdkm0nCFYY20nDpyndhCEJsZv36hKs0WNED1lXg3cl7GEr3toMUjGWfYZ1WzK
	9xqpiU/vLLcfMjWFIpkdm6oyZb3F2DGB4v5R3oSWuU09HnOmBLIO+/vSRWc4HFnpMK/W
	HW+9GqTTeGvylwibIfvAZuWVdO1FmUZaInz0yd64coBZTJ/cFt/oG7Uu0e5fkXFgNZ+0
	Df1A==
X-Gm-Message-State: AKS2vOys0zOXE6x/FBZ4rne+ZHUu07CE+dvJNaRz6H7XyTfXT67Xk4vS
	+r2dvE9Cvbxhumjjaek=
X-Received: by 10.200.55.233 with SMTP id e38mr14312823qtc.198.1497639596709; 
	Fri, 16 Jun 2017 11:59:56 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	j65sm1956484qkf.38.2017.06.16.11.59.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 11:59:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 14:59:51 -0400
Message-Id: <1497639591-30034-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497639591-30034-1-git-send-email-derek@asterius.io>
References: <1497639591-30034-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography: update to version 1.9
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
X-List-Received-Date: Fri, 16 Jun 2017 18:59:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_1.8.1.bb => python-cryptography_1.9.bb}      | 0
 .../{python3-cryptography_1.8.1.bb => python3-cryptography_1.9.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_1.8.1.bb => python-cryptography_1.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_1.8.1.bb => python3-cryptography_1.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 5339e6a..9a74e8e 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -9,8 +9,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "9f28a9c141995cd2300d0976b4fac3fb"
-SRC_URI[sha256sum] = "323524312bb467565ebca7e50c8ae5e9674e544951d28a2904a50012a8828190"
+SRC_URI[md5sum] = "1529f12fb403c9a0045277cb73df766c"
+SRC_URI[sha256sum] = "5518337022718029e367d982642f3e3523541e098ad671672a90b82474c84882"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_1.8.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_1.8.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_1.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_1.9.bb
-- 
2.7.4


