Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF1DC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14715.1782634300390296499
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xrsb1f9Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30e9eefa268so1601512eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634300; x=1783239100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEIjq86GayijfNWrVlY0RHVeRHczhTSioFotPTt9j2w=;
        b=Xrsb1f9Qcl5aDn8y6bUk+SSoQeJYTMxX/CfGlrVQ05RLCbSAiZcy11BmyROarBNFaT
         +U3FJrGX2ZFQC9ZjQfbtTsfqlvGomT5qanQBIJjTgcNGZuL6sGMyc2AVMozfWwAsUxku
         xYLxcbsOljpczy71r8PEuo7aWIo1nRvUyDgbLwzVg1zkYLtVjez/3bIV/LZREdE4n+zw
         HAB/EBJTc8sWh/+giRHZ/F6dQBgNr2LBiaQN47nPtXv6BpR55WkyYMj5yrcP8k5MzQBj
         CH7sS7kI/bRMzCTieafGWvvoEiARbNpAO2jXpLw6nldoHLdKVjdeWPVSB+9IRI82QGfy
         krfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634300; x=1783239100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tEIjq86GayijfNWrVlY0RHVeRHczhTSioFotPTt9j2w=;
        b=FnGRMlCJX0XUMEG4/nqsEXs7hRgynt3/Wf+sus2SlQU4Hka342iAXzJMzEIDnt5oW8
         IfWm8tit8VQHBl2gcV1mEKhRFCea8bh7RfX/fMr/GjLrWGWCjcAndK++YbrcDCRRxlRF
         RW1wD5Uw+IF+ggEfsj+sTZhG7URuJhxKVCcZF5rjyQQ903YPgDw54+tZO04jmaCNrHDQ
         WT1pnOzxK3Rbj4q0yLmbx3cwxB67HW9aKX/ly+4tIUttu6unij7Lg6QdKumqs4ypTM4C
         APUkboHCV9jhPqt2cTSSYToqJLzpLFZ4M9r8dK4P4bpsBspllTlNLEBNM0pVHz1miQNm
         Iacg==
X-Gm-Message-State: AOJu0YyIwH7hxguaFEe8fqdFaxUore3nKSSHW2nXFvQWovB+PfpJHgZ8
	YGXmrQJrZddHQM9wbySavMCe5qbvNp8wYX/TB7JG6B7pH9ndBHdUGclZwlmQxNiCQG9bOw==
X-Gm-Gg: AfdE7cnWy7G6UjzNlY0DOfHuFHL7YSEAhZrtUViF900SwZVJJDYUBK7RoilOWKPe1Z8
	5a+vwfepPOQKrLDIq1wmNx1FSZ8BmFGDZJUG5usftbdOvBhpuC/Qrm4kVRFGOwZbOeTofM3AGLc
	hRA1lo7ynMSOp9wcsfesnZpNDb6bQ0D1AtYdnUU10+ozGf+YchRpdtUxufFLYcCRsK5Zlxq7KSx
	3sVsTJnBq7RAYHKTvepIO/CS9PmJMcbKAOzCSPI5tSH7ucaO/wY3GYW0b7GJWup6YPdDDI/QgwK
	vgr589r+JO96zQOeTlflaq2tgUsMQnzNUYmTg5agZR4HbmIzYkgUYw6hAiu0MKEzJshDPQS60Zh
	Ae0XLNusrmhawCEmnqulNpnnwHboXJUVPjcw7BkT1ykHdUdtRldMPMPLfjym2opbxFu4s8F/qMf
	wVf26FIiiUqE0L0JP0IvwUC5qBJzfS6SRGmMSSKg1L0SVujMrWhS2VAS7rD+bM6BSYlA3J1XTuF
	F9KKrI4UlcHJizkP6snt9cawmBcBAXOkpMR2ZdrFg22rM87qg6XMrk4F97NViEvjsZxseXYyc+K
	PuhnahYu+Sbz8hoAlWRhaujxI7JjtA==
X-Received: by 2002:a05:7301:9f13:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-30c84b9dcc0mr12567125eec.8.1782634299693;
        Sun, 28 Jun 2026 01:11:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 016/128] aravis: upgrade 0.8.31 -> 0.8.36
Date: Sun, 28 Jun 2026 01:09:27 -0700
Message-ID: <20260628081122.178348-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127826

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../aravis/{aravis_0.8.31.bb => aravis_0.8.36.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/aravis/{aravis_0.8.31.bb => aravis_0.8.36.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
rename to meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
index 950ce25363..97883d3d15 100644
--- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
@@ -16,7 +16,7 @@ DEPENDS += "\
 "
 
 SRC_URI = "https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da"
+SRC_URI[sha256sum] = "246deaa0042a387ff1bc00332d0fb80537ce14abde2c28d1a54c91f17adc51bf"
 
 EXTRA_OEMESON += "-Dtests=false"
 

