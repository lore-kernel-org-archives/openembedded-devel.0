Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2059ACCF2D3
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:30 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9885.1792302984161560084
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mkT+km4F;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2778063eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302983; x=1792907783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pxlf1g1uq1vJoMCuEHksTcSBClw4cy1ntqAbJzUb7Rs=;
        b=mkT+km4F2vvIa/lfMbs57zNlGGntoEov8JCkRI5p8EOVQQMwI9S7NDxbqSTnDZbiEq
         JaAH1UCedPiSwbGKVpasIN+jizEObdO/IGp8K0oDDVbMqNgnQDzgB96mx1Q6BYyppE6o
         vdotY9Bt+RW1CHYHs+ppy4VIeo/FmzmhaPH/aYz+s4W6qSq9GfJQBBALZZ8PHt6T/r1i
         2ueS7/dH85FmeycTpa7z8kJDwp4p7fNbrs+ydTEXKoTFjz/EONuZhuBOBVIRTLj/WtHO
         kOB9LrUOnFFXWziKWgrp/9u346Gw0ZWePcjZ/q3J/sO9sa5bzAIRmvYinqKhDP9ZDTLW
         YnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302983; x=1792907783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pxlf1g1uq1vJoMCuEHksTcSBClw4cy1ntqAbJzUb7Rs=;
        b=CFdBcoB6n0EAJG/VH1Sb+xS2O6VSd+lAaRknG4StituAFPAkWQwOEyqRbujhzSuiMw
         dhj/isktKkfNDS1zhT/RcTNABbp1RYd5FyzVcYfwbYjXWK+aWF/yk59MQZY6nfa3f6T4
         bdbp9FVUM9c23b1zMekfSjKUoGjSo/E8mSKoyDsbU8xbKNBfAWzgzEm3Ev7iNhnABIe/
         0xDwctASwHxYQScAmNE/KawEaYdHRTexuGDMT2DSyX4u4vqA4Pt1Tphps5SBP++9e2t+
         trd5+CWvsRdsiImQ+H3pS7Yjbr1GUjGXZOhJb7XZTh6BU1VOZ/NrQo/bB97W2JPc9mtP
         k2lQ==
X-Gm-Message-State: AFq9FYL0UDSLJLRFNIA8q5LxOgYws8l7zhdbBo+YOOSsZckjCRuRdNrA
	VLbKsPU9MtwS+8f4eejlU9dPMPNE4tK1UWLrPnNq3ivUHbQM1TDcddAEOkkwhjlGh/M=
X-Gm-Gg: AYBFou31tBplYM5byS22fqQtmoDicnSqAttJOvCDZRMQkKhGRraTawXftHLBRYZcgLS
	+sa3z/agACzNLhIVqvIXJAGxjzFcXIz8GCg8AlrCQzOfCI5Nu/g+zg7zo+MNQn/XukVMKQ/eXJP
	Esjsj+VEtwWdsx7P/VAv18zw7BaJjJvR4p84kllry9X0NvfsMbHOUoFE7qSAxj8n0t8nb0nxgrb
	DmqOGoZuVQB/Jbz27Y7S5DwQSNnNEOiZpn7pEWPEYRM0ABrS4ZpTQ7e1hL20HsLKjrakk1DEs2g
	df6lRhBdhHGsYPo39ea1unC4QfY41qijJR2bkHd9rXlT4kOlYhVXuTypTMQYxflrtCmA/zA8jnz
	As897JztZiXmfWnK+9uDI0D7kUpCDqkpOv3ArnkF1w4vOKyUpRaJGbnoekAxz+fAZPPksb/Wpw0
	GgVtd6Piz13TRGWg9TuH89YvULswJL7zUHqVjC0tzS2r24lI/2QTGb63lCoroE9/yspDJSaIGSv
	rRLrBEbeDn0awgfRktSZc3VWkIZBDjPsrlyhexGQY5UGIjaXYgx3ppM/4J2HLqS9aJP9p2Y6/6A
	PtwfzsPGMa7NJ2/9BoZKQdbjL6YYhRvEbfyrz6wHIvB9BXEJp3FcSSXz8pRb+RT3LALW2pqI0Yz
	2Nrq/9986ryXmb39K29z2TYensMVuRzK1iwGdHYHmi9ERmmvjH3bd9AFclAZqDOgyNSUzbc7P97
	z69Px3u53JBBMGAqcqcPrkJkTaJ3+hrKhTEENKa2jP+ItKXiZ9uDG0fJk0
X-Received: by 2002:a05:7301:2f2e:b0:35b:b3fa:40f7 with SMTP id 5a478bee46e88-361a33234d1mr5906119eec.38.1792302983471;
        Sat, 17 Oct 2026 22:56:23 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 11/11] sushi: Mark incompatible with riscv32
Date: Sat, 17 Oct 2026 22:55:38 -0700
Message-ID: <20261018055605.179605-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131093

It depends on glycin, which is not available on riscv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/sushi/sushi_51.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb b/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
index a6c93da10d..f083618bd8 100644
--- a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
+++ b/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
@@ -55,3 +55,5 @@ FILES:${PN} += " \
 "
 
 RDEPENDS:${PN} += "gjs glycin-gtk4 gstreamer1.0-plugins-base gtksourceview5 libadwaita webkitgtk"
+
+COMPATIBLE_HOST:riscv32 = "null"

