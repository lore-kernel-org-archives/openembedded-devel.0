Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B46CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:31:17 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10368.1791801069580744117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U0iDmlA/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so881936a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801069; x=1792405869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AUXmhCptc9fC4R6lXv525oRK0hy6sms/UarETlSFno=;
        b=U0iDmlA/TSCqCie0ojVuDv5/n6GuRu1B4cd0adGMdawbDD0S2F+ovx3IGWZZbaJIuu
         TvSfWsS3m+bq7pNHV403hDQo7/w/nTLA/N7a0XHY6l/zMLibS4L7sn41L3tE/CCKlth4
         W3JV5DisXryjzcsqGz4Lhgh1RA62qM6Mi2ej0YuX54iFbGtq93zbJBHdKNzvML+v1Eyp
         9sDDLTZF6fzwsmjHkppN3dG0u2s825Swy/8IkDs4GMCTU893cV+UypclDYKerOtdaYU0
         X6ZXPNh9Rlgw1ZSRBBQxi1BG9gteUBDbcPYjwf2c+cOQeTjj6JzZS4E8vQKqSaj0G7Ia
         vbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801069; x=1792405869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AUXmhCptc9fC4R6lXv525oRK0hy6sms/UarETlSFno=;
        b=B5NQ1/jN7gNAXi7+B1fJDXmolfQ6AMHDpkRWwYu+YEtTCPsU0xRhas5G9RAE3VcWyc
         76TNFhJ0vHa9UsOHIJT+dAJSTlNbNN/8QwsqZURLGcRytGabeRNGLxJQvQIUuBqX+d30
         7DYi7PSa+ZyxCtQM1tugDmXfeCHcn0e3zwWkwg62BPXfZSJfJ68FvTQ/YJB5ruvhgM+i
         9p9rMNUSc7uo3fb9XJHTxRhWN9+A2CmLBXcPxGdfGMDFkAvScHBG2Y4bZ34uNNWIzmDa
         FLSUT4SfFvMzsfgUUhIVYzqauGqiGQFc31dZSeH+bW+ot09LnZmzQG2AZhBn6zU8k7zs
         gPBw==
X-Gm-Message-State: AFq9FYLYMGWUPrz1SNH80id6TEMQOjIpwnHK1BOITPcH20Xd0MsDZy26
	8syDd2RZetYdHXQC4btYCsaBbYM1K2B4JiX9an78BxWc1hM9Du+9bs2iVGISVPsFkXc=
X-Gm-Gg: AYBFou0+3Hc174Zq2Oz6bq4/9JIE3qqz/Wc7pVNhnEb2E7eU1L9/vkvpJ39e6F/TsIQ
	3NTr1LIurnBUfiUuApyZYwXWlEC0JrXVYYogXHWwJFPrgPKWgRmAZIysicC2YJHkpiNi0MYfYTA
	CAvjyL8KMmqukGcIv+bAPBoe6WHRcIvQA+eDzRITgaBftoxGV9FTXRLlCP/ksU5hjkgMyjun6cq
	2W9aRofMmBhx6Xsy5jc3BdIDkNuKuWFOgkqN9a+0rQaax3roqlQ2jqi7RKQbEhfY/t480L9dqbj
	Xluj/dhRDQxwSkV7fRY6MiXMxtzhQjOX8a2H9JJHRKkuIj89mN9Znq8OcW8WPLZHwnbVAbIic4F
	fGSZ9UqjzEa25RnwLkMVHMC2dYo1HtSWwCiqAM+lOyNtOdfY/508e6FLplnhwunqgoP+pWBghC6
	7Q1VSrKDgXqzALwn0hSo8pcI+ul0Oz6SyKz51GQ4KX29CbOhmLVdEEC/KEnesdO0t88h3A+i8KI
	r5+lNOI+uY5l0K9tPciYTOS6LO/0H/4mmhJ3Mc=
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr7171935a91.23.1791801068609;
        Mon, 12 Oct 2026 03:31:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm15929891a91.13.2026.10.12.03.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:31:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/2] open62541: upgrade 1.5.8 -> 1.5.9
Date: Mon, 12 Oct 2026 23:31:00 +1300
Message-ID: <20261012103101.2969383-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 10:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130760

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/open62541/open62541/releases/tag/v1.5.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/{open62541_1.5.8.bb => open62541_1.5.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.5.8.bb => open62541_1.5.9.bb} (98%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.8.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.9.bb
similarity index 98%
rename from meta-networking/recipes-protocols/opcua/open62541_1.5.8.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.5.9.bb
index 686f884dcef..7c3eb85aae4 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.8.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "e6a35ddc4c80d6f948af3f046ad942b4c9822549"
+SRCREV_opcua = "05c2b389b65cc35884eb40d800301af1f3d130cf"
 SRCREV_mdnsd = "c1be962b37e4b952625d9b0a873e5ca619b1a35a"
 SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"

