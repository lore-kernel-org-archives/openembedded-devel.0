Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 796E76D1B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:43:56 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so9574604pde.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cuSsdnJrQZ9RPp0GBoWCaxH1OHGS7kCBESXCGTl61tY=;
	b=RDvEBSJ7UxlJWXzFCJl1I6g4lPrtExw6iYwslHgldFbDlB3dDRYgV3xC8vPdrwKrDr
	NeBUVTXRvn7J9VU92lS2pn0FJEk8s1M3dJvNtQB1YDIO/jZDmRjx1J72n+mT/NX12mN1
	hJpJsvx31l29fe3JCkO448FVMSTp/0yxJE/LLGL1n8CQLDvUj3A3jleHdV2wmSKcSxcF
	5/eHtKutI18gZLfGYzpGBqexeiTVSXzQ4OBiGVs9mmAUtOTU+UwWVIIW+1EZJTr9HSXH
	LLreqsZBp1UCvVe3Mov+umZ5gvtT1yASyHpFYE0VXOlkb0ZsTHpRrUPN5Z6w9zlE4sAS
	beqQ==
X-Received: by 10.68.225.232 with SMTP id rn8mr43239774pbc.32.1381877038718;
	Tue, 15 Oct 2013 15:43:58 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ve9sm86900850pbc.19.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 15:43:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:43:28 -0700
Message-Id: <1381877008-698-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
References: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] opencv: Upgrade to latest on 2.4 branch
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
X-List-Received-Date: Tue, 15 Oct 2013 22:43:56 -0000

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


