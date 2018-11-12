Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0145D6C318
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 14:33:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f2-v6so8311351wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=owwz3EfY2pKTMnvrA1ATlEHBqGnMPDX2oCkU6p6+0h4=;
	b=u85j7qN5VlGK8kQ1FwI703HFwy42zbuC/z1mD9acoh0dHSg/SsyJmYMUSXa7ZbrB7S
	h2GEH0PsrWPXPLlmW0vGPjk3C0AtpEZVlOQr9cBA0ZRf/QPMFB1Wa70OafjHjJYNwq25
	F7Y0Sg706/XQgRFKp05bB1CH0xNuQG2cMPheSiIZqJ2qUvp3U60f+XK7pqmnCDnVWOK3
	iFlihEETigxn5faAYa6NdnlOSCTuuSsNu3D+Gvpb66QKy1ZOORzXUPrTn9y7jvtT2DKV
	Buv+v7tvz3mL/y/EpU5U6jvEwFu0YOLDbE+qToTeoEQDymNByPypY6pLlvQ6FsNrHO+y
	eBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=owwz3EfY2pKTMnvrA1ATlEHBqGnMPDX2oCkU6p6+0h4=;
	b=oQB446bziSnR2l3dxI512xNK8Ht6V5HhT7Ym/BHdQhAMiOdKgSuZ0LW3QZO80xKI/2
	Swwcx0gwBSfcjxs+LuLkGC8/MmzXdSSk0HaWPvS9uqCkaxRaumPWYoqL4MAHiTFOnYDI
	oz5FMlmQKREMtoMfDIT6OsnSeQAiwg71lfH+BslsGHf6BBwB/2NhEu37izLubIjE6HUJ
	IRgvLXoeDVAhJ4PQODTbWwdtsKEYtW0wAuwEH4aut34jVcZZrYmxetZH4WaByjoBwrza
	ERGHT+HPAXkOuFnxMPRkYcfArXSxWSnuapNz5GkkO3leZupW6DAbjaGo/YIyEhBJPCo9
	KFcw==
X-Gm-Message-State: AGRZ1gLd/GRKe1Qyi3XRkRrFDkFclcruGgo5QCfjp2xYgRMCDAJQXprq
	VpjOOvw4X0lpO3FHzr5Zjs8iZm/g
X-Google-Smtp-Source: AJdET5ftt+iE0veZljtwvm16z6joHHCabaDev80yj/M/qOJwL5RGmmnCS5/yDjaaRclBYXLmSII2+w==
X-Received: by 2002:a1c:3954:: with SMTP id
	g81-v6mr7487357wma.139.1542033191172; 
	Mon, 12 Nov 2018 06:33:11 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	m69-v6sm12327963wmb.8.2018.11.12.06.33.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 06:33:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2018 15:32:59 +0100
Message-Id: <20181112143259.11488-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181112143259.11488-1-schnitzeltony@gmail.com>
References: <20181112143259.11488-1-schnitzeltony@gmail.com>
Subject: [thud][PATCH 2/2] lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)
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
X-List-Received-Date: Mon, 12 Nov 2018 14:33:11 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The library parts are actually LGPL-2.1, not LGPL-2.0.

License-Update: The correct license is LGPL-2.1, not LGPL-2.0.
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 5728d83ea..26a887ea1 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,7 +1,7 @@
 HOMEPAGE = "https://www.sourceware.org/lvm2/"
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
-- 
2.14.5


