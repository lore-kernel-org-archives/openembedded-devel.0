Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0345AC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:57:54 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.1587.1646247473335412280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lwHn9J3q;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id o23so2391397pgk.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtm3eE1QAHERhaW86W1WwcC3bguZu8CiT44ZoyKoH/U=;
        b=lwHn9J3q4QzdEy1/2fplbqql65jfgRkBFIrcw1J+1nkZp8LdGTtwVUfwXARkm7vZSm
         sTc1QaMV0M1cXdMKWTHRNOrojz0PvHtd7pRdCRrb66QK/X+wQuDOlTbDtj+7o/fJkb3m
         pPwKYNXoeH/VuNuMU0N4Y4re73uuPVhd5TNqQK0ma3daLVVEahyXYcxEhQmWBdwxsc97
         bN9LZ8TnfFJAAdgH5yHieLyuwNBBhXBYRXdn58XeRVXLJHtpwuTtRkpD2mdHTpkty3gY
         vsmx96QhvGHDREz2znLfvacGYOAmmHdPWb5jCwXMhAyQFz9goRcLBqQINbU0NhqKSm+V
         5QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtm3eE1QAHERhaW86W1WwcC3bguZu8CiT44ZoyKoH/U=;
        b=lP2jrl/mbZE31LhULbrxmVtlyu14NvmnUmlsxwXPM3Eti/gzJjG/K6TAQdFcgCqH6a
         5GeFruQrT5hw42zU7nwJroPHcNBNh7u8OJSvSm0LZeIgLScmacDzVlE3OntNq+Sn4rZD
         k0ODG6GkL96PdR/lEAl1h2mDYU8MN1k5yMvx6PRAIMqQTipfSlw8TNI/Z1t0qtnLRWVr
         evY/JweVNnOts4cmBxYtSG/fXqI3Z8B9wS3bFDY8St6Tw7MlGpuUNoTFi4NR8bF2jl0D
         uoGf+CX+b/kKzolW7NiUKzIdQ+BNgl8Ja0KWpbmFEh1ElBnc4GPtnPusNF7dMaZwMPl8
         tO5A==
X-Gm-Message-State: AOAM5316Ynbgn8WbxqhcWpWBqPVts3hTDJ6dDqEQSnltD98KpyeW5Pl7
	rlR773FUjfurZg/LgcO+xdKeq2Chjk6pWA==
X-Google-Smtp-Source: 
 ABdhPJyvMCfqPDLmYJ1OrFUBjuM/K8BVwG4gGeb2bXzB2YEuU3eHbMMd+I7iDWl/0nNy3LW+QCsDAw==
X-Received: by 2002:a63:e59:0:b0:374:a169:d558 with SMTP id
 25-20020a630e59000000b00374a169d558mr26787010pgo.304.1646247472640;
        Wed, 02 Mar 2022 10:57:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm5560011pjb.46.2022.03.02.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:57:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-txws: Define PIP_INSTALL_PACKAGE
Date: Wed,  2 Mar 2022 10:57:46 -0800
Message-Id: <20220302185746.2402043-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302185746.2402043-1-raj.khem@gmail.com>
References: <20220302185746.2402043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95703

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index 7910fcd18a..c075e42700 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -13,3 +13,4 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "txWS"
-- 
2.35.1


