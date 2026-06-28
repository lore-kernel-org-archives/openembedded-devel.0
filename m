Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B936C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69146.1782634341752842798
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HYeHhRT8;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619445eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634341; x=1783239141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkhmNAFLUh9tIwU6GHawE7DbfrshgT5U6w2s6SP9w9w=;
        b=HYeHhRT8i9KkxJzi7sQkydia0G4+tvXttjrkvjEtH59SBrGSzhFFBvvGqIAv5rYBoo
         YbDeMZMsPTLDgCh0mUBUY6Vdc+wmJdlX6QaMnEK3DuQ52xy7YaEWlQKRvXG5eOMG8/Nu
         2FgrdTKSPjcnf81rhQlA/4FXdGG6T2XB4NgDRoc8MYMrmJnSqi6DvHRfahuzZfZDig1T
         Zk67LwkzxOeZ/vCKEkSFIlfADMSbFoFXQkaYf67pbsU3vLs5bC8fGj1q8GcnKDv/r1Z0
         UUOmtXmBcOXCEceguZHBUZh1SFVTx1BuOWu/bHMbgIZMIZl0BBzhbujFa4Gy3OXpFyn8
         fBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634341; x=1783239141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkhmNAFLUh9tIwU6GHawE7DbfrshgT5U6w2s6SP9w9w=;
        b=GmXwHgaL1D7BaoQ6If306/Xu6pSgHvqBZH0LVVCR9bk86S389WjEXBj1PnPSkR8NBO
         zalDu1Lk2O8aCE8Pxvgwe6aC60o3PQ5Rk8r1/dD77RihVnVTozzCHURQDhpZaIVKvSYB
         2tNNyVdjsghmZR9CqYKIdgW8nmSyy+XihyyTaGLw+gTP3PTVXDNDHNnLGo17Pi4U95Hx
         zhcAeNMPxeBdGdjhrT1TdL1loFezMmCqXdDSX2AZ08xkqmOPFP+Q9S62c5sRKGuYS5+5
         FmPhZIZMp+S2eFxDFr61QLKEn4fW6F02FPqLR9S0YqSXKLU9YLwGS3bXWzZgQXYQMhbf
         n6xw==
X-Gm-Message-State: AOJu0YxDmru/DdSmEMq4tswT3nDX0VgxgQoxG/1a6iSVym1C5KGXDFXR
	bPBLR+fBeV1UEyaVqksXpK/sfGweigGhLaVgcBJ8YeyZFDDY85hNoWGJELvYHLew8f6Mnw==
X-Gm-Gg: AfdE7ckFnKnI1hKWPWga6KM5bkrxg9v4b+JFMqglx9fyXzORIBwN36AQuba22krsRng
	T2RQFMOoKP75rqv3/GySouMdJ+LinBb09WMvxpE7lKfPVL0Lt5ORtmtHx5oJzCz5QJDDh2UTcEf
	wva1NyHfgOmMrILELaREfiwDva4nOfdErrkI4d+wxxxjeLQ0COfzOF80ihQ8cAnZo3EuSQp8PW+
	5151Ozb07RtzO0mCyHg4MgzEKpFNQPeqOj3xYjNi33KGhQ0mwUGUy5V6REH3NwFVhcvU+BLg4wb
	2j1fnNIUKVc5GR2xPyN3ou70xYfgPwTtKCh6X0yl9QlyC/0UfPj/xmwA9LX9cdp6WhUcfOIaGJn
	dHxRk5lEMdnT3wixFPn6nXixfZ1HdJsHo6avelEuQo2Ld5For1E6EH4wcPf32BxVDTMNiEmaaUc
	O4V1NzxEPJqjLAsv0YDVwazsNqU0HcDOpQZoqzA57y6MK1zeG8yrXVWLSWjdeN1JB9giW7fCDfZ
	CSQrSnEZ/sYXNtIacOeKyGRmsM/yt5HmlQZoT/P6SrWL/BTMga/qh8Cbtuw+doieMzgxq45WWb5
	mXtdYqAbUFbsMquWihyK6o9Mtr2E5Q==
X-Received: by 2002:a05:7300:a485:b0:30c:6491:49c7 with SMTP id 5a478bee46e88-30c84ba2e35mr12884234eec.15.1782634340965;
        Sun, 28 Jun 2026 01:12:20 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 061/128] log4cpp: upgrade 1.1.4 -> 1.1.6
Date: Sun, 28 Jun 2026 01:10:12 -0700
Message-ID: <20260628081122.178348-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127871

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../log4cpp/{log4cpp_1.1.4.bb => log4cpp_1.1.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/log4cpp/{log4cpp_1.1.4.bb => log4cpp_1.1.6.bb} (89%)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb
similarity index 89%
rename from meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
rename to meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb
index d51e51387b..72cca22ca1 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
            file://fix-pc.patch;striplevel=2 \
           "
-SRC_URI[sha256sum] = "696113659e426540625274a8b251052cc04306d8ee5c42a0c7639f39ca90c9d6"
+SRC_URI[sha256sum] = "a036bc6bd6044479e6c456de7edd042b060ea5c843e47beb75f59baea9b20e3a"
 
 S = "${UNPACKDIR}/${BPN}"
 

