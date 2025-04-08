Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A73C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 18:45:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.3758.1744137925431470382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 11:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0HYYOY4;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22928d629faso60921735ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 11:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744137924; x=1744742724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA0P6gYD+M4TCrE4/E2iCUtqMTRVxNB07+SZKDB3BL4=;
        b=S0HYYOY4IssGJUd8pJEPxoOIVUQbQZJQEnfmNO8mkWLDns32l57fKcIu1FrtqGcVCN
         Smrvt2t4Fg7uLQnk/nNdj3DNccH/ZaQ32rMMyp9Ipa2OJ4jzmsU42r73Nr2y2E3gcMHt
         vg39yH5TyI7k5nciIVnhLsBekJLuvvpDE4aLd5rEA9qFfpWPeGsgKntrgaQ4kIOLW1j7
         a0h6pUDeEEob8YV35YPq1nTMuzX2meVkO7e0qU4slc4N1tNowhAEzwj+qGoWOpiYEaY8
         tffkB6DeMq3Go++YlqrLHJ9s0YssV0Tu2kS/K/V58VN71VLHiJheu3E7ZuMn7hJk2p2t
         QD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137924; x=1744742724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA0P6gYD+M4TCrE4/E2iCUtqMTRVxNB07+SZKDB3BL4=;
        b=gjOdB6lUZoMyMZ900GpT7SufBqNpyccGiL+jRtVw0aaqu3feg7vk3qFDm496tIZDMm
         08UE1dIfYzTHQq824LujFn4g6blvmNuKseRPdIFVZ1o4sRhdg2xGw6Yc7r6As1ehmedb
         lpdSNXMMl2vYDbwlHeFKfX/8z4mXaXOn20h1A3bp3ofyDZtLmj184XfMxA4V+0I8qYKY
         7SVjA2LvV/TuNMv0R0s3hzTzHlqB3TlLNy4WC8XEi0LnI7gMIsWwTTF5yw7MyPZvhJ8F
         xuxBq58Wv1hP+d27gUNemmaXoVc5sbbIQG5SSq+YRqGUm9CeU5BK08S0+LpEaFe4Szet
         8cQA==
X-Gm-Message-State: AOJu0YzD/EJxrMoorUK3eX9UgGxs+bng/lE8O35bYNI9eU8aRGaW/2WX
	DcHP9YscQdWZxL7wHj8UuKiQBMc3bHuygc2jRAWmVmZLXyJz5RoHWDEn209+
X-Gm-Gg: ASbGncu/731o44tnmH8/gWgPhNtkz14bAXLg96j6zIi2IroJgYn70kw2VgsyzU8irER
	/PawZ+ScvkqR7QcT0+QPVY72V3NIERiVn150gBCe/es08mXnoe6rfHCO8NwT6L4VH7vr7yk46JO
	GaFPPXIfyPvabePoBJyoMGj/FirBczM1q2o5v7StqAI4OWcew576GmerN/ZLIwo97lv8kuN/TU5
	ec++RhnLlzM4frQoY6YiBbnXIGE/pihhqSD/2gzfXNeQSLzzH2scDFc0ANZPhVO6rddMhMaU657
	Fiwjdag99gU3h5wytLHDTPyTs/okwpdBjH3s
X-Google-Smtp-Source: AGHT+IHJnbEEo5Mv6PYYwNouGuIPaCArXmemM0wA3BEMmLP6EoqcWuQswzehYyKuDVffLjMaqleZfw==
X-Received: by 2002:a17:903:2448:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22ac2991606mr4095025ad.17.1744137924418;
        Tue, 08 Apr 2025 11:45:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1ad5sm11288264b3a.12.2025.04.08.11.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:45:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-multidict: Add ptest missing rdep on python3-objgraph
Date: Tue,  8 Apr 2025 11:45:20 -0700
Message-ID: <20250408184520.1291149-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408184520.1291149-1-raj.khem@gmail.com>
References: <20250408184520.1291149-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 18:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116714

Newer version needs the new module objgraph to run tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
index 4e4d69bbd4..905cb7f4b2 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
@@ -13,6 +13,7 @@ PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-ptest += " \
+    python3-objgraph \
     python3-pytest-cov \
     python3-pytest-codspeed \
 "

