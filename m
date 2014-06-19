Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id B18E6605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:29:09 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id k48so2173433wev.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4qhIBfn2sEnJe6laRmP4g59PNIrE1EV+6AxKCeDU0AQ=;
	b=TiW2fTksF93+oJxCAYKdjRPzWsKnoH5ZpxuiU0VouTuds/TQzGmT2vdt5On3eHq0Io
	JtuImIyP6UOJJnAjbn4kXfB5Z35Ka2gvluWinCsi278wANK2wb/3bTDP9K1jc8wQzoox
	pu8M+TnmP2/C+G3CXRXxfuQL+VooeVBKcugrVklcfK1j4eW2moGBbu/5Q0mXbJ2Bid/7
	q3XCmKYcO15d354BdSqGcL4FLEHVJ3TWv2usjevLVwfopcpk1lAs9ICZ/s8ux/XViyDY
	HCMsTZcl/5e+Jw6Y0elIw/N60mr822YdUu0Dklgrbrhv3N+Af0e3bktAHdHdHl/yvvHh
	PX+g==
X-Received: by 10.194.92.115 with SMTP id cl19mr4344008wjb.29.1403177350170;
	Thu, 19 Jun 2014 04:29:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fq2sm10740840wib.2.2014.06.19.04.29.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 04:29:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 13:29:08 +0200
Message-Id: <1403177348-19368-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH] tesseract-lang: Drop runtime dependency on TUNE_PKGARCh tesseract and keep allarch
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
X-List-Received-Date: Thu, 19 Jun 2014 11:29:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/tesseract/tesseract-lang.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc b/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
index 542cc6e..7f69eb1 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
@@ -10,6 +10,4 @@ do_install() {
     cp ${WORKDIR}/tesseract-ocr/tessdata/${TESSERACT_LANG}.traineddata ${D}${datadir}/tessdata
 }
 
-RDEPENDS_${PN} = "tesseract"
-
 FILES_${PN} += "${datadir}/tessdata"
-- 
2.0.0


