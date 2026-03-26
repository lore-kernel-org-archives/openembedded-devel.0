Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CE610A1E6C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:30 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45491.1774523008230849456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KZB4znPu;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82a646c96bdso693206b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523007; x=1775127807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIVQT1rDTdRSGpjyEv7Hoiy43Ey1+Phhq9AuyWNx8Gw=;
        b=KZB4znPuMdEiOpEVWbLbisYZnV8uuFO/vIqP+dLQik+D8OsohFwDtPNLUJTkXhiSMm
         nK7Jg6eqeK6vQkvXy2QoWJ27gs7kn8fdYzVoI1H7rxnYDjin0VqddWawErRp7q/aj0Hn
         x5Thgj8wC4b//RHkY6bFEL1JSKSepmFc4rm+DdRfFFSnjtlwp7HW/K5AVGMmIgZeKQbT
         /GPMITT9LVLvHNl8QBwj3ex2uDbeavpMhFB+h3GDbnrxxDfbz8pdhZr0ZfKvYAgYY2vs
         NNS5pEMGWpWIWwBwsdEcsghyEqb15+KjwO8/cAkw5zKjPrrnqItdHIDAb6peVmypyhL2
         zj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523007; x=1775127807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIVQT1rDTdRSGpjyEv7Hoiy43Ey1+Phhq9AuyWNx8Gw=;
        b=eZC8OfMWmYLzdpfWYTz5yj4Aja943Agh7AgMczeQ/XqWz+sY8Zc54x/UuOGnuc0OMt
         yjuTNe/xkvxYQ1MocScphvC4JW1e/+lx2cH3dPnh9XzAlYQak5y8MBnPzesrSXyvq5tN
         kGnTgOe93u2QzdCRXQPCOUqVeX9Z6B/Vm2pr47kW0T9DjQqCimuXM6wwsX823TTLeUKW
         kN1o7J7DEdB0wTSHmyddNxB7gvIqbYwrKSpeaXTXI7wuBt1L9fGAhgBAalJGYhDU6NW9
         b8lXi09WWSIRmISuMIkJARthc7gu0DPfoEW8eDiSref9UFf0Jfgd4c4GztOMNS1/t4nK
         Ak0w==
X-Gm-Message-State: AOJu0YxWy0I/9Stj+D7Ju2wnFpp61N3iGs1AS1A9Zpjq4GK3lS+/MNPj
	8CZpVjOK5fF3GCIdNu+qp16ioH22swKRjIyat2NmgIbCoMCjaIdK0w1jacJK4Yk5
X-Gm-Gg: ATEYQzz4m3HdLje42oTo/q+ZYyHAoOcBC4OQOwlElHfCv9KSBEA53Y2lrKUfnqPKwIA
	sBWGN4HaYCLywlQHWZmMb/uRkywPZymE2ZZz9e5uy5s1EJM6OCb3UYkQadMXuwXPgiu+UrwlQ2S
	p18nI95qU/X6jJ1cNbN9niGgAsDNNeJuvUGUF0JjllKODvUgPzArBAaLL5JPTqQjrA80opF5TDr
	r2ojvxLG1bl8CLitDm/sf0ySJb4DjmuvImJt59X5y6qpHSXMZzBgLghqaSygHqW9Dmel1z/8LlA
	Hh/HwYg2zjHHUTITxqoLQ/G2CGPdsOcr0owhRx32KUx9Asbvmq/uwcI4rq0I55Q26iUy5SG7JT/
	AM0NzR16lFjBeM38LwR0OSq9j+kF10S3qrXYZ+wvSbes4ciatjuhA1psJG/aEb5PQbcZE9GZAJt
	Dc/lTrv939bD7RESWX5dMRofVwQVD5w2r/TxQ=
X-Received: by 2002:aa7:88d3:0:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82c6df392fcmr7235770b3a.23.1774523007354;
        Thu, 26 Mar 2026 04:03:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 2/13] libde265: upgrade 1.0.17 -> 1.0.18
Date: Fri, 27 Mar 2026 00:02:59 +1300
Message-ID: <20260326110310.1809866-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125643

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/strukturag/libde265/releases/tag/v1.0.18

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/{libde265_1.0.17.bb => libde265_1.0.18.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.17.bb => libde265_1.0.18.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.17.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.17.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
index cbf883910b..00fc16c0ce 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.17.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "f3d916c8e63e510bda1f9cf5e8710259c22afece"
+SRCREV = "36ad04841c209cb8b3577ec2723d431b6bf7efa0"
 
 
 inherit cmake pkgconfig

