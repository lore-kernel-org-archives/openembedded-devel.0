Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70733C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 13:38:45 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.19519.1753450712242890325
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 06:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f20yOMMx;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3be5c0eb99so1930404a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753450711; x=1754055511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr5j6avxNb0G6WKPKnAej6dLQIvWsiQaK0sNaXQUl/o=;
        b=f20yOMMxcZ2Wj8Z9nKtTjLAytoYAKeM8snP9xNWiLrwuGKIan9T38wvkXCg8v/j9XN
         dmv4Z3mdiGyIl38HhowzGcR9xVjncuCXJjeMNk02VStlIq/Cg/al3/5009+ybLipBfwc
         MELLTmTcoCffD7r/tDabLvne2uJyaNFGKSTy6TM/afI6OtSfrJiycZ0o5doF+cjtbJgG
         7t2rbWnkGV2wz7WBHfzToP1RmFHPolM0gT70cPgdfMB9a3QSUDmMuaWcu7crwsM8Lj5g
         t/uR8TnqJG6sy9+UyPeec7O6uKc8Xar4K2m2dSatWr9tgbeQlQU9gf2JVcK/EzS/shXt
         Y7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753450711; x=1754055511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr5j6avxNb0G6WKPKnAej6dLQIvWsiQaK0sNaXQUl/o=;
        b=JhD3MUMHdyDSiDS7gCrBu+2WKJqPXooVDmBtETB6Aips5a3NHU+saK1RC7Uyp9kovj
         vnEmETzTiVz61AAjh3KY8paysxQ9DqR1cKqCBqiC0cSUQDSs/5rsENNkUO75eZSYxZJT
         dlEsYIZZVXo+gcKbpSaHMzwL23k2QenXlcBD4/W/aBavvzvujQy9HpXlQ2QyaB7FcoYA
         W/1nWbhpfZrC4x1xmjh44sMHRiz0r5W6SpXo2GZQTPicPN+kfbyciAe5cVrpBm4bgoE4
         qOXn+dh2CcTPWL7/kTurV6IYT6adX/dpem5gRRc8Tv+DEUlj7pOG5I2c3ZXkVVRIs1kY
         ItHg==
X-Gm-Message-State: AOJu0YyFjWBCR6u1+3eVsX0ZzLqIuc4sb05YaYzEwpbs+lYBs3QnwcAI
	YzOYGWaCSqz9VOOzxDRaDuxn7Im1fTkogOL/8VTgxwCVSZuRH0E35Jk/fqiFrwiVDEU=
X-Gm-Gg: ASbGncvL+iNLP7JMYwFemqkmBQPb5xo7xMW3Sg3dzgC8mTBnYo11Ho0oHFYlgfOd8V1
	xBOI3wIDs9DLKbPVOA9g9R0oa0ZqvaTrCitLPEx9HoNyihgltfc1z3odoAuQpbSBx0UfY/YtiLW
	aYdnCIjL3FzgDGT9or9AX5sAw9wsAu65NlgbCSDYE8OgSiY9LADeAqEvpMg9E8KIcr5Pyn2kpgA
	ma3L02qCBeW8LJXdYJi8/z4K7Cjjjm/hlbXxYtvMqHqfQpkwqmNRCm6pE+o7anoijURmSdlefvD
	SJN4ujWrTOuNw2R87d1xOhTsIIMTbq/nF7usrFSykBCUbLxm+hERybzcQMiUc7fSPlW2thd1/Be
	nd135SnW3LdXTBw==
X-Google-Smtp-Source: AGHT+IG9WgZODU4QNy1TTjT7oKsnHEfB0C8pNdCuOThxA+Jkr3fORlboZ7h3gE/7hnRQzRX6pqzdPA==
X-Received: by 2002:a17:90a:e7c5:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-31e77841b26mr2893624a91.6.1753450710803;
        Fri, 25 Jul 2025 06:38:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6226adfasm2549284a91.2.2025.07.25.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:38:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-pytest-mock: Upgrade to 3.14.1
Date: Fri, 25 Jul 2025 06:38:25 -0700
Message-ID: <20250725133827.1533329-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 13:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118728

Rename PYPI_PACKAGE to reflect upstream tarball name change
Add missing dependency on python3-asyncio

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...3-pytest-mock_3.14.0.bb => python3-pytest-mock_3.14.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-mock_3.14.0.bb => python3-pytest-mock_3.14.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
index b968cf1cd4..775b77ccc2 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
@@ -8,15 +8,16 @@ LIC_FILES_CHKSUM = " \
 SRC_URI += " \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "2719255a1efeceadbc056d6bf3df3d1c5015530fb40cf347c0f9afac88410bd0" 
+SRC_URI[sha256sum] = "159e9edac4c451ce77a5cdb9fc5d1100708d2dd4ba3c3df572f14097351af80e"
 
 inherit pypi python_setuptools_build_meta ptest
 
-PYPI_PACKAGE = "pytest-mock"
+PYPI_PACKAGE = "pytest_mock"
 
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN}-ptest += " \
+    python3-asyncio \
     python3-misc \
     python3-mock \
     python3-pytest \

