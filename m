Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C89C0015E
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 23:48:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1787.1689205702587770273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 16:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jDsZHPcg;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b9e9765f2cso849915ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 16:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689205702; x=1691797702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGtGrO+J8AMPIEyae8LlZx3tEbDSZGdqLR7INaV4yp8=;
        b=jDsZHPcga5hXRpc+I01byWqvDfrlg+yEE/O18mDbP8EdtMdB8iy6SQtpDtIQICG1NU
         JHbze2DigUnhcY9M2cGNrFOJQxAJ3e7O8QrQNXqDRDNwV0jwAiUS5nXA4HFtzpqOyfJj
         qEp7k6AdbCkWExEz+sEuce6yZ0UfzZhemip9SpR5n4QI9gTs1A6dDQ9vfO8h7x/53Wnm
         IVuaSuNOHY0ak8M2QPXL8ykONYIL3/1OH6zKlftj0T23sfzW3ES0kQC6oioC56ArHoRH
         uL/noUspAhuPmDE3KFoebETuvJln4ZzEVo3fK3dVKjY78ZoWRD8IqK8gXFDKiLXCVyev
         xkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689205702; x=1691797702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGtGrO+J8AMPIEyae8LlZx3tEbDSZGdqLR7INaV4yp8=;
        b=CJcjhreWYvWsov68uipI8VVA9djDHcxzEk8AsFCH8KI6uFbPJ6rS3ffhJQexoeVkv0
         uLI+iG3QhU+VFd/Mil/GGwMn9Xc2qi+zZue21BQw8UCnwU4S5Hc4aD5Xiotq5+v25tQ1
         J8m58paD/fjqhqNW8aaLRE1vbecX+2bR5OFByw97kAZAhwXsGBpqMde7Pc+oh5F2XoVo
         42tow5Si8v2eG9ZCRxHtlqt+Ism1m2+RsS7rczFLCzDuxFLBMNLhAU7NE5Y9kXl8j0Af
         kG8ECDsd4SemjJcthWu4PsdP//Jc6uLQX2jkKHvmwkOZxzn6fjQUxfJpbUvTg+eniYMC
         3fFA==
X-Gm-Message-State: ABy/qLYTh2dBRvNMf4r27pUPOAMbfZWMZSTbdIRY0MZYDNdP2U6jZmo1
	gWsCQPPq2hAJYtaFCqKhBzRdENELqFw=
X-Google-Smtp-Source: APBJJlGHUkuxyVbAaWJHOUxvCWy3wBmTcel7TiApmnLtpE9RwQ3Oulu3GV/bqpdaxoSVYzHJtIZHTw==
X-Received: by 2002:a17:903:246:b0:1b0:3637:384e with SMTP id j6-20020a170903024600b001b03637384emr101414plh.25.1689205701725;
        Wed, 12 Jul 2023 16:48:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::9429])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001b9d335223csm4545831pld.26.2023.07.12.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 16:48:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] pcp: Disable parallel build
Date: Wed, 12 Jul 2023 16:48:17 -0700
Message-ID: <20230712234819.1008911-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 23:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103848

native as well as target recipe often fail on AB still
therefore re-introduce the patch to disable parallel build
to 6.0.5 as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index b2d6e130b4..4cafa7234b 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -36,3 +36,5 @@ EXTRA_OECONF:append = "\
 PACKAGECONFIG[qt5] = "--with-qt=yes --with-qt3d=yes,--with-qt=no --with-qt3d=no,qtbase qt3d"
 
 PACKAGECONFIG ?= ""
+
+PARALLEL_MAKE = ""
-- 
2.41.0


