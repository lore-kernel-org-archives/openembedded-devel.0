Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53D6D2B941
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.19585.1730817405438914778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRx5cEp+;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so5144632276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817404; x=1731422204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqovamB0caC0W1BrlXSlD9PLpmTdEv/MrPQ6OsrtCFM=;
        b=SRx5cEp+jXzti8HnQuk8bdRBum2XCaV3+Nq50c0aXcVwwaU+rOtucPZnxObbMsBnbh
         bPKC/GxjtNR76IgVf6GPR4boZntFFAFMArIKcmH0OEyBaWRV+7bsWnNiq5Sdsj0pb+rm
         M2x54eirs4qA68OpfAjaEH/wboCX3vTuzhzf4uMHmkfnCnuD86lnmHrlJBD51y9qiX0G
         MtuUsG6uqkRHP/RJ4V2DkrRk5EerBQGDdggA9YH5EHws+otP239hCSF1n4V6dCayYxq6
         hqCftFO2z16EPrwyzv/fOeKXlK3SkoMuuoMy9R3sZRkW9Z/Mnib1yXL8/9uRm7eJm9y8
         sBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817404; x=1731422204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqovamB0caC0W1BrlXSlD9PLpmTdEv/MrPQ6OsrtCFM=;
        b=XoPi5WSyNKZb9HhigI78gvqEnW6eDvUSYhRm/lZuMZD/sov8eRN7aF8BlEJHyrbVpc
         ZwoFZYgsw3cEA0Y4ou2k/9bnoTCFyqvLp5dwVdxRF3Eo740zvbce0EDg+hslaI1sTc97
         k9WpYlonnIsaiiWOc5O91en9qcs0u6XGO/ZS8q0QpNKNfOw6rrvc1qRhMYkY4xhZjKSe
         4K1T/zD/aKn6uKj54N8RzHZd+bIsjdnBOjrboNpseEexCDzOyVKFK2Db/7bTpq6R01nD
         rIuVb2JqERTVXLNTr8gsOQXVwK7ZUnRAYZUjj64McMSSJ3zS9+sWPsRYuHxKVAu0Cxj6
         olmQ==
X-Gm-Message-State: AOJu0YzPNm9VbXSeb2PMgacmrSzsJN6yrEOBFSN+0sqEzdeu1fOOcPyo
	Gdk/AEtBpvE1fSqN7dpcCCtavG0csNS+w+NLpwV4RP34/zMv3Yxan/OEOw==
X-Google-Smtp-Source: AGHT+IF28p6r9rdxC+OZ7O1udElN1vLJI9QTSX5XI8psFhkzCnJx0rVvp9R6omdSHp70hWO9LZW9rQ==
X-Received: by 2002:a05:690c:c83:b0:6ea:3313:fa1b with SMTP id 00721157ae682-6ea64c1cd41mr146415637b3.46.1730817404507;
        Tue, 05 Nov 2024 06:36:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 12/90] python3-nmap: upgrade 1.6.0 -> 1.9.1
Date: Tue,  5 Nov 2024 09:34:37 -0500
Message-ID: <20241105143638.2301245-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113430

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-nmap_1.6.0.bb => python3-nmap_1.9.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.6.0.bb => python3-nmap_1.9.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
index 2293e3ddf8..25e382088b 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[sha256sum] = "892b5091cde429fabfb8ba63382b2db8fd795193ba147558d0a7d5534c956255"
+SRC_URI[sha256sum] = "8465cfb013f5cdfa8a1050c40cdae600b581ee32f1864ec404927aee49b4262c"
 
 inherit pypi setuptools3
 
-- 
2.43.0


