Return-Path: <mario.goulart@gmail.com>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 May 2014 13:04:13 UTC
Received: from mail-yk0-f173.google.com (unknown [209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id AED7065D1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 13:04:13 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so6054174ykq.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v+oYhCG7vp5SvEArts9WprtZ8us+E6dyHh4b4f7KQ6k=;
	b=iN0oZUeJJFkgdUEcSZiRGINkJCFkNYCytoGPzRnO4MFFq4f6r2mL+MrSmT1gSCMbzZ
	Lhj1y+6zhl+nOq1dMpVwCgp5lVNJnROqy4/oi/buhtF9Pirzpy9qtaYG11v84lfqLw7M
	8m76nsl1HWlv779mHKge9ueghfBb26Y7qNJyErpSqxvKZI4HAzqYtisbN4JCKi+7fSml
	LffWbLjRffxy9T31kX+aNvbGyb/4SgbHxbEalLFqDV7DvYI2Lhtse+B5Eti5XgsExF73
	pF8/JhrxFCENnD66ZdoRwpHdBX1eK3kI5X5kFPQ6itQWyUBAFlSxcxffoa4Xyw7Bi9U9
	C/YA==
X-Received: by 10.236.208.33 with SMTP id p21mr35608480yho.17.1401109088246;
	Mon, 26 May 2014 05:58:08 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	t27sm17809473yho.55.2014.05.26.05.58.06 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 05:58:07 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 09:57:43 -0300
Message-Id: <1401109064-30223-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401109064-30223-1-git-send-email-mario@ossystems.com.br>
References: <1401109064-30223-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] tesseract: add recipe for version 3.02.02
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
X-List-Received-Date: Mon, 26 May 2014 13:04:16 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../tesseract/tesseract_3.02.02.bb                 |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
new file mode 100644
index 0000000..72bd423
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A commercial quality OCR engine "
+
+DEPENDS = "leptonica"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0c94b3c86ad0c386bb6dec70ca8a36a"
+
+SRC_URI = "https://tesseract-ocr.googlecode.com/files/tesseract-ocr-${PV}.tar.gz"
+SRC_URI[md5sum] = "26adc8154f0e815053816825dde246e6"
+SRC_URI[sha256sum] = "26cd39cb3f2a6f6f1bf4050d1cc0aae35edee49eb49a92df3cb7f9487caa013d"
+
+EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
+
+S = "${WORKDIR}/tesseract-ocr"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${datadir}/tessdata"
+
+RRECOMMENDS_${PN} += "tesseract-lang-eng"
-- 
1.7.10.4


