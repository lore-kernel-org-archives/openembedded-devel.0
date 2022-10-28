Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF984ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:17:16 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.703.1666970232708140836
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ecaGCB/F;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13bef14ea06so6627124fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/q3MI/GktDQ+q74hNMhjOAvmgMsLxUpy+fgfA3ZQbqg=;
        b=ecaGCB/FnFvnMTUSDpjknPhFHQUKwm/reuqyTKlrALZ2WfWrunKScnRfF3SauqE0jd
         2QXc9YlOiDBQ/CBXDIahU5JL3PkVW04L2T/r5LCj3YvtjbdXAhxn1Nd9FPny83zxclaz
         omG5+lFmvTPw0Hag666cck8OPJL7VZ+TF47FgmSLojoDLoX42x+/6mk/yte9kGuKX75R
         lBLhRWhHPte5ERf2aUSaDkojNiBJ0b1YkZCM2t0TiBumNWehity7KOminQq3IYZ2dv26
         zE5pmob1rLv2NqgQ/EAxyZ9JEMO/vYYM6eLElzuS+ErzpaFU/0K7t6MaJQ1ZWRmNVTyJ
         7TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q3MI/GktDQ+q74hNMhjOAvmgMsLxUpy+fgfA3ZQbqg=;
        b=jqldZOUbUI7K1N6I9kTGxDyrvw7M9KSzC79ACMFCjfjEIVfI9vsCjnv0xmKvxnoGTV
         Qn/3QoIlOrdePyz6chyFBsA73u7GP27qY/06v4Sg0LSgtnJtCwjXiFs06EKssKB4QogH
         DyPRQuntUTkXIX7c4RMuTuhnBBc0Md2DKXW0/Th/Yg5DFEAfHRougIzyMFnjR6i1W9T9
         4/HEhUCRxVuy5Zl8uJ2TK/cPkOGWT3OZDa3G0d1Jm5ngothz7ma43dNQBIZ8ozvszYzQ
         n+EsDgnAirf6xBNJfm3HqpQoAjGowqVWCnRjI0k05U3wqtaJuBJwHd9uR/RtAwOMP2Qx
         rbfA==
X-Gm-Message-State: ACrzQf3vOezWcYsN4/wwGRey7x6ya/SpmGnRiDfDpBFEXy8DuZ9I9qSy
	prkyABhBkcEiia6ZnCtakncBVbgB7XA=
X-Google-Smtp-Source: AMsMyM47vKyiuOT+luLhyP7/JPxicvED8vhI34GCWLcYS85ZvIfbgj2Fm0CRAZ7XYap8YUotvmmBjw==
X-Received: by 2002:a05:6870:e2ca:b0:132:b262:9855 with SMTP id w10-20020a056870e2ca00b00132b2629855mr9792968oad.269.1666970231792;
        Fri, 28 Oct 2022 08:17:11 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id er13-20020a056870c88d00b0013669485016sm1670830oab.37.2022.10.28.08.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:17:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] libzip: Add native support
Date: Fri, 28 Oct 2022 10:17:09 -0500
Message-Id: <20221028151709.810423-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 15:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99337

Native tools may link against libzip, so extend it to be a native
recipe also.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-extended/libzip/libzip_1.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb b/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
index f4de8607a..7fb58de3c 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
@@ -25,3 +25,5 @@ SRC_URI[sha256sum] = "c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2
 
 # Patch for CVE-2017-12858 is applied in version 1.2.0.
 CVE_CHECK_IGNORE += "CVE-2017-12858"
+
+BBCLASSEXTEND += "native"
-- 
2.33.0


