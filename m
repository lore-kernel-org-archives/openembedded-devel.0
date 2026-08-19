Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52536C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4902.1787138762447010018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bx/kF713;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d5cad1a6baso7065735ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138762; x=1787743562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mrd9uCkqnJkb7W1zarrVXFr+ECK+4pC1tmf7nZvgVE=;
        b=Bx/kF713BqQ8DWJlPbp2fZw4h+XJyVXtAKYCi7nTuKkLFhR9TG4BijGEhaj1lSmJ/S
         hGX/maugg95Ox8R/V0tqYAse7IE++rjzGKcjwF+nNWyd2n1ZWiomFmWnSvwMXftIyJ1s
         nvQKsTyRMVNTyfsg8jungii2lrh6FUE38AxfC2mgluXYVB4VouQDqNotJ4sgAncIcQzq
         CmWyKwURUhv6/hJ9432bYzMir7w/l6cNTynIV2vJBWoO8XfEU7A+NI6tZSJhnhK8OB1Y
         cOdF5XagDiCyoU1JUB3MZPLaLGYWgi1A4Jzt4b/GBoF2/WJM4oPx4DqMcmoowWxcIetT
         k/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138762; x=1787743562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mrd9uCkqnJkb7W1zarrVXFr+ECK+4pC1tmf7nZvgVE=;
        b=FWIYAz1NbxueAjakKl3dvmA/aSPqYRn8wibKJtyg4vuBTIhb9YfZ7GhfHq4txrGyxo
         IJkA0gbMa9CV5PnPTQ1rhbpyohCfD6U3OMbpFkUzqHqfT4pmmQJlueYZ6a2CVGfMvC1N
         Obj4R6+hVxMMpclnAp+gHefwiE92+ZIcpISa9DKdYQRZh7INyhBRKPLm4YlodND/uYlb
         8kY+18j0gI/fwh/XyU/DvPSzZlfIdop9eP8F2rcWNfsNmV9tCUVVvqS3sCsrooDIEWqo
         /cS0vM6Eqz5g4mXpRg6OURI74VqDFEQS3vu6vJlnYfTqvKuJ+LNPg4sl0O+2lchRJrbq
         QTuA==
X-Gm-Message-State: AFuF++na624sB9WTpf2TT/2+TvvUqEjwr/eHJIAN/42LFScWqvCZ63zi
	T8FauRXKO2so0psggh4nZC8eRmqlCDgDQH9vWveX0hsplgOcS4rPkgqvTZaljagZ
X-Gm-Gg: AR+sD12s2caMmfVtF6QCDBGkn6FBz2UQH037UATJeVVMnvxxZaAnomci4ZBkXH5BD99
	WukqjD90Hjr7aW/ZEajnYYuR4iWegP5cABKxwIDPhVckNhTpdsERmzPpzkV7dQjpufQf8aYXPXx
	AG5X94xrJTrw1qk1qL7+gI3jPQh/JxSz/IBcBpxZwqGBfF1+Mc/W+z4RAzooSmYZWrmegJZfxb9
	DNnlPPLEAw3QhwHG1OLnm6azeEyJ0GzowQGIrP5fZpsXlcE23hcKkBKte5da7Pcf55kHHAYd6ZF
	9J9nsK7cD4Lu+t91PTFG6TqKH2ONOdSRFYbRRIWnfUTINrm9f+tbU3ta3kgxu67zcbjIz0LfmPW
	3vi6UmOyEuQgZTkz1WkGP8wusKGnnDQHCs/UDtCovwDYUGbW7nBdqXPmfl+NRb/RY3VdcIcKoMX
	6wVn9J6NOFwfBCVyw0bkmdqYbR/z6V6reaqYTmHQB8OMrWAlw/2MdNMyndiC3pdLR9IMQYrJrDH
	A==
X-Received: by 2002:a17:902:e5c5:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2d601860803mr66798085ad.7.1787138761662;
        Wed, 19 Aug 2026 04:26:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/7] wtmpdb: upgrade 0.75.0 -> 0.76.0
Date: Wed, 19 Aug 2026 23:25:47 +1200
Message-ID: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129354

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add tag in the SRC_URI

Changelog:
https://github.com/thkukuk/wtmpdb/blob/v0.76.0/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wtmpdb/{wtmpdb_0.75.0.bb => wtmpdb_0.76.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/wtmpdb/{wtmpdb_0.75.0.bb => wtmpdb_0.76.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
rename to meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
index 4de0a300d4..ebbfc7e994 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
@@ -5,9 +5,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "a6f185a241ee633cbba600029ec153feb2665cf8"
+SRCREV = "89c0861f74e576c5ad0ec9f5302aa635a4e50dc6"
 
-SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https;tag=v${PV}"
 
 
 inherit meson pkgconfig systemd features_check

