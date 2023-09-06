Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9052FEB8FB7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 10:58:01 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.5653.1693997877820557967
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 03:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fTAIyywR;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58cbdf3eecaso33508217b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693997877; x=1694602677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzGFAARHO8K4aMXbafRgrkReagm/7Fr3E4+gIm8512Y=;
        b=fTAIyywRPMVoUz7MDAR3nSq7pXKypvuOU7ypd5z1zqtqLd7H0eTNmGnt7dZjJiys0F
         Ipl90NF6PStmiVY2yHUkKf6SrX85sWS/tnWcgyXmtsihoTo8WATTbYDNLzMxyXx7Tca4
         s2YM9FGXnmXlGQQoX/EG+/75zrLh2hCIDrl2Igm9zOUB8z3Blcmz6LGxXAtHX+J9oEju
         ONaRrAjYHZJ8VFsVlH5HYGtR8/f/onVoOzA3PYI8dWqCNxK0AWERSL4Fs5Cm5DLI/uLY
         w/Es8hI8WjikNtOQfYhotEGRVxsHugtytVTe5Ewmwj/Yg1MWjtEIv8JArRGlTZr29xbM
         k07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997877; x=1694602677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzGFAARHO8K4aMXbafRgrkReagm/7Fr3E4+gIm8512Y=;
        b=P81FL1qbvSUsH2fX46+HtjTyw3wsBSqZOxmlzN9PR9hC/FZ9L0ZEcnXKW1QjWCPAH9
         ZHfubFZ8BC3941JnbzFVQCcNTB4VlM/tX1tCgoUm8QuagJe5qKxju0pSXdEyutcr8xI0
         H1zcQVpvJm8pzBTGH51cSrlWlOqiopBsxQLAZ/r/khhcdCJ6QILjvvTfibAGBPF4l6D6
         bMqPZP+Q5aKN7D/hqgyUs3NQRJc8HffCUOAszIgkglBh3dRQtTZpcTmVkbSgTCzbrsLd
         4XSwEfjemOXkmmJrCURrkGYKt6dIHo2te0EBzawFNK9RvZVQ3rWEdC4T+EqZwot2P9mr
         RMcw==
X-Gm-Message-State: AOJu0YyI1/M+SNYOnDEuumwNDBcdkyv+TNzc9OsS/9H2y2GpwCuM//pt
	tM3V3vfJAtWOS3w6+zbfdgiMl5T4+ms=
X-Google-Smtp-Source: AGHT+IGel59OgZLcWOZtDq1q6Yn6U9nt9UTCoF/BCzHDr86YQGqxZePxqQ2D8XWeMAhE8TkvMfsfnQ==
X-Received: by 2002:a0d:cb41:0:b0:589:f494:3e42 with SMTP id n62-20020a0dcb41000000b00589f4943e42mr16478819ywd.40.1693997876780;
        Wed, 06 Sep 2023 03:57:56 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:5654:1c56:e678:3eb1])
        by smtp.gmail.com with ESMTPSA id dg4-20020a05690c0fc400b0059590440338sm2425687ywb.43.2023.09.06.03.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:57:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 3/3] tcpdump: upgrade 4.99.3 -> 4.99.4
Date: Wed,  6 Sep 2023 06:57:54 -0400
Message-Id: <20230906105754.847690-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906105754.847690-1-akuster808@gmail.com>
References: <20230906105754.847690-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 10:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104777

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Source code:
----------------
  Fix spaces before tabs in indentation.
Updated printers:
-----------------
  LSP ping: Fix "Unused value" warnings from Coverity.
  CVE-2023-1801: Fix an out-of-bounds write in the SMB printer.
  DNS: sync resource types with IANA.
  ICMPv6: Update the output to show a RPL DAO field name.
  Geneve: Fix the Geneve UDP port test.
Building and testing:
----------------------
  Require at least autoconf 2.69.
  Don't check for strftime(), as it's in C90 and beyond.
  Update config.{guess,sub}, timestamps 2023-01-01,2023-01-21.
Documentation:
-------------
  man: Document TCP flag names better.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2e782260d0b6018614dbdea95899a4a0921915e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index 03f1b76f97..803a9bb5f5 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
+SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


