Return-Path: <net147@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id E922776536
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 10:43:36 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id fg1so18193245pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=owoSLCuwQPOVaqU4FM13vk2duW+rh8yRm9jNuY0eqwg=;
	b=U4DXFnxVJn7Qyq6FCDRGFuM4dIuMQoybg1+sxfxp5xBzOAs3erSux0Ab9ARDB0JVNj
	B1TF3bEXpUaSV4jiDWWpUhTNZh1hkpeCV9X3UUDISB56E4R4r5MPFSF9oTW9QCJtNwmx
	PZqTSd7/UQkNU0XUrY0QENmVmaAgi9xdWNqLkDG+nbOjR5s5nqpBL7fJXR0NS2dP1ZpX
	0QvyMLTAmh1UVTaK+4bh0uABGkYrIX8GGkdOHlT1sv5fiIhq28aMHDPjCCHOtf33tl6K
	X9XT5R2abkcf5ux3klrOnwNbfR3tRQXklsQqj2eh6S43qEGIU1zo/G5JdmaJjB/p5O6u
	lG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=owoSLCuwQPOVaqU4FM13vk2duW+rh8yRm9jNuY0eqwg=;
	b=VkJSUAVUA/jrMahYDvEkUiZdNN9iXP5oM/tG8QWyOn0JqWgafy5q8pSTEMZYPev2Jh
	8EdOvoFvvXD8VD4qMGdzZycAKhQPj7/HM6MzHikqcNRhqh11b+7zYqC47iTXvMplIyyE
	xY4VfrDIv32fhxWlX0SDVSx9Sg0UVsNekGrBS7r2blYcpTuspDb7DVhHLELYoP1dO/IJ
	8H3/p43LBQG42ohwFr+B7V19BKjIC03nXJ5jeqrY/X58y+wnTIibw5mcwEglSqu+oak1
	SPuy/GaCiJ998fTOnSowUT6yFi/4zSjK9FGJCKXtPV023b0lh/dN5u9Lj+dWN8Dr7IIb
	UfIA==
X-Gm-Message-State: ALyK8tLUfG47hGfHftNmT7/1jAt6m24V3jlunFIRXiDnFHfOAvPJKqodZkpRAnfH/5zWtg==
X-Received: by 10.66.145.195 with SMTP id sw3mr37067559pab.36.1464518617438;
	Sun, 29 May 2016 03:43:37 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	e2sm25443241pfd.20.2016.05.29.03.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 May 2016 03:43:36 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2016 20:44:15 +1000
Message-Id: <1464518655-4302-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-networking][PATCH] libtdb: add missing libaio dependency
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
X-List-Received-Date: Sun, 29 May 2016 10:43:37 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
index bf6698a..7fbbe34 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
@@ -2,6 +2,8 @@ SUMMARY = "The tdb library"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 
+DEPENDS += "libaio"
+
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-- 
2.8.0


