Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDCF78467
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:22:00 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p5-v6so6316971wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ELRrkyKplKbeBgem0qNCBVfwg3ES3x2ZcI2dYXHG2c4=;
	b=gekXOo/yTYuhgXKwe++KJFcQyzUzq6h4oUjh+KHoYRyvdFZBJvGb3ONYYOil8YIrfQ
	EN0+V/Gj/9TcW57EJ6I5NDjVtZDcbNBGZy1/pXqY3ZmNbEuO+cLJuRbEB/gnstjJZ0YV
	dqOxjKxvo6jRxIbfAsP60hlWRKVWsVo3M3NyVjKXol8JeFh0emXqy/JfBYeiTK8//FpD
	fpTQrXfXL70x1DirgnAdhTFACUemBBSqItaIMEKkVQQdtnThURb9Zo1dPao3KQovrUi2
	Dxvuvr3vngnIPb4i6In/BKSX2TgPftnuv+wX9eZDfU3Pi5z2k83dAI8WcKRZ5fxKVFZD
	b7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ELRrkyKplKbeBgem0qNCBVfwg3ES3x2ZcI2dYXHG2c4=;
	b=k4vfM3+siS4Q3k85EFr9Hinj45FdQjxlxbpu0AlaXgk1K2m72wv7D1nfPueA0yQKMJ
	ambimE+7VwZLHFedoFAB8Q3AYYLvWhh2Kt2T7w89B31Aymxh+y6p9nbwoaF6xH9bjbSf
	4GOEOOW+iuSSEK/O/uyT5HJ/CVb4HxOD+RUsr+Lm1OQSRoEDO6I/dndB3bqp2d2vKHB3
	KV+/ktVH2Yd9+cFOKWOMZn/rSCE+EJzEvF7O6eL5u50gg6DdzgiCVNBDOhCYhpPecbJV
	8FyUNpvaIgnQbzYg/8uvUEfdWXzD6sopZsov++kht3CITcnP7deaW7leAnjtk/KdspQZ
	KKFg==
X-Gm-Message-State: ALKqPwcZxBXLyDQImQ8fgJ5sLpM3KhF6EHV1JWLenJCTzYoDTCXPcYv0
	3q+DFTLp3xinEfIMs5o0Ff72Uw==
X-Google-Smtp-Source: AB8JxZrxVnCn82Kq6hekepuDzZU5+HYawnuKkTiOccDG6I09CkM5sVw8VoR6/WO14QcmC1ltaLcoOA==
X-Received: by 2002:adf:b8b0:: with SMTP id
	i45-v6mr192139wrf.105.1526066521600; 
	Fri, 11 May 2018 12:22:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	44-v6sm6608433wrv.47.2018.05.11.12.22.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:22:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:45 +0000
Message-Id: <20180511192145.7811-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 9/9] spice: use latest version
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
X-List-Received-Date: Fri, 11 May 2018 19:22:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/spice/spice-protocol_git.bb           | 8 ++------
 meta-networking/recipes-support/spice/spice_git.bb        | 6 +++---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-protocol_git.bb b/meta-networking/recipes-support/spice/spice-protocol_git.bb
index 1405985edf..30d0a76752 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
@@ -15,15 +15,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
 
 PV = "0.12.13+git${SRCPV}"
 
-SRCREV_spice-protocol = "8dda82b49d8f848a25e3a1ef6df943276c59e462"
-#SRCREV_spice-common = "70d4739ce2f90f904fa96e22e438e9b424a3dd42"
-
-#SRCREV_FORMAT = "spice-protocol_spice-common"
+SRCREV = "87441524f4e7b79658e42bd8f1f6c3e3c8649aa5"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/spice/spice-protocol;name=spice-protocol \
+    git://anongit.freedesktop.org/spice/spice-protocol \
 "
-#   git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common 
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 257159f374..8fb5bd2715 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -13,10 +13,10 @@ architectures."
 LICENSE = "BSD & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-PV = "0.13.90+git${SRCPV}"
+PV = "0.14.0+git${SRCPV}"
 
-SRCREV_spice = "2c1037f47c37899842b1696bbab0d3a4ed6c7b09"
-SRCREV_spice-common = "70d4739ce2f90f904fa96e22e438e9b424a3dd42"
+SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
+SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
 
 SRCREV_FORMAT = "spice_spice-common"
 
-- 
2.17.0


