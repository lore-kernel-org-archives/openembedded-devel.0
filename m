Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 293B0772BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:14:56 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id e1so4367855qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=997wiBajH4n5hsYHr+zj6e0IskvRWZctA/+HI9O+D4M=;
	b=PJzXMTo+izg+13OVLYN7SiC3+PXJQxutiqYNLYFISdvJ1G1J5VzRw42OqGeT+cACVq
	kJfu6Fip+4bN+7d79NYQze4k62Ql7Gx9A/2RkAHQCulH0tMKPcm3dJHsNCbMRLui+B9f
	QH5lVqzgRPCPOiZKa+JSJrSzjKpKFuqT+41kpD7TeNlOvrRPBw1Z5GMlnbJx3apv302N
	H7qGaGczZUE7M1sZCcfRU9kldYsRtsnukrX9AUgVI+w67b2euNDTvXyZ5lcrv1BF9e3n
	kpF37tHcuk2VXsdVHhL0adMrje+Ps+VM/2w64dfZSq52maDJ5C2iGdY7CPUwS3OG+upp
	c7dg==
X-Gm-Message-State: AMke39mO3lLPdBst5JWi23yi+IFEDWuYgF2kL4WzK8zgKz1IbEF8MxtzljYceJlbFxyiZA==
X-Received: by 10.55.23.135 with SMTP id 7mr4871353qkx.125.1487283297037;
	Thu, 16 Feb 2017 14:14:57 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	a54sm5249460qta.48.2017.02.16.14.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:14:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:14:50 -0500
Message-Id: <1487283290-9919-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-certifi: update to version 2017.1.23
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
X-List-Received-Date: Thu, 16 Feb 2017 22:14:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc               | 5 ++---
 .../{python-certifi_2016.9.26.bb => python-certifi_2017.1.23.bb}     | 0
 .../{python3-certifi_2016.9.26.bb => python3-certifi_2017.1.23.bb}   | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2016.9.26.bb => python-certifi_2017.1.23.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2016.9.26.bb => python3-certifi_2017.1.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 894154d..1df23cf 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,8 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "baa81e951a29958563689d868ef1064d"
-SRC_URI[sha256sum] = "8275aef1bbeaf05c53715bfc5d8569bd1e04ca1e8e69608cc52bcaac2604eb19"
+SRC_URI[md5sum] = "b72521a8badff5e89a8eabea586d79ab"
+SRC_URI[sha256sum] = "81877fb7ac126e9215dfb15bfef7115fdc30e798e0013065158eed0707fd99ce"
 
 BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-python/recipes-devtools/python/python-certifi_2016.9.26.bb b/meta-python/recipes-devtools/python/python-certifi_2017.1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2016.9.26.bb
rename to meta-python/recipes-devtools/python/python-certifi_2017.1.23.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2016.9.26.bb b/meta-python/recipes-devtools/python/python3-certifi_2017.1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2016.9.26.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2017.1.23.bb
-- 
2.7.4


