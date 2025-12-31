Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63017EE57E2
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81811.1767167697040675460
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IGDzb2Lf;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so7208955e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167695; x=1767772495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaTLdMZ53ipzhbBumWOASQOmj2aUNym9pEef5+muNRI=;
        b=IGDzb2Lf1n6PfWnYOq3o3cedD5zSeOVgqchQjmVmWibUkpZvGZG6+lu8Fzd27L0gN1
         QFSKSuKjHLBc9yy1RKe2LXEdhpj+qNFGBFKMpXBojKvZFdrPIqIPfiJiSjdYwXWtRW4z
         UR/yK4B1s4CGr5Jwn8hsSwzvk/bfvpRN8hSgRojoFBbRFaZqW36rismi2P378YZ8Dsvq
         z+gZCiNMLpZ26OSa86SSM2fIHKDb8BKAHDzxNOS9rb21d0n47XJ0Pghm4Qd0Zg1VBp07
         j6ZP5Y4GHDX2a0hNaW9OXPdZTTD5TsJMpiPFeXa7WPWiTE39Z8odhpYUmAH0ieByQWPq
         vw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167695; x=1767772495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MaTLdMZ53ipzhbBumWOASQOmj2aUNym9pEef5+muNRI=;
        b=rRRlTpsguO++aH5lN7ACbEMPQCfZ2e8WfuOQO61PYRX5KTnQ1ipYFRJNLKPnM7su70
         hrlz6GH0IuYWgT52c1W1PnAp9fxbXY+t9EkvUsj4BZFgvbLOqKEnIjX3AOoNIuNygCQ5
         +rq4BtDUVLOrzuCICfA9Vm+U2S0Vmy+y0GYq3Nr0RA99EjNu4NGLGGa1Y0V00pf4yjqV
         sWJ2Pl2s6k3f5s+4Cpt1Ng/yZl0N8O1JE7fjmw7kXihM8QcMjIrUxribp1Ay9DSy7kqJ
         9HSgD1ed2uZk+wV2Vh6CRLwj6QCpF9ykScDrGpsHRHxL3fyPUDtI4ee0WRxGh9mb/Sxf
         n8EQ==
X-Gm-Message-State: AOJu0YxkxTZLiDcbxi/WtesMlHrCXQ8ECatRJfWJhY6f6VEURO7eWyci
	Q10CU6ada1l2HSNt+kUC7p6aT9Vt+ox70m6KbkcpG9gLEQJXhSQpvN0n6gs6KQ==
X-Gm-Gg: AY/fxX4cQ9pvGJMkfyG0xbV+SQeu5eTQ72jMhpOb2afzL3HLFN0+BQefzwLrGo1SThE
	FrACmEpN05GdnoH0jmHitGu9sRWmG0E1Mflc/LZuUvVFI7PVHai4c14DlKsDuV9dMbukbaGTQsP
	sYAU3If8lNdfNKg/b7KRgQfVSW1+TCqOAdjJwfHtlCcBKqgVvpwz2DEgGYkIPUAWN6yvsb4nwHZ
	ODKzpInGCuGFfuP4VTm2N0q4M+d5oK4qvPp1jjYz+axwXHGlAUA3QqUxJ5FFB4wVwbEPndH6Xq6
	9xrqeL4LaMfEcoadw3i18/2AX0cjTt6iR3bnp+PdvGoa05IhKPSU7XrxX69DVHEx2x0gH/mfp0s
	pRwZfMr2n0oLV2keBaMqjB8DdZrAgh7eBsbp3Tg/UQScOUU9+aqfGWClWs1hMmHAtihaHIlbxgh
	oqzkQTo4UH
X-Google-Smtp-Source: AGHT+IHcSGPSm53zCdOGRO2arZsx3nFuClLoXP3ciHq+1dzPzKbVPJWswLHaNDTrBZgpUBhgcU+bQw==
X-Received: by 2002:a05:600c:3b1f:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47d20423ca4mr410723275e9.27.1767167695348;
        Tue, 30 Dec 2025 23:54:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 25/34] python3-configobj: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:27 +0100
Message-ID: <20251231075436.771395-25-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123065

The related CVEs are tracked with configobj_peroject:configobj CPE in the
database, and the default python:configobj CPE doesn't match relevant entries.

Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%configobj%';
CVE-2023-26112|configobj_project|configobj|-|||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index bd4764f4de..474c345b14 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2df3cb285297a24cd1097dfe6e96f95"
 
 SRC_URI[sha256sum] = "03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848"
 
+CVE_PRODUCT = "configobj"
+
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "src/tests"

