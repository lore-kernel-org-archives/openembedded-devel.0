Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 118886BE19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:40 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so339506eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1RMPw3YgZLfat1GeR8EpL/nMf62NaekupYvGEChAdQo=;
	b=lGl7XaMV3gNh+LBcro0143XgNcGeGNpg+Pwmr0ojZGNOovvENduAEJmaEiSEibNHdU
	qOa4dk/ZddSAOk25evQeUCrE253l3wL2OFsCJCyxI0s7r6a+/kYDN/enk3BztndMJ1fa
	8hqf12CrrOPdb0u58FTTdtUdfR8rfDNDHq4n3VfXsIHhoLNSj2xL4ao6a3eHtp2YgXx1
	SHEb56NMq9B3N914qKbSujOyJzdVqrCebsR66g/4XfZfXOVAZb33OG3SwcBVhCdpThHg
	p94yrIwuWQnvum8TzBpqHa+ZPsmBhHeDY7nSq+ek5Xcuz1tnJXg5sqGgDichSmkpm/8z
	TBVw==
X-Received: by 10.14.220.200 with SMTP id o48mr5296424eep.62.1377791501314;
	Thu, 29 Aug 2013 08:51:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm47204610eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:32 +0200
Message-Id: <4d10a88842bea1905ac7e924d85978a4d4aabaf3.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 39/66] v4l-utils: Add libx11 dependency
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:41 -0000

* configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index c00f119..e2884a6 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
 
 PR = "r2"
 
-DEPENDS = "jpeg"
+DEPENDS = "jpeg virtual/libx11"
 
 inherit autotools gettext
 
-- 
1.8.3.2


