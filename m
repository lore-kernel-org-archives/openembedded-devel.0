Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id EBC7670195
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:13 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so2045105wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1lXXOK2yB7QPmdLoKXfaq7gY+lFwUE1Uv3gVCtlR+Wk=;
	b=V8yClgyUUMU9UaPHC4/tuMSOTjmL6r57t7vCti2Vx7/g3LQEviK9p1w4174uy4+mQM
	+K8ew+sRmcJC+QMEfVAPUKjsPBcSjHHx9bMEr6noGdZ6UzcnFYAksIDpNhwEH2JuqYWm
	hkQ4VfIqsoGpZu1ZoTNSh6E0wtfLlnVHsCgXkq9YLElaXBAZg7eJg7UT1pXXIqBV9WIr
	PE/40eZMdTy53ahWHu2Tq2A5anRrwA+7K5kJ2C6bjC1uVlT8yE5DcqNYsqYzK2bN1aCz
	rtXC32oTAbEA8Uazap32ZbFX2SLTTqdsBwAQpB46HIAYkq2YOASJL1QgOUEztpovojvS
	MekQ==
X-Received: by 10.180.9.71 with SMTP id x7mr4848358wia.61.1403172012236;
	Thu, 19 Jun 2014 03:00:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft20sm2716199wic.14.2014.06.19.03.00.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:43 +0200
Message-Id: <1403171993-26208-15-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 15/25] apcupsd: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 07b8ccb..4cd3f77 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -7,6 +7,8 @@ SRC_URI = "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3
 SRC_URI[md5sum] = "5928822d855c5cf7ac29655e3e0b8c23"
 SRC_URI[sha256sum] = "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51aba5487e189eef2032"
 
+PNBLACKLIST[apcupsd] = "BROKEN: doesn't build with B!=S"
+
 inherit autotools
 
 LD = "${CXX}"
-- 
2.0.0


