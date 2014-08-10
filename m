Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 92C4F65E2E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:03:41 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so9195153pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 18:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xvUry0pCiLhroNG5H6qosYFL/R8/xCTws4B3WgiQpd0=;
	b=PVmfltGC1VDzFf3d5Wr3uvuycw7Do617NFirS3eNDh829z3FcOA1TjbTaKvTxQZ5e5
	jU3vOzl9e83kzmerpvSG2mksCA0UG/fByf9ByINqyb47LKl8IzPrEkGnpkDF7bYYAqNF
	CgGy8yd3AwrhQ9I/av1NnXJQQfnwIdK1NggfOXQzACNMSOXNGXvNfnLckqmWFTfG8VPM
	RUga9gmmdcVjlZEgQz94fxoPaOqUazlOFDUzsjH8U36TaS3RPiiPh5scbS/ZxvKGP88A
	QnwBVLojrZ7fKwqoQNQwC8LJeVDcK6ymLg32r7fek4W1NPrXyEXR+ROtLpn0H55gVCKk
	F5Aw==
X-Received: by 10.69.26.33 with SMTP id iv1mr6642047pbd.62.1407632623283;
	Sat, 09 Aug 2014 18:03:43 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fu13sm150134pdb.81.2014.08.09.18.03.41
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 18:03:42 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:01:11 -0700
Message-Id: <19269476fcc8eba082b218c4d3a8f5abadede543.1407632366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 1/5] dnsmasq: add missing inherit pkgconfig
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
X-List-Received-Date: Sun, 10 Aug 2014 01:03:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

dnsmasq runs pkg-config to get cflags/libs for its dependencies.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index e57ab72..fd5793a 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -13,7 +13,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq.service \
 "
 
-inherit update-rc.d systemd
+inherit pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
-- 
1.8.3.4


