Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48842760AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:02 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e65so2226026pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=KmyhVcxKSLFOZyLk3Ab3c+JtaLw72k1Hc67qyHvlejA=;
	b=m0VnKOvdIt8DWoZiNbHVaW2ln+hSIVURzm6K5GqL3CHGvHPKsZeSGPuA50o9kmoTIY
	AmmaGTeKE8BBalUswNYqIV6ANGsqyCAaVqYx1iFTvnrMdqXTFtxuK5df0kKwABDeHYRV
	k8/5MUKHCgxXMcwQxfDFGKkfE43qWFT6y+4HZROkrhSS9/OWlxHBbtYmRJK8t6aLv1M+
	cS6zNiEtGZwY7BxVUqFx0L9xYYy15YP4fJciPVu8PgDvGUzdOkCILq0rBAb2zbkV5mTo
	3Sojf3wN7AXxsEYP3StZcLtbaNaUgOlVwJP/dZacIYSK1lCLe4uNqNG4AY+MX/wj57+A
	VYvA==
X-Received: by 10.98.72.72 with SMTP id v69mr15752643pfa.100.1452387603199;
	Sat, 09 Jan 2016 17:00:03 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ix2sm176248119pac.15.2016.01.09.16.59.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id DC5F6FCC842; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:33 -0800
Message-Id: <b9e10b91f49b5a96fb2fb80b12afc1d9a6a3c448.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 10/22] opencv: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:02 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


