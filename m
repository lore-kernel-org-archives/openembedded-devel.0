Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F4CC36007
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 05:58:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4655.1742623122487893331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 22:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TpU74rWY;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224100e9a5cso52692405ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 22:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742623121; x=1743227921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=evGptZHkYPG1n5SZbF2ba9I/nW7RM9ujXGqjrmq3VfQ=;
        b=TpU74rWYT0pY2plJMSFbHc84qOZh2lqk4cUWdIPbXKsM/M/CX464UxehknTe8iVb+l
         L9e9ssXEBDie/n6kxH+LvYZExfj2SNhlUls1fN/dP8yMYPOHH8Dd55L67w1THRbA+5hh
         hB7x2tnuM2QeEsnsaFtfBA6FSZiIzcxDdktRa3YHgVUhePLLOcMHLiYCiuZkXtCDWQ9G
         ZISHV/Up6y23DM3q9nWLdz+X+/dVhLzjGfv/biZXJkrVZn4o7sRaypLUSEMZSlqcWiDF
         p3KzaWjZxdqguBmMelcKdTlF97e3jviqGh3BFO3rmv3IX7IxIHMA/0hSCLcImKTBUJTK
         ITkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742623121; x=1743227921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evGptZHkYPG1n5SZbF2ba9I/nW7RM9ujXGqjrmq3VfQ=;
        b=wETAEYoz76glB1ef05t42Pajg4EwEAfXGy1+Rbh2Fcc+M+r6xY5se0nEqCl0/tAI34
         3S6pG0NyU7hBaza2GpO1Tkmg4Bzi3a/dg+DsEKhczsODo0AMkr6IChTeuVTulxf3yn1J
         SUqiqANBrC6km1fy6lfYMUwaRvcVHPdSmQNABxj0SZtGREDpJHFziUYgKlk+TtEkcXVK
         PkobcWf0Ka9h13wE2jiHE2c2dN95nzRHuUEzbxEugwTmtxWpidAg2Du+ZhoXClnoZLKd
         Pj/vRDdlWGm5LL7lbZNu49dU8pXoABpSSIIrJesP/G4GfNl0+Vpzga7GDAnfRnCKj6Vh
         4PIA==
X-Gm-Message-State: AOJu0YxC6a+yxyg94Fq6ecTn0Mn1qqoSotjypWy4OFw5RA0mj1i9MSES
	pdB87bxap8ECOOlqeBl3rmkt+aZ+HLdza67nc2aHXgYBXucborsPsJCTMwkU
X-Gm-Gg: ASbGncuaaxBSo/Iq8wYZ9PzT3ucmhhegtxxFN6PYXmtIP0sed1owk+fEJmsYV3PKhIv
	U730WbspmxDYmt1IFkqn772Xv/8tj/M/KNBYFWPbrEZJXLESzK8KYWRJPFiw338Ktz9BgBlzn+3
	r+RU5Z/xlDAI3M2g8q4RjzHhJxle7zrAIKuQCtRLUOHamXPFSwOQo+78eGvUrg1y6CQTanxd0OW
	fIWQCvUybkCHa0FMTQTp15fg7+BD+c/hLLjl0XJFoLGI2RFbxVz3yTbMnJWh1JqVMZx/gso0CQf
	iAHFFU1XoDHQswxiDHPpuVU7XcUqI0UactbP
X-Google-Smtp-Source: AGHT+IGQ54WwtVbW5xGvV19HtJCqbgzyA/d3ALRRzYPYMQqCEc8SK8vM2ehz97o7LfrPv1W1BjsnMw==
X-Received: by 2002:a05:6a20:6d9d:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-1fe592175b7mr434801637.20.1742623121517;
        Fri, 21 Mar 2025 22:58:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a282be07sm2885136a12.34.2025.03.21.22.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 22:58:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pybind11: Build with -DPYBIND11_USE_CROSSCOMPILING=ON
Date: Fri, 21 Mar 2025 22:58:37 -0700
Message-ID: <20250322055838.1164459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 05:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116196

Since we are cross-compiling this option is required with 3.13+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
index ee5722fbcb..e853bb33d8 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake python_setuptools_build_meta
 
-EXTRA_OECMAKE = "-DPYBIND11_TEST=OFF"
+EXTRA_OECMAKE = "-DPYBIND11_TEST=OFF -DPYBIND11_USE_CROSSCOMPILING=ON"
 
 do_configure:append() {
     cmake_do_configure

