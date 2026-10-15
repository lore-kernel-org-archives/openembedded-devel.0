Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478F6CC6B30
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:28:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29955.1792027681209197986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YtvGGJTz;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so3503537a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792027680; x=1792632480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DErithL6yljm8j0lkviHubEUkSbJOTvx/louhUA6gYk=;
        b=YtvGGJTzcuui5t9XqLMYfmwXaykE3QqqpJjSm/1bPj+kMujDNh1wmu32u5nHmeXoTL
         3JKre16X2AX2BNPIgP8vqnp9tFMfDHAjllqJKQeQ5Ifj6CMAOQBTTT61VeWBsF/FjnLg
         lAA0tPRmQOdzCNvOUCVk5o9r6mhTXegxAsiUnHOw+NAVk/rCId8KIfqMeN9IYWokYxcx
         NJvU2phSebT6uIM9g4GM9qpKDGUWqjvnxpbSMU+gjG4eaMAcFvt7g1ee3JN+KZD70sUD
         xkMJHseS7+e8RoH1MarExrpFHY5UcOptmC5+dVgvF5m6+H9ZTHxjaL+YB0Zu4CXq0w5D
         PSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027680; x=1792632480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DErithL6yljm8j0lkviHubEUkSbJOTvx/louhUA6gYk=;
        b=gYGSWsO0X19NPslOmkRjevz5AQPVWrhzt6ZPNkVBI+xsHfKRuUSdoYqpLuSDfuEEBF
         xYH7XOetrFTCQrWmdGzW/OlMGVrLAvXLB5TNCYA068oefYykjdby24QhhVfZ7JG6CtHw
         wuBCfgC16z1a29cmFzD4ZtZmP75ZJwVf5TeunuyuH6PIb2v7dn34R+CKkMeduUiwXbj/
         JfmqFXcTREWmCYnnUbLzkIEdqSeRZI/JdYA99G5t288nxKiG07Vh0/dkw8RYkEEWDERD
         qdNQbBTfjXNOoYWu+ISsBfVQqpLaITDbUqwU6qjle5VU6+sev054s+q7Jyzq0VxFItrX
         H5RA==
X-Gm-Message-State: AFq9FYJ408itaeU8Rih1AjOEA4FqD4kOk3OTBERirx3+JAj5pVG0Dmmi
	e7TJ362Mww3LwFmeEzY1FqPbecy9G0jsq1SqU6+A8SrgEBAte1k3PrILoTla0g==
X-Gm-Gg: AYBFou3jEpOuw32/RcdXZK1yvd2GuJOckC3jBuZN4ISJLdVaDyserJqbVdhBLgihmhO
	gctc5dVLrawHcFhgf3FCpV0NvSO3UWSGHpM2b8cis7i0u7rcX0ex4xZHjSuCZ9KpM2nBgNzyF+J
	UGqMab19Gj0ih9KxcocSsbzCdQbndHmOyA8RY7D0QHNJxcd/yRm8Vd/HCqgQvmmd1NXaOy1XUME
	RWnkdWT+VQsY9zO9lhezFHHkFWcaiHHks6/A5DE7FZj3Ub2dvK47PyvRaABfHY6StWtIGEsr27r
	fV5ZMZmSJLe/ZlAPX05xADxvS4+Bc2LLSCZsrhOFhEkMT40g7A1tlaG1ENQzC8exBIujUh4rrHL
	7EU9bI7tQiUgRU4NCbcMe4MJUL1tWnX3QmO0dZBvXfS87cXPGo61lUP01v3AdxkbXx51lKZo6u6
	z1KBETQ9fgWnBBODY+Ixi/86INgxC9Na+cT/IurIJRJMbnFucCNB67cimfFa4Hco3B2emreOG5K
	//1VQKkEXQzvcrgr55fTG0ef2iw+We8MYmvnJY=
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr13619567a91.67.1792027680620;
        Wed, 14 Oct 2026 18:28:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm74429495ad.0.2026.10.14.18.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:27:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/6] libtorrent: upgrade 0.16.21 -> 0.16.25
Date: Thu, 15 Oct 2026 14:27:47 +1300
Message-ID: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130901

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libtorrent/{libtorrent_0.16.21.bb => libtorrent_0.16.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.21.bb => libtorrent_0.16.25.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.21.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.21.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
index 06998ba989..5b7133e645 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.21.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "306fbbf008183dcfd55fae0a83fff95302c64987"
+SRCREV = "6ad3fecf3e7e7aa86855445587b532a91256f344"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

