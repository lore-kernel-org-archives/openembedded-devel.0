Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE682EE57C0
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 15:18:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.24317.1726067879985452962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 08:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XYto1fJN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2057835395aso22664085ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726067879; x=1726672679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HfV2Mi3Nuomq0tYQGdeERfRUHh+rEaOInFnPjmqIOA=;
        b=XYto1fJNqikXRwVgBh+v/HiOVslHlphTlgdqtb/HGqU93yYLwiueIZSHFMrNBgpGz4
         zdtFqfaDM4qf8Mp7/8rIKchhLQHkLzLXr20MaEcWbIYZIUlHcijBS13pOqqixPs0+yt8
         7vrsj1BXvwkLdKWX3XBTUKAsBnW2ZzTz1wbTlv5c04WXGptdaBLV7BWaYM665M213nH2
         jq+/sk8qiwjxvJGQUMkxEZlFQr7qWlyYBctUV4N9FZkD67I7ClE9q6uM349flXEStxLa
         byvZZzXZmXjRhwWKxy/bWTyRRWGzolxRjzRBXp6igj9ixG7Ar61J4bn6yJv2woSYSozK
         5xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726067879; x=1726672679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HfV2Mi3Nuomq0tYQGdeERfRUHh+rEaOInFnPjmqIOA=;
        b=nHK+EJLOiZkMdPXgM+QQsaNEHQMWDd3LU7cAIVYpujkB56cp0qdRQkwq9pp+gemjsz
         ezlk7nqL/SlrGjGRzDaqTWlt+sDpt+JWjzFGNiSuhLYeR2nGy+KegwhEhEmih9/lgtAJ
         XycQfij2ypVRLaPQfX816z9mUapzpAYvXSPGmOTYRUi4S/rPWUhpaMr5/O8x85ytU7Al
         fuRK8fahLZnagivYVHlSAKRRs9MuPe7DWsIHnhuNeBbg607NOLqTxW30FoQ4vMXGJSRF
         eHX/SyKITb/i+rhxHL/lbpZ7Y+IMk8GmaCWfQCQYISIMau2gZ3hWwkpfgjuio/0zT/Eq
         kNSw==
X-Gm-Message-State: AOJu0YwMNY/53qBgtJ1M9fcnYdAx+i51KSC7vTzDW+zcJn7uHhtC8p0u
	8VnpI41wxnqG3Z5AoQ7OUGp+mRK2x9VUTnz8Vwgy5rrIHRzZhzbcuPyGRge5
X-Google-Smtp-Source: AGHT+IGwx2DU71v62g291Y4MLx9NRlARcGb2lTtlyhBd0Rm2VeZm4G/mqiBTBDBIIbDauAbQrt7juQ==
X-Received: by 2002:a17:902:d2cb:b0:206:ac4b:8157 with SMTP id d9443c01a7336-207521aa78bmr45242185ad.31.1726067878883;
        Wed, 11 Sep 2024 08:17:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9f01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b009910sm791345ad.267.2024.09.11.08.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:17:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libjxl: Upgrade to 0.10.3 release
Date: Wed, 11 Sep 2024 08:17:56 -0700
Message-ID: <20240911151756.1838037-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 15:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112246

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libjxl/{libjxl_0.10.2.bb => libjxl_0.10.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.10.2.bb => libjxl_0.10.3.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
index 8df0e9a2c2..3b694e0497 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
@@ -10,7 +10,7 @@ DEPENDS = "highway brotli"
 
 SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
 
-SRCREV = "e1489592a770b989303b0edc5cc1dc447bbe0515"
+SRCREV = "4a3b22d2600f92d8706fb72d85d52bfee2acbd54"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " \

