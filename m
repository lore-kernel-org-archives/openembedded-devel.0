Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E48CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:04:18 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3441.1790823851264473632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E0CKxwQV;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098db8dcdso2721368b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823850; x=1791428650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlBu3HXM6ZC+7gopG+wkCHywHNQf6dWgZcDMtFvgFD0=;
        b=E0CKxwQVqNkz11t4bwFUXIQCUUwrCMLmYHC0z4ouhXEwJSTKpEtAWFanIrywAY5Mvy
         9Vfz/x2dzAk6gwwKR4ylokkD6UO5Dyui+5C7JdZO/Btyr1+IrQAJv0Eg6wNbyIgy6Tnj
         yVx6LTryHq+GkCkAZaIP4CuijrhZxU/L4zy3gs0jKq7Eske2o0oPfguuB/KIN8gg/1Se
         5bxRFIjs2dkNMGn0QvotCQAD5R9NN3oMmocPX+EIzv8KjagsL2HHu66a71dXvUOD8+87
         AHnqlUqPBfNwEwsCZdH/cGxHnMKWbKqDcuhxmR6E0rGzVwkIjEzaAnjaMCXkMdMDhSW7
         Igkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823850; x=1791428650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zlBu3HXM6ZC+7gopG+wkCHywHNQf6dWgZcDMtFvgFD0=;
        b=AP4Kn4pmdZUc8IjBCup+ZFSFJRc4B54FHHYP+Uq4FEcjXQlRQHhSi33T4hSgpGavbL
         0VqaJEd3yh2+F69yLWTB08cuQyqnGk4Qxu/4GNePlH1DPxWDKSq779ul0A/UHd/ZV1Tq
         qPIrTVE3vDmt2IlhUYNyzdtCNJwSbDjh/0sBP6+RgvXdWWR2ms8Beukfnlp0dT/ZMJU2
         +rW3+ZI0hVCn4Bgb1cXdAq3lL8IYi7Qr9dl3haL6J8xed3c31zHHraA8bWqB48IDSqkm
         PpCPYvofURqtV/mfh1tqAe18ZsE9s/VCjFe5JAGXdBooZ63eoTxhKMX++0pNRDfzqtbz
         6ciA==
X-Gm-Message-State: AFuF++m13FR2GLmihtCz1p1z7rcuIQ1yG+LpPo5+xNlPU+D8tvuIgW1n
	8pq6ZoAS+nnQjoa6BWPxKBEtAx6ebwbbWUErOgFxl8Sq/e61zuhSHV42dIFVTA==
X-Gm-Gg: AYBFou3JivlyQIdAJmJMUMQ+lUlz+LUsQ8eMrfdaYLNI9meBf7Op+xm+h8Vu3KkhiKI
	8wgBb4bqdiSGtE0rMwUlBWcFFUJJg9nwnO+Re1fua/2PMwqOd2VHJktrqjZbXSbgKMuKZTiim/6
	c0QT2CC230iKxukhPyv8IkrsTDLTh3ipsx8rACNOSlMAY59XXe9M4t4M+qiE0ewT0sPqi2owbbX
	0yS5a9uZTJoiEROFHYAXhfnYjBjZlDCH6LUsXwoqFm11zfmpabnlx2w+VS+5eyBzhoDfNg31vF3
	PO57JjfGQDuD2RR54h0idPEAupEWKO5Gb4DxKeRkajFmWtAJKoiJytwTcoRHwckEgfiDvq9Sa8o
	P8vYFpIbk70Nql8iCRU/iBeNo5x08y0qkJ3yf/Aw62oEzIs5t5mrjwrKM0Kl12n10+ZaYzC5vHD
	0Kt1WYrOh+1YL7aIconw6JPAtAnlV8woIUu6rbXQGV5lR9QFM9escOMTd1mVK8wMoEynQmUflXL
	qFhY/koVKFJf0JUuB8tCqYJuV/Ukgf4WA==
X-Received: by 2002:a05:6a00:1152:b0:886:ead5:6d22 with SMTP id d2e1a72fcca58-8874d68a6ccmr2546960b3a.12.1790823850571;
        Wed, 30 Sep 2026 20:04:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:04:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 17/17] mpich: upgrade 5.0.1 -> 5.0.2
Date: Thu,  1 Oct 2026 16:03:29 +1300
Message-ID: <20261001030331.1581021-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130566

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pmodels/mpich/releases/tag/v5.0.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/mpich/{mpich_5.0.1.bb => mpich_5.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_5.0.1.bb => mpich_5.0.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_5.0.1.bb b/meta-oe/recipes-devtools/mpich/mpich_5.0.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_5.0.1.bb
rename to meta-oe/recipes-devtools/mpich/mpich_5.0.2.bb
index 55f6cde82f..ade5938dd5 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_5.0.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_5.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a296dfb961b957b0e8adf67d8478d3d"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8c1832a13ddacf071685069f5fadfd1f2877a29e1a628652892c65211b1f3327"
+SRC_URI[sha256sum] = "928c2f18d350a91443fe8024ad01ce2c6009e9c551e0a73e797fc567f119137d"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 

