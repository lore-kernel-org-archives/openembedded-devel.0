Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8450E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 04:46:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2595.1735793187008865232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 20:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXMfxW/G;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so64317795ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 20:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735793186; x=1736397986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StFPvLb5aUohQsxsgO0UEPVpucV7BlrD8T7hrqVWW6g=;
        b=IXMfxW/G1mPOnYicialWbo/D0PFePEG7mTKWtxjMXSfiQw7YuaRTROn42KxTBweA6R
         FbMd5207hwRPmWXkZClijnIVlqM3ozYLeYUONUSV5OXzdQU5sDxXsAd38hC04DbHP+M3
         5WR5ZtaH5MU/gGOA98FpSnQQun62LD68PFg2KLNNtAeK/TCQPPfvMOL1kXmbG5Lm1TKr
         NroqZtUIHNTVwW++MdwR1g9Hg9ZI2sB2OVV9rAWmyOoysYt6pr4U4BQDcPZtXdaQWihn
         v5v/8Llw38HERTjtuT0c2HmsRmUfaTgbkJbgmGnokjJzaZbCgk+KNY2qgYExesUdaxFA
         Ggkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735793186; x=1736397986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StFPvLb5aUohQsxsgO0UEPVpucV7BlrD8T7hrqVWW6g=;
        b=qyByMNQfwhmSEZF5RGqndYcTv9+nXuGCodjtXl5nc1ZvNX6K3mi66OPoxLuJZqQhrb
         ISr9etokhjfq00HhCSvvztAlRaN+vUHQ0jvmnqpvdhGdh612tjVMRz4sPD7+lh8EUtC5
         RdE2FM6CpEERiJVAlPgid3H7qtOUw7CiKmpfEInGWtGPI/q2ZmoY9RhwPIiMPD6MQ3Kh
         MgIHKRmbmUvZ5KmE4h5H3lm0PHYSEuVTTG+4Z3lM/uGMwyPBI7AFVrgK5XjgGMNUq7KF
         BCnnIFu6ZV4GKDhc0ZrEMXnSdR5iTnGjN8v7KBI7hyhF7lsKuy7eoRZ3SgUXZva1U3d9
         E64w==
X-Gm-Message-State: AOJu0Yy1w78fk0HR8NeQIScVohlh5e327rjAzDmL8/fwLLYsrf79MM8u
	AffMc9pmT+9lgZo5dWuEsw7sfA0RtspRIp5YWw0MT6CsnQdiJXEuhgosfw==
X-Gm-Gg: ASbGncv25S4/ipd+TEOomnqI0MkSInwlzJNbfTkUYsDQXIL4fDQJDIBev6BDnbJDQVY
	E/q35Q7VyfSSRuvY8SJ6fH2XfOeshC82tNglgd8WG1MnMaI4v0IZQvXWsYDL3meb3w0l0O2sLo7
	OS53Q0HAQtImOAnewk892oIF+dmlCPk4xglrMhZwTtALIjieJbNJyC3maNJPSHodMXWjHJvaJWK
	0fPVNciyrto6xQdqL4MMRzqul+rb3Mm7AQUN320fb+GwV7hSmRyHa4F9Tg=
X-Google-Smtp-Source: AGHT+IG1AvvuqR0HoHqx8XArDd8kRJMiHMPNEmLJEgrNTSuFWKkuprxeggbBRQw+AqNTGh1fGkEDCw==
X-Received: by 2002:a05:6a21:e8d:b0:1e1:adcd:eae5 with SMTP id adf61e73a8af0-1e5e0846948mr65328450637.42.1735793186225;
        Wed, 01 Jan 2025 20:46:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4714])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8161e3sm23302630b3a.8.2025.01.01.20.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 20:46:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-google-auth: Add missing dep on python3-pyjwt
Date: Wed,  1 Jan 2025 20:46:23 -0800
Message-ID: <20250102044623.2076003-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 04:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114616

this is needed for ptests to run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-google-auth_2.37.0.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
index 57621588ce..fa7e94a7e5 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-freezegun \
         python3-grpcio \
         python3-mock \
+        python3-pyjwt \
         python3-pyopenssl \
         python3-pytest \
         python3-pytest-asyncio \

