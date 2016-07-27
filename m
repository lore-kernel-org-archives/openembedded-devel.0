Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9539C606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 12:52:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so6337210wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Zd+1HBQH6I3ZRJ8NLfQ9O9/vsCKx8B9DgmLn1FO9suk=;
	b=Spa/n0/uVdcpL9XV4PQzFSx+56rNnN33aisQS14P+oCQV4JAbNIIpyVeb6YXdXFkGD
	axbunonLTG+fiJBTbe9c3mPVHkDElMLObIKpN2ZxUBDSwGBoHWKJkHFDqOVcyo8z36TA
	gTjT1yrjhgabBma1tKAIBg2Y5A9V6xxsKZEOiT2zv+FmsiuxDnpoXlYhoGhkvq2Ami1/
	FASlt6kT5ugl8KaPaz7Hl+3HjZ774AiXmWlkzBBJtF2jvJXIHL+XsVban216BGqNPuNa
	+q4h6Ifozi/ivFOrOXmY4VlWU1l8bw28iirvVLLDUpwwWM2RD4Vs7buYk0JJXUhewBUl
	OB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zd+1HBQH6I3ZRJ8NLfQ9O9/vsCKx8B9DgmLn1FO9suk=;
	b=ZKxRsSLcZ3MGgOFvf9JuR/mOF9p2vJvJIURhpt9tRdkFKNbppCuNHID1QJt2fb1HC0
	VAyqxmZ7bNK1Fg+KbY5YhzGU+n7GCYxnjhPbwXw06kMoMBlPL0kF7MZuNgjcQVRQOrEp
	cElLjLSQhwuHRliK6j9OaiJr612cAUY5ps2A0MniS5UVj5MWCWwPTVRDtBMP44jFQr90
	KVLToBvfremJy4ISIPj0lBQjmwUxmBWEx2nBoTJMMecGFQ6Mm/OtzKWDLxpLbXnoXAHR
	6EwQjuF+ubxl5u8sQkokzkBGJ/px/590/i8rZK1tOApVc6Ts3o2SBK7L083SIhdY7fi3
	A3Tw==
X-Gm-Message-State: AEkoouv9naVRVHkI6qoeVk2cYirnPPmeKxVRzE+Dn5RbHwwCJKf0nt/0ufkpA3srMsphZA==
X-Received: by 10.194.240.4 with SMTP id vw4mr30042809wjc.22.1469623951310;
	Wed, 27 Jul 2016 05:52:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	c131sm39171158wmh.1.2016.07.27.05.52.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 05:52:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 14:52:31 +0200
Message-Id: <20160727125231.6291-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-oe][PATCH] packagegroup-tools-bluetooth: Fix incorrect LIC_FILES_CHKSUMs
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
X-List-Received-Date: Wed, 27 Jul 2016 12:52:32 -0000

* it was using checksum from old LICENSE file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index dde4599..0ede5e5 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SUMMARY = "Set of Bluetooth related tools for inclusion in images"
-- 
2.9.2


