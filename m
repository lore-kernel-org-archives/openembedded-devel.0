Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6667AC48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.628.1708129044752734663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1z8lIDP;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6de3141f041so2102594b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129044; x=1708733844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOc5o9fv12Cnfir2XNpD18iQLKzNFewJxuAJS8DftnI=;
        b=g1z8lIDPU/jw3U1Lge+7s398glzrTJ9Kbo0zSwRISeKZRyRQ9WOkj5SRpTUHxaTLWG
         lyaF3dxXAb+rbMHsaRCmaQ0KpICqU/rne0iUBspRYMX2H8rZv6Fiyaebhi0kVgu4H6Q0
         VUIfrKS4m8Roa+qeKAYdV0MT+oBCurS/cNbiT9XtSD3Ok+Lc/9hJAlf/vB+w5jY3Scre
         bRtOyDu4TBJxSzQF/U/TtaXlntkhsCHJtPEveqNZZQaUasKCNukrNbRI+lVWQcjdW2+Y
         cHp+eCy0DZcBo9w9I7Kbd5HZ6hkhefvVG82pPuuc4Lx1FdpLGfQ4Cnuley72Bvw/2Pv9
         z+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129044; x=1708733844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOc5o9fv12Cnfir2XNpD18iQLKzNFewJxuAJS8DftnI=;
        b=phBlnQaZeR2FXbS9E2BZGTawIA0i+rZqAMrd7mVfSJ5/nYxOfWrxNBBAx1+tkk26e5
         OKlUDQZ4309l5+D3GbHJC0jNcCbgfYbSLZ85EQH8Pj3ELoYD2UlhFHojXmXdICqboDe6
         7NtzvOYB1Wg8aHXXB//jx3msaFczdd+L2h5uT8U64ZT9GyXk9tipCq3mdwEA6SfDpmEQ
         0KzAm8vcP2ojS2c92U8N+XsyuvlVNFvDzyOc4FG/9fnj3HSTL8XkLy3SCmUeX8XtYUG5
         w8nR1ikoGR1NvhrFYganzXkk/NFpb0kI9jNWmHIkPupfnBnWGYwU9mbsCBLZOFcRQGEb
         I21A==
X-Gm-Message-State: AOJu0Yz3x6+/v8ZqqPZ6DmpUA6CYRUQbRCZOQ0zdtURym24/3uVJurE6
	uDbEq1YTCImiKsuc6isgwQhMlNCe4/S2FzdnI2suZChSGP8eDlS40zJM/wKT
X-Google-Smtp-Source: AGHT+IEpN21Fe0X1I3N7tlHAWl8/hXna16+Z00KjFGtyZ+s6izhVlkf0rAkwjGJRF3uJwG5zKJpsaw==
X-Received: by 2002:a05:6a00:9399:b0:6dd:c3fd:45fb with SMTP id ka25-20020a056a00939900b006ddc3fd45fbmr7860512pfb.24.1708129043994;
        Fri, 16 Feb 2024 16:17:23 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 56/60] python3-typeguard: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:47 -0800
Message-Id: <cda6392cf72c95bee8a6f2c2c37a5c1598d2e479.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108826

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-typeguard/run-ptest    | 2 +-
 .../recipes-devtools/python/python3-typeguard_4.1.5.bb     | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard/run-ptest b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
index 53a02dc4bc..000620ef73 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
@@ -17,9 +17,10 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-typing-extensions \
-        ${PYTHON_PN}-unixadmin \
+    python3-pytest \
+    python3-typing-extensions \
+    python3-unittest-automake-output \
+    python3-unixadmin \
 "
 
 do_install_ptest() {
-- 
2.34.1


