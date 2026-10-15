Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAF6CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33238.1792043009736422910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=smIAGP7l;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so28513135ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043009; x=1792647809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IbEZzYz1oFOUiKbvEoUom0ixcYkNfOQAMw3851J4cOo=;
        b=smIAGP7llbOkkDoCZcD4yYqXs8wh/EMsDUyw7PsHwsq0rFnjn4qjnR57nKJjax3ZRv
         j7tlre3Th3uZoB4Xc5vlSnlpmxknGbN52Au67XFep5zhLrBv6Q9JmlWDaQePQhYgTL+/
         98BrC6TqSjD7CHsFYiL7dqIU1z2U4Yp2S39lIcV5uFSprdCOmF9Z0/xbEUpc0NmdzHPJ
         AA777iOilfnaMxz4tiTHFUEQw179wryb2x+OBJvkk/LMWNtlW2wouefxYuiFzAKHz/FH
         db+JsfH9pVRsF3snIeEb8PtQbaYR9WTQZpmAheSf68eb1iVq6C24Yx8FjiSUSPhtnQN8
         R5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043009; x=1792647809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IbEZzYz1oFOUiKbvEoUom0ixcYkNfOQAMw3851J4cOo=;
        b=D7cIX9WICtqFG9wlYrCXKDsIHWQWuAXfQReMu61o2jFcpj4cJXtJjSzWjorAeh7EzX
         Hr7sDwrEVFXKhh1S+l7ydQudx6hiAgDciFuxZK4n+hP27uGiIzIxY4Ib5eOimzlxsWlZ
         NsFyT9XmrKobQ6aUDjFg3QbGhZZW9x+uEGo4SNzpA0yjzXp/TDd5chbI5VH6aZKsms4Y
         72zF69L/JZYeXFxPdC5w/AAIytcxp8pHqddSDl3P9vYNP++VOx33Rn7tUhfuuHrtrsbP
         WprwtEPfbiccbyyjAUOS3+Ug5TgUaeq3RUmT24TZnGjFCNP3oUWeHt6ZJ/PPxl5VEvsd
         zlog==
X-Gm-Message-State: AFq9FYId9s44Kfdgx4ybExmOGnkyC+66PA5eV+cf86EIca1PdWiNnoW8
	WdjGfP4pBgiEvq1Ejl38+ApT6QArMeo9BJi5SZrhfTF2W4xcONiTYeuZ0EsFFw==
X-Gm-Gg: AYBFou05BM2BzdAQj1VHRE6X4mAMtklI7RLm4TMF/sPngxDkZg4a9+HWzi/Kk7EplD4
	jOoXqrbq95HdrvRlqQuOxXU0QqZFTtpdiE0HcFeiHHxtmEym/yVHH2ouGBg0kirlI/KeBs77cLR
	cUoUbvnjPWEgWJoWdAiFfZseyCAUTxPp5PWg8lKQMX3Rvn+rbUZebDHXACsJCUDbjhaQXh+6ae7
	PZur5V21EIoS0ehUgDZ0AWWQQv9AE55kuFEPAXrNn5vNXv4os93MPzp1QS+JDE/s4qsKtpGBPdt
	YOnUbbbFRycJvWLW2UNIvcfln1Bj0ixLW8pALgRVOSKpnUCU6raeD0WmggV06zpiU88jEBRWUSf
	dxyzsCkLJqkfJ8OB/y1LCu/nkZ9obONft7HjG75K4g9EEg98CL9xSzzJWI6Js3zAiOH38quz9Xr
	Zx1boVasbBDJwFR746a14GD0lWa7PPtGw/cxgi+SH50SRpX07f60oR7hkbUAgCuzuJaRmTpMDBD
	WKCOCk0qG3WbgHyjTs3Tw8=
X-Received: by 2002:a17:902:e88a:b0:2e3:1776:278f with SMTP id d9443c01a7336-2e842bcd141mr172622385ad.42.1792043009064;
        Wed, 14 Oct 2026 22:43:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/82] gpm: ignore CVE-2025-4558
Date: Thu, 15 Oct 2026 18:41:07 +1300
Message-ID: <5a3355e3ae4520541b02607c8562d7cfd73b4beb.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130939

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-4558

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e134adc8f3e5ff7359d7df04c4a841e4d5eeff15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 155e56bdef..9c07f334b0 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -42,3 +42,5 @@ do_install:append () {
 }
 
 SYSTEMD_SERVICE:${PN} = "gpm.service"
+
+CVE_STATUS[CVE-2025-4558] = "cpe-incorrect: this CVE is for GPM from WormHole Tech"

