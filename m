Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFDDC2A072
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 05:32:48 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58473.1767591158877484759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 21:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T75Ui7fr;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ae24015dc0so1475950eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 21:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767591158; x=1768195958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEoBNMO2Eu7NmLF9X9VSjE/cvtsEf1lsbWRpYieFsLA=;
        b=T75Ui7frrVC4/VreffblqzX3RXlkqEgJl76tX+GEDi0lOO78R3vHh8B45Q9NVbPDvJ
         XkN5YMGgO2PO3xkJmW52EDw+DmZl1+7834x4CuVOLFtrhZWM6ULQFqXol5dVgfBrFl6b
         igdtNrzNz2P9GRbI0093sTsXX5MojHmoj2v1+PBHgl7g63eK4GOlDrM/ArTXphQkveeE
         DCp406tFtLkUyqIYi+OpvM/d5UK6bPmLHCx4HQCoVpdkoeILI1TMyvw8a5nDdW/TFhsT
         mw/8vY7XmdM0rCe65GMtJaUyFvnK/agsNo4YKYlH7mCH2KU4X2dlF/UG/bA+7QUlC1ZS
         m8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767591158; x=1768195958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEoBNMO2Eu7NmLF9X9VSjE/cvtsEf1lsbWRpYieFsLA=;
        b=twgyt5e/XVkI+HkDwFsTt3vEvs1jzy7FEvoMjdktW6skfrCOP+LHssAJvAgPV73nEJ
         h4VSLiKI9tAEg8U68QWMEtIR1/ttLuBI52HqvJbeQb7eItaPhfclLdNtCzoBMeoOV+6M
         97AbNxXPiN4TB+22gVu3QQNjNBF2a8tvp+PXdF1TAUY0twHkrti7TceLMDfqNxgcTM+m
         6nuc1513aeTnVUnccZNMw2Smt2D5J1At5p4WNzQJvczNYwf2YFGEkhSzQaqqWC01tKFW
         M3kySEPbXSAhrfWLYczNONsIU3zpy36eVyvNHcTqUWa4e89FuxMN6B5wPrLTcPIEHypi
         ko5A==
X-Gm-Message-State: AOJu0Yyg24cprZY3gU3/oDJgb88ve899ARC5sg4RZDS3UgtD5rDMNWkR
	6l2qrBX7cgjWFe6lirhq/CGDWjdZAW2YQuRU+tVxUSr9GGmD5aX9FvNANl5LIQ==
X-Gm-Gg: AY/fxX6g9CTVrhiRtXj400lQCX8hbRYNsQCVN3MaNRAceGz3Fw28fTAW7wH0hy47YcF
	o5P5JQQF+Ur2IbSez4b6bBOLux90CGC5ABJwaZXhHdAm1wNgtqQeQ6xbcggwuhOJwr6DggSCC/n
	1C54kfQaTAfScPII1eJgpltmIi+7J2hLMwcyMzAqd046ZPdX9LNz43b8AbAXNWB5XH6ScAlbSCy
	ClliKBqB5jB/WJYwNzy80iWruZe8NsIchPnuOB6j0HuVsGnusHQYzxJEVU+0s5jjsC4Us6FaQEr
	dxz7J0sS0wu9wz6+6+nP3K5yUQFK25JxpCq/g7r4xb0kznyjlPc/Gr+saUu2FT0j5Q8BY0aJOuJ
	J5te5DIBK/r0/o8Gs5qTYO5ccFRknuTrplntX9ree/9glsts3d+maO7mQBqBfqV5DEpIDQwvFR0
	YcxK8YBinCAyMvmQ8eUAiQhYliOEe0Qhcta1eqZvT3Mf7YERunuk8ORGPXAiMw5zq4n/xEPvnOM
	jF3xLrrzeybwCdHZcTnYf6aQfcTr+w=
X-Google-Smtp-Source: AGHT+IG0hWtFMocI5GHnYj5ZSmFZtKpQ2xefQ/LbplI3/AFR9m6Vo43ixnTOpF41amTBWRt7NdL3OA==
X-Received: by 2002:a05:7300:e8a9:b0:2a6:9fb5:f78c with SMTP id 5a478bee46e88-2b1434238f5mr4809733eec.4.1767591157799;
        Sun, 04 Jan 2026 21:32:37 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42e7esm10108697eec.22.2026.01.04.21.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:32:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-wrapt: Upgrade to 2.0.1
Date: Sun,  4 Jan 2026 21:32:35 -0800
Message-ID: <20260105053235.1854719-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 05:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123122

Switch to Pypi fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{python3-wrapt_1.17.3.bb => python3-wrapt_2.0.1.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.17.3.bb => python3-wrapt_2.0.1.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.3.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.0.1.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.17.3.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.0.1.bb
index 68e356e23b..6339731958 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.0.1.bb
@@ -2,15 +2,11 @@ SUMMARY = "A Python module for decorators, wrappers and monkey patching."
 HOMEPAGE = "https://wrapt.readthedocs.org/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=945f689eb1f8c581bb9d635baba5abb5"

-SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d"
-
-inherit setuptools3 ptest-python-pytest
-
-SRCREV = "99130c02842c87001f40dbe73e21934c0615398d"
-SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=1.17.x;tag=${PV}"
+inherit pypi setuptools3 ptest-python-pytest

+SRC_URI[sha256sum] = "9c9c635e78497cacb81e84f8b11b23e0aacac7a136e73b8e5b2109a1d9fc468f"

 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \

