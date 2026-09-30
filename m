Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55146CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:05 +0000 (UTC)
Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143.1790811063775911257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=USxqXzPF;
 spf=pass (domain: gmail.com, ip: 74.125.228.37, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-888148d08d3so195439b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811063; x=1791415863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV4zKZVNnJJ5sKhC4pvTwM7la5bC4MiSqR1E0zc7s6k=;
        b=USxqXzPFiIKYB14XVq4QnQCF26ONxxQECroKcVHLrYNvkMO+mHbCT12j8SEnaIIjsl
         aP0nZ+V5cewzBtzkVVPzJ2Uw/PwEkzk7asVAW6Hxe+3UF+p2m4jfeCEZEVc3vlEsU/du
         dm6FbhQTlncGiQ9teMhZXOehWrljtBZfOVODKZ6P1/+MSs7pNE22bDqhNSkxiL3uaOvG
         1+OmdwDjU246FXZq4hdY/lKYi6DzziPq8NLGbSjHxrW3aZYXECdE7Ruo0287XBitQXqO
         CxC3fis3QwIgAjdHGUmJNYBEDBth7PFXBoO5OcabJ9QZ3BQU9JsGwL2Clk7CvabXqTld
         lHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811063; x=1791415863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UV4zKZVNnJJ5sKhC4pvTwM7la5bC4MiSqR1E0zc7s6k=;
        b=OJKDlgik/9SVe4pNQ3UpKEAnfN9G2lU/l8Uxs/E53Qaozd08LkM78Jt+Zc8DZ8v2AH
         SyMD60Wgo5rqZRy4PoWBdaqU4NM/Vw1kRzJUeyeG9e2gFt1DcwksIofQ79XmbwqnNmWn
         H3i1ovLT54mp5RbZuQMTy+TBaCHGusDpAQ5D2ECg3m+T9hBy+Bf/zyi4JbEwDFoYjkZ7
         vkCcE7Ud68bpYTZ20L/u9EdMQDloe4LiiBRL4Bn4ckm28okYcIdYnZ+OaW7/XnKtl1KL
         866xgi7Fb3hr4p2dQVOoh3UhWgGldZ0JdRMpjWpvDPhA79C/FKdhF+4imzzP/d6HiZMz
         zSEQ==
X-Gm-Message-State: AFuF++lxCsTyVf6E5tfLAKKvLccRclUM7FfKJ3zbd9GRtIsnAdVGrhbw
	acN+tJZNOkbBs8OZsfWBMdAD/2Se/Qt0LcJ6cX4VFjnHxcyyTdZUKzbtGXNj2A==
X-Gm-Gg: AYBFou0C7O6DCzrbIHv5+aRIqTyPfLrAkTeATRIpY+Z1nsXkt9Vst8PimHgza0abWIo
	0DNa23Bp/vCH+g5eib5pjUw4tKZ19bo92YfjH1htjzQ16pFlZM0Ybufe8b9XgVcP9OqKg0XWU2k
	tnwOSyHbZQ8txWn//yWPnUJPjyWB3FKY9jG+dP5dA2C8sMW0Q1Neb/E0Qw+xNsGv+rtObjdOChi
	JA3GcZcBrX6tIoJ416vTNEZcNJOwZjhE7lhRyT0lm2irA9WsoQTYWOnULNs299EaCNELUgizokw
	gvZtVNdw0Xs5dDR9pUHoUbWZklgznbBGCzihhrPIbTlDQ+Rhv/EKZhCeSrZyyZ3haqHbgDwhfeg
	6ROV4e9iSFy9kVf5Elp1cHuSLEm8YymL4SvDG57cLk7zkqUxP5xgsUljk9+7LEJ+lPnpE0Z2D4r
	QbtAGMp1xOv9cWfjsPA/09xnZMp2hOHYSwgxhHGwHeEquNJ+cVlfIJ8+G5tMnK2gKtMi0QqVo9u
	5bYA+R9B+2V3pRvrfm9H9TCpp2p8zxYoA==
X-Received: by 2002:a05:6a00:a253:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8874ab8ca2amr2109035b3a.22.1790811063019;
        Wed, 30 Sep 2026 16:31:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:31:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 10/14] nilfs-utils: rename PV v2.3.1 -> 2.3.1
Date: Thu,  1 Oct 2026 12:30:30 +1300
Message-ID: <20260930233034.659237-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130543

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also update tag and add UPSTREAM_CHECK_GITTAGREGEX, SRCREV is unchanged.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{nilfs-utils_v2.3.1.bb => nilfs-utils_2.3.1.bb}           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/nilfs-utils/{nilfs-utils_v2.3.1.bb => nilfs-utils_2.3.1.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_2.3.1.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb
rename to meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_2.3.1.bb
index be9442c5e1..9589df216b 100644
--- a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb
+++ b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_2.3.1.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://nilfs.sourceforge.io/"
 
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=385034ac639a62b8415db9814582ee98"
-SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.3.y;tag=${PV}"
+SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.3.y;tag=v${PV}"
 
 SRCREV = "805edb2a35178dc1d3d64a553af607fb500ab21d"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "util-linux util-linux-libuuid"
 
 inherit autotools pkgconfig

