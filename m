Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id C1F136F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 20:59:10 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so10479534pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N5lQf0nOR5mdA74MlFRSv+AnIguc95vXoUTyLutvP4Y=;
	b=cd/c/bRexnb9/C1ygCA4K7k1Heb0Shf3EOE0iifmpFpNezMbycMRsEou2OZjZ3WIHv
	uY5yFhKvqdNbIQin9Kd+RYlAvOSJMOeuVtmlrIK8V232msC+bPcgbja9S8IanPjvhPaD
	1UjaID1eFPB002zFfEPGVwkSuejGFY/p7IbZOtE4Jw4CwEBVSEkAsC3Li015OJ4Icx8l
	NKlSZjq/x2z3JWIaaTPgEksuuc6pd655tmjyLMaE7EyOtwfNszv/Zg4Xbp8oAwmu9bpv
	urAi7LYtTV//4NPKHs196kpZJmQUrhU9o7eAR/86hOnol9pJJD8OMWRiPnH1tES1xboY
	hpfg==
X-Received: by 10.66.122.1 with SMTP id lo1mr14948392pab.118.1396385950604;
	Tue, 01 Apr 2014 13:59:10 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	zb2sm51982399pbc.30.2014.04.01.13.59.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 13:59:09 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 13:58:39 -0700
Message-Id: <1396385919-5924-2-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396385919-5924-1-git-send-email-stephen.arnold42@gmail.com>
References: <1396385919-5924-1-git-send-email-stephen.arnold42@gmail.com>
Subject: [meta-oe][PATCH 1/1] fixed QA configure warnings
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
X-List-Received-Date: Tue, 01 Apr 2014 20:59:11 -0000

Removed stale confgure option, added staging path to freetype option, 
and added --disable-rpath (hardcoded rpaths being bad juju).

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
index 957c4eb..5fb5857 100644
--- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
@@ -15,10 +15,10 @@ S = "${WORKDIR}/gd-2.0.36RC1"
 
 inherit autotools binconfig gettext
 
-EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
+EXTRA_OECONF += " --disable-rpath \
                   --with-png=${STAGING_LIBDIR}/.. \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
-                  --with-freetype \
+                  --with-freetype=${STAGING_LIBDIR}/.. \
                   --without-fontconfig \
                   --without-xpm \
                   --without-x"
-- 
1.9.1


