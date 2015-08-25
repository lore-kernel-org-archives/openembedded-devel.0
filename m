Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 91C1076BFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:05 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so3967221wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uagMg7sEg+FdhmpDZWJKytjPW3Tyjjt+mPGHrdOfnYs=;
	b=KFPhjVNjh54ZdgTrOS339KC5pqg/XBXvT3NriK3Q+OMx3VNKcyZNKjob87n7zYoRLn
	pppfl1FXUin2US6hSkMe/sb4cEWc5wPwYRRPEsGRmfameh29vnvnCKKYkUD9HtNYbI0Q
	v6ZoYOtC5J6wShCDF5CHCJhK/2MRn5e1INYWMxqJb8w5FOrbpVG8wbKYjolPvclK9Xye
	Al4/BEVRm3uCFQ8vmUZ486sptnvRhBkbdbn7BJhBASuWIhTs06MWSngZpry+wbaJecK3
	iQXhtj45rS8ayh/mOS//c/+kWrGlEC0Xca+L8c95EgtQYadpQXnHUhplpBcGFUnG4KLY
	bB5A==
X-Received: by 10.194.122.97 with SMTP id lr1mr46925704wjb.26.1440481265611;
	Mon, 24 Aug 2015 22:41:05 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:49 +0200
Message-Id: <1440481251-22440-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] poppler: update to 0.35.0
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
X-List-Received-Date: Tue, 25 Aug 2015 05:41:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/poppler/{poppler_0.33.0.bb => poppler_0.35.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.33.0.bb => poppler_0.35.0.bb} (91%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.33.0.bb b/meta-oe/recipes-support/poppler/poppler_0.35.0.bb
similarity index 91%
rename from meta-oe/recipes-support/poppler/poppler_0.33.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.35.0.bb
index d5362a0..520aa6b 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.35.0.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
 "
-SRC_URI[md5sum] = "69927d1614d6704021c0b0dd0ee6a852"
-SRC_URI[sha256sum] = "a5fa6d7f7dc5382b48caca82b147c54bdffda02698611af76db5326ba64995a6"
+SRC_URI[md5sum] = "561ef4454bfabe59ef1b8b9cd4aa4c4b"
+SRC_URI[sha256sum] = "e86755b1a4df6efe39d84f581c11bcb0e34976166a671a7b700c28ebaa3e2189"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.1.0


