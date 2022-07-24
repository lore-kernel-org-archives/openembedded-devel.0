Return-Path: <tvgamblin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18B5C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 19:48:12 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.20293.1658692085565389889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WDYx1qDI;
 spf=pass (domain: gmail.com, ip: 209.85.219.48,
 mailfrom: tvgamblin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id b11so2529876qvo.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITMrInh+nH/8g6oGdjATThzF4DGP50h/fHBoh/d6jXY=;
        b=WDYx1qDIMJK19DDrWKAMx2IphsOqvYXojFdTxPjuqC8+nTIDzAY5s1RoX7GJWbJn8u
         2MxOek91znLkgeiS4rKnQQ3/HloxrDYMXVnWDS+b9cvJ6K/hYG9vwSfpmtC0g393NAgH
         Z9ie6O7m3E1bMuWnnQgTHNBhORUpw8gxM7Jv2r8QHcFte9FUCoJhmNU6juI/wlmrsLek
         m5DyqS53QnIG9H6TExUiVKsmBFtU6MtS/Iyuf8s/rQsm/+eNLJkBMlBCAviGlg8fkM9O
         ddYtOwCDmH3tVfhbJZt94wAtDW/9BIjQcShOrvKs1yfRwgXoSPBhor/nbkUg7vXu5Szi
         QNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITMrInh+nH/8g6oGdjATThzF4DGP50h/fHBoh/d6jXY=;
        b=lmjFZ3unuf2z86rF6A/14wne3X8p3Yy6BA8KLsTuUvSBYkQgJ45y6qNc1qOaIEFKBr
         VlsWMeKxmW5GamRFm5mmFDAfqhuM+tPcsiZrC+xSCp7q9fAx1aEJFowi+Dnp8rxdmGYg
         P38ldENQVWszFx+CkzTGcn2vhR748p5j2/3Q2HrB3eEv20a/5kGP54RKO/7qje8rM1k3
         d5cpva8Qhxv8OJBuhu/s0LJS4rRooioQ9n2+1YYBFZcHwclRXWv6GYACXVgN1VPA5O87
         //kuDJPBDGGgYp4sVqUuCFc7d4GGrD8amFiGoKyRmLIOfYCXY22KmkJN7+xlM3L07Ohd
         q+2Q==
X-Gm-Message-State: AJIora9QoIokPbn403zftFWEgI0njHVDb43vTo3ffwmSqmuIsMF/W12F
	3mWqxMJYLwVK1FFKOf6/FfxNyWA9zU4=
X-Google-Smtp-Source: 
 AGRyM1szUwOhGjw01xzKUtRLCt7QhxiviJEJ9FxqiHhkQ95TJHAlTNBnr+b4vzLBWidr+UPz6mEkZQ==
X-Received: by 2002:ad4:4ee8:0:b0:473:fb95:1a3a with SMTP id
 dv8-20020ad44ee8000000b00473fb951a3amr7882506qvb.14.1658692084448;
        Sun, 24 Jul 2022 12:48:04 -0700 (PDT)
Received: from megalith.ht.home
 (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id
 w19-20020a05620a0e9300b006b5c87e9eb1sm7524288qkm.102.2022.07.24.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 12:48:04 -0700 (PDT)
From: Trevor Gamblin <tvgamblin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tvgamblin@gmail.com>
Subject: [meta-python][PATCH] README: Remove maintainer info for tvgamblin
Date: Sun, 24 Jul 2022 15:48:00 -0400
Message-Id: <20220724194800.189798-1-tvgamblin@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Jul 2022 19:48:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97964

Signed-off-by: Trevor Gamblin <tvgamblin@gmail.com>
---
 meta-python/README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/README b/meta-python/README
index 8b62ad32b..01c51dc88 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -44,4 +44,3 @@ Maintenance
 Layer maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Derek Straka <derek@asterius.io>
-        Trevor Gamblin <trevor.gamblin@windriver.com>
-- 
2.37.1


