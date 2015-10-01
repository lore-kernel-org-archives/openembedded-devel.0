Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 84C87762A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:09 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so34044498wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+XxtyyNz9TdYFf3bQZGQI9m6DxqhOKE+T4sVLH/J8ck=;
	b=s5Qtvn0cdCS4UZTY+k/tP03yLyt3uqdNLOvAxy3ZeZ0FFoqSIhcrwv7LZvKOcZQAXJ
	d6TdEGp/56fKKhJCW9gPw5La/M2+2pUuB6y+tdmRq4TBLZoBQEZiUzBDUP8GNjMzvvPd
	ybOjPrMTe2M5TvpPxGjQVPxzn1uKm5mCnCPcZ9rdrD/3ulb9z3H7NeJI7ckzMoYejska
	FrXCP1bJK8xQ5RAwXztMTuAyGd541u7DYyWGiEqdbrR26UWcGbSFV10jtla2tqmciwbg
	cQeviW4seGexkae21RZzIOnvlA9qoR2Dwk1WoOGQZ27aqR5OYUJi+wXxGL7xOpNQd4fY
	HX7g==
X-Received: by 10.180.182.84 with SMTP id ec20mr4177467wic.42.1443713349165;
	Thu, 01 Oct 2015 08:29:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wn10sm6650827wjc.46.2015.10.01.08.29.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:01 +0200
Message-Id: <1443713401-8584-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/4] libdbi-drivers: Blacklist, fails to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
index ce30bea..ec869c4 100644
--- a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
+++ b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
@@ -3,3 +3,6 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "4de79b323162a5a7652b65b608eca6cd"
 SRC_URI[sha256sum] = "4ab9944398ce769c0deeb64d2f73555c67bc25ccd2ade1ccf552226c7b2acf72"
+
+# libdbi-drivers-0.8.3-1/drivers/mysql/dbd_mysql.c:232:5: error: conflicting types for 'dbd_goto_row'
+PNBLACKLIST[libdbi-drivers] ?= "BROKEN: fails to build with gcc-5"
-- 
2.6.0


