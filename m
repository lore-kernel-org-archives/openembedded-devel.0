Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16B4CC6B1F
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:26:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9336.1791969961206885699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J5iVWtB8;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso77587b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969960; x=1792574760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rqa8FwGsvCcdMRqM7gKRjx2sgMO1lEXjf7WI5tBhJ/c=;
        b=J5iVWtB8tq86Wsarz1mBCP4T7WQ1RRComVC0B5bv1S+ziuw3GIBQl5luQLasdiyjj1
         zoh4G5LT0PaBy0CSyO3Hbyj83KTz3KZ3JD8lXw5RBd/DINmu7xPu06jmo3IAD3FUgOxa
         syz+pGL/fZ3AJ65m/se50WF3/a17oehBAbY6meoOwFB3d9ELvgn3Cq6PMoOoS5EP3Ipx
         qua1h2LhNNJwWcZJIVQOVhZU23P/kCFXG95UiEq9ju543j6Mu7aUleNiaea9Zxolu7mz
         uC33cRjAOC/iAhgzlMZCOKEqCRRLqs5fhzNROe7SdfvrlAQ/GcioM4RAqoxKeM3yYtWG
         UrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969960; x=1792574760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rqa8FwGsvCcdMRqM7gKRjx2sgMO1lEXjf7WI5tBhJ/c=;
        b=HyKVkgPsPFw/G+Ucx6XGmd40wSZ8UPAmrXdYDt0FiOMLHa+q4zml7DBdvNC/EyRULY
         imE8t0Nba5K99n2uzS9XVhSVQ6aEz3uFCruOuXetsM3wTzQKu8tKPI2Mf7miuzlx+yHx
         7HL3AiF3HVKpjygMM/JO4EkAkhtGcKTnUT2WEg0lFBTdGTx4Qx0SFq+CXddAAL5nvt7y
         FTx7g0AInJeDR2+dldiTL6AYgc50+gndoBnWXv5sPgeLomRKb9CX8R5VSaLetL2GTHED
         WnWov8V+AB92BfOaYFOf3pxPXV17vwDzvp9/r/0fxpTS5ojjADaXJw/OQQbQ89DljiXt
         72xQ==
X-Gm-Message-State: AFq9FYJdLqf7tPCWr4yChDSBzlO4LeLOoriKPqD4HeDZc4H0ldg9VDnk
	Q51kT2iyAjXxTcKw4NnSLQ6SH2No4vXAPecihwWdtq9ClkwFtVAgwP/ML0vj7g==
X-Gm-Gg: AYBFou0EQgvzucjXLbKXkFfzco1uOWfaFVD09FXidFUD2TjUm7tQR/W45nEEJ3U+LiP
	/U/JRbYv4wbDMGRz9GM7NG5C120xqdzl1qVq0FlGZuKN6EmifchGinwdEKklvta7HWO8Hwv0ya5
	RfyfQfFsBaxaomc3Y42fn0zZI/qU8UfXb0RaxyOP9F27BHCQP2aJzq2bvLoWvXZ1r+ZUAe4WGHH
	Go1bBjnHcuFJaRuErfp5ggFbic0N6/lTpVXQEI4x3lC9AebVO7k+HpGpYNRp68mp/vny27KrNw/
	kSQp1xHN1/Z8qwyptJdfJanidhCpfIVmHmT1Xw4EAr7h6YYa3lqCza4KIOo2BgKtURmMxjOMsdI
	jcy8c1TU0Dk7zjqNwCMPZ/rdRtDALbigA5OcNMfe+w4U8OFhz3np7lp99b95+Z9lIrHizBF0hG8
	sdZb/3CXI2/EgS7jGhQLpFe83ZqlfPm6FRGeJDSjuD1o4hFVohHJq/Z1uS7c/6qS2K7cjqeyAWK
	+60BWvS2B7BVeZArgggUJ6WrX2axuXB68vbcRo=
X-Received: by 2002:a05:6a00:4b02:b0:87c:b126:8e4d with SMTP id d2e1a72fcca58-897c3ef9479mr12816474b3a.3.1791969960512;
        Wed, 14 Oct 2026 02:26:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:26:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 16/17] libxmp: upgrade 4.7.3 -> 4.7.4
Date: Wed, 14 Oct 2026 22:25:12 +1300
Message-ID: <20261014092514.454505-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130884

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libxmp/libxmp/releases/tag/libxmp-4.7.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
index 1600686229..a287124801 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "1e0812137e4f9e15cc026c0c75af82d71d3cb5ad"
+SRCREV = "5d4f6aa2c7dcdf8e9cd8129fe579d45b36a302da"
 

