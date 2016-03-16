Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EACEB7002B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:23:48 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so195328308wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sGxs75pZxSfKUOgx3kw5zIOSBIF/QIt3Fp3xWRqy6wg=;
	b=d1Ugkh4j29xiiV/k2B4JGSTHT8Uj/GNOf+zm3J7FbZJIgz5SLc+HYec2GB0QnxvtKW
	LDbw7RcbWNTLCuCtUxyyXO7vzosn+k0Fb5qZPwoIyVcfurl5ShkCSv+n8mU+SxKUsjln
	W0UyhE/HK0lxCTw6bVX/uc+Cc5ztCV/XL1zWHgl5m5jqaIB0U8rouk+sTSAIpiJm7iid
	bqhdUFsh2KZrDguL0vjd8B185KyZA0ELMYSNZPyUQBBuMmSxMFylythcI03aNTcVpRsq
	hLY99NvPgVjiSVwfaDL+xI8XzNboy4Jng82fmr6/EPNNzZnN8T/6u5SkbgvSQkjCiQ9s
	U7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sGxs75pZxSfKUOgx3kw5zIOSBIF/QIt3Fp3xWRqy6wg=;
	b=MlhBDQxx4WcqYvKd7uwgcgBRdv2YrrVvoeUm5cMAzNUIPZC4jTxTpKV72FRjygnraU
	L8HC2aBF2DdBy7dOPO3INYWuBl3kIT+IuEOAehNS3p5mE339SPNBPuWE0JPFdnks0yxU
	+qw1BfXcPlIE1qM6IYZ+RnJdylvXlJn4QkiGhODKfNEdVeUQU8kp+djX6XAl18yGh9jK
	KOVqmyAxN0ENgyHQ0QYzVAZmVTy/aHK6bEtrr1VIyp4+t1UaqlihzMb7U5zf8iH3GEcY
	75BiF3rN/HuZSXuscNBBVoFJKmBadC/oYkUSLJQHvUCfEy7WodwjvBSuHDSk/P+aNrQc
	KoRA==
X-Gm-Message-State: AD7BkJKFi32r+iuxP+4cU9Q9g7nCBcom23st0WTK6GTGyhiWoo86/PVpb0sXPTzDlOe7vA==
X-Received: by 10.194.60.145 with SMTP id h17mr4706205wjr.47.1458141829108;
	Wed, 16 Mar 2016 08:23:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e19sm26127973wmd.1.2016.03.16.08.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 08:23:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2016 16:27:23 +0100
Message-Id: <1458142043-7870-1-git-send-email-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Wed, 16 Mar 2016 15:23:49 -0000

* SRC_URI seems to be down:
  fatal: unable to connect to git.umip.org:
  git.umip.org[0: 77.133.223.36]: errno=Connection timed out
  git.umip.org[1: 2a02:8428:26f:b200:221:70ff:fe55:8f78]: errno=Network is unreachable
* and build fails with:
  scan.l:38:18: fatal error: gram.h: No such file or directory
  http://errors.yoctoproject.org/Errors/Details/56158/

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


