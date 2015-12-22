Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id EA9AA60721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:36:50 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id to18so47292506igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X9WklTlEfkP6BSX7fI71VcKn882CCCW+CWzG/p2qA0U=;
	b=ws1DkMN4Y0x3d4azHvkMNrbQE2HecRAT4ZlZQsKaOByTT9mILneJuwXsit7JdYrFGo
	E+TvoATvf6CUozjgGxLmoReGL8bYBGnAqpRyYbVii10Mcp4/hHL95gBdQy3bVyZ3IZOk
	s80k2hcpENIf4dfoMcsb9L8IqIV9vIvpEUrMXkVt9cNxCSYDLs2qGOnIlt6CCQSAYsg0
	lF+Q2YlGCgA5nucGySiisRIFQjt+y1YU338RulmYQPRm5tn9idL4tGlXfmKPEKLrj8qW
	N96zN7d3BNy/fC5AWyOQFYJvQFIsD46qjaVBQSTCoufnRyYbGzZiNmDrY8pCkbbk6R7Z
	HelA==
X-Received: by 10.50.33.52 with SMTP id o20mr13823240igi.60.1450744611420;
	Mon, 21 Dec 2015 16:36:51 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id d9sm9184283igx.5.2015.12.21.16.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 16:36:50 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Dec 2015 16:36:34 -0800
Message-Id: <1450744595-8679-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450744595-8679-1-git-send-email-armccurdy@gmail.com>
References: <1450744595-8679-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/3] opencv: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
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
X-List-Received-Date: Tue, 22 Dec 2015 00:36:52 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 3 ++-
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 14d025c..508655e 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index dee4436..8ffe1cf 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.9.1


