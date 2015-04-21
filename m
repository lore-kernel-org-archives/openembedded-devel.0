Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1BABC60167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:27:35 +0000 (UTC)
Received: by widdi4 with SMTP id di4so139123045wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4ODYc6pH/Kq/o87T+/ubTUtR4uRTitbMCPZ+rYHRiEg=;
	b=0LvUAwz4sxxa21DyZHSfozZekoRRUkL0FSkE1YQb6G+IYRxKxwBbWxby5Dl9/dVviN
	WOnRrA2Xr7vV9X4sdKavhAOw0+u5vu4Pu3c6hj/dDOZuI4Veq19vQRY2wK7o8U4davBk
	M3PNJzMru8R9dRO871B13w/om7DQrvYT9m4K7usdAT4UyPbxo+EksjD3rVo3lJvehvyB
	DhHItULzHeKEIjATlLT9imHbDuUfxHz4HsX5ludGSdiImaGDdzJE5EUtlE14gN5di9iG
	nhFdZ/6EGySIpFojMgxUiNx75mhJVN7i8M5WZmXSbcCTJjLm+14TCUGK3P50j+13v6eS
	bFMA==
X-Received: by 10.194.121.38 with SMTP id lh6mr40853986wjb.2.1429622856751;
	Tue, 21 Apr 2015 06:27:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id m4sm2658521wjb.25.2015.04.21.06.27.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 06:27:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Apr 2015 15:27:25 +0200
Message-Id: <1429622845-32029-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] dialog-static: blacklist
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
X-List-Received-Date: Tue, 21 Apr 2015 13:27:38 -0000

* broken at least since 2015-04-12

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
index 595f323..76c21f1 100644
--- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
+++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
@@ -1,5 +1,6 @@
 require dialog.inc
 
+PNBLACKLIST[dialog-static] ?= "BROKEN: dialog.c:1378: error: undefined reference to 'COLS'"
 LDFLAGS += "-static"
 
 SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
-- 
2.3.5


