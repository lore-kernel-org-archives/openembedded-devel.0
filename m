Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id C443A6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 12:53:04 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v81so1544106ywa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 05:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RukTCeVL4meFn/h8dxaD8OJW4X035ueFT4vDiWQjn8o=;
	b=kaoR+hhc7orXDLSlt4DD9by6lsos1Xa+FLfu1JXiTVF4P5qkQwPsKg7E9eoCgtXNS4
	r/kBjnPXDOozWwMXPZ5Abgltcncww00v9y8SbM5Ar/pe9qy2DRI6YGV9HNrm7kqaxQ7k
	/3jFgW6mAzrLDET6I42jADPflr4DIBH0Jm/gY0V9eCx4a59ZS6Qi1b/FQJF1Jhx1wUU+
	JYGvDMjyVi7yciXfb92izqIfvGdxc8FQyxfg4y57yy0ecB+lFf9qGALLE+7tVej3emws
	6jsZKHhWzgotKAnXWriWEp0tsGEolAwOTIATk/bvyNfgKUYKcLSHaFrTWBoNp4mpT6uY
	U40g==
X-Gm-Message-State: AOPr4FVYASgPKSYpPgW9fv+gFkvp+xe56RM/XrVAVEY3E4meV9cjIKHXXuIyySTLX/44Zg==
X-Received: by 10.37.13.196 with SMTP id 187mr924848ybn.163.1462279984758;
	Tue, 03 May 2016 05:53:04 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id
	n126sm1624332ywd.50.2016.05.03.05.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 05:53:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2016 08:51:37 -0400
Message-Id: <1462279897-7364-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] leptonica: update to version 1.73
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
X-List-Received-Date: Tue, 03 May 2016 12:53:05 -0000

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


