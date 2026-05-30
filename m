Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E5DCD5BD0
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 12:01:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5347.1780142498716366828
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 05:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=amBH1iEE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso34625675e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780142497; x=1780747297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irKHCof1fWL3u6ToN/u6InbeUszCEby82SqiarIbBKY=;
        b=amBH1iEE3f2UI1xRB2XWcikYllOO0K0t4+p9fEK18KMNPXUOLdVuL+5xLWk1Q4ApXD
         QdM9ciQ/NmlruwdHuQtssmg9HS+6Q4jbpvNJI8Gwn6nZfLwkiCB0kVi3uz0Fsh1JtloI
         NDzYSpw5exVdNRSPe86ZCy6XHwuAy7zGwyD4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142497; x=1780747297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irKHCof1fWL3u6ToN/u6InbeUszCEby82SqiarIbBKY=;
        b=hG/WiJxhBboBG0kEzXys0S8Xg3yXlEfLzXp3bzjLcMUIIn38oMSaHhLDCpLozfAAD5
         UM/0g+xAs1PvWomYTvLyIRfo+C5nMbFkZZ03ccoJhv+HzsMw4waZ+MV6KGlxCaoU2iaw
         2vDRbE6mK1UhvDKyiRB0vk2qKz6AhRg6ZOGSqlk3S0iM7hrs0Eg++6j7aEmKkzsY8spl
         SJAaMspCNggg7+e7+Cvv4SQTN8bYifjo/VhftJMcP6KQeOJubaFHhsNTn/9EqeASubpv
         0Oo5RBr7x9/sE1qbMW8syOksYgFveRnPA1NlHyEkY7oO0JlgwHuWLTFAVmmz5Bq1ggq2
         0Jiw==
X-Gm-Message-State: AOJu0YzmPsVony+Xo9gSLeve4eDltVj1WrOn+sjal9wt8ykSmZKs1WaU
	PIZJrH/HQcJZz8M7LGxILvz62mFEn1oaenmJR/Gnaqg09gERJ+5/8USbhyK+ai8wBqb2r3vH0J/
	HRJpNmHQ=
X-Gm-Gg: Acq92OGzgDXFMO0FcLSfTl250vgCTSj+tJbMHGCGSt870VcWKxNcsePcAoYbhTuqSKs
	hkEKKwFi1KHJgL1PtvctXkZCd0O6ztXDppatRF+qtX0SLhHgKmpEznDFLEZtzDtgqNlW2uYHZJr
	V3PFkrYuQXU+jQqenISS2PemjWpWALP8Q+m6HMAQupSWFjsHNHoVARYZFl5YwTgJVD1/8+Gpo44
	YVswyjDNf/QXKVd+wNLGrKFmJtFWzRuiZo4Zze/nNH1+HOBOPifoDH0pEPFXRIRhvwcyjyir648
	94aQ1M1mKRhTFBboi1PjBYPICk0tGa0/nNO1W5u+URrrRV+w+GJwKxn+H1ZYkmmzDt6SnM6wktq
	wTw2OCBvN8vACcrIBaE61OtxUVxP6J+wgx5RyJ6gM3UgBs0BE/tUrTdEg/w4tr9scaWtIyBy7Wt
	FcCsUckd1JMPCIO01aF7wfxq8jLdokMSC/V5xVyQHuVOVF
X-Received: by 2002:a05:600c:46cb:b0:490:601f:d784 with SMTP id 5b1f17b1804b1-490a29e434bmr61635495e9.2.1780142497182;
        Sat, 30 May 2026 05:01:37 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0a89sm120582975e9.7.2026.05.30.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 05:01:36 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH] unbound: upgrade 1.25.0 -> 1.25.1
Date: Sat, 30 May 2026 13:01:09 +0100
Message-ID: <20260530120109.3938131-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 12:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127298

From: Filipe Pires <filipe.pires@konsulko.com>

Signed-off-by: Filipe Pires <filipe.pires@konsulko.com>
---
 .../unbound/{unbound_1.25.0.bb => unbound_1.25.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.25.0.bb => unbound_1.25.1.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.25.0.bb b/meta-networking/recipes-support/unbound/unbound_1.25.1.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.25.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.25.1.bb
index 8e0d3f346d..7331fc01d1 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.25.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.25.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "25fe6020248df41f891c921b254cf91d3d55f194"
+SRCREV = "75b6dba593d4fff000434cd64807c6ebd50bd244"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-- 
2.49.0


