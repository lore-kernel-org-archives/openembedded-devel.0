Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC21C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 00:01:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.1406.1645833661105776348
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 16:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qT+0BGLJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 132so5995356pga.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 16:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TOgArm5p7XLDc1nLXz0Vpfr4kiC8G+CfuktzMCVRz1g=;
        b=qT+0BGLJCGJ8CRXurTPdcWXLsSUUTstTbSqGy7MBZTJzGixqHJWC1S/DkIr/vGlmWb
         Di/AD19fh15mgaEs82X/RT6CSmSXRfHyOwQznQcVExhXka+KmESSHYmybAMYXz6zLZOJ
         pNPwc0hUvCu3MVp1VVYZGu6pPpo0FtpB+13jD/Ecu7gYRw7Fk0Sb3EiQ5LiMEoVoSpiS
         VT2N/DV9YPsMa27ehO0MmNggGe2xTxtX135qQL9wGRyS6NmxLX8ikOyRtCjkHK4WZbNk
         39RNMJaMZF4UDPh+qjbuBJapAYozl9591YngHfQxaBH6ZCGBxYwwqI/Vq5yMgWkemecW
         JhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TOgArm5p7XLDc1nLXz0Vpfr4kiC8G+CfuktzMCVRz1g=;
        b=6QMAg0iV+GN0C3xOY+/1EBtOU78c4UsuI6u4PEsLHPJojE5/Trn+QXh8AdmLGhE4pP
         5GUHECeKKq3srZwT3253vasWYEY3kzOgjvSoEJX7APwDHjLLEvAU4/Q5d3lXfoBO5WyJ
         EvbJi9BMt7sE5MZVN82cByWnsbywYvBGqghW/gTw5ADkax2zXr5Df9rLhjL8O2a+9xeD
         hGMvHKChMraHr858QXCpjFxWKVtPv9e7DmYEWhREjrIoo1HFYyCMxo5dXseC/OlTODx6
         0wgAYsoSDahmtoDxayQ0ONssI94sjfY4Og5zXOb3SZHwFKLyKmTgEmUa+98Lpzecs5dg
         lAWQ==
X-Gm-Message-State: AOAM530vsKFQ9IaPF89iVXyHMcN5OdiK7kJr8N3ooDQgd/iATvrSXU3U
	Atm6L99TaGj3fepftTdQqFFDOqcdg2A=
X-Google-Smtp-Source: 
 ABdhPJz96HUR8C09ICJVvYOgu6e+dXjvhztlBV8ykS95FBi/lYHerUirtc2tAty38RMToiBEUCh38g==
X-Received: by 2002:a63:1554:0:b0:363:794c:9e31 with SMTP id
 20-20020a631554000000b00363794c9e31mr8123816pgv.66.1645833660281;
        Fri, 25 Feb 2022 16:01:00 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm3678650pgr.37.2022.02.25.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 16:00:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-backcall: inherit flit_core
Date: Fri, 25 Feb 2022 16:00:51 -0800
Message-Id: <20220226000051.671863-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 00:01:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95527

Upstream provides a pyproject.toml which declares the flit_core.buildapi
backend for PEP-517 packaging.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
index 56b1485342..16cd58892c 100644
--- a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -9,4 +9,4 @@ PYPI_PACKAGE = "backcall"
 SRC_URI[md5sum] = "1f4c9a370c78743406296f48e56e8821"
 SRC_URI[sha256sum] = "5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e"
 
-inherit setuptools3 pypi
+inherit flit_core pypi
-- 
2.30.2


