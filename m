Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582D6C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:38 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4193.1790160148997723969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ENvWS+3E;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so371731b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160148; x=1790764948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRBfwQQd5KBzoYBcY10UxDu+nmP/ZlliUGQBaNOGdSM=;
        b=ENvWS+3Ef9DLogTar6xya8eQhBtljjqLCl2xakABuowBarVFdsyKlIicvVFxNisE6q
         4Ryu9i+HzLxc4xj7C66A9RcMMXVf3CA56suIK+dsouFzLx3RROAM+HdAiAaGj8vSuSgx
         gGPcgRI9X8C8i+yMU7oWWighJI/qrcv3BG/blaCN17U4ySDOwpTZV08lL5jyxG8M2A9Z
         pAFXfOSmziylB+xyRXvlPPMkCn8G9UMA9LSkH11Du3boAPe92fVUZSEsmSszALRFmaWl
         xqJQjv2rmqAym/FV+unk9yFRoEysA5dppfeO6YlIKRyQZpzKF/yRLoxGs1Fwnnn3btc6
         FMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160148; x=1790764948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aRBfwQQd5KBzoYBcY10UxDu+nmP/ZlliUGQBaNOGdSM=;
        b=2kBOxUTO5sjdwqkj4EddmB/Fmw9LFf9i/yiad1lOB+BeiRx8kuFU0Av53k1CateFye
         ATYB60/9flcMDxznRr+FcmegK4lf1TEySOzsGr+CUK7Ib3AHw9b1v1zEkqrFJ1UpIFxq
         EokV6/b2DWvNVCYzmdIAgfPD9EZn60g8L00P9jGSih+lFfqJ8ZHIUArvnvos9yAN/xXn
         KVUe/FsKQcgFd4gIWV3nOx7fjIUHgPiCtRcpBCD8/4gpGFSIfx/6ApmAxOhc1jL2rDjq
         aGJIMfA7+91dtY63M97YNo2xbKPR4yZ/mwU42pCEcGjr7F3WYvEtNOmAio3CF/65LkbC
         y//w==
X-Gm-Message-State: AFuF++nCnuRhYDEe2hwfFovUQmwIOaEDWj2lkX+lM2HhR1b7Sf4gX1bf
	JPWi0wAtGz2iXHHe6pK6rX24kKD3AZ1CaU/Ncn2oMAFVkJgwTeIooajAevxJTw==
X-Gm-Gg: AYBFou3dBUegBJC+rAnE3VUr3ZagEbaN9QtWXJv7E7yYrbSdNCmR4q7TgO3ia3okE/c
	wEF5XyHQnvEf5wle5ndpGKb5Lm8gRWhuuTzrFJw78RSxhOiQKz9glQVPdjyPfZXztsBG9sd0xRT
	NicjVtNx5X6eF9gcbyQda85lLLuqSQGfXLXPvQJEozFWcqsLecjd3abc6tS1owbQ9YKESjQP7v3
	wuXrvMaoBy7zyOo3W+7KH+wD9N5dHrVsVLKL93ivDIbvVF5+THBlZPiF6vhH3bOluXOhUm8omSn
	xqjL4RMVXLlQFvXnTPV/mVFdXFAw4YQ1inXuQytLiyT5zxMTxP0Uc1XJyz3e+D8kIPdrw8UIR9L
	QESXLWIzyRPEV4suAuD+SJkwmNISWdCUm9rytO5QGrMuNyIwwRDIPV5Yf2X4yCICO0/yzSkbxHH
	p9/rmAOhEn8qB9tpHnEfcPzVLZYRlclWPUw+p3sORZpgNXmdqMgmqU6kcn1yozse161i+qXTqbE
	IJwloUwZxoGwKgnD+GlnPs=
X-Received: by 2002:a05:6a00:1a03:b0:87d:3894:1994 with SMTP id d2e1a72fcca58-87d389421c6mr1310911b3a.49.1790160148395;
        Wed, 23 Sep 2026 03:42:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 40/42] python3-twitter: correct Tweepy CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:54 +1200
Message-ID: <20260923104056.457360-40-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130227

From: Devansh Patel <devanshp@cisco.com>

The product-only "tweepy" value emits a wildcard-vendor identity and
hides the distinct NVD identities assigned to the packaged Tweepy source.

Use "josh_roesslein:tweepy" for its NVD dictionary CPE and
"tweepy:tweepy" for the NVD configuration-only identity. With
sbom-cve-check 1.3.3 and the pinned database snapshots, the generated
product identity changes; the current CVE report is unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 46ca829b6566349ed02dd9bd4209d3c7ff50586b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
index ad05e0ac47..bece398e3c 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
@@ -18,5 +18,5 @@ RDEPENDS:${PN} += "\
     python3-six \
 "
 
-CVE_PRODUCT = "tweepy"
+CVE_PRODUCT = "josh_roesslein:tweepy tweepy:tweepy"
 CVE_STATUS[CVE-2012-5825] = "fixed-version: The vulnerability has been fixed since v3.1.0"

