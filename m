Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD6BD40CE5
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.30974.1730839879860563414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKSBLX7x;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so4883669276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839879; x=1731444679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI4yLn1hGChVCYBL7V1ZgzzCTPGqizYhsqVkFnrW3Ms=;
        b=IKSBLX7xqBLaiwQub0M+7m5hoQR7tTFl9E8NH3LmCZ2YD70R4V7B8cPYZkuM/i+ENq
         GVZe84qJVeGWO4LjCfnq6gFMx55ozaJbiW9g4clMyFwe/mlSnB024Fv1f744JCDtdHrh
         EBjMbDY+C95L93A2dfWOW36J8X9WEUpUyKwhM6OqTsN87SfO+8yqIrXBPMyqSHjdZsgT
         tN2s6v5eHQUQk5fNqEnssDdL2DPze/Esh3NaKsxYu2F9e1w44h+lFLRZcQTuYMKEi2zp
         RFXnOGq9Xo6Ikjt4+Rn7VQ8C/Ebv+cI2Uj5x2vae9C1LJD1O+ZPtkTEE+teOJxQo/U3Y
         Q4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839879; x=1731444679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MI4yLn1hGChVCYBL7V1ZgzzCTPGqizYhsqVkFnrW3Ms=;
        b=mgcuFzdvzl6CV6iyWo7UTQR2hY7qr3VT0aKoaM0ZmRDPBXjDTcoLLwwIMoEvp7WFrt
         nvQk3l7g5vNxpaQTBgZRJ7kgKfBt6S5M/OvbsjNJO/4h6lOmi5Av8NmtXlq+fLGAeopN
         hyRcECMctTUUP0ciEwhKaMnW9OUwpj+SwWAcYtYx+elc00w1hSdO9FghuVw1lkcfAz8+
         KUk+nW1NqRdegAtqJ0USN1XKXf8VhmojNyqyKo/td9QT6H9/LbNldUXGo6oQPXj9rlIH
         MLdqN1s7WAE+01NWgBsEOn1KrSyDiXgO4+CH1h9xmBL79nwYn8ZP6ZZ8VBgKL51U9fV1
         1i1Q==
X-Gm-Message-State: AOJu0Ywmr5EtYLsX/CSBMvSu5usW808vu5tDXnJS4IQYtzmc8koBwRfL
	g8Gxa/MrYbEXqiBq2HziGdUgoCHgW/OBTGM414BDBbDmXFoGmrpkqjYDPFXE
X-Google-Smtp-Source: AGHT+IG3RPZAraRwQSZUZjpVqQHdEgzyTuVkglewKc6s/OFMdK0mroSgstof2UE23c5STxVOl7Kfjw==
X-Received: by 2002:a05:690c:89:b0:6ea:3313:fa2d with SMTP id 00721157ae682-6ea3313fd13mr262518907b3.39.1730839878287;
        Tue, 05 Nov 2024 12:51:18 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:51:18 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 141/161] mscgen: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:47 -0500
Message-ID: <20241105204707.4155-141-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113657

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
index b503506a2..8b674db92 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b1e6a340187c1cf716513439d07c1d79"
 
 SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${BPN}-src-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "65c90fb5150d7176b65b793f0faa7377"
 SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23"
 
 UPSTREAM_CHECK_URI = "https://www.mcternan.me.uk//mscgen/"
-- 
2.43.0


