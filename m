Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6A66AC6A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:04:36 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id k14so1011547wgh.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eAX2y+HRfOfH+Eto1QiBPxAgORZrwgfmHTzqwAj/Jyk=;
	b=UO5lo/LtrWlHs52FpxTUN26HulCqJ0o6n4JTZjARD2lqqCUpWvgl0GfwoImPuerpxE
	OfewoegQfI6HnSKiM9aqXMsxZ7+z2u2VsMQ+Lt40q/ljHNlzPmX3VUmJMjFp2s+qwaAu
	VyGRdeGRlysFaZ4MrE1UbYcpffiNtpL9ryrN1RNAKRUNnX7yUcCECkzuo9ZHu69tTjv6
	Ei/PStJtoUOjkQrhrvbPEUpBa4kGpnQYviUESQlYZVVqpbBKcjcVb8aEcYdmFZy/9CBv
	TdYil5D6VFylKOa2zWl4Vh24jPriH+06iAxv61gXBYgkPr2fy9sBdbHJXQRbZZwUCfMK
	uOew==
X-Received: by 10.194.94.226 with SMTP id df2mr4118619wjb.113.1404230677552;
	Tue, 01 Jul 2014 09:04:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey16sm44708784wid.14.2014.07.01.09.04.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:04:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jul 2014 18:04:39 +0200
Message-Id: <1404230681-5064-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] glmark2: inherit distro_features_check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jul 2014 16:04:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
index 8e3dc8c..708b6d2 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 SRC_URI[md5sum] = "739859cf57d4c8a23452c43e84f66e56"
 SRC_URI[sha256sum] = "bded41aaf918ce062d9b81e42cc5be943e6a80bc4ff9d046983b96102c3df6b5"
 
-inherit waf pkgconfig
+inherit waf pkgconfig distro_features_check
 
 PACKAGECONFIG ?= "gl gles2"
 
-- 
2.0.0


