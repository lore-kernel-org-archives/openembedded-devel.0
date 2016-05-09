Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id B48746FF9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 15:11:03 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id gh9so15915711pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=97mcMtAnN/+5iUVEedKy5rx236rJAiZiLAhzhCjVdPw=;
	b=xEXaF4MoJq9i+sBkbErjwPrDmN7R1c8paAeo+LYIxJQfkMx4Gf7XHUHODXYHhZAFET
	iEc2/49vKeVLcS0OpyNjA79+HN+BR64WHPSABHSRT51Q3NYM+UUb5Mm9GGmMDCAumJbG
	3o1rWG4BecbIS8PVHIIg0KvsOxBqqipDD124mLpbadheEgg85+Q3ItwAas++ykpySgWv
	SaajmZ94LR+oFBXY79N2u54N8+P7oIVsP6lTWUGE3eLBvkR4qBu/SwuezSZb9KCBuFNV
	2SuivFlT9rxbPUfrHY7dMc9tQSOe6SEL28KIXaH5cuA2uHLoKWorceDCAjSOTNGdu3uH
	O4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=97mcMtAnN/+5iUVEedKy5rx236rJAiZiLAhzhCjVdPw=;
	b=gcbBhzgLfXyUSqCeUfD/CbRIt/0nPqdSsFIy6xvnnz02wWJTDvXNz5G0Z0l+VtKADF
	cHmHtpPKCJB96/wprlHQ+vFko+5PUVZMe/QXcL3oGcho7JSZeATt964+CZUtdRu45yzE
	e75lMxy9++/TBNZKXb33+xeqEdbyIi3R7ALYLl8JUdTo4TtnDghIBNaQh0sJT2L2qT6p
	gZ/RNJFrwZ4/Ch9jKqFChcvjHhF6xTTmVjHzcd+rHTL1d8Lf1WQGDtMwS4yFeyYNxnJ+
	amC8XAWttBlvlXg7WhBUYjgm/72BkeZtr8Rna31BLoDvFBWj8TOA2IYVzGdTnRGz2PjB
	b4Cw==
X-Gm-Message-State: AOPr4FXdZUOmCfV1UoKW6rix3qlTe7TZO2Qgpog7guuLvym4IEXfUOvnv5+CkoHuiW8jsw==
X-Received: by 10.66.76.74 with SMTP id i10mr51552390paw.31.1462806664058;
	Mon, 09 May 2016 08:11:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	bf4sm41514687pac.4.2016.05.09.08.11.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 May 2016 08:11:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 May 2016 08:11:01 -0700
Message-Id: <1462806661-23970-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][master][krogoth][PATCH] libxkbui: Fix license WARNING
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
X-List-Received-Date: Mon, 09 May 2016 15:11:07 -0000

WARNING: libxkbui-1_1.0.2-r10 do_populate_lic: libxkbui: No generic license file exists for: GPL in any provider

sources have:
Copyright (c) 1996 by Silicon Graphics Computer Systems, Inc.

so picked "SGI-1"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb b/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
index 66a717e..103da1f 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 SUMMARY = "X11 keyboard UI presentation library"
-LICENSE = "GPL"
+LICENSE = "SGI-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
 DEPENDS += "virtual/libx11 libxt libxkbfile"
 PE = "1"
-- 
2.3.5


