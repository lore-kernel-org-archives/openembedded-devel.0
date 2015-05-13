Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5A95C74034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 12:48:16 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so54377020wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iWMGojwEuBVIDy0+rJ4L70rwOSADslReXn95IMlmvBM=;
	b=pmAW1rI9hA4JWKaQR8XkARen6tgfkRlpRsGy6+f7Kqto+iaHkAFkwVDgShgDcvPcHL
	fh2e7/q+5+YUJPyLL194hx9/94/QfgwViLXMq6L0xuxV01idrfWsoqodnfBgRi2JaTeM
	4zWFeHj5Gljv9F2r568WcHbdJZ7VIV+QDtjzNCwteKEmxUENFD314iXbb7yVXYcx6uW4
	EIfBtRXDsW+DjaFoQZjL8evRauhsLCTomxTM/VdiZ0Ri7ouFNKoG5NuI8tcuUrrDlr38
	y6oXSOrDi/KjCfNWbnzPATP8RiQm/NA87o3rCU38JBhhmLiLcHSEFLqk/jN9L+Gft59R
	0OnQ==
X-Received: by 10.194.123.67 with SMTP id ly3mr40141915wjb.105.1431521297088; 
	Wed, 13 May 2015 05:48:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id w5sm7928311wiz.11.2015.05.13.05.48.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 05:48:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2015 14:48:24 +0200
Message-Id: <1431521304-19402-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <20150415171653.GB2338@jama>
References: <20150415171653.GB2338@jama>
Subject: [meta-oe][PATCH] Revert "libhugetlbfs: Add i586 to list of compatible host architectures"
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
X-List-Received-Date: Wed, 13 May 2015 12:48:21 -0000

It's still failing in world builds even when
"libhugetlbfs: x86 - don't link against host libs" is applied as well.

It was reported month ago:
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg41565.html

This reverts commit 3cc7f186be46a0de049d1fab70ddb84111be6e29.
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 6fe5dce..4ce6a19 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -24,7 +24,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(i586|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
+COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
-- 
2.4.0


