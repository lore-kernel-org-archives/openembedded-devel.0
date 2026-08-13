Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D951AC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27764.1786651741341464121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=krqn4ITn;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc73e322dbso6244645ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651741; x=1787256541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGJQGfbtDnYzRtgg54iV1Zk90wJxm9OTGfMY6/XDrEc=;
        b=krqn4ITnhjepMKwP09tKdANVXHvd37yH+GZ0Fphq37Z4gHQeVuPIlic5lMlu9sMVcI
         4sDV6I4PIfRyurgZYMjVpBNca+01rQqdJ1mR/tFrwvtNWf88ACAeqvjMASyrPlR+j9zW
         Mv8KSyXoR875gWJA66Q/GBW5LFpuPHiq/pMKjokDpJwO0DXkvPYijeLiila4zivU0go7
         VhD2MZbqgmiczWZg4SPQXZTVA9gMrKUNSMk+tc1hCLoaCLBJCrHrH4I8Q6YYdQhh9nZp
         MO7RtC1l2C9PWR58sN5s08zUZ7rvCzwKCwPbG7SIbU8DLoJaq1hXkFLbfiGBN414FXB+
         K0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651741; x=1787256541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGJQGfbtDnYzRtgg54iV1Zk90wJxm9OTGfMY6/XDrEc=;
        b=iHQ6hT0xot04evq+55gy5KN+0oVYWKF4t8rori2ypROGyN42b8OL49BN0Xf/YnPdkv
         A2Tw1qLK0MI1JmBlyROtLdvrt9X17F0/eWrTZIQ1GwgRzLXILGaxkJCmvbiuRMKJUsr0
         ELZmOlB9FsFui7uBkoWiuuS6qnZoQGEG0p06+MsuqHrUCtdvEYFcTLyBmh5Sa9oGol/p
         zES/IfuhJYMvwovmXr+hcDjDFTT1HThkK+ZCOfOOl3l41cWKnGgaScELcvMV5F65y/L4
         IEhx0W4UrJKaxfUWiip7KURaHA7Zo+u5c15HLAUDQC1SDcxkFYbobwR72IIUMVTxk8zM
         EP3A==
X-Gm-Message-State: AOJu0Yx/SXCRpKf8dsOv51K3kVkiFlG7xf1J08OM25Afqd3Nq1z5vEwm
	Cr7MJC8fCn6qDTbYrUoIN8r31uXo3zof0JxE5rV6gdrea/B153qN4C/X/fNmQdwk
X-Gm-Gg: AR+sD12Hj5JE7Xtnz1Sw/1vPJIKSEF3lsiH8TXeTqRId70hFT3ALY1NlNzT5B7oeVgO
	IIPplQb7hmR2GjYxwHXTo4PhbMu/1MLiYnxjooKPkM/nGAslkY3GDahr6LY4/ey9EeQQnh2fUid
	mZfd4NJR32WS0UTb6/ebVgXofJziw3FTSbnYshEMBBxfxgoDGyYqcm3jMaG61v8qnBD1xd3CrlX
	iGPxSDu0Kc8lZkmha5MYtDvZPfNk5MYNwg0glA+uiSc/ORAb3Vk07OvZIUk9cxFUkcJOwSbWy3L
	+44VSHBJVrsVSehFLHEG6hZ9wmmnSxzSBZg5q04+CjNg4o8UFSrBwkebN+BcB1IUwkoH4Bqm8UR
	U//o8ZL2rl1IPnYS3xTnu38qcw1ZqPttpP7A+AzYgeG9eQ8Gve9tN0ypzuVAxmPtTf/qVQ379+G
	4Ci0YM+dMx14earD8Fn2M4hnZkVfldPiN8Zyly5jqR70WENvt+UdytGN35/ejGgxnb65R68L1PN
	Sjzte2/GtLsmg7kHfZfTTQnUZKrdJaYC32JMhFMGNIw5Y7rajTc+xV17cBV7Kgx/eEYcKI2v2vo
	scHPAapjqqyjJdUsuQS7SB7q6gsKTqzJDBmup+Eon/kPb6Z6sHSGaPg7bjR0U1PyxyxARv/mN3z
	qzfihOkpXPVEYUyKrURaU5SJy3Y9Ug/UfMj5aqM0Xa2jfHA==
X-Received: by 2002:a05:6a20:4492:b0:3b2:924c:566e with SMTP id adf61e73a8af0-3cc720cb55emr213052637.36.1786651740514;
        Thu, 13 Aug 2026 13:09:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 12/80] python3-canopen: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:26 -0700
Message-ID: <20260813200834.1302829-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128956

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb b/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb
index b0c6f9f10e..bf6d505e2d 100644
--- a/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-canopen_2.4.1.bb
@@ -9,6 +9,8 @@ DEPENDS += "python3-setuptools-scm-native"
 
 inherit python_setuptools_build_meta pypi
 
+DEPENDS += "python3-wheel-native"
+
 # The sdist has no git metadata for setuptools_scm to look at.
 export SETUPTOOLS_SCM_PRETEND_VERSION = "${PV}"
 

