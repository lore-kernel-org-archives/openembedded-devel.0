Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF0EE6CEC2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:44:12 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so6179025pdi.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cuSsdnJrQZ9RPp0GBoWCaxH1OHGS7kCBESXCGTl61tY=;
	b=JItmoDKaWkKmKLj68z/TaxelowphwI/bPRysAkp5rLmn3j9kcYrrBeYAdM/gt/cgt+
	S4T7+PqpbWHRhXTLOfYJ6mdj62g03jXYPoSpNO96ARB6mVfbLL4YagCo95mDYzGxPKhm
	D37eb0sGRGHAZv0XNYWLY+UJtJRCzZhNihQEJmGjjqxGHhxpm42pt99CXG7g4YXtg+2H
	EN243wjpnk4SsM6p34A7g/aY+R21WM11lzwGoJhcwExhf2b464ZWcd5hG/ADIMTkAH12
	/EAgnCnKiON7dI9/vV+jcKgGFIr9WldyXjxuRBlE8Dt7S7SoiveVWQfntMq1XQVnbcrR
	hbew==
X-Received: by 10.66.146.42 with SMTP id sz10mr31736862pab.100.1381653854094; 
	Sun, 13 Oct 2013 01:44:14 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id l8sm70753592pbl.22.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 01:44:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:43:54 -0700
Message-Id: <1381653835-32079-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] opencv: Upgrade to latest on 2.4 branch
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
X-List-Received-Date: Sun, 13 Oct 2013 08:44:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index ccb26e0..9dd9cd0 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
-SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRCREV = "c5afaa4e8dfe507e87531f7688b9cf65c1f701c6"
 SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
            file://opencv-fix-pkgconfig-generation.patch \
 "
 
-PV = "2.4.3+git${SRCPV}"
+PV = "2.4.6+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.3.2


