Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC33FCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:47:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9264.1758185232572632789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VuHuVSXT;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so3543755e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758185231; x=1758790031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy7yBBPOtdY98NXS8KNusIkDWTGZb9P/0V14Xkwqdkc=;
        b=VuHuVSXTB+uB9rv96YP+EcaA8QoumxKqeILegMYhw4A3/PuAWD6iYRLyxZTDjxTcQo
         AAScJDpIGKul6TsWfhXE0H+j9H2dUnARjZZ8p1W7VdZU21wnv5tjATQ6ZyXC6SLgkRHd
         fvN9xSjDpE/GRns6Nb1fM4IdnO84I2tlGBVUulfMgqDDvU86tAfO7laiFbhEYdtSvBN5
         fdk/0tX6iQhWRs6L8sJocT24cDmqTPPcqkArvAN8lUEa8AzBNZl8X+pkXVE3s4pde3B+
         J2RhSV7+SBuWhiSsVECEHpVrFoqGAekcQFPcLlOBM3PBjRqB87Xb1Ybm4kTKM8C9T+3o
         teqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758185231; x=1758790031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy7yBBPOtdY98NXS8KNusIkDWTGZb9P/0V14Xkwqdkc=;
        b=VH62XVLfhq+9sHcEY/GyvZBwWMAS1vkqKIxdvKIqnIKiFGMB2y79Ipm06iUnfLdmXz
         kOl0go3yeqPnsXUtNqn4f9nIAXemYOdwh+GOU0gwn+M7Hgld9txp3uakUEXSje33ebzs
         Na9Sj2oTYsMtMVSiYP7I5RRnEbFJOFjrjdJ5D0SjSAg6/VfV1O2ywAMPSYDYIjAj/kwc
         q++urYMTZkqyVjsOu0GgOX76QAVHVWSCw3jwAtiz7UWtnGYF1VqZTPQKe/QTAjH/WU1Y
         3jxHEsd3smMVPE4nakO0yyloAgpZKrDOtEi0gV9EQBhwmm0PDr+oizNLtlc06+t6kI99
         sYSg==
X-Gm-Message-State: AOJu0Ywh24Jdy7b5q11BTbM1xz17iBQ2bmPrWKuL4D+C8JpF9qEGQWQy
	N4FkIFAHZRUDqeYvPb3cTnsplgH4prw3wMdCuXuYcyBGqzHZGAIoyyu71FQFWQ==
X-Gm-Gg: ASbGncvdG2M/LafbEEb0T45mnjhm/LWZtlMw/QD9bn+TiibUwecEhqCLoTgTxYWCd+1
	+FaBgsUt9f3HO0mhPRrfb38kHtb6A8PJB4ABNyOQcPWd9xCGCDGM04WnrKnyTSzRK2h4P4bmsrr
	QLqrIR8db7mOD4yz5qYL81MjbUg7ZFghGkCCmtYD0MZvw4PyZHE78Q6AoTLAaPyFg8Ypu7dyGWy
	1KU+TC5kB8PvG/qcCqqsOoQmZaWJ6DtmH2bwm24BJGeX/5nQCvedInQsCtl5bqDqMLj0H6OO6Ze
	WvaQU2f1nxmnyKc0L/ihsyLGhkGB5mh4YwbseuPbbQoVHzLpURQKM0NrPOF/i9puR5W5bIn+s0M
	WTpbmQmJv/i0jDoJ7ygJd5uBYcSUPfFOw/Za1pOr8nfAx3AyuJES0YSQdS9XttUWyskv+fCIhrs
	0=
X-Google-Smtp-Source: AGHT+IHowR4yCyIzRC2BY/hLM3xZcqrgsLyhQooRuu34nsp/ssAMG0DUHoy9Nej8PdOajoLc7TDssQ==
X-Received: by 2002:a05:600c:314e:b0:45d:f7e4:8969 with SMTP id 5b1f17b1804b1-46202bf788fmr45547605e9.4.1758185230634;
        Thu, 18 Sep 2025 01:47:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4613e754140sm70020345e9.21.2025.09.18.01.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 01:47:10 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-gnome][meta-xfce][meta-multimedia][PATCH] README.md: Change maintainer from Andreas to Khem for gnome, multimedia, xfce
Date: Thu, 18 Sep 2025 10:46:58 +0200
Message-ID: <20250918084701.1428246-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 08:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119541

From: Martin Jansa <martin.jansa@gmail.com>

Confirmed by Andreas off list.

Add Khem as he is main maintainer of meta-oe, but surely he would accept any
help in these areas, don't be shy to step up.

Just add uppercase L in meta-oe README.md for consistency.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-gnome/README.md      | 2 +-
 meta-multimedia/README.md | 2 +-
 meta-oe/README.md         | 2 +-
 meta-xfce/README.md       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index fbb0d72476..5513276dc0 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -13,4 +13,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnom
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index 235c34331b..bda470a6f6 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -14,4 +14,4 @@ git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-pr
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-oe/README.md b/meta-oe/README.md
index c7c14a4507..da6c4cbe79 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 3d6158628f..0d0077783e 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -19,4 +19,4 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
 
 Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Khem Raj <raj.khem@gmail.com>

