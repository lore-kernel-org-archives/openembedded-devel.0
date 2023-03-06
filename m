Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BF5C61DA3
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 05:49:12 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.27214.1678081750528621114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 21:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pRGXVs4c;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso12035467pjr.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 21:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678081749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sjP4jrk+DB4i4xEozXkfQU9rlzqJ+t/34PwSdP/DJA=;
        b=pRGXVs4cIXYV/nYi6bCEx+C3R0TWHhQ4K3RTOMYtJ3JdbSQKu7dxmBrVWVa9f9PSy/
         OJjvaCKgzMBSMxUTJ1olx4NXimD72W/pDs1W01qOrKxoeeS+PhnRcKSNa7c3CCqCS2tH
         xhCerrVaUVlhp2iNrewf9a91S3ZK993t33ypMRM1TroHv83Ex3zoJzg9Pc9MHmDvx2E2
         O+7K5erMga4Deec1uBB/RSVV072SvJSbWLT4owXB07gBlpkDmniR3QP2hUUqhWJyzC+c
         5DC5xA5WD9uyJ7OApUecyo5ulPzJZq/1BCcUFz4VLonYf6cXnZH7f61v6ZoZe7+XSZch
         wHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678081749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sjP4jrk+DB4i4xEozXkfQU9rlzqJ+t/34PwSdP/DJA=;
        b=kRI/y76TpbK0k1qgBEyarrH5y8QZAO52NBW2xikdfpcP4Fgx2a7ieybi+weZYlJG1q
         LVFs2rWzt0i7CXfzW1ZtN+aDoPEue8rmtZtFtKwGfJZG8MRLhI9tHG8nJFTLS89DBo/m
         bEfsUjzjfP8fKbQDMPIgEB9PzLJb7bZKsMf5ASNlRYSSOS7SPsSL1+xSS4Tuxzdv+DnL
         /Z7XalslPsp/0ezJetUDOr8WGXwPqwDcBNkOkCJRu29Kj5x7wzirDyg51KSz3wx2CZ99
         oqyScHmoTbvfglesI6sIwMYR0eZzbrjRvY9wrVsN+0b/Y8JVPvBP5VrHLSY3dAYVzUcb
         PCOQ==
X-Gm-Message-State: AO0yUKUJ8WEwCewHDy2SmRiayYCbQYt2Az6tjB7BMusFBIz7HEixhsh2
	NcDzslwFgtKCl6SiTfNcD1g4AOh7h5U=
X-Google-Smtp-Source: AK7set+i6nAGd01qlFULfA9+uToREH1wgmi6BIolxtPKD3SjK0FTcqLoEHrOse0CDlcoq4nXIlYfiQ==
X-Received: by 2002:a17:903:41ca:b0:19c:be63:a9ce with SMTP id u10-20020a17090341ca00b0019cbe63a9cemr10093575ple.4.1678081749265;
        Sun, 05 Mar 2023 21:49:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::c80d])
        by smtp.gmail.com with ESMTPSA id x7-20020a1709029a4700b00186a2dd3ffdsm5673753plv.15.2023.03.05.21.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 21:49:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] redis: Upgrade 6.x recipe to 6.2.11
Date: Sun,  5 Mar 2023 21:49:05 -0800
Message-Id: <20230306054906.3334993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 05:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101391

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.9.bb => redis_6.2.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.9.bb => redis_6.2.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.9.bb b/meta-oe/recipes-extended/redis/redis_6.2.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.9.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.11.bb
index 100c2a2a5d..5a410bf4cd 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.11.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "9661b2c6b1cc9bf2999471b37a4d759fa5e747d408142c18af8792ebd8384a2a"
+SRC_URI[sha256sum] = "8c75fb9cdd01849e92c23f30cb7fe205ea0032a38d11d46af191014e9acc3098"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.39.2


