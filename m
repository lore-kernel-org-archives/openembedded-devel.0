Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35E2C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:11:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28172.1786651855947625011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ThpjHC+U;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so4596805ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651855; x=1787256655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqBON1BPTfzocKHEKuSaRtEoAMdlAW2ua+G5AbaVuD8=;
        b=ThpjHC+UnjwHce1/KGIYLeZ1Xq6HUtDPcBVB9R8SYxYArGbx+4SJJCB9SvIcwIo7O2
         4N9szbbbQzWkr+XMJegixlbLjLl3LGF2usthMHSGSzSIopPBoh/fxcXB7QEesaNZqowp
         Obqv4Tn4BCTEJujSHHtWRekFSJAgVuPtRhYH2HYYkqN0lBEAh2gqWcPb87J62RQU4UBN
         KIVhJVEAY2+5Q4Q9IgyRGLvnZ3e/RvjDeCGfljMH8zMb2BtXwAYUqkXeQQ38yqf0lYIi
         ALqg8v2ADmRzNLgsC0WBLokRN0gHKzFoa1y0vsZxmhTYBqkwNoL1N5osJlaN5pVEeX7O
         BrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651855; x=1787256655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqBON1BPTfzocKHEKuSaRtEoAMdlAW2ua+G5AbaVuD8=;
        b=k5SpqZynkhPne792AwMEewZyATRCiWD/GZQddDvoJmFtFOV6TYmy0QbD0QDjEF740Y
         U+3L/MiMXDCzIyn431mzdxZkf8Iyoco7FHV2Bz0Pu0xfHY97Vn+0Yd/paNejh8fCt27f
         IXu7ly5yWuBPqu4RruB+PycleBn9Rl7p0DxhqsLt47oWQ28hkFUvm9vXS8Be0/B9wxQX
         hya1zRHIRHnGmCaHxYdKi56uHRhVs1rw1pTFQhrbs8JorsKUy6c8Ng+zUrWbqH5L3yJo
         9tCY7IdFIrqeWO8Vi1J73Dl42N7ZK6sYi6ryme9JlI30jgkZ6rB2SciShBq925HcW4KU
         OkRw==
X-Gm-Message-State: AOJu0YxZmRi+mYovIqd/iquyKuCtsKisUTsGbE1yxKDrEFveu/tCmTWl
	sQpu/k07sgJQd8qPf9I9eOCE8A6VBt/GXL86gu6ctavNPtAHgDE9oIDb0hQHXRUj
X-Gm-Gg: AR+sD127Rc0n1FkKfr2ABbhMdFteJQTMzOZnUx0+DJUYPBY3n3SpChtcW5h9uFBkNpX
	Jq8fe5L8EUNpTS6quPzK3FTZlGGCx9k+j7pf5SUm31tGN4FlDGIc+3dDa8kvfPQ3cZpmDlllXkc
	Ix82ZUD0GeyfbatiONORVWKL6kqCd676CoNeeZ+Eyb/koLLw/j9ITsdtQV1qj9jICZd/CLjYo9Z
	mtw2T+OS4S9927E3jqj67JLl0h3wKYxNVn/Je6YjSQPZWGVRFZ8fwSHsNkKqPzNlJ4N2U4cFXaP
	pHVl08Gfd3KOHdMK3/FD5dbMrrTTUBcryoI7m/Dl9LpKgoQIJbyX5Tn4jij+1di/bowzeKJMuuh
	qjJdi7jdZ7ZX4ZLqb2ti8cH21de2lBLyXLrYjHOFHCDtjgIj2q/MmVLPGGrmwLyfo+AVjRSqN6M
	MWhdyuprNvuH8YQWY4CG3KLbtpFxPb8AwJs3k7Edgbg5KYDhK56pu/q8AsoTGGwsXvCIpd6N+sQ
	BXEJR8BmSN3zzLVAydF4xDL6cjHaFSELYuK6+dUDRPmNQSd/LcrUdHNz0F/TTddryvH55h2+cPX
	VhTGCEc4WrxazGwwc+FO3+Bnrswn4vAqtyJ3F3uduL973rSnryuM/4pilMDTNOmRFIXTziTo7P5
	uO+CidH35jNsk8W2cYdeNEujHpL3L4Gt4uZgU0/QbSUjbKCmk2PcZXpHj
X-Received: by 2002:a05:6a20:728a:b0:3cc:51ff:c2e7 with SMTP id adf61e73a8af0-3cc71dd8814mr226475637.10.1786651855228;
        Thu, 13 Aug 2026 13:10:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 78/80] tftpy: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:32 -0700
Message-ID: <20260813200834.1302829-78-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129022

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
 meta-python/recipes-devtools/python/tftpy_0.8.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.7.bb b/meta-python/recipes-devtools/python/tftpy_0.8.7.bb
index 7bb1ebeb57..22b227a34f 100644
--- a/meta-python/recipes-devtools/python/tftpy_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.7.bb
@@ -11,3 +11,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
 SRC_URI[sha256sum] = "e8a5aa092dab2e1cbb9b94392036827b808dc37eb6cf1b1ab33c81957b3f5fe2"
 
 inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"

