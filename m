Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE8CCD129B
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:35:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.3220.1712262950635442352
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqK8z5k+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e220e40998so10734975ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 13:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712262950; x=1712867750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2PNlxMXT8Td1KtqUFbwvsDmLQzlhK860E7GtxQuM6k=;
        b=hqK8z5k+D8+x4p1Ygdhc1o1AyCdCVFQjgl/48MMCJuMbvc4o5aflKhIC7vOGOIKEeU
         BMzW50CNFRAMj5ibCO06HqF8uiDUJDb1X2EPK3CsOJ/mVmIh/SRSHXayiop72pPkV47C
         Mt3Yjqyuyp5Uot3F9ETTghcfFGoZgDyDyEQeUQN9UrVfKQjS92hkUHfMDDLWEJw0wKQ+
         mKIr1wRuQlWxdsDHDxBn5nxPBoDGoRn/+fyIGn08ijCTXrPZE72ohsFJnCDQj9FaSKXU
         w97orpCD4ZKnxn9a3dzmlbUy/bFN9u0fuNWc0CmHo130bDeSRW8cEy9MF2NSXhogINbZ
         Imcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712262950; x=1712867750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2PNlxMXT8Td1KtqUFbwvsDmLQzlhK860E7GtxQuM6k=;
        b=XvWdJna7QoxRsy2v6wM8MlW+NuEkb3tRYeg0TDm02Fh74U1nxgGg07UYAPVvwHuD20
         v9az7GNh/MAvXdFOgZBd6CBhS5j81sAP5SFrRoOK7UVc/2l66WrDxiXhnZtQjMVxCQUk
         AlTP15Fd9aU4ea0COkAvSYMaKene0xPSCi/Fk+nPmfiW0zJeOKEtLSI+cpMf/TJlPHII
         kah/tJPfOpSwJxOmp2VyPokAy3zjwZRpA0VwpatMovKK6lSR2rhL3ZYF9Tau8DjWLiMb
         /bHO7Els+S8kOUiyHKvBfXmb+EXMEYacxqHYsPPeqU0Jv43IPJJU5vzZBjzcchFSBT0o
         iIYQ==
X-Gm-Message-State: AOJu0Yz+KtQ3xWrYlSlRw/azNfsxyS/1knFOlfalmxOPWHCam1siPiU5
	iKvYno1XJLOUBKHDoNCPHfoqIDKEG+q1nVvpzJpvMuXZhjUnPSguc7umimYi
X-Google-Smtp-Source: AGHT+IEjdxVCJOZuS33TQeTpHst72wEU3Q7+m1aTR3TSGYhaGC8nYv6YeGJjyzQG49jQHnO6w4kWJQ==
X-Received: by 2002:a17:902:e802:b0:1dd:a33f:5913 with SMTP id u2-20020a170902e80200b001dda33f5913mr4235998plg.30.1712262949665;
        Thu, 04 Apr 2024 13:35:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b001e06c1eee22sm39764plv.74.2024.04.04.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:35:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-pydbus: Fix typo in ptest package name
Date: Thu,  4 Apr 2024 13:35:43 -0700
Message-ID: <20240404203546.285796-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404203546.285796-1-raj.khem@gmail.com>
References: <20240404203546.285796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 20:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109803

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 7399ae1a01..5754fd2adf 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} = "python3-pygobject \
                   python3-io \
                   python3-logging"
 
-RDEPENDS:${PN}-ptests = "bash"
+RDEPENDS:${PN}-ptest += "bash"
 
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
-- 
2.44.0


