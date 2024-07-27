Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97159C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 27 Jul 2024 15:38:43 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.18717.1722094716388114680
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Jul 2024 08:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JiJD3d/j;
 spf=pass (domain: konsulko.com, ip: 209.85.214.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc569440e1so14966035ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Jul 2024 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722094715; x=1722699515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCLaQMaJWjzgTss4fzOacxxfCpF9db3bknUK9pgHTp0=;
        b=JiJD3d/jqiPUIPb2O/9xO1dTMe6S/RL8sxp7hhIpOh4u7WAfO5g6Mn7XDDyBN+dXE3
         bpmkJPgo1pssXoOY1tW90rXNzN0fthpxOjEl3tDmjsofNPOHSKPDTK5j9HbCLS/yqOl1
         6qCco6G+saSHVgR+/LMBlzG6/yvZtFI+APNJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722094715; x=1722699515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCLaQMaJWjzgTss4fzOacxxfCpF9db3bknUK9pgHTp0=;
        b=A8YqbWrAsLKKhvZcsI2YeFwu9CNDWgjkymMzfIV3wx1gGqcJ473jsBwDNWO4Lvl1QB
         bkPbYI3619AwlzwotUDQoXqVRKFxgrL0lV6KprFWgPYYT3dvs/aRaGpS2Ekr5AaDoivL
         xI0L1J4e9FvGIDRXnVtUFMmLiQankHp4PNsXabGUpF+3Yjzi/ZLF/YLtNfncUSuge+3m
         vy9ICUHFlDm/f2DvvmpACdH9fSttnm291XWWeVXSa6G7ittFnko7BR/RRjzX/hVl/uhD
         1RUMIWC3FW3zmNU+X5bq3PV1wc7jEmQ92U6iEj31Q6H17OjXrTQ2Vdwn/73yyW0tO6e4
         aa4w==
X-Gm-Message-State: AOJu0YwNL0HV/jTxe1iONvD3Dwoz6mEWjw+VLDP+5VRhM7wh3GDZKNU9
	tr0rSxYCPZM9J8Hq4l5PxddUo2xb9AzD9AQP872a3tZX1lKS9CuM6ElzWp0QZUSiLXPfXD86Nz8
	VxKc=
X-Google-Smtp-Source: AGHT+IHCwo+ldO7k9HjdIl1En/hipcAITMi+qm3U2ilp2U2fO45pYClaTY3YiKtVt9Q5fKZobJwiwA==
X-Received: by 2002:a17:902:e885:b0:1fb:9b91:d7c9 with SMTP id d9443c01a7336-1ff047e4399mr31554225ad.4.1722094715270;
        Sat, 27 Jul 2024 08:38:35 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f671e8sm52107355ad.228.2024.07.27.08.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 08:38:34 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-configobj: switch to PEP-517 build backend
Date: Sat, 27 Jul 2024 08:38:11 -0700
Message-ID: <20240727153810.502757-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Jul 2024 15:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111445

From: Tim Orling <tim.orling@konsulko.com>

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-configobj-5.0.8-r0 do_check_backend:
         QA Issue: inherits setuptools3
         but has pyproject.toml with setuptools.build_meta,
		 use the correct class [pep517-backend]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
index 8dc706fdfd..96e579c78d 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6f99b84d9a94610c62e48fa2e59e72"
 PYPI_PACKAGE = "configobj"
 SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-pprint \
-- 
2.45.2


