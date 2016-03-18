Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 745506FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:40:22 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p65so37840201wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=e0+x/mAASkPeX36Z+H1sHdbQP7CqzLs60cgSPdR4iPk=;
	b=JSrZ20ZSijHO/VaqWOrgFFfqBn5Wx308VRZ7okc9OXbraUNxrAw/8cBELh2K/BLmfY
	aa6UBg5ZFE9/IJYhXIBRgMGIlLjmXvq9PiPp2LASzZ4OBII08BRiJ2v2yErJkuaTxw+/
	O+k2DG4RKqSj6tOrIqBWkGtlj5XVOhkeIPcHanQTqrp+Z3PRU6MQ6Lnnf8MLalcP901B
	ngS6j0gAHAJSuCBj6N2r8xzsMEcLFGbuKq8epDx+lt62b1CVJ7OkbywWu8HcHUFZGLw8
	aE7LJaUiJTBp60jDnen2/xr3imRTYMoYivLT8DrgNUwxewJph4enP6QrAnsOKIMLoBST
	gHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e0+x/mAASkPeX36Z+H1sHdbQP7CqzLs60cgSPdR4iPk=;
	b=F4uMzeWT2yALAFgyUsYqES5pK8RyAZxTZcPW/lIw8ULy8pN4m1+JJlBVooHewBymFw
	oC48mBfbsrHFSAzOmV/WRaG5tI8QeSVXP7VBrFiycT2mHpLREb1oPMt8ByL2cZ38ISxg
	3UQJ1DVszKF0CN2tvsqd8tri0HNnJWxX/+RUpTyUQ0qokVQpShLlP5T9fiCS4KKVFldq
	yqQ2wp5YyZe3WuLvghBP3FbPgKYdENu/bomOhRbCUHyGHyswB4xZTJpfi9pxagWIE/no
	uQ602ydps6YDtbFm9C/lzBldncfToUblBY7zgfGf5uuqnM7zAQScgwl7VtM0sWGA44gw
	rWEA==
X-Gm-Message-State: AD7BkJJ6vGt4/u089zoivrG4dc/07p18+RUt9tZDXTQhE2LobSZtbxl1evLAmr9GBxmHcA==
X-Received: by 10.194.57.244 with SMTP id l20mr15938180wjq.45.1458308422735;
	Fri, 18 Mar 2016 06:40:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb9sm12319809wjb.26.2016.03.18.06.40.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 06:40:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 14:42:55 +0100
Message-Id: <1458308575-31778-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-python] python-cryptography: upgrade to 1.2.3
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
X-List-Received-Date: Fri, 18 Mar 2016 13:40:22 -0000

* needed to fix build with openssl 1.0.2g, see:
  https://github.com/pyca/cryptography/issues/2750

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{python-cryptography_1.1.bb => python-cryptography_1.2.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_1.1.bb => python-cryptography_1.2.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.2.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python-cryptography_1.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.2.3.bb
index ffc8fd9..b8357e2 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.2.3.bb
@@ -6,8 +6,8 @@ SRCNAME = "cryptography"
 
 SRC_URI = "file://run-ptest"
 
-SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
-SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
+SRC_URI[md5sum] = "5474d2b3e8c7555a60852e48d2743f85"
+SRC_URI[sha256sum] = "8eb11c77dd8e73f48df6b2f7a7e16173fe0fe8fdfe266232832e88477e08454e"
 
 inherit pypi setuptools
 
-- 
2.7.3


