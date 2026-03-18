Return-Path: <jakubszczudlo40@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED30B1077609
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 19:03:09 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22192.1773860588865608839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 12:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iMPqiqnz;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso409550a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860587; x=1774465387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gtgZeg3GjWL/ifY7aJLZAOX01CyZ4BOSmQV07yy444=;
        b=iMPqiqnzlEtS8v6kYWEdH0XLf1MgnVwM3feR8w+KzkC7boFYlnMOY33tQFk5YY+pGl
         ehHQMSsDrUexrcT9Lltg9zeHY3UelYc6sdCv64DBHRYgCkknrts3lWIeLKnt4OiGdrKT
         t73zgA2yqhih/x2S5rYabmmQnrBHz/AEEPVWlmXeHCc336pr/pWAW3p2uCGMOzCB1Zyr
         /xW914aCRHmqeCRRU0ps6v3jvfb0FkY+GXq4vQ4aAmO5t8Fb0edZB5mfqSSrhw9TotxJ
         Rp0shJVZqsOmzzrPVEWZI+yKYnBGE8cQHgQaCVHV2PvZKtC7PNyIMPNbtD7uFwXSo1rG
         FxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860587; x=1774465387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gtgZeg3GjWL/ifY7aJLZAOX01CyZ4BOSmQV07yy444=;
        b=EHDJHx9csJbpeFNMAqoO9ZUFakvB0ptq4oPYiGjwR33I98GNrrK3iynR2NHIdAaf06
         Whg0r9iBMRZ3QMOS+HEJFTpSRiZkIQCf3u2wxjDRQgaq/STnFVDE7yKRy1eosvQ4IJ7k
         R6g2OUBDl7tiUeZxOgQyDOLXFzuMSWF7q6/bTYO4PKM+bdxhTCJ1ZNpSlHB1912xuG8r
         Y0dTZQaCHOVl4bju+2XmVktS0Kk4Uzw3dh9U/qzAcMihFNX2Ea+gBrGRx8XjYknZzPXA
         IF44iY1fId13mOyIVFqlgrLasQCyvhJwvlDd1oixq2aFA9osmV93sPR3g+QB51AF3OPF
         SkGw==
X-Gm-Message-State: AOJu0Yw471PVo0S3HZNWZdXasMz7O0mJdkZlgQIDQMxcmXcpB0nM4u4i
	iLIt1aUIaUsnxbZAzITvNHstBz/1kaTDMbJD3s3OXwI11oQnF/6tjw9OVTxgoHfw
X-Gm-Gg: ATEYQzzBXOsesM81PtG/8S1s1vZ/N/cnjjMKod/Sw4o1OAPXrtqDITBxfwCYwkO1YZS
	wBL5JkWxUf2mdcaAy3/EwNioZVWNZxm/EtHO+9kJ5UkFaboE3Ll8CX/s+W6z1eMX6zx5/JKQGqP
	V9EV18ZzvfzcWktp0hCaCwF9PVenbX1S4AU11FRmqGyX7fEsL4evwreSwq1irHtKINo4naDbDJB
	xgA9GW0ecwo1ix1eiSPKBnID6t1uY27CydNvdZ+wBykcu3U05Z0frL42m1knXrehCNPHC70jTHu
	IYHP8QxTjiyhwDvQKXxPvMvOgzjGiCZfqpRshF5QzH0HwzAgSr+NTej7onSEr/5uS1ysZ3ZvyFH
	2K7Fdx6nzpc9xESHj8kJ0+4YsqmVLnXMDzo8VqVWceGOueeWeLv/hRW4TR2kzeE/oiS5g36Lbmj
	cKH55FrxxLD5FlDrXDQmZcoJoibMQGA4ax5BicOTd65xeshsVNLqTxkP80cdkBhP8McF28
X-Received: by 2002:a17:907:7294:b0:b98:b08:7459 with SMTP id a640c23a62f3a-b980b088454mr116601466b.8.1773860586378;
        Wed, 18 Mar 2026 12:03:06 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:da9f:d9b3:d3ba:a5b6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142c3e7sm276830966b.15.2026.03.18.12.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:03:05 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH] libssh: Upgrade 0.11.3 -> 0.11.4
Date: Wed, 18 Mar 2026 20:03:00 +0100
Message-ID: <20260318190300.270982-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 19:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125362

Release note:
https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-releases/

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 .../libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb}          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb} (78%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
similarity index 78%
rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
index 5928581312..c39b121be6 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
+SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
 
 
 inherit cmake ptest
@@ -50,3 +50,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-5987] = "fixed-version: The vulnerability was fixed in 0.11.2"
 CVE_STATUS[CVE-2025-5318] = "fixed-version: The vulnerability was fixed in 0.11.2"
+CVE_STATUS[CVE-2026-0964] = "fixed-version: The vulnerability was fixed in 0.11.4"
+CVE_STATUS[CVE-2026-0965] = "fixed-version: The vulnerability was fixed in 0.11.4"
+CVE_STATUS[CVE-2026-0966] = "fixed-version: The vulnerability was fixed in 0.11.4"
+CVE_STATUS[CVE-2026-0967] = "fixed-version: The vulnerability was fixed in 0.11.4"
+CVE_STATUS[CVE-2026-0968] = "fixed-version: The vulnerability was fixed in 0.11.4"
\ No newline at end of file
-- 
2.47.3


