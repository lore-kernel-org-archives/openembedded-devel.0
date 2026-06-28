Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1769AC44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:06 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14728.1782634318437384055
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MzexZCAF;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30cac93dfd7so944808eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634318; x=1783239118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QD34K0TC7h2rdCUeE0fk3MA2l4hz/YGf9lvLrprCfww=;
        b=MzexZCAF5fglb7tI9MsOFTyxtH6/ZD9elvFWHm8utt165DygC4y2+ivJN9RLS2s5vS
         c6E3PcHlLEYSBP7Vqybx3shhWbDm4rdK4OSq/y9oqNB0gBnran3H+Wzfmq0glFMYHqi7
         rQ7rnbSHfdG/45CeqzCXGr6ELjs5btulBKCZXJLqqq8lqypjShoDQb/gd2zO4GDxl2LS
         iFFzh9wvc+TwDmOe+OucphQeTGt48+neUBcn3kzun+dWoKItkYZ50Iin+jIxbQXjT/vz
         aThst0VfbtM4JfuYEJOiqrwkHybPq2xRIItTIfHRYrW9heeDlcy2qp130nhViiF1MO8w
         jNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634318; x=1783239118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QD34K0TC7h2rdCUeE0fk3MA2l4hz/YGf9lvLrprCfww=;
        b=Q3rqJqnq8AMSSuIgDy1kTNPi7MD7KmlIPJyGMEjrrqJAvQpEAKOtsYuTDul5JDj8xd
         D6FqXdtSny9mced0aF0RxBfRQSvMTly/yfaW92wh+1mwyc+kSrQmiPxvCVutvVj4jYsE
         nlFZQFlmW+t3GHiR7+P2ckMrHb6Kd5OPjed4fYZjy8NbmqS47XkrgFlpYEKiBeZrfcM9
         EpBxccCXl9sAghkVWJUy43TI+CvIUnOj0wQasWXXMFjHec40XUZtS0DXzNSJe87ym6AQ
         GSLGlf6TZez03mDy0sIR5c14Vf+yRyMeY78W34YTfBkFvHBGPIEkpmAjg9sTKCg6Bkbd
         svgA==
X-Gm-Message-State: AOJu0YwamVwkyJ1RBqcy/d2FWOCqm3ERccqKZo2d6fYKlykPTCf1KssT
	FhzGOKu30PJH4DqQehcVVth/uKLeXrJh9Sv5QtxUCucsBBl0BAWoOKhHWYRViWIMgg/Aow==
X-Gm-Gg: AfdE7ckl2GSa1EWOBVjhQIJu65LEOJseBNI7+5vHoHbP2P/OUGIaTI533CYzQwsiK3z
	PLXIBoHoaByBl9mA+ghwMh7HLQiC+iLk3k/FJcFkAwiYAhy9hw9EK8kezEC6XGUlwgjM+TVhfO8
	FrzAjqwLuSJSieFhUZcXkg+18xkVyWspD2O/CNrY3CI5J1WCE5RWP8T5am/CBMM1L87A16gl38b
	fuRbguSTJlpI7i2NV+n3kTpmcRhs3bRPxDRf6dKITqFCESW2wNNwYun98yCHReVI9iml5ddwkga
	IFNtIdw6CKbf1Ass1/YXBbifA5ozUp0no4vM/4Mb8J7SMZkMpp2QYg44IbMTVpIJHqUMcrmZKuJ
	nNgkQy2EC7LQQ/r1M4jRjb9uXluxZxGWjrt3cgdqGeyKE3lvyVE2NC3kxJCSnv7igFWuyDbrpSX
	X+xmw1+L2Exy3acE8pu1CRxvuwNuWMnQF+1jSFJa5WTZ7FeRLHWKoC9n8bHODTeBB2D/7iR7c/S
	AcKtk7ZsNXuH/SDl0M2S/GjV6XnjD13iWjlxBMpUF+LCZxeYyElkgoBYfIC7DQmmhTofb3PU2rn
	s78n46bNLWvynKIEAkG18gkI7nZ+lA==
X-Received: by 2002:a05:7300:6814:b0:30c:9bf9:d9c8 with SMTP id 5a478bee46e88-30c9bf9e233mr6137713eec.13.1782634317731;
        Sun, 28 Jun 2026 01:11:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 035/128] cloc: upgrade 1.98 -> 2.08
Date: Sun, 28 Jun 2026 01:09:46 -0700
Message-ID: <20260628081122.178348-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127845

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_1.98.bb => cloc_2.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_1.98.bb => cloc_2.08.bb} (86%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.98.bb b/meta-oe/recipes-devtools/cloc/cloc_2.08.bb
similarity index 86%
rename from meta-oe/recipes-devtools/cloc/cloc_1.98.bb
rename to meta-oe/recipes-devtools/cloc/cloc_2.08.bb
index 6d349c1e58..106c72974d 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.98.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_2.08.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "5fe0b159eb75718df7308a4f61470eaddf82170733929999e37a3fbb4651cf8a"
+SRC_URI[sha256sum] = "ce3c86d1edb448728278079eff6d99687477b3c1fe84b2f1a4dc14cfb2f811dc"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

