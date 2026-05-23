Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6D3CD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:00:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3020.1779512447587215550
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MVvN1Ppl;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83f674f978fso2945413b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512447; x=1780117247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtn42/bqR7e/s9aC3THmmYHt+C+UeEiEo/W7WSohXhQ=;
        b=MVvN1PplaeNpE5EB1st+ayJU46u0O4TFfaL2tFEKBVq07M3JBI96G+WjQSMR/62Qzi
         uSDePHfy36LsI2c8VNDVIGbhn9XXHbuyiJwnagcf/7JdGpfxnVmWdJZKcQehMt2X6EqO
         nA0TqSht91xlJ9TU95Z4V05ihvAg3gYscZTldXYnjxH5BMdyhgVq+cPs2N+AXv0Iv6HU
         btzzsSOHgOqMDw2KcClsVXvp6U5Zs4DeQWXCRPrKU2EI/lkf6J/F85CXBKBP72dTBjPo
         0x6pvPizXXeFs2tBDe5lLIXha4dgT/d4h86ECGoSc+hlQ1x863u2vyYHlf38ndsTIwja
         dYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512447; x=1780117247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtn42/bqR7e/s9aC3THmmYHt+C+UeEiEo/W7WSohXhQ=;
        b=o68mnhSb+PREQUCLo8bftq758Js9vo8bqcWYFACQVs7IDX802QJredwOSN0FJ0Jeek
         2z2pK6wR2xE+R6DAxraOdD4QdSVh8gp2Kvr0G30uvPn0zpQ59dbjQYBx+eInu7IQYBhP
         0h5SvP9UntszDgaafuc7xtJujC3Hp+0LwTzNt+/BMgZEXSsO5CpO1J1FaEKADcqT9Gfk
         /NEpj1/Pb7o00zy3l9wdc8/l2lzFB2pI6uVoNn0XPR3EPAKWcBC2Z9jghSTqBR6qXr7Z
         uB/HQFo4QYxPM9R8a/AmWqEtRurzigmC9btM7KFDi/C5gMF3OkS80cN3gDKtuyRPDxCj
         A/mQ==
X-Gm-Message-State: AOJu0Ywcqx6zjd/9aEv37SoEqG+vpSBDIAV5CSlPhjWya//CIdYyxkgm
	1P4GN4asPU9QTA6OXSY34v3y8Qomqht3bbKjfGLwpWevrBtihLFu1Hqe4GkrAGeT
X-Gm-Gg: Acq92OEbgwa80ilkdUcLhP93EopF45E5unr63408f+XP9PwkIiCSo5dfRJsyc1c/KTQ
	2Rz1ZwRRs5CNvDJmTNXyzanFBEHTa7y+Kym1gy4/wfo4bIzVXqSmTs254E0AyORk020w9+b28Xl
	SqnnVk+tZCnQ+lRlD8pSFNmfKPfzQ4REn67wIyc0QgbzIo2RRsvCtT7+fE8cJZcF5xcpRdmuccB
	zYv3zcYgaNZuOV77zA8nCtjeLnHrrderKKBX0wX9Xm+mwCrMNEpA7uJT8nRQjV7/xhPx79lb04W
	ejbiapKI0pKIqaYYpCIZcFHZE2Td+WputlI7JRAV1q2d1yApTBG75h4LBSSTdZFDYTolbxkDg84
	QIU8cWqStUeAsvhux1K97ZUDbaQFPxjDcJkK6fxwhgXcbtzxZNpRwBQd0BmmhaHV0A1/KmBLr4U
	+I7IcdBv74gLS0XlW9nErVopBnpHMR2DPc5ORj
X-Received: by 2002:a05:6a00:298f:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8415f407bb4mr5690266b3a.30.1779512446867;
        Fri, 22 May 2026 22:00:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 4/25] python3-tzdata: upgrade 2026.1 -> 2026.2
Date: Sat, 23 May 2026 17:00:06 +1200
Message-ID: <20260523050028.848327-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127154

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6321202865f920d6e6e45a0a5e6cd7c5752a1374)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.1.bb => python3-tzdata_2026.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.1.bb => python3-tzdata_2026.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
index 9a66460e76..0a94aa59ff 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "67658a1903c75917309e753fdc349ac0efd8c27db7a0cb406a25be4840f87f98"
+SRC_URI[sha256sum] = "9173fde7d80d9018e02a662e168e5a2d04f87c41ea174b139fbef642eda62d10"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

