Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0D736763F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:34 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id c62so90148811lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=56TB26JwlGxE28UfjIXm3ndV/TAo8w/xslRSKQJ5Qm4=;
	b=eQmyaSM6i0uD5gRYb0W9u+tWoy0mMZ1sS4GksEUMuS1PBzKbpEuaBopQOjlpSmcUCg
	8016K+wwlLoNOFjyD2CLQ14FuoUUpbtd3vDQ3sGYFqcnyTLlA8Y7LtG13i7BAI1vFysc
	p9rjcVVzQ/MwHTIwVRc9Ckv1i/J4dcaRiCLBXaAM4PeG1ObjWcG8KCZKHBy9NQrK4zQR
	AAeBDwUhvnoyoR9bxQTOjqHuVqsXHXTjZH1qwS65qZqRkI+tOsBP1lk7d5H9n/CNLpmD
	rlinvI4j+1HuTiCVlQBbftfe8d8+V9wSmnaiPwBcDzFJCnXPyB9nH9kl4oFD8ELsTyQm
	oKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=56TB26JwlGxE28UfjIXm3ndV/TAo8w/xslRSKQJ5Qm4=;
	b=akNRp7fiaXdRDFPW6hTY08+sxFWeyH1f2EKJYpY9VahP+LbSttYyM5g5G/90WL2nZW
	fvTm9F3I+mYoqBi7JmDWZqukNx2tvs+IWj9OcuV2aX7a58jF1OQXH5S0EnZKB2DvGtI7
	lHzPfnT263GaADtuUhloSo5BbgVtGTE1rZlK8+j9CkzSVhwiVxybC3kJ++FXmHURZfvT
	qCFsA7qYEI2wEEFUP4mUuBeU8b6C+X5PBtCshNvonqGZjG+WZwqHq01vt2cWFvODV8Xb
	Kspe1a5hh3gqUy+5KSKnqEuqzx8lUsWWJlqCQYLa1hxAfYgiQ+VJqPrggY1pnhD4VwLA
	Su7A==
X-Gm-Message-State: AD7BkJJjNnp44dJpyp1QaN9zAS1NnbtKGlO9x2O4rJe69txh3NFmKMLymjAic/XrxkVV8w==
X-Received: by 10.25.80.81 with SMTP id e78mr2923425lfb.133.1459546594984;
	Fri, 01 Apr 2016 14:36:34 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:33 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:24 +0200
Message-Id: <1459546590-9513-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 1/7] opencv: Fix use before set error on meta package
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:35 -0000

This bug was introducing a loop dependency of opencv->opencv that was
confusing dpkg.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index 99ca8b35727d..f6c4ca8fac16 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -86,8 +86,8 @@ python populate_packages_prepend () {
             metapkg_rdepends.append(pkg)
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
-    blacklist = [ metapkg ]
     metapkg =  pn
+    blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-- 
2.8.0.rc3


