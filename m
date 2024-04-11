Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B40C00A94
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:33:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.27571.1712864019664647501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXoVbho9;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: geoffhp@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e3f17c6491so2029205ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 12:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712864019; x=1713468819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEnW/BZADb2iDPmdbJgO+MkwNyXeIaxxt7t9VGkBWSY=;
        b=jXoVbho9IqUO7lVr9kk7LlzKR+GxJ8eRfDo851h7pEiu66viwd3ZCm+E7bbtKDYjpO
         M2yr5qGdgFpYwHwmp1QctX8foyvQgJ6i7k5KYGBoFlnPNAJUeqG7GM9Il9f7+LleYUjI
         7cvFnuPGM4PWY+ysuztzAOztKLRcMbM6OWIj+Im0+cLP7V55Nw45zyLC3LLJyboaT9p/
         78uEoEUqSHSX/d/8+r8K547G8P4bRqViTeBrVo1fjsbETDJjVi65vErGPN6cUvw1F2yL
         Smv8pRMsI68pgPX/fINw8Fuq+cMrtgPJBsWYsSPywPmZH1NrZqbw6whpV+xrRKYOPFDL
         JGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712864019; x=1713468819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEnW/BZADb2iDPmdbJgO+MkwNyXeIaxxt7t9VGkBWSY=;
        b=tAC/3z0QPQc87zaBhs55hpnmoU8Clgs6OeVanrD2HZ9gzOmy/6evOyZYaz1t1rLd7y
         qSu64FlnWYulzFPEWykwMmUoURp6ClCcAMZfSUM+ct+X78y/+JD+uHZRwQWLbMZAXE05
         UNn053ngEDxfIL582G6nDkUDjKGfR6185ZuXkvwijmKKzJqpOFMy8vRe4uGI0LK2+uKk
         nJWaktu8lZM+xH0Qg/NiCCsqiLauv/yDgXtB9N94bPObNZIs6OWyTLyc6OoBhlRW0uog
         fnFyu+VblKMZWavN0ZTkfsfgWTRJEmId5EgZikT7JaFnRzshONniS156PrTlLd0VEmy0
         Uaog==
X-Gm-Message-State: AOJu0YxyeZUdTxGFVzQrPrWDTsjFaTXcfPr55wWaphYCK2xGleGWDxce
	rAk86g+ULxJv4rWdaIsB7KnOBECAzAHsQp3P8ARBeRYRTEQjxljLWlrybQ==
X-Google-Smtp-Source: AGHT+IFDsCoPYNmTftZ5QwWuvn2T17Wtnw9Sr9klRXsIhd3Dgtyx4yehx+ZCBypCaTKK5sFLdzoejw==
X-Received: by 2002:a17:902:b081:b0:1e4:427f:83ea with SMTP id p1-20020a170902b08100b001e4427f83eamr414859plr.64.1712864018785;
        Thu, 11 Apr 2024 12:33:38 -0700 (PDT)
Received: from localhost.localdomain ([23.241.67.81])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ea8400b001e26b7d3e8dsm1526562plb.266.2024.04.11.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 12:33:38 -0700 (PDT)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH 1/2] python3-tornado: extend for native and nativesdk
Date: Thu, 11 Apr 2024 12:24:55 -0700
Message-Id: <20240411192456.2974073-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 19:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109924

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-tornado_6.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
index e3d0209e1..08c8672eb 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
@@ -37,3 +37,5 @@ PACKAGES =+ "\
 FILES:${PN}-test = " \
     ${libdir}/${PYTHON_DIR}/site-packages/*/test \
 "
+
+BBCLASSEXTEND  += "native nativesdk"
-- 
2.30.2


