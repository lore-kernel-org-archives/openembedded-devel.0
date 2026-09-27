Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17A8C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:03 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35350.1790506260840784497
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZuQY3nCx;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so317701b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506260; x=1791111060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhAqdVvepR9/7vZFJTzaTSE/lhETQSk49IpXmJKrKDc=;
        b=ZuQY3nCxktxJtTqTtKc1R9JiS+5oVElROgaglTkV02DNWxC/vSRuUNfkriSPpcSv10
         zNlKZUY/Uq2I+oPrmIXJJy2LGYVp4UO12Ob7QMCcQ8bnfu8QiM/iVnim6Z6svLrmReRZ
         3mxLSWmEnbCreGb4DYdK8f5FbFDx0bNZrHo1AuPtxufla/915RKT6OmVs8k0FLZY82+5
         N5XYYH67eT4MnpNJMKNTYVVufkwyHaIW9XYTePqfNp8DdaOi3VBPnYyhtFiyWp2olMqR
         +hrjyozzr6iU7S3ebr2UPouKd6Ed2C5I9DZkJhNvBYtteJqoBp296CMauG2MhgX4tob3
         GVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506260; x=1791111060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhAqdVvepR9/7vZFJTzaTSE/lhETQSk49IpXmJKrKDc=;
        b=ocJf3BQVl558kUx4Ru3EYtO2kAdaimhBMB8Knk/8JI4f4pUCSGUysMkS9JOuYbIma0
         uN6WKD/okKQyQavg1s9vWzw9FITfbQdvM71mUKc5XHCg0AoHIBmbHdEV7fqWrZzpszkD
         wbwF6FUQb/hVXUB81mH7v8eyImZ31eQUoI8hJs75tgWTWy/FPzcBYzpwo0zcREGMmFtU
         CoU/ea8ATciCpEkc7ZoP8EKXGW/2RvgDaheR+XnXW2T1ORaAW+L86F4I3iQusNP34MJC
         BSfYPgEzeEp1o/7qdvZwk6nPIIZJycAYI8VSwE4MqwYZCN26CqlpEGqR3F9F7AkEWvll
         oewQ==
X-Gm-Message-State: AFuF++mkj5/J/TiwX3xR3M+s4+TprlDm6Lq8yfXbjLRDxmxZUSLD/dj8
	dt8i1JgLDFaQf/OvA38ibkw1tVnSgfsRN6/NPUQFQWIBf3vm6MMy5pj6FnQ7JQ==
X-Gm-Gg: AYBFou2qsh951xMPYoB4KV3BETX7zOqB5R4VC8nuy9cyoJI++pyZJdMbNUJ1Em0zU1o
	Eiqozx1ItnqHIwO+1tKGFa0cptAY9YgSUIBZMLL2pwwaTX2HrRuXthw6pxZzH6cyZWjtz5wqnsz
	yxx03nm9EwiP00sp8Tnt76ipU7MA7kBHC2MHK2+Iaw2mt4TkUrVxq7T5h4OALdfgpaNEyuqGpKO
	IC4CiqLAldM2KI2Gf/ToIUIbaypB8ciwzULmIBk/e5yO+w6QsuTxEH2pu6pLHxgl48mkhgiRcA0
	IZLH4dsqBvmqNkQ4nVApnh+/W1yIldCYVZgHD2kZxYA8wPZQAOQkL7MoAMsrCxuhPOeOCqsSLy6
	czKGaixx3IKh2e8y1/3DSBiDhqDAAVWH9Dbq9OFkBecuN2qbVPbjigUMq74gUR+suW1rz9T59Qs
	lGpLqYtwNsXDwgJ+YpW+if1R6E9BwhK/quaT3zxVy4KvpSveCVn1rhmAI3BFJmXqOWAfapVxrgo
	LqAVl6stO2cxDVsOkXRvUI=
X-Received: by 2002:a05:6a00:f0e:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8828aea11b4mr1306298b3a.16.1790506260159;
        Sun, 27 Sep 2026 03:51:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 19/35] wireshark: upgrade 4.6.8 -> 4.6.9
Date: Sun, 27 Sep 2026 23:49:46 +1300
Message-ID: <20260927105002.1832451-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130353

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.9.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wireshark/{wireshark_4.6.8.bb => wireshark_4.6.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.8.bb => wireshark_4.6.9.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
index dd839f081a..1a10eb08e8 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "c0f1ccf217bc0d3b51a9c03ea178b0f7df682e475da26a2d21cd4a1bdd9579d0"
+SRC_URI[sha256sum] = "d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f"
 
 PE = "1"
 

