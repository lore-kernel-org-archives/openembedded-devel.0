Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 28B9B60767
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 01:34:54 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id i22so10320984ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 18:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RukTCeVL4meFn/h8dxaD8OJW4X035ueFT4vDiWQjn8o=;
	b=BW6cr1wUlA9e62VkRMhom2RXlFpd/gtqV+F+oL/srHn5dGqZWlHsDZ1iUNVuDYZt+F
	WpE4AyvtLoLrGIkERS5lhlU1zKNTpcIB9ptiAxORKjC1hCU/x0mOMMY+imEKGa2a6ox+
	BoMGOS+fXaeGDjN2pdu6SxBfMu7Q8eXy0+Zhn9qaqLa8XiZ1QA7PTgEkN9obbfoG/43n
	EOgAk13ITC0hdItS/ShHfStmET8Xg/zQP9BQk065uPJScPqTVO58VhgMrzmPh3QdV0gf
	GCzo2cPrH7bZnBpZsVRP8NmZXTugwQlchc3q6JlIcuy8w0+jXq8F9app+zw9BC+heeOt
	CS3Q==
X-Gm-Message-State: AOPr4FVlDuhxzKFfY0leV2Ihc0Ygb7VTkv6ck1w4hPaji0kf3+/DQZpKWQgmEq4mS0qnig==
X-Received: by 10.13.236.147 with SMTP id v141mr6854046ywe.308.1462412095449; 
	Wed, 04 May 2016 18:34:55 -0700 (PDT)
Received: from lnx-dereks-laptop.hil-hsvuvhx.atl.wayport.net
	(ip-64-134-180-59.public.wayport.net. [64.134.180.59])
	by smtp.gmail.com with ESMTPSA id
	y83sm4091529ywc.37.2016.05.04.18.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 18:34:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2016 21:34:19 -0400
Message-Id: <1462412060-20750-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCHv2 1/2] leptonica: update to version 1.73
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
X-List-Received-Date: Thu, 05 May 2016 01:34:55 -0000

updated to be compatible with giflib 5.1.x

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../leptonica/{leptonica_1.70.bb => leptonica_1.73.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.70.bb => leptonica_1.73.bb} (76%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
similarity index 76%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
index e826e05..57bc5dd 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
 
 SRC_URI = "http://leptonica.com/source/leptonica-${PV}.tar.gz"
-SRC_URI[md5sum] = "5ac2a31cf5b4f0e8f5a853a5266c42ef"
-SRC_URI[sha256sum] = "d3d209a1f6d1f7a80119486b5011bc8c6627e582c927ab44ba33c37edb2cfba2"
+SRC_URI[md5sum] = "092cea2e568cada79fff178820397922"
+SRC_URI[sha256sum] = "19e4335c674e7b78af9338d5382cc5266f34a62d4ce533d860af48eaa859afc1"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
1.9.1


