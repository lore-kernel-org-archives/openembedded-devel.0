Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3148CEB362E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 18:42:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167960.1772476971180201317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 10:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZu94RsB;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so54421185e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 10:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772476969; x=1773081769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKWkhx4NsvLaJMUoEIFABez8nGP7C2vnEMFviIjXZ+4=;
        b=NZu94RsBuCb74eLxY+Xi/6oHk4PnL74nKVAjjoK0HSzkJ/PNK2WJbZQG1ZrBaGeaCW
         mFGPlbjpcKvo7aboXenIUeohRtZjjathMBMZB+KQ9miaysV2Y9WzKbvRSMLooMSkBzWA
         2n825My06spZ1yWVH08nru8bCf+QzvmNFwc1w72ybHeTQM48f2rrA3Qz1Iv/tAB+gIOF
         QbDXhJVQvosW2gMW8u/Zk4052G76TxpHS+Zy+ORkAX4gTYWw49oJVVWLB7qReI45Omyv
         42/xLQlLIjcQPPZFVqJoYJ+5ACXwpZSLkQzDqr2IFbKeE+YCqTj+R6Tiy1e1oKk88TVB
         k4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476969; x=1773081769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKWkhx4NsvLaJMUoEIFABez8nGP7C2vnEMFviIjXZ+4=;
        b=AHYz3UjXuF0azNNmGQN0G+91x8FQGscX/ePjHMNYZ6g5HLw3YdpzUCSivUZKN/E6JJ
         eLuNHvsuxU+7P+BkwatdynLIx8ru6fTtK+etJ2mxSlJSPAxpgMcKDY3+hUoMLaHVtj1H
         1yd7UODbdsQMjJOKAqISjxR6Q0+Kv7DSNszrZGRb6jHh/i3iBtSa3XabUOOPqqhO6CeC
         F/o2hDwCejimlmqvZIH9qZJkT++++zv9h4vH4KAaPlPwK5t38GyVVi3/RnBrBrJVH+fq
         9apIlN1y09FtV/5NmTsdNAPJiJ06g3ojhPMT3r7qxdtAYaJanGQbCXgxzOqZdO46gUEd
         XbqA==
X-Gm-Message-State: AOJu0YylAd4rDznzFenqHjDf/UIUjfu4pMrN+lwYzVRX+ughSjGUt3o0
	XpieuvzQpLLczltz2/zphBKyHEsbOraIjkhuJtU+srHyi2TV9JfhwXYeuTviqg==
X-Gm-Gg: ATEYQzwaTXWJpxaFt45tXAzFHBrSEREpHKIk3Z8PIkQAgMjFu6EDquHTdklvXjS+g3W
	fRkN6AdyjZhoXDNRLh/x4gsIiuoITmGTXI9iC+DO1NVOInLtflWcKwY+d300DrTHrG7YZb6iJUG
	mZ2Q3Vz3DZ6rbk2EGfT2tHjMUlpa8ZHqgdfO0JO6FE74Iq0JhwZa3GbDD7pyZ3Lpb0QmnTIbghS
	9sSDShLwMEvyL/Wv07PXazoJYYbE8NZaWHLCzwHMK8yryaH0bL23DZNxe+OKdjniEgbFxCOejPO
	VfUpF5m/nzTrqpNMYZ4figo0sQZBu7k9QFP2wvMsFrnXTMC8org9R84/fq3wZ2i7WWID9dm1Y5D
	6xlsI0xPNovVkCFF8nEsRY35vIzCG48t9BvgQL/whqmARgkYvuknKh7QZxAolzOoOx3bjXRBztn
	QV560NEr5mchMRqKvnkVbp
X-Received: by 2002:a05:600c:3b0c:b0:483:a361:41a5 with SMTP id 5b1f17b1804b1-483c9c0e75emr206657955e9.30.1772476969273;
        Mon, 02 Mar 2026 10:42:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm442326315e9.3.2026.03.02.10.42.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:42:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: upgrade 7.1.2-13 -> 7.1.2-15
Date: Mon,  2 Mar 2026 19:42:47 +0100
Message-ID: <20260302184247.1792854-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 18:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124819

Contains fixes for:
CVE-2026-24481 CVE-2026-24484 CVE-2026-24485 CVE-2026-25576
CVE-2026-25637 CVE-2026-25638 CVE-2026-25794 CVE-2026-25795
CVE-2026-25796 CVE-2026-25797 CVE-2026-25798 CVE-2026-25799
CVE-2026-25897 CVE-2026-25898 CVE-2026-25965 CVE-2026-25966
CVE-2026-25967 CVE-2026-25968 CVE-2026-25969 CVE-2026-25970
CVE-2026-25971 CVE-2026-25982 CVE-2026-25983 CVE-2026-25985
CVE-2026-25986 CVE-2026-25987 CVE-2026-25988 CVE-2026-25989
CVE-2026-26066 CVE-2026-26283 CVE-2026-26284 CVE-2026-26983
CVE-2026-27798 CVE-2026-27799

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
index 0eb072f84c..952f8c4028 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
+SRCREV = "b5fdb90dac0e6d0bf1bbd95704bbd60216a5bc23"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

