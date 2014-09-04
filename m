Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id BFC93713EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:28:59 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id fp1so12768066pdb.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sP6XL6rNLah7+Ugen9ZKA/qzS4uc0o5XBhk/V8ooG04=;
	b=IIBFiAVfttZuTmjcQKTTVBL5e6LdSp2vZgjLupoIqXjtxYvxV4kV2XHqq3psakO8YM
	c9/fsaQr2A2bw5cmoFhA7lb33Ey1uWSjNJ9Zlde8qbztj6+l2Jnjj3oUweYXiCtldO1U
	3P338edTxTer+nXppFogUt3G/RhZRQ8Y45bCRFrPZgJNQJyguYoONYVryV8poEGSdq/O
	qVSkxP8Tgc7Hpb1l5ecYdMZJBfkQdYgcswGy1l1IxwARhuG7sL7xolS0eef/xJYStNad
	FWDaO/10aZ8tHxcz18MKMk/SKbiuWftsuF8pEhOJ8ItZ4dd/utASeAmpQQLCjIaC+UTY
	6Nig==
X-Received: by 10.66.121.103 with SMTP id lj7mr5566552pab.80.1409815738713;
	Thu, 04 Sep 2014 00:28:58 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id pn13sm845213pdb.53.2014.09.04.00.28.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:28:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:32:38 -0700
Message-Id: <1409815958-24314-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] numlockx: Update SRC_URI to somewhere fetchable
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
X-List-Received-Date: Thu, 04 Sep 2014 07:28:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
index ec875f0..47ec504 100644
--- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dcb1cc75e21540a4a66b54e38d95b047"
 DEPENDS = "virtual/libx11 libxtst"
 
-SRC_URI = "http://home.kde.org/~seli/numlockx/numlockx-${PV}.tar.gz"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/numlockx/numlockx-${PV}.tar.gz/be9109370447eae23f6f3f8527bb1a67/numlockx-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "be9109370447eae23f6f3f8527bb1a67"
 SRC_URI[sha256sum] = "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da29d7696cbce772e4"
-- 
2.1.0


