Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ED6C46467
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 03:12:38 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.4704.1672888353219063437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 19:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Otfhf4YZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 7so23694803pga.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 19:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+UQqheO5XQhkSkbOomfZbb1vE8CP4b9cl4stzy7d38=;
        b=Otfhf4YZS2iKiLKL24abk8DAWfIsM0pRvUxSYiS0td0kmhPZs4rSTt6fKGKXdoA/Nx
         ENIPNTYgsj4XGy8Q7e07ZS9Pk1r6axqBtSTTu/BeY+nJhDfkAca18aVUZaXBHG/1pl5H
         Z5xo0kVLDsxGNjr4kff4lTclyDWeJ9At3myq3k80BOmFX1+GpwvvlMtDqB2hESkuiMrt
         7uvOnRdsZ105tDUOxMf3BA+FjUkd71ewX0JnpjOztPnBeDn6kdSJv3lVAzAqEFGNuBe4
         htbuhR9j5WedA+XaL4ey5KDTK/vn38FGon0Xwi0YYtINuJBr/v9AkknOgYM8XIXnaPWe
         sT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+UQqheO5XQhkSkbOomfZbb1vE8CP4b9cl4stzy7d38=;
        b=gUabQCdvIhgGxrtW5lWvWGHAPkfnQmtWUwRILNnBXfexJ7QuKB1MtUz2ZRDHiU5+A9
         sBt3EUOYps+AsX65DfjJwRmpd3qLSeGWQ12n24CJmSInRok/xh2cmXW98PO27t7VqWqC
         ye9B5YP1LGVrGvHDPQjp05HZUB9dc+bAlbrwAx9iQXLpg3jFAYoJmDFpBziZe6vDfq0m
         cYdkJp2Z97pq7h+oo8c5N/g5lHlzGikOW1lkhuKwGC1MFeO3XD3um0dHJ/YdpEIlnmbY
         bU/tVwDU6/HxWt1+s2FWE8+KrP5uz4S2y3YJtsqLbCLpeldHz2mPLTQTbPmQcf0taCwY
         A2kA==
X-Gm-Message-State: AFqh2ko/bG7f1FYyskOLCZd1u6TdbodjMYhy4RQn/vCDfLOcaTHUr2Or
	0wFpqQwdDueDownyYbM87qlnYm2NgSY=
X-Google-Smtp-Source: AMrXdXttPW+IGUvhtsBrwvqhXMbneFDihvaL567oVrKHWmSUiuUEzFxsSvxCDjvHJforp8QnxS/RVw==
X-Received: by 2002:a62:148f:0:b0:582:46a4:87f6 with SMTP id 137-20020a62148f000000b0058246a487f6mr14990488pfu.22.1672888352185;
        Wed, 04 Jan 2023 19:12:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id 123-20020a621881000000b00528a097aeffsm23141757pfy.118.2023.01.04.19.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 19:12:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] nftables: Upgrade to 1.0.6
Date: Wed,  4 Jan 2023 19:12:28 -0800
Message-Id: <20230105031228.4126802-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 03:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100407

Changes are here [1], change to xz compressed archives

[1] https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.6.txt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nftables/{nftables_1.0.5.bb => nftables_1.0.6.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.5.bb => nftables_1.0.6.bb} (95%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
similarity index 95%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
index c5a2968d18..789a493127 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://0001-nftables-python-Split-root-from-prefix.patch \
            file://run-ptest \
           "
-
-SRC_URI[sha256sum] = "8d1b4b18393af43698d10baa25d2b9b6397969beecac7816c35dd0714e4de50a"
+SRC_URI[sha256sum] = "2407430ddd82987670e48dc2fda9e280baa8307abec04ab18d609df3db005e4c"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.39.0


