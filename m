Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6837FC369D9
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:42:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.23138.1745743224497485432
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1DVziAM;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2867417f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745743222; x=1746348022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OexM/XKdfjkVctp9t58ARkUzejpj87RmnqGdkDUc3oU=;
        b=l1DVziAMSSPKcPmXgkz734UQJQNme5D1rp0G+c4qA3XO4zSMQBfjQEV93WtZVMSmUH
         vL4u7585SU75WBqjSpiAQP2PcH2XwCyOY+H5qpclEJ2N+Tz3iYt2F2Eu5kGSy1kisaX7
         ttrs+rDFgkVjhd9mGoJvpnB4EvqiEW8qHX9LDXytn+FTgwo0Zssyy266vl5KiBWdZI0I
         vqCZRiaUrsu4pEfjK9g+C6YhgWL53vkP3jxknsMRF36P4SZ8VHsdKcKu90fPfnl8x4a3
         sSGiZXChADC8QgLiCiHe0FKe0LK/W0HuwNQ+2NGuzT7iRYRbBD2jP/DOAFZVRt91rs6o
         w/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745743222; x=1746348022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OexM/XKdfjkVctp9t58ARkUzejpj87RmnqGdkDUc3oU=;
        b=uLtgN0390bhYbJxEiTajtr8PxfnBo9s5tqqtPo372eKN+QqZMYUGK4oeOrT6l7MR+i
         /OqiUqUqjNb8V72A/GaKLzaqaHk0c65DThadQ1clSMzdaVztsiggnlaJ8+Ceh+91uqAn
         8ng1fIVJfLCWHtplK8os7uF81ZvseLXaezuym8pTs1tbPX2Y2X//BILBwmnn/BP5fa3U
         ao34pLL+H7JR8DZVt5oMamNylCMYZGhiqttMBKYezBJtSfrYu8WKmTCus+CnkmZEx9Ii
         ns/9smAZZSm/OgbmhXD907r28Oo/ym7UIqtP3fxGoVW9L94KyV7tueZeUaUqSPe7mFJS
         IO4Q==
X-Gm-Message-State: AOJu0Yz+ptpwVj2ww5q1qhPJPMVfO7eHSR1KifqIaR4KDrcnC/+XhfvR
	MJL1O2/kBKCln7w5SDGlnMht68D3PbTnmN0pqEXK2loY4qxXRnv5e4iw6JMj
X-Gm-Gg: ASbGncvxqsVOyIF7QE9iHdkwX/nuIiZLTtDfy4dPxWsKBrReBoAewRRUEe7HRIkrbPr
	YWg3+98fUELIVS83RVOfHX8CBUCaCiVToQyMgYxuZcav/W+R6kZuddz1p4P0Vh+alb+Cf0el/24
	IT42pt5UodNjGVKZxRZ/6sbcfLh02sKRyszRQpvx2pi+vhgx7nVbTQ2oJczqmEvQMMC0zPJAZy+
	OV9ztJEcYD2Ek8lX9PLLiZWj+DNQn+zq7YB+BmpoR8MJSNyPMUM1RBVFPqFEODwEb9/DtXDV+7w
	dYi+sQt0gpNlk4vbeAScqUzXzSk0+ssKYNe+6MniEb6TT+4qjczgpjrwdvR14sW1kQ==
X-Google-Smtp-Source: AGHT+IHovuxB0fBF5aX3P4zrJBCxYi7LMEdqjlrzfzio3wKJQpfxYAEj91cE/F5WCa4R+qcWHapggg==
X-Received: by 2002:a05:6000:178b:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-3a074e419f2mr5857519f8f.26.1745743222276;
        Sun, 27 Apr 2025 01:40:22 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07a7c39a0sm4974654f8f.101.2025.04.27.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:40:21 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][walnascar][PATCH 2/2] python3-posix-ipc: switch to PEP-517 build backend
Date: Sun, 27 Apr 2025 08:40:12 +0000
Message-ID: <20250427084012.4224-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427084012.4224-1-gudni.m.g@gmail.com>
References: <20250427084012.4224-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117165

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index 29e1b35122..b3da09c35b 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -9,4 +9,4 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
-- 
2.43.0


