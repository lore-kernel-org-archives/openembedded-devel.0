Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0B777BB4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 06:55:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so11669570wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uzHZoX+Emolh70YKaezdgmBvADGLAw/FdoelOz9yVxI=;
	b=eVpoA3NmzU8/UTBxK0bT9HwZFiU5GBH8mD+5VbcrnQ4mWbekKDyiXItIQ1IOOSmJxy
	ScYfjiM+w0LOEBmZf9H2Jv+WW9TjFBSc0GWeMqHNO+t/JpNzzBhkYmXatLxyEdGH6/C1
	uqGgl878EgrJej5Tngz3+Dnt8ZYFFBPXHlSNmcOLkEvt+0VKx0Nsf7HIHBo5BJ5xxV2R
	GOKi7gXkQezsPk6DN04mC+e8B8UsLcLQJV2ca5rzrWoEbno3ulpkQleIJ7U3Rl4g57TG
	gvqhk49ALKgPE5ughlP7NcYIIVB0cpkr7quVkfZLR2+TJg2plF5Ar7maOLMz6MrALP2n
	k5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uzHZoX+Emolh70YKaezdgmBvADGLAw/FdoelOz9yVxI=;
	b=GZKKQpFwUiQ8NxxgFxToZLlZ2O92AvRQET3hjz1gryHyxP5O2tYbwf+SZPhIQbm+hT
	IZ7uhjon3A5pqXYqcVaiz49MWKlop6d2EEmhdk9HI9vFfSqxJUX8HIEqVprZxh1hy8l2
	K3s36Bd+bRgNIiUZeaBVQRoZSrRvGFNBczCD7IT5iH6fxDhoBPF2UTDe9XUSeHU9h3eZ
	9HSgyH7sr4os9S+aPJOWhsMTiQ9ajBv0SQpaMUHH4LywmfecWGDj7HHB1hjfieW/n/FA
	3QIQ0aETGC6bYvb2PtwYlLDtUwnMFIVXwEk5QMwkFA3nLZZFme7cEpSEU8GI+SB7PWrS
	gO6g==
X-Gm-Message-State: AN3rC/5q7QRXXBTF2t3ijl9iz8wjMVd31d4GIhhWr+z0dPTCT6eBupPt
	dPmcbLCB1Y+OPQ==
X-Received: by 10.28.128.68 with SMTP id b65mr5377631wmd.140.1492930519824;
	Sat, 22 Apr 2017 23:55:19 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154])
	by smtp.gmail.com with ESMTPSA id 81sm8059503wmj.9.2017.04.22.23.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Apr 2017 23:55:19 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 08:54:53 +0200
Message-Id: <1492930496-6082-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
References: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java][PATCH 2/5] openjdk-8-cross.inc: fix wrong sysroot path
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
X-List-Received-Date: Sun, 23 Apr 2017 06:55:19 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The '--with-sys-root' should be set to ${STAGING_DIR_HOST} but not
${STAGING_DIR}.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index b328395..11e98b5 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -42,7 +42,7 @@ SRC_URI_append = "\
 EXTRA_OECONF_append = "\
     --with-jobs=${@java_get_parallel_make(d)} \
     \
-    --with-sys-root=${STAGING_DIR} \
+    --with-sys-root=${STAGING_DIR_HOST} \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
     --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
     --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/jre/lib/security/cacerts \
-- 
2.7.4


