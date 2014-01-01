Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D21B76B595
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 11:59:14 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so5910487eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 03:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WLfdAwPTXgMI+PMfaZ2VOTDdxzvx1E0d61jVFgpknJM=;
	b=yXniUfOAYm4j3UNnFQoJ53xra5m8RVHbmzfJm2kUEHNA+6trcfEmb4TXUE+3IzKLtv
	IvMiKnr0jhV5MzuvYfHv6SrAqpDO7kTK4r0ayORbhT19kTPx3SMVg+fpHSbxJSqPjWC8
	JVzG1yMQw1Yd1QbWXGI23xVoy+5UfT75fO8LY/ewpQFFMDQN2U5MyXFXt74LtSoF7W9D
	z4Co5rpEm05MYyXRyZrizIMGCzN7AJXaKiPsUOdkFz/yDIVJVc7ZZE2IlUA6oShAUfeW
	iUv2RXkZ0MSs+U5evOSJjLLIYeE9/I8FyQnzFE+KuVExosPSDmsfFT8LLtFdUxvd/PKA
	fpsQ==
X-Received: by 10.15.74.200 with SMTP id j48mr10717771eey.102.1388577555550;
	Wed, 01 Jan 2014 03:59:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	a51sm126488505eeh.8.2014.01.01.03.59.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 03:59:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 12:58:50 +0100
Message-Id: <1388577530-4557-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][PATCH] udisks: Don't enable acl PACKAGECONFIG by default
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
X-List-Received-Date: Wed, 01 Jan 2014 11:59:15 -0000

* libacl isn't available in oe-core/meta-oe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_2.1.1.bb b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
index d4c6eff..a0bf148 100644
--- a/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
+++ b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "013b09ff38aa256b89c01525771f4565cb088724d5c8c79b32e9f811e8
 
 inherit autotools systemd
 
-PACKAGECONFIG ??= "atasmart polkit acl ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-login', '', d)}"
+PACKAGECONFIG ??= "atasmart polkit ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-login', '', d)}"
 PACKAGECONFIG[atasmart] = "--enable-libatasmart,--disable-libatasmart,libatasmart"
 PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,libacl"
-- 
1.8.4.3


