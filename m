Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD682D46C13
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12598.1769685429395149204
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PGphPTL8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so520884f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 03:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685428; x=1770290228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLKJ7PM9f9NEh1RXkkYvAuUowkW7fLjOlGGRV3aZ64M=;
        b=PGphPTL8Iaj+fxaiFIqhTDeRszUcDbrXvqetwJLykQgm6GiGkaQ83E5Gc7rpRz4C1S
         csnGExmA5dgy5jXndYXUDGTiN4z1zB8ahPAeSlO0OTIi9zWcDhepU/6SuUZYSUKPaDtE
         L9x9FMaM9jCeTRFkE9XhGa76wMEacBdwcuIL2mICBaWNcT6Z3P61zI3kEKxFqNBkRBRu
         t8+i2biaVCeiEhuleyv9eGka/NVMQWyXstuOaxYLodhHgtD6I2LxvRSpJ5VjVGp2ao8K
         ZGtdxsRKhjfxxYHDnWUPv2PjHNgy/nJWY7D+lu2w8wpBT73KquUHBOwEfiEpSh05IMqY
         FtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685428; x=1770290228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLKJ7PM9f9NEh1RXkkYvAuUowkW7fLjOlGGRV3aZ64M=;
        b=iufPUG8vXV+LWQUSZNIWpQYuC1wEBreioSOJzDM01wsKTEpo6zzwTWGTfF4ugbZWjn
         PeX/ggNP8Qz65oFzF1aaJYpWAbnlSmLJQ4h4RLrCiOtnqxVAdDx6Wkf0UeZFpLRrqlgE
         nT0m3CB5EqMwFxWZ3dnB6fUMYFRU/6x4OoN1AmRjbGccqrDZmFsrS33IHGA1D6rXPVLJ
         odRS0V+bjgPgVZkgNzc/cvUp6oRGlRndl62QrQ2JIyT/nwVb/r/dxi4BWH1vyOj4sqGs
         y8cgpNI/jqctUBAxh5e+HwYS0I/Zs+kBdWKEcCfukDrxaAgWMUkZ2bsPL9PuXVzCLoo/
         c5TA==
X-Gm-Message-State: AOJu0YxH5nd83gFr13siG9+SffjpxpnRDQycYQViW/pQ39HFU4VBg3X4
	72S/8Fk2+Z7OEzdhRC4oGg8TzXAoa83eKYl834H3if6OHgH2dNEo8rpORj1NXA==
X-Gm-Gg: AZuq6aLDbbBZD4N7YNzQPwgZVEUSdGRxNVwVXuaYgdFklPJxqsxRFmoIsJcRA5Ow/m4
	MvSGblkkzy2p5EKt3qNH+oIiLrDORxgUIOop+msPB24XmGS/NSoQqmBgBydH8J88z8MKpQKmNUj
	T1s/zIQ2lUD2HzoD4gEa+++w5GcgXOo+lxitsuHwPaR+Z3Hseb48EIypbAxAxK9Vf1M0tHCzL4o
	gRHNFLZDHNA6solfFXj0jCQsJV2HYqfvs6XCG13indTSUz/jiN++b9drXs9yiDR+T1Fd+kgJD3U
	kORgOa5c+2pU82G4G2+8oidKW3BYDnENaalr2cake3SxfmTaDkV8R3C5qoVg/1MACCOcxDbZat2
	JsjRcevZartUHACaz9ZOh0y7HlI6vJJQdfvFZaaXRg8bOoKxWTHTfttF6yxcIS5+HmMGKcYNp+0
	qL5rVm/gUq
X-Received: by 2002:a05:6000:401f:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-435dd0b9073mr13131074f8f.41.1769685427697;
        Thu, 29 Jan 2026 03:17:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm14718443f8f.1.2026.01.29.03.17.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:17:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] iozone3: upgrade 507 -> 508
Date: Thu, 29 Jan 2026 12:17:01 +0100
Message-ID: <20260129111706.903623-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129111706.903623-1-skandigraun@gmail.com>
References: <20260129111706.903623-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123988

Changelog:
- Put an end to the (&*% stupid GCC breaking builds for no valid reason.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../iozone3/{iozone3_507.bb => iozone3_508.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_507.bb => iozone3_508.bb} (98%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
similarity index 98%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
index 725b0af209..31cc72af53 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
     file://copyright.txt \
 "
-SRC_URI[sha256sum] = "1e8087ada056f5d8018ee0bc76686d416fc2251ed03038055dbd0af78d1e5ce3"
+SRC_URI[sha256sum] = "ee55af310a65ec97e1db214aebd75ee87f458b529cea3da37081a63974e8ace3"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 

