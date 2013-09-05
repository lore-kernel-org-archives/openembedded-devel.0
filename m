Return-Path: <jkridner@beagleboard.org>
Received: from mail-qe0-f44.google.com (mail-qe0-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 761636BE78
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 16:26:17 +0000 (UTC)
Received: by mail-qe0-f44.google.com with SMTP id 5so921136qeb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 09:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pPs65UCvmgBzeMP0y6OFqxDFkOLWHIRm429pMmq2GBM=;
	b=dMi/sprnlWu1EZ5EsgLqlO14k2tHP9pXG4A6T935SEYkbuY7COIy3QQBfn80QqEyPi
	hdd5P/iafC1pRrptvSuXLT0oQFU6rqf7rs6cJSVO4JknrCR0K8b9sNzhDLj35jaGVCs8
	FfTJTNO9E6/ZNZsYdQnnFb3smok0XDBVcjBkpHBBQhSmCvihLy3hbSZBzVa3DqXf0Mh6
	rKfVrmO/6ZzGFmFSboxLJgym3jnIjDo0qr9INW9jt+64WC229P6eSTtRkowajqiR5zgz
	UNenUrveOMxKhp70H8yagXB7Jmm2t4kagIo/97MLEhq3bw53HbeOSoHvx2jPJ4xf0PC0
	uzXw==
X-Gm-Message-State: ALoCoQl6tEbG3YfbqqZ75jsk+Z5MdaIfSJX4Q4eDm0eTP8++hLsScH+EZSOFvBJXW9TwXW7jPezG
X-Received: by 10.224.147.71 with SMTP id k7mr2075714qav.121.1378398379079;
	Thu, 05 Sep 2013 09:26:19 -0700 (PDT)
Received: from ip-10-74-22-218.ec2.internal
	(ec2-184-72-149-51.compute-1.amazonaws.com. [184.72.149.51])
	by mx.google.com with ESMTPSA id
	p10sm42326872qat.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 09:26:18 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 16:25:56 +0000
Message-Id: <1378398356-21164-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.7.10.4
Cc: Dale Schaafsma <dales773@hotmail.com>
Subject: [PATCH] [meta-oe] cloud9: update repository for sass.js
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
X-List-Received-Date: Thu, 05 Sep 2013 16:26:17 -0000

From: Jason Kridner <jdk@ti.com>

Updated repository location due to old repository being removed.

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg32587.html

Signed-off-by: Jason Kridner <jdk@ti.com>
Cc: Dale Schaafsma <dales773@hotmail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 3300fd2..a755470 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-PR = "r4"
+PR = "r5"
 
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/visionmedia/expresso.git;destsuffix=git/support/connect/support/expresso;name=expresso \
            git://github.com/visionmedia/node-jscoverage.git;destsuffix=git/support/connect/support/expresso/deps/jscoverage;name=jscoverage \
            git://github.com/cloudhead/less.js.git;destsuffix=git/support/connect/support/less;name=less \
-           git://github.com/visionmedia/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
+           git://github.com/matehat/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
            git://github.com/ajaxorg/jsDAV.git;destsuffix=git/support/jsdav;name=jsdav \
            git://github.com/fjakobs/async.js.git;destsuffix=git/support/jsdav/support/async.js;name=async-js \
            git://github.com/felixge/node-formidable.git;destsuffix=git/support/jsdav/support/formidable;name=formidable \
-- 
1.7.10.4


