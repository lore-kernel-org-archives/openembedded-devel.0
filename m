Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id E4EC96FEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:08 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so2121512wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3lXTihusyb8Chvze38NoK3QHCw8gnWlDfk7BWuawyrU=;
	b=01Rt9F8hQWNLlAI7SLCGmdLX9IJheuTUr07EcHIY68e99E1lCx7IDx9HJjGh/HBhHs
	57MwrU3vNwMgcxo0yLu8rEA6NI9oILBDPsw3OjDTWCVFokfLFTN7fsVPpv+kgkiOYYX7
	HBDx24pLQYI1Q4XjG1vSMyzfAE3t4sCc9Z3FWf1Wi7pzgozj7OL2i1EAbHm1JWebWqwH
	uR/KCAzYatyCyMNQgcNfdeWxsPyUuaJ9FKWezH6skw1wu7S43WOOpY6nbITZGaTUBI8l
	k2evQdEmoRv+w9MSUlx2RfMmHTK0CDJtydOIdxdFaHTxd1lPc9iDLq6MQS8jxZGF1uNu
	kKUQ==
X-Received: by 10.180.86.199 with SMTP id r7mr5189482wiz.20.1403172009614;
	Thu, 19 Jun 2014 03:00:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ht5sm7662865wjb.49.2014.06.19.03.00.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:41 +0200
Message-Id: <1403171993-26208-13-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 13/25] curlpp: Blacklist because it's broken since gcc upgrade to 4.9
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 9ff2093..d24c958 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -4,6 +4,8 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+PNBLACKLIST[curlpp] = "BROKEN: since gcc upgrade to 4.9, error: 'size_t {anonymous}::readData(char*, size_t, size_t)' defined but not used [-Werror=unused-function]"
+
 DEPENDS = "curl boost"
 DEPENDS_class-native = "curl-native"
 
-- 
2.0.0


