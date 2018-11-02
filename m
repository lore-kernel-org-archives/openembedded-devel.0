Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id EA73279F7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 19:39:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u1-v6so3114638wrn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2018 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4/4OdHw+IBRIMLZo77SnYKpgiw2hViqA+wVhYPR5SXM=;
	b=CIFyBBxrVRKO7dD1cdC57lNHC6UdPjh/JR0n0LOgHxjt5I376aRkokL6RtBvOqHNL4
	342+b10zCB16kZz306plufNdOEl1/JtJPg3HSqKjEBR0k9ziSki4VPkyYwFbrLjobS5h
	Om+1oo3JivISe/eKcaXBSXCvh8099jZPlTmG+FZOLa0T/0iQEsAwx1Z9WY+dQ7DK9Mgy
	c8ZECCmVbVzS5xQFhJsTdRcqhUUVsvFP0xuU8lYu8/PUQPgd0rrrFRvOEtYSFGscPcFe
	F434AFTenzWjjI8bhKz9peDmjCLO0DCbdf2KTlWXspC7DtKuEpjqG7FpAYMGWLuuQFLZ
	sp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4/4OdHw+IBRIMLZo77SnYKpgiw2hViqA+wVhYPR5SXM=;
	b=oxoktZ1CZgW8Aq73T89kNLiwaaKvL8CQ9wmlJbGfbi9Jlf2+yfFgjveI4Tr50rDJAt
	MthjRYvGatJpnAL3CXWPMtdqZmJxuKhVZDIlsd5iYMpjnKGSdW1SUE+JbfKahm8+4525
	IeinOEY7/A59zTuU5Cr7s33IWT27NFUwz/bzGOOkUp3UH7F5Lsy8MLXqiTMgMrdx8hlu
	dmP2Sb0D3zp+r+yBIiJOCeR/IaTQHYR/cU2S51G0ysCiNUXS4r6J9l2UKPupW27FbNNt
	ONqh6GQBUakVRNZod5WwY29XApuV9T/orrcB7Ah9Q4JigH13o/jpdfCm6O9yZQaqNBF1
	+6Xg==
X-Gm-Message-State: AGRZ1gJSBBjOKDenaBp0In0iKe6OTFpsPNgbD+MQz7gdPPyFgw01Yl77
	F9uhbQFql0YU60bNeoxIVjFO7slz
X-Google-Smtp-Source: AJdET5eeI9z/us7UCJSKLk2dqqzHkraLrwGVR5X97sZAGDZjSCcJZmZpcpWtldGLSRK1YNIJNqPoyA==
X-Received: by 2002:adf:8281:: with SMTP id
	1-v6mr11582711wrc.252.1541187544472; 
	Fri, 02 Nov 2018 12:39:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m2-v6sm27777434wrj.80.2018.11.02.12.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 12:39:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Nov 2018 19:39:11 +0000
Message-Id: <20181102193911.784-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-oe] pcsc-lite: fix SRC_URI
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
X-List-Received-Date: Fri, 02 Nov 2018 19:39:05 -0000

* alioth.debian.org is down
  Connecting to alioth.debian.org (alioth.debian.org)|5.153.231.21|:443... failed: No route to host.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
index 90d58b00d9..10f724e6c8 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
@@ -11,7 +11,7 @@ LICENSE_${PN}-spy-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
 DEPENDS = "udev"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/4225/pcsc-lite-${PV}.tar.bz2"
+SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
 SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
 SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
 
-- 
2.17.1


