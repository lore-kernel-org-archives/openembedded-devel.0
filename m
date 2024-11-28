Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0006D70DE5
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 16:17:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.99063.1732810660571340016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 08:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i54c/ACP;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso934510b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 08:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732810660; x=1733415460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pu90tUlxaQpyjN1QexV/wNuC6i1JfFmxjLp4wVk1uA4=;
        b=i54c/ACP5YfRGn69IcbiApHkG/01lX6vZr7KZhUO/e29LW/ftfOw5pf2RqXikZduoj
         YlEopzscJ6y4ciqj2UeMmCHxkYM8DFhWx/LSSOjGrOon63kmpAwBlAHJ3nl6PGxcdKSp
         fkcfXBjSIn2jRrmlEKn0jTz6wMvjLJ/LSjgVNevfGh4MV1B4s09zsMQDrMh21H0GMWDn
         q5APwvbQtM7EE11vDBxhWMNGIyxx+Wb/lUL5tAcgsJCP/iKTXD+9b1oAknBbyht2KHYo
         p9sNsfJ71ykJeyLE7k/IfQTHAj8GuJMqMeZC4ZCmqxK3dRXDXSFQA4ODClfbB1DCDmWL
         cXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810660; x=1733415460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu90tUlxaQpyjN1QexV/wNuC6i1JfFmxjLp4wVk1uA4=;
        b=Qflx3mToTW9IpgolI6YvoO+S71hGL4cSOkdg8iFWqDWH03qDNe7J5EWLf3jl4gVI8h
         xrHtEmlo+sXmrnolTp4n6bzBIk+zohlqroFLodG56cSt9rCsjUMZ8vR5dGyxNsdJyd+i
         W7LU+XVthre5qv7L7RR3Q/+EMdYI6W3Wdg80FMOAKBIWuJ91YYe5e7PfOfCn78VpvZyk
         2jtJT8gWC0/Vv/LZhHpPaRYiaDqJ4kXhOo36AIJzD/shkxuNSXytGVr8s/swDFYvZ9tG
         CfO9LnKrvOeZFsir/dSeE3rfa39VUbjyvN6B2MjoWoq+aZvloTk53rjvK3QPJG32KYiy
         Vl4w==
X-Gm-Message-State: AOJu0YyImbYN3LWrTHkub0MPnBPhZLGhkVP+a058/OVsmW/fzVb2+081
	YsaZaBQBqVuhwRQGy0XW4E4xWv69NbtBKZe4rbYSEx7cgqfiuasghfIj3K+W
X-Gm-Gg: ASbGncvF2G2qK7z+cMThBOJc5P/tFewwcju7mlWD8GqpujMlnf2BGHYjYIZfY+tFwev
	kkCsrljx/nihgAHqdnPiGTbl/Ht+/zk2cE0XqoBt25R+gN3Q6kDNVUyE/JPvqtKUr6/neJX1Yna
	yR6CNoMGozZILPGxgPR3XuipTayIP5oEzkC1ho6kJmUBCQf1/d5S2E+1IQ1tO1yEqPg+D06ik+l
	0vw900DsyPVmbolIyxlnBrL0CxnWLYYfno9vgvq59H2qZYcQ/Cw
X-Google-Smtp-Source: AGHT+IFeXAvve8KVkhVFyjZXifWMEZeqrn0/zHIi6UQyBDhpfaA6/5ZpbGECRUzA6YQD12s/GkER3Q==
X-Received: by 2002:a17:902:e88a:b0:20c:5909:cc30 with SMTP id d9443c01a7336-21501082d2fmr109929605ad.10.1732810659546;
        Thu, 28 Nov 2024 08:17:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::b650])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f591csm15288095ad.8.2024.11.28.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:17:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] exo: Remove unused perl module dependency
Date: Thu, 28 Nov 2024 08:17:36 -0800
Message-ID: <20241128161736.586789-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 16:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114110

This has been removed upstream as well [1]

[1] https://gitlab.xfce.org/xfce/exo/-/commit/8b6667f42da26a7c78939c105477e2c0395f3c49

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_4.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb b/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
index f5415af75d..f6b50471c0 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Application library for the Xfce desktop environment"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gtk+3 libxfce4ui liburi-perl-native cairo"
+DEPENDS = "gtk+3 libxfce4ui cairo"
 
 inherit xfce perlnative gtk-doc features_check mime-xdg
 

