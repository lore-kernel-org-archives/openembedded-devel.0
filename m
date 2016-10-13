Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42C9A71998
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:51:46 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id m5so3166136qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BRzVN07qpPq2c3n3ivOsTCwB5E6E42ZGIL85EyPHNlY=;
	b=Qhb88UkJbq7uVYdlzB3HXHEoGzoDh72eh0Ca1JH/WJe5OeP4P9ew1sDZMrYhLpeVjR
	ueyM20o2xeCSPBc6GeUaZEjwu9E0B78F49QNY7CCq1kshLxl9T9P7lUGF8Pzv/+Lz22h
	TabKp7jc0JksZOqgRHS06iEbscAAIdjzFbSttONjzoYw/779CtgCbQvz5J7zRtw//oly
	3PCmkA5PFiPLBS3HADzJVQ/ZH/yW3r5kq8mKZ/GJfkfeOx7JwlT38qVbY8vHNGwsA6eT
	BoxjMQohktmfKU9u9+e72WQyjLtpJu0cZRCjzm/XVI+vzVuB1D/RHtM+RBrfUZK5wF+N
	qWfQ==
X-Gm-Message-State: AA6/9RnGITO/XppuSjStLORwLidfghb4f2zvqYbaxrFfIUCF+E5IAkII5qjLK5Ksed0qJQ==
X-Received: by 10.200.46.77 with SMTP id s13mr9497347qta.29.1476399108058;
	Thu, 13 Oct 2016 15:51:48 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	d69sm5984481qke.45.2016.10.13.15.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:51:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:51:41 -0400
Message-Id: <1476399101-29346-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bcrypt: update to version 3.1.1
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
X-List-Received-Date: Thu, 13 Oct 2016 22:51:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-bcrypt_3.1.0.bb => python-bcrypt_3.1.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bcrypt_3.1.0.bb => python-bcrypt_3.1.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb
rename to meta-python/recipes-devtools/python/python-bcrypt_3.1.1.bb
index caeef60..aae037f 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-bcrypt_3.1.1.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 DEPENDS = "python-cffi-native"
 
-SRC_URI[md5sum] = "49d79e646dbf27a05b81e4f0c4f717c7"
-SRC_URI[sha256sum] = "e54820d8b9eff357d1003f5b8d4b949a632b76b89610d8a933783fd476033ebe"
+SRC_URI[md5sum] = "7348b2c361e23cf205701bba7652d789"
+SRC_URI[sha256sum] = "0309a4a72bd1dc314279cf1ee14e277227732f14c9b63ab96715654e13fe9321"
 
 inherit pypi setuptools
 
-- 
2.7.4


