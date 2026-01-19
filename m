Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04002CCF2D5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32272.1768817125763663076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3eLF2Dn;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a12ed4d205so24613075ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817125; x=1769421925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcC4FyUAWE6UBXGmA0135pcggwdknC//i6sr0cPQ/TM=;
        b=O3eLF2DnvPgvOchuPPm+BN+H5Y3f0GCkPCYv/T/kuEB6XYv9YMDkRNyjIA2T3bEoJl
         txn5/5JRUdSOeFK3VaB/cLpH8srNjr+/D70PBfkQRDQ97ih3u2k71Nk1iiiTLsYMvhlJ
         IoLdkXW1mRsynXIvcxLlLM6CVpI4pWWDNXaBiV/msSCNl31fNL9FXI72YKhZk472dgXc
         LdneaXMa+MUkkVzb7T88duL0bHNZXiaODnGb/1ClyCf7QoEAHwqQRfDYpcHQvG1Wh7YV
         afg8bB66v3purNgtYYmkETwWm8Ya18RkAJ52wXAHT2B3mOwt5dPtoJ0Pqdwv33RDPRh6
         n2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817125; x=1769421925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcC4FyUAWE6UBXGmA0135pcggwdknC//i6sr0cPQ/TM=;
        b=Xd39pBnuz9OAK8MmaZh1m5GhgMb9T5eF3o1qfuhQXgV7hFtIv1XhR+Il4CZQjyWsKX
         5/jNXf3qUikCNr+EXv5Kg2dpt4SkUQWbAH7PaOREIjHdeBXMkZnT81XN/ZQcMVZ1Q+2m
         FOzeI4qntPAGVKcCXA8i+8FcaeGUeNBfmm+CZZURzLuhYtD1qDutOwXw44OKbIVDVWee
         ZFL3f9dFjnH4KWa6pGkicuj5FGzso6VA3fRl83BKbDncgfLpTLc7mh53QFYTtIDAFN+R
         GYG4P9LrcMsNmeuqF2kygnAjfapp/osG23xWIsmHTwfHVmgYThsNLaQt28zt8l/niMcF
         Px0w==
X-Gm-Message-State: AOJu0Yz0hy0d8hXRjFSMoGFPR++zJ+5o8tA1MTGbdUEP5o9fKrZ1eOMT
	vowyC5enqhn+T8kp//HnL7qYxMA1mM2ywbY4PR3SQTcRMlfgGwzjgM/jzrCPLg==
X-Gm-Gg: AZuq6aJrJOenAqUvPZA2gjJTpaJrGfTDRfayg0YiM9uRXmNKNwBY5f6CII47WHMvAOU
	9iqXFWilMhQbSQ7o5VhSsZEDOuJCeSRjCv8a1/zICr87EPsYTrjAjpJcSdtqu9sCy3SZUt653DF
	9E+Oeh1r1PKr4WRveqTNKbl23cdSHdUuISxosm3vieC/E4eSGlXcpkLmgukxUHdi33eydRWRCnd
	XIlVXS21B8f3KpQY1NTO6Uug5eXaTgPyvgfQW/kYSH44whSdNGX5hoNC+ilRt/CdFdG7hdRWtQf
	v2Um9tyrtLzXYOPCguxxDp4/xADGB+tOoygwtQE+VYrjGKvkCXSK+NIDJZ9hjCu7hBbSyfwfI9N
	oAiw37qO8aqvGZkMwYyLibEBslzHSEShvzAj4uAf5IVU3lTjSpIUlCtJK7m9EuIzSGKHaYwa8r+
	8hGnK8aAo/Tsv4t6lLEUMwhYk=
X-Received: by 2002:a17:903:22d0:b0:2a1:243:94a9 with SMTP id d9443c01a7336-2a7189463e0mr101980495ad.53.1768817124840;
        Mon, 19 Jan 2026 02:05:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a718f79f40sm90109935ad.0.2026.01.19.02.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:05:24 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 1/5] frr: upgrade 10.4.1 -> 10.4.2
Date: Mon, 19 Jan 2026 23:05:11 +1300
Message-ID: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123625

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/FRRouting/frr/releases/tag/frr-10.4.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-protocols/frr/{frr_10.4.1.bb => frr_10.4.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.4.1.bb => frr_10.4.2.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.4.1.bb b/meta-networking/recipes-protocols/frr/frr_10.4.2.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.4.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.4.2.bb
index ce455ab8bf..a0a42859f7 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.4.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.4.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.4;
            file://frr.pam \
            "
 
-SRCREV = "88f5c06cbc1cc4d62e1cba3e7791f5cea4179ba5"
+SRCREV = "642f65b9e5853c7207982a9cf8275732737d4e44"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 

