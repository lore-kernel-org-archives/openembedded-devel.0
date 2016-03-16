Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB9F6FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:22:46 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so77602080wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aB32w8tiqNZZgfW7kcU2xbvNvyFkwiLGInX5XtMlcy8=;
	b=fLev9i4k8WYkoBCXJMVUhrg2z23SqgPLoz9DcWtWkumCI7AS3Uv9g+K2o8V7VjR+pP
	0gGd6YXB6i0h9ZU3xRTNHgFj734wYd1WPbxf232Bo54vw44O5P8dzV+AgUmq8aRlNZ6x
	XMb7fahQdmYKRq8r1VRtkWvY6qBPWLKgpxaSHkemMlvTy5XA/FLcYawVuFmadQoNHutZ
	i9eLEAfyx1qrK/BsY7U3bL1yRD2F0vH0AV4XOHIvEtJIv30KgJGAL4AGbv15O9QfgQ6v
	7x5g+Z/0zUueJVwoLGvwF54SHCzFweY6Cy+OBc5uiolx8XTx24IJtq6sHdrPBXoGuCv+
	gp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aB32w8tiqNZZgfW7kcU2xbvNvyFkwiLGInX5XtMlcy8=;
	b=EdyON5xRv1GO9kxeGaLsZAp/JADyav2FLe43oam9xwXvWJMolajcWHHaq5Sql1RJF1
	onUZQ6s9b8rQTq604frMCKCffsOVKO9d7MP7+Zb6hHnRT/mtZgOLbCW8PUhonkIOp8Lp
	nDXPIpIrv2yCNOwl/+H0lXf68ZeYv62gGwqr1XYUDDSYkmw0Tto5mRvwmCLXoRVn5sZS
	yxB6LNzKqBY4RM8xc4/DlGgVC+Zsrq/qH46Y7TAPZiWjVvEaVpCp8KHR4tc+6g8at8qf
	TMdeUHkxScKCaU3BWFUAXdsYjoeDsHVRu535b3/MIW/3KnzNzXGHQuxYWccxMKlz5oYM
	P0yQ==
X-Gm-Message-State: AD7BkJJ/sRTAZEdrMKbidlJu5mufqPn3SBvpZe76vlGgFOcAMhj8VyTBHTh6nqMtltGW9Q==
X-Received: by 10.28.144.19 with SMTP id s19mr4907450wmd.81.1458141767368;
	Wed, 16 Mar 2016 08:22:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 202sm3985201wmo.7.2016.03.16.08.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 08:22:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2016 16:26:21 +0100
Message-Id: <1458141981-7810-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-oe] umip: blacklist
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
X-List-Received-Date: Wed, 16 Mar 2016 15:22:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 76901ab..41e5340 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -16,3 +16,5 @@ S = "${WORKDIR}/git"
 EXTRA_OE_CONF = "--enable-vt"
 
 inherit autotools-brokensep
+
+PNBLACKLIST[umip] ?= "BROKEN: SRC_URI seems to be down and build from premirror fails to find gram.h, see http://errors.yoctoproject.org/Errors/Details/56158/"
-- 
2.7.3


