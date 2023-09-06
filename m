Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949BFEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 10:58:01 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.5798.1693997876977409446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 03:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J4rqQsbW;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58fc4eaa04fso35984477b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693997876; x=1694602676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3ImTviAmuvTkiaA+AI9TBd2pA4t5Yv7PucFc7iqqng=;
        b=J4rqQsbWKyBOwWQqydh8QalESEVBKXz7jAWhelXsPZMmG7v3KdauC1n1JEn6smZmY+
         kSI6RjovQVMHrDGD1Av48Is3eq71vXbFELmVREnbIsZzu7AEeL4tQBMasnsFOg8WIQhX
         r/oJ19qwELSVHO6xsqDG/kjsHb4EcXpvMwX17KF6UhYvB3pudiVLCB8BOEW6esc8W1W6
         w0UVJE8ik25m71NW8x8dPNAUnIhybfBqSHL09+qPtVE7RMRPA1BdIsKSHwxl84zgXGCd
         gjykc5e6d7XMvxuYnnd8Ycq4abNIuN8nsFvhgIQEOvlLP8TVu55kWAu9X0YjpxFyjHMm
         xjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997876; x=1694602676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3ImTviAmuvTkiaA+AI9TBd2pA4t5Yv7PucFc7iqqng=;
        b=RT+jyM4HXXZzc8aWut6KQ1V1ffetulZ6xXSSLiwW6lycHzVXKfqrINzZGIOXGXkz+C
         ax5/xuR5ivHREulPFIGkd8mhqlSia/8Ci0CeEKNoGvsc+FJLft1O86O1sogPICESmfuq
         eyJ04GcEmV6yTvsmteV3lFuttFxUs1sIJC8O4IwXdkLRe/wrXOsobF8EcliBoJT1Wpka
         NlroLOVws6JK2tavIGFfgGr5wdNRwm4F5PWljfhmD3/BVVXEkbyRqQfm41olEiMI9sax
         jbg7yy8sBywjPaOfttMSJdcXK7Oub1oqNJ2uIrREn15cW1lA4YBH92dit9PMBGBzDTiR
         ajKQ==
X-Gm-Message-State: AOJu0YzafJLcYXdJp+1cyWSYiP/qPi122BL59NusVBQxtLnCLN7bhMn5
	6Wk8qaqpw3NBBaBLI1MRjwJlMG+nkqc=
X-Google-Smtp-Source: AGHT+IEebZVRb6oEWAJ60FQU9HMyh/sxb1JV6dMds/Al0CPRiz5HtvFVfPycQ//CGfrqaGAIKSt5Ag==
X-Received: by 2002:a0d:d7cb:0:b0:583:51de:e219 with SMTP id z194-20020a0dd7cb000000b0058351dee219mr14353356ywd.17.1693997875977;
        Wed, 06 Sep 2023 03:57:55 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:5654:1c56:e678:3eb1])
        by smtp.gmail.com with ESMTPSA id dg4-20020a05690c0fc400b0059590440338sm2425687ywb.43.2023.09.06.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:57:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/3] tcpdump: upgrade 4.99.2 -> 4.99.3
Date: Wed,  6 Sep 2023 06:57:53 -0400
Message-Id: <20230906105754.847690-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906105754.847690-1-akuster808@gmail.com>
References: <20230906105754.847690-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 10:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104776

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Updated printers:
   PTP: Use the proper values for the control field and print un-allocated
     values for the message field as "Reserved" instead of "none".
 Source code:
   smbutil.c: Replace obsolete function call (asctime)
 Building and testing:
   cmake: Update the minimum required version to 2.8.12 (except Windows).
   CI: Introduce and use TCPDUMP_CMAKE_TAINTED.
   Makefile.in: Add the releasecheck target.
   Makefile.in: Add "make -s install" in the releasecheck target.
   Cirrus CI: Run the "make releasecheck" command in the Linux task.
   Makefile.in: Add the whitespacecheck target.
   Cirrus CI: Run the "make whitespacecheck" command in the Linux task.
   Address all shellcheck warnings in update-test.sh.
   Makefile.in: Get rid of a remain of gnuc.h.
 Documentation:
   Reformat the installation notes (INSTALL.txt) in Markdown.
   Convert CONTRIBUTING to Markdown.
   CONTRIBUTING.md: Document the use of "protocol: " in a commit summary.
   Add a README file for NetBSD.
   Fix CMake build to set man page section numbers in tcpdump.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dab75037cc9c4a5674e08c3a55fff172fd6eba75)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpdump/{tcpdump_4.99.2.bb => tcpdump_4.99.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.2.bb => tcpdump_4.99.3.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
index 0a541acfea..03f1b76f97 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5"
+SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


