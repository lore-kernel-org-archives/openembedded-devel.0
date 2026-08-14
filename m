Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19865C5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:29 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24502.1786747583971854020
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IHOuVBHJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1788277a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747583; x=1787352383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npmCOv24iNEt8EzIIflfze1zpcB3AMVX2RacoVsoV28=;
        b=IHOuVBHJApyPsxjFaXugpMwkzPiQH8t6J2JlPpllLr991/IOlyKKAaX2qg40QpD++i
         U31luBIqor6A7L5VOEpLAQtwlFJgeDZqt3shx9vTiLRvX2nvPi+57nMkX5njXnFru7rH
         NspqN4SJOwHWd9hWRT3Nes1MtfaivO8FPV/l8TMm+LbKWAwi1tYbYF3IjBo/4v0jNLAC
         gyUOIyX0jv85Kv0ln10xnxdXzQ9HfuBMOLEH76hwlLlICZO/P0NnpeEAVAHVUXBpFrgn
         EM1Hjx8fcaWf56fSOwz77UizWxRL2vMHln1h0tV9L486QnJp1LX393L9Jdwpx4wfKoSL
         DsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747583; x=1787352383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npmCOv24iNEt8EzIIflfze1zpcB3AMVX2RacoVsoV28=;
        b=NKI54vtVgN2ce5FOJ3KcFcVo8KSe8T6vpvAOWNCKrR2lSKS2sgeJaF8mefA2slRGKK
         +hdlz82PKQixSBc9xm/zhlG+UpAETIgerCs7j5hMsw0ma1z5HOZU21oiHDgOtgHS+Nmq
         b8Z6rKRBkceic+OX5QC2ZZpycpX5SDRGHRPAAjcatJIFFa0OzSVvgaQucIvTIZQDz1Fg
         vKpBfLSv6arBqMWNYvWSiolRjsLyGnKyyDtY0t8TiJymF5rfFbWb9W3u1J/zJYgOQkPX
         M8kBYrhdb25VMu5Sj3CXvZsOzjpUPEl2wskd1LPicQTpjBsel5t2Qx1C85yoUASVplxi
         5r9Q==
X-Gm-Message-State: AOJu0YyQLUTTU1vBnEIPGpycg5O7MLgjdE9fFALe7aGaUbcZVZgtlDva
	ZhRlAQk3HQjoSl+l9daAUk/senaBThqryzJV3VWkely1HGBVyX4cqbVKou/jBf7x
X-Gm-Gg: AR+sD10Cj4vFdsnVxdbF9A9xFqansq5jB8K1qy31MJIvqnl0nc7tFFFFgrjQf0jH3u0
	qBdI/1GG8h0XAztnWuf0TlKOFx0M15gdB0V8VAZawUoG/2MQOeYen+oi+EY27yrPYZzueZsehHv
	+irdwaPlptPFG2wgy0zRFVRGbLGgfkIxQJpBPwCW89AFDjCFZtE+EWLBEMSorJXRl56aFz4fbqK
	zidQAd4nrvT4GgwIQe6YFeyp0zeIPf/ycPTgROPQpPLYnW1QNWpmMC90Bf1MmBJFiDk9QX52B6B
	yS9nneJOpi3NQUd++axGmghuLaRJBFDAYuV4SBND8RR18vYZT+ex5w9w5YPcU42cskncxscPsO2
	NybXEtUOcmUQJmphDZ43hjXCZ/VZT6y/V5gqN9J109erkRUtKMaAY0bRJ+ZXpkE1u/PsHPypXz9
	eQjgjJpJ0YzomHUXLmeEw1vhMhfexEdGPq3tZ6jvYtkTJEwzThaSKZBrSUEEla3YNno7K7y+foO
	5DY85qVuAYqdNVqsl4SY3T9WkcGDP1z7TJ9I6XbtBHcZlrabZ5cXzbCe99UGKGRzIakJ+9nBsyK
	tXI7RmeZEi9SwJG9Eg1vVDsK8x5ph2iGHgC+g8ipUS7vmc8YlZ4sXf42jhu3URyn33JzCIX2wkp
	fvsu03oD8wvOSKxWxD54wVylj6PtXAt/EF0dehaET0p1s2Q==
X-Received: by 2002:a17:90a:e7c1:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-3933ed1ba09mr9664116a91.19.1786747583359;
        Fri, 14 Aug 2026 15:46:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 037/109] libmodbus: upgrade 3.1.12 -> 3.2.0
Date: Fri, 14 Aug 2026 15:44:23 -0700
Message-ID: <20260814224539.1523174-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129101

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libmodbus/{libmodbus_3.1.12.bb => libmodbus_3.2.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.1.12.bb => libmodbus_3.2.0.bb} (92%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb
similarity index 92%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb
index 2e149580eb..1eddfb8bd1 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "9af6c16074df566551bca0a7c37443e48f216289"
+SRCREV = "a9b025d12289855490b10d77461c99e001abfc0f"
 
 
 inherit autotools pkgconfig

