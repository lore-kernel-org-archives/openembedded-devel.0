Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A248C43334
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 03:14:45 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1963.1657941279965468973
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 20:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HiVcx8pT;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so7765653pjf.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 20:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vl/ZHH/adLXZN1VsRaMYeBz9uYtzNllCZpVGiB2/4mc=;
        b=HiVcx8pTEVVaZ1e6ilXDchwfb+sT3PjE+06j7kISSkjJksdJnmEbrPQzLqorZpBm1l
         k0KXmjxt02oxbuEqYx7l/+p2lY31TvFrZjmaZoWlDtZxtsA5OnX1Cq8iN2TbkwCHElzq
         7ZMcM7lQTmId+vCfko4tEq18WpWHXrTorI89lme/VZowWLkCDPz35pXHoZkeciJmX9nN
         ncN8yjNAe9knkr4MLNQtdQFpiwVa6IU4QNDVVo79uY234w9cH3nkFcWmW9jkUsr9COHa
         2eY3uFQO2dGdNLhHX0dNoepAJ5NwdjQIhafaNXwZVkqLTrVHuSIEApbn0z1C10Zgwiet
         s+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vl/ZHH/adLXZN1VsRaMYeBz9uYtzNllCZpVGiB2/4mc=;
        b=nUTDCL/ssBbouIOklo67N0vwrOmFMco2XT1aaIAbEzCW6DmaR1SRR2pM236tz/nPVI
         W5ihuolaTGGhx5bNd3+G5s90+xS0x01oN9ji4M1QoAtbnjavjKl4/a9B27+KmlTviNkr
         +S4nyNqyXoOE6AmeyJAnDtxSOzaU7QMO04JXMYaGJzY011fXGqelrjatS3l2q2DvDzLR
         TQI9FjaUCGnfujITSsrUeDqfGzEMhMsuyi2G/cx7/mP1pzOO4S6Hz29JX9tCyBA5Gdgl
         NmZ3wOc+S1IKgVwB7JKvbX9BHxuQm+yOtLO2KspGOcPxkt2hkoU9QZjwrf0iO4uG64KC
         cflA==
X-Gm-Message-State: AJIora9BpjMuJOiIdg4pwepPGNKuCXQRhbI0LgKu5O0IiV/P0xjn+DIR
	doC/PAo7N7xQQxbUhM+uD+/ebZz7N5nq9Q==
X-Google-Smtp-Source: 
 AGRyM1uKJo1lUBJLnYMuNRLBx1rXyPpq1ww15XRqEiwr7MuULN2L7smgHiKZkv6QjkIDsor5MObtvw==
X-Received: by 2002:a17:902:7406:b0:16b:dbe3:ee0c with SMTP id
 g6-20020a170902740600b0016bdbe3ee0cmr16424454pll.123.1657941279134;
        Fri, 15 Jul 2022 20:14:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 d8-20020a170902654800b0016c6e360ff2sm4279455pln.132.2022.07.15.20.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 20:14:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3 instead of
 python_setuptools_build_meta
Date: Fri, 15 Jul 2022 20:14:34 -0700
Message-Id: <20220716031434.4021879-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220716031434.4021879-1-raj.khem@gmail.com>
References: <20220716031434.4021879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 03:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97852

Adds missing dependency on python3-picobuild-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
index 1508273009..67cd1a2277 100644
--- a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
+++ b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
@@ -16,4 +16,4 @@ DEPENDS += "cups"
 # See https://pypi.org/project/pycups/ for data
 SRC_URI[sha256sum] = "57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13471dce350e380c90"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi setuptools3
-- 
2.37.1


