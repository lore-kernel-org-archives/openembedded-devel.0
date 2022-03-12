Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B51C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 21:33:24 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.9510.1647120802767678333
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 13:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhW2CSd4;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso11142698pjo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Zj59HUX80T1958mqH6VE09ZZzq8THIVQs89HxbNy2I=;
        b=NhW2CSd4ybFN486wiNiOW0tpPzpEfkYvuaUFRqs4IOnI6yj48NyUPo/4pEAbYQymoF
         m1hc/9jCDRGKlAbpgUwOjE5F5n627bWhzc8OcQGnEToEgXvjHMj5LSQ2NvesjSVOySUG
         vOdfqRQulahddpAu4VUaKviw00YC8bQEeAIRfNPWaVj0e2Cr/uVheKxP4BpWr/bilOqY
         +a/FzA4zUCXR3LNLcYqb6x08oDDoJ0IfXD26Q8sb2L08B+64UGGga+ztpvzq6LWGNSSX
         P9w9CRHbckZC8yz6Ya33GflnuhZXF7jwTBockzlb3rhokiXSHiPP40b3yY5VTyBgZ7C7
         kOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Zj59HUX80T1958mqH6VE09ZZzq8THIVQs89HxbNy2I=;
        b=7b2mBkJQOi6gwJl8T+OxjuIfANuD17OMVwtCYVcd68MmE8aV1kg1Q7dflyq8b69jzn
         rvrcNzGxsRzdZyky6hAA0HCxryfXYQWz0OiObEEqbJFHDS9tFjEefuaOoCr/59LCWF3f
         pkuZbcmViBWJZjrXxhPZs9bA1zCxUl/maRTtK66own//RyTJIL66+6hbHIyiGgsJJ/1w
         +mrdAVP6KBdAKwlUmpl/7Pmox17OTWu8oGgE+4hwiU6SRhwTWe7fREHe/owAU4R5fIUY
         w44DpvdSGyXp7H6LdyIQOuU/IycNQwf3ccw//WPDyk7HRek9/aPoHaxKxoKc4NPBwLQT
         HkFg==
X-Gm-Message-State: AOAM532ESKh3TXT2yrF8twPqExlXDS+E0KXc80zdCwHjSrI8uB5hqK2H
	qQB4yOc2CAhK2U5i2f2vPTBaKyrOChdbGg==
X-Google-Smtp-Source: 
 ABdhPJxOX4sAzwj0qGE7OYfZtKwJSh/fbUL2mTV4aPmKvu0MIasXfGOFbw6+fMcW9j8RoNfo9FCV2Q==
X-Received: by 2002:a17:903:11c9:b0:151:888b:e1f with SMTP id
 q9-20020a17090311c900b00151888b0e1fmr16866931plh.78.1647120801934;
        Sat, 12 Mar 2022 13:33:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 gw19-20020a17090b0a5300b001c5c937384bsm3102230pjb.52.2022.03.12.13.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 13:33:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2 1/2] poetry_core.bbclass: adjust for
 pip_install_wheel.bbclass -> python_pep517.bbclass rename
Date: Sat, 12 Mar 2022 13:33:18 -0800
Message-Id: <20220312213319.1814870-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 21:33:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95964

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Adjust for renamed PEP517_WHEEL_PATH

 meta-python/classes/poetry_core.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classes/poetry_core.bbclass
index fb37c78c78..b2b80efa4f 100644
--- a/meta-python/classes/poetry_core.bbclass
+++ b/meta-python/classes/poetry_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native setuptools3-base
+inherit python_pep517 python3native setuptools3-base
 
 DEPENDS += "python3-poetry-core-native"
 
@@ -8,8 +8,8 @@ poetry_core_do_configure () {
 
 # TODO: ideally this uses pypa/build
 poetry_core_do_compile () {
-    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
+    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PEP517_WHEEL_PATH}')"
 }
-do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
+do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
 
 EXPORT_FUNCTIONS do_configure do_compile
-- 
2.35.1


