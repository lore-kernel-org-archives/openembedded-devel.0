Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C6BC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 19:21:05 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9596.1658604061456251841
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jul 2022 12:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UWKQO2af;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id z23so13771174eju.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jul 2022 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TjPsm/Xft3DpuMIKUVanGNoDoBZ+6pPSY4MpkILuxH4=;
        b=UWKQO2afLZsi/TdmBdtjwiRBRGbyC1HeMOgUUj5LPvYzSs66r4RhcGzIBmOroYdCJ0
         hLGG5xnBGEFy7Q/tRkbDF6+cBDvLu23VilpIWrk+MsG5S6JFGr208CnpIHqhmuaWKhp4
         XZLqmyeZVJ/h8k0DgSX/T51Xo8vOGoilIhDVaz/C4/fmr6OkAzB8Oo5hOen3iNDvhB/r
         UA1wosVAdiDPMR5ZvKgkZT3STQlyCsDxAQi1QbD45YTtLoOrfUCER1isdErX4lI3XatM
         wN98sWSi7Hn9Jokw/UaZ/b/PYL+cRf25+AcdTJDDxKtcS9YKcExBscLqdgdLe5KSOjxs
         DVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TjPsm/Xft3DpuMIKUVanGNoDoBZ+6pPSY4MpkILuxH4=;
        b=653lDHBbLJvxzG2Ppjqzf/sZzpRd9s5xxgEn7xL5YV2/6B2RynttbH+jeYRXwswGlX
         w1SYuhBgQ2J4CfeJt96QGt06wFvlwRS9+YCP5yktCRZtEH9b5Wg7UCcs129XwiPD3YJN
         ivZYwe3KJsbEkuLcxV9cBrDr7ZFwVxirTv1iZNQSE4ssOhfzHKRyWhZQ3kvWrubjUhNj
         xArVC6uqzzmuuFzxp5EgJCiyP1uwhTYgMadUl49jHCi9ejKrQYipVdl3BFInsGQro0DX
         dlgfYXgvxpe+WmPxiJmMBdlVEfCD5pVsPJiHqZtM6Rgt+McVkicjByuZ/9SYtujf2hC9
         7Hdg==
X-Gm-Message-State: AJIora8tBQ8yHjPouk9MEd89IK2R4HHvtmGvR7iY2Jj8GFcSYbmeghYO
	bcMx7zEE5TSAWQ9DmObPayRL05efi1w2Lw==
X-Google-Smtp-Source: 
 AGRyM1sUbymI3Xok70HH0aMTvq2h5hSz1C1ShkDZ2ORfI/xFd7qY3Hc0bTswlFcK4xOrUHp8CtKCyw==
X-Received: by 2002:a17:907:94c3:b0:72f:3f8b:d628 with SMTP id
 dn3-20020a17090794c300b0072f3f8bd628mr4301728ejc.313.1658604059624;
        Sat, 23 Jul 2022 12:20:59 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45qzxv98s73x2tm3.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:ebd8:f58e:9524:1f6b])
        by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b00726b8e84c1asm3463842ejt.21.2022.07.23.12.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 12:20:59 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python-ptyprocess: fixed test_pass_fds
Date: Sat, 23 Jul 2022 21:19:19 +0200
Message-Id: <20220723191919.97586-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Jul 2022 19:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97957

This ptest needed bash.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index bff2d499f..2a8b8730c 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-fcntl \
 	${PYTHON_PN}-terminal \
 	${PYTHON_PN}-resource \
+	bash \
 "
 
 do_install_ptest() {
-- 
2.25.1


