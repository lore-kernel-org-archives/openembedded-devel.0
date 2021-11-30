Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA4AC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 19:37:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.82074.1638301039709715473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eBXyemSJ;
 spf=pass (domain: mvista.com, ip: 209.85.216.46,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso18286071pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bjxP53L+yFvjUoT2aDw3fcIgZ+X0kI/Q6EGFaD/vZgQ=;
        b=eBXyemSJ1YDiNJrSemIGFUXIIbQCW2MZl7CkqldRjFkBYShNVDpkEx3cdgGE4Funh8
         9gCeRMHmCoiLOLqrmQDxHIKOASUF4gTL8H+mnR0eOMzkk/ixd48nuKYWJy6z8drpPKMx
         A7eCqAzvZUK7xmKnMrwjqAJpqNTD3bdk3UyKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bjxP53L+yFvjUoT2aDw3fcIgZ+X0kI/Q6EGFaD/vZgQ=;
        b=OBzsBR1PhOHl4+DTsqljacGqM7xWEEBMp+MuWaMLrmQWS3qZAL6ymbmyAGZHIkn4ru
         dhR0uPbUJrbKggeDU1NILARmpS9qpbv9mRkoXBMXZ8EUJfCuDzSwX1HvLSPfnG8NojzA
         UVIIezCHpss6jBS4SLeR2wV1h/6fjWpotq7DiDORp0XYK80sgcpM3xZDyUVSCVNS9bAR
         a0boQrMylWpsNK5p+v+xaIhphVQ8j3BhUtcv2deutf1ckVORq+lFYrUlQzGyRHqrbgkH
         Hjg2IDnvOLrdQ44Smx0LApU9hHOrfiHovOnRH+MGFWVEJqLq4f/0lAmFRg06QeHYgQr+
         9gbg==
X-Gm-Message-State: AOAM5339hSmHDsLndpND7wwzyqNk9Xbe00uFmwHCXzWSNIpZBWVskdMA
	jkHNUI7Zjwj9aFhBJJFq4KiXk6OkIPQsgg==
X-Google-Smtp-Source: 
 ABdhPJzhu9sqedxm9DEQDbMWlVT+v9z+A32P3FMJfUJtoWQ3bcJJSz6TpYVgzhSlEM+vd8gwB3aaWg==
X-Received: by 2002:a17:902:c702:b0:144:ce0e:d47 with SMTP id
 p2-20020a170902c70200b00144ce0e0d47mr1319293plp.69.1638301038864;
        Tue, 30 Nov 2021 11:37:18 -0800 (PST)
Received: from blue (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 s5sm15171759pgq.62.2021.11.30.11.37.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 11:37:18 -0800 (PST)
Received: by blue (sSMTP sendmail emulation); Tue, 30 Nov 2021 14:37:16 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-networking][hardknott][gatesgarth][PATCH] ifenslave: Add
 branch=main
Date: Tue, 30 Nov 2021 14:37:15 -0500
Message-Id: <20211130193715.32154-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 19:37:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94150

master branch has been removed upstream

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
index 0db9e8a0a..5e547a462 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
@@ -9,7 +9,7 @@ inherit manpages
 MAN_PKG = "${PN}"
 
 SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
-SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.3


