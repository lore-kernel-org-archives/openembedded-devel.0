Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7F2CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:30:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.11842.1760110224701687902
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VvdCg/n1;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-46e29d65728so13419365e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760110223; x=1760715023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=VvdCg/n1LrSuYt9+OXMH84QCXct9sz5ystDdTnrD6rwHIzf76/pTKJeLvPgSZ0VvHy
         WwmaZHHM3t6DY2H/YPO6KQqTBpTXfUQOsFejwlZkDOAY+fSRaRMxCplBzw6g9u1n/VQt
         PQe9+frTtltLQfryuzjljYQ+6GQqB4YDPDEa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110223; x=1760715023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=U7mWtNba2Su1ZnYM9mo22Qfg0nPkpTOi1SZ8nmKTHcTgNkfeBuuN2aw9TvGKQ6bNpv
         shOY0gXNjBTSx28DVD/DP6yBDZlFhNJn/3jAce0Tu54xDQkrxuFSC+QThPmHy+9AAzun
         EkBi+aXjH20S60NUzV0LftQzaWgOQVAZsGr/o5xryaL+Eg9eWaGhwQPaCXFFmONyDTex
         HCqyC+rg1Zqn4/DYudcDCBMD+Yq+mr/4OOuNcq826bFyY/Mn7P4G9vcxzn1HcYB5Td7K
         66sJFyVBOnRAW6WyV57eCLaMHpWZzmmaL0P0Uj0JZhXC6jePBoy2wpJ+Brqscr0cy6+Z
         C2Kw==
X-Gm-Message-State: AOJu0Ywkq7m1GhiA7ySifwjFNApdy0G5zaey+X6rPmwIl8IZzUSbdszX
	dJkW1CmqWOz5mRejm49Hzv2kQ7o4Xcz16b3e3UOeH5PjyeyzqmNf9obWEKsw/Cqc4tg9/eS5Kv2
	JO6KQwx06x/5A
X-Gm-Gg: ASbGncvqwwGWtdGivYIsCE/0lAqUaOfmt1cIcz/BdczRQ8AP+bWYckkCb7ucQe9vtMn
	Gfr2GjdJFqLEThL7f8bTmQqCzImbv1FUFeSi8/Hn2Qc7awxRgKLOHBk+1WFlU/N6H4/k3c2C5MF
	0a4jYGO6AQeSyrKs9tUyUKnnqR1n8RkvL0oPm/lok0bV2kxRb7v56YWfkg/T3Dqgag6Yf5PgJoM
	Y9M6kPgFpzuvtnDoHFLc+S5YlhpBj/Nomlbr5/c6U84Yc7rR2IwqASLnXzTBvFw+WZtxHzG+0+Z
	yc/L2yCy5Bkdp7iXNjlHAfT5p99Gqxk60KoZxq0DiT6B8e96GclPgN9kdLXwXGeYEt47Zkrp9Df
	XFR7iZk73BR3kAS0czgW3IJOl9etydX7uPeOs3oX3HzrQCYbmoiRv2IZPp3CPAiV+3XLotNyhh8
	lVcCbh2PA8Z1wanoQq7klyXlTU13Uf//eWpGoqxbaraH42gmwJO307V0Cn
X-Google-Smtp-Source: AGHT+IGxBGHM6z84Y07RZiilV/83wPfjqy8uQJKjZg9Sb09D0YYmXd5VguQBWuiARGG+gtvKTdwrGA==
X-Received: by 2002:a05:600c:1f84:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-46fa9aef45fmr83647415e9.18.1760110223103;
        Fri, 10 Oct 2025 08:30:23 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb497b8fcsm50911315e9.2.2025.10.10.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:30:22 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [meta-oe][PATCH] libblockdev: improve reproducibility
Date: Fri, 10 Oct 2025 17:30:19 +0200
Message-ID: <20251010153019.780786-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 15:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120480

The --with-smart option behind the feature "smart" relies on the drivedb.h
header, provided by smartmontools package (/usr/share/smartmontools/drivedb.h).

However the dependencies (DEPENDS) miss this package. Furthermore, if the
--with-drivedb option is not used, the configuration step will search for the
file first on the host's rootfs. This may result in the wrong header being picked,
or the --with-smart option being silently disabled due to incomplete dependencies
(causing missing header).

The header is now guaranteed to be present due to an added dependency in the
"smart" feature, and its location is specified by the --with-drivedb option.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index 48e6971d1a..e4078d6862 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup keyutils nss
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
-PACKAGECONFIG[smart] = "--with-smart,--without-smart,libatasmart"
+PACKAGECONFIG[smart] = "--with-smart --with-drivedb=${RECIPE_SYSROOT}${datadir}/smartmontools,--without-smart,libatasmart smartmontools"
 PACKAGECONFIG[smartmontools] = "--with-smartmontools,--without-smartmontools,json-glib,smartmontools"
 
 export GIR_EXTRA_LIBS_PATH = "${B}/src/utils/.libs"
-- 
2.49.0


