Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58FCC746C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 15:55:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g8so5198420wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6mnSrN5+KY5PV5spGOMqxNc4KfHsIv1MBLA7oDN2/3c=;
	b=ApFXBicfE5ON8BkZkTDih33y+u4jwNDgbsErCOc0zU/hKL3xw/l/5rNyVEalBU4ore
	3/ntg0uS32D3JirRW0dVYyHYUFRiOhYz7KKY8vEY7B/bsmC/DuGoa2PcBSdSzJ9MJMgg
	duHMmbhnPXVck0/twTP7gK50uqmB3VQbqOOerH3/rkHG8cZcrugngRJBC1BUGYDTBs3N
	76QhOVuJMBqCg56LQ6nNoUonX/Y92fAlnb69ykNo1mR3jUT8RyErn1DucCJZM9prXG4X
	H3LpYbLrDnw2dzCuhgK+Ptz8tAuGjaOAsMH2DVvIqvfC4wwb6w5PIHtFHuAsbRDWDkpf
	lfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6mnSrN5+KY5PV5spGOMqxNc4KfHsIv1MBLA7oDN2/3c=;
	b=jBVFFUhIwYRVls038z6O0ov9mfH+sdHkvWLszqoYLB8hwSHTARNt17wntB9tXOhsJi
	dvYwaR4HfsMqdQd80r8jGi6GYYxSDZlELpBAVP6QAr1BCnZlDmfY6q059FwoGEevUQps
	7z2qdVL/4EI4qv8FtvRVuwpH1Td4XeOoNxw7tltO8cOCduIYFBjReu8FY1eAtKyiY0Xx
	OjX1iXl+IKDsjboFZ97MxL9S7oxtS/dsXbgSX4DolFqdUJxuYQthVsNqkg6dKj9MXVxC
	l14MoMRJWDdJBvfI7MQ0e6wPl6LmTCA+upIkd+LxRGmo8cjq+ErJJEoF8BRVGSBpmEi+
	gSVg==
X-Gm-Message-State: ALQs6tAgA5/iTS66HGul0AN5kxgbbtn4jvVkOG4Nd599gWlIxW7lVH00
	cHOQaUp3FFdAlTbABQXDzeHuFNdV
X-Google-Smtp-Source: AIpwx49EKPnGfjAkwT7srQxohNj4QlaOGgkWH5KlkJHcW8rRpybSXg8CTvKtR6PYNk3TlhIWAPhH4A==
X-Received: by 10.80.224.200 with SMTP id j8mr8225700edl.198.1523462118563;
	Wed, 11 Apr 2018 08:55:18 -0700 (PDT)
Received: from ip-172-31-7-228.eu-west-1.compute.internal
	(ec2-34-240-242-134.eu-west-1.compute.amazonaws.com.
	[34.240.242.134])
	by smtp.gmail.com with ESMTPSA id q6sm904459edh.48.2018.04.11.08.55.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Apr 2018 08:55:17 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 15:54:27 +0000
Message-Id: <1523462067-7259-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][PATCH] sip: update recipe to 4.19.8
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
X-List-Received-Date: Wed, 11 Apr 2018 15:55:19 -0000

Update sip to latest version to allow update of PyQt.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-oe/recipes-devtools/sip/{sip_4.19.2.bb => sip_4.19.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_4.19.2.bb => sip_4.19.8.bb} (92%)

diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.2.bb b/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
similarity index 92%
rename from meta-oe/recipes-devtools/sip/sip_4.19.2.bb
rename to meta-oe/recipes-devtools/sip/sip_4.19.8.bb
index 1d837c5..ea944b3 100644
--- a/meta-oe/recipes-devtools/sip/sip_4.19.2.bb
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
@@ -9,8 +9,8 @@ inherit python-dir
 DEPENDS = "python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "4f48e212890ebe584e8d804cfbcfc61e"
-SRC_URI[sha256sum] = "432b4aad25254e6997913e33b1ca3cf5fd21d5729a50a3ce2edccbea82c80533"
+SRC_URI[md5sum] = "0625fb20347d4ff1b5da551539be0727"
+SRC_URI[sha256sum] = "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c960801679942377c297bc"
 
 BBCLASSEXTEND = "native"
 
-- 
2.7.4


