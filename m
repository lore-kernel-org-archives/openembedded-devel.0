Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF587C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:54 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14722.1782634311095491558
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Az+f4UA5;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so6037265eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634310; x=1783239110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYSbo3kafdgoguFVFnuRtEZDJ/i/DN1slFTzkRQW25Q=;
        b=Az+f4UA5tUTX0Y+3Z4a1cL8CdXjqHFO6ia3mEwXWNVRbQfx2zlYaB1WSed7pKkyYqZ
         0T+ULXUcmskU3DFfq9hqsGhpjwGMajOpmEPo0b7tBcyMmatAPQHlxv3VJCTfjxBfhhvz
         6UeFrpAniRqJIYlMPZN2g4RdEcLZG6cQcUHp0rzIek9hvdcnmeksZavEL+xvJ1XWcLUQ
         UyCBig7fIyijlbsE/SJIc3WitUx8NHpp9iXOcDDDLOwvp/wFRMPX+Fc7eN3IomvKiyc0
         BqRRTcxz7qqXsS3XeoU5GJIE9g4BoH8+FCI4/vKDPu9K3NNPXL7MdiU4FW2VKJRtB5SJ
         hDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634310; x=1783239110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYSbo3kafdgoguFVFnuRtEZDJ/i/DN1slFTzkRQW25Q=;
        b=ApQ7FOpnd9R2wKTvhF2sWdigEbw+PkV+Gs+St46vAKXiwE0kWm+E35gVPKdTEjdeYq
         ZFwuButxXcIr5roYczKeQY/Yq2FOxThauOW7zZwwZhCHmOoIEiMYqJAsVmcRa2vD69tR
         Xb4zl+HqZgp4SZrYgiBQMuK833J6H5sbXmAWbPUIh2zGQdYlhUCHNSYORyDofS2OnCi0
         I5vsQhtoDGqT2+1HlgrmpOvAUk5K8aaTttuxHe2E9MQjbFi3+u9oGpS0Amy3VbM6MogW
         AWKihEXuzBMSGhWqcIIuNDHXDMLeH/BNUirV6vRdEEz0vBMKxMQwaDGiKISt1117lidx
         E8Sg==
X-Gm-Message-State: AOJu0YxEvJ2LPVs3yhp/fAcwAlVQloilA+U/G+7kgsTWZC3J3F+xhjWq
	CvTzy592FxlW/znBerNYII3O3G6AuaRGgiOf1AV6ZdBlTNSyW6Q5HQChZOyw2M2I60smjw==
X-Gm-Gg: AfdE7cmW1eCtvT53fnLC0Ir/0lKJlpaZ7BThDV2rgQOLYs9U8Fx3Mx/SCKGR+hmIP88
	iFin8BjEz8+HM/J6kfusvMPYoPAIza/IUKiYX/Mynw3ueiJRFqQD18DOKIqkoRwjtFUzrEQLYHN
	ePJb5mtsFjKUBHi4LoMV2k5QB6ArUCUOC6G4dpuJzJq7GpQea5u8OXWrwkkfZktc3soyq390RUB
	CSk/5K/XpVjMxnCF0ry1LGuiY2mDTHR7k5enJJg1OCcOLNEedNxLVBaCjGQCm0c+4etKSdqJNNs
	w2opXaYwtla7Bd8V7BWamkpS3cHr/H1OR9/Pu0rKqpZz8oI/G9UVHMTUwQEEtoB1Ioi0BetFM7s
	wxQyaM1OfstfHNlF8V4BL5pJlgRL6oJtLbJYDnQIEBVS0abSO3xsNWJr/i+a1lyEDuWTDJSg1ri
	WQ6CvP4AsN1nOfTwAq2WjW3WYA/oakkvyjZp8aEcnYaWz+k123lEfwZfqGSt0Bab0HWByWdQywh
	I3ILV/rfPgpIohtNWXHjHC71MkG9Iwt8vyAhU6UBKmtxY4g+VLRNpVHKYfvgR5sdKP6E8/+pTFE
	P7HinZo22X7uAMOHUxgtD6tQ32q2Vw==
X-Received: by 2002:a05:7301:6709:b0:30c:ab4d:da39 with SMTP id 5a478bee46e88-30cab4ddb7emr5328378eec.43.1782634310453;
        Sun, 28 Jun 2026 01:11:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 027/128] squid: upgrade 7.5 -> 7.6
Date: Sun, 28 Jun 2026 01:09:38 -0700
Message-ID: <20260628081122.178348-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127837

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-daemons/squid/{squid_7.5.bb => squid_7.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.5.bb => squid_7.6.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.5.bb b/meta-networking/recipes-daemons/squid/squid_7.6.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_7.5.bb
rename to meta-networking/recipes-daemons/squid/squid_7.6.bb
index 3364c1f746..637d1f6942 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106"
+SRC_URI[sha256sum] = "852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \

