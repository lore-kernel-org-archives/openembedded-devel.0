Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA19C02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 01:44:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.6653.1738201440615274146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 17:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QMFrGrQ1;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso3647965ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 17:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738201440; x=1738806240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GQyMNNE3IzEIkbPvbTd5hpRVMqrNXcoariNlpmSQRY=;
        b=QMFrGrQ1XWZBDAU/20wpXRaeTfILTENj2MDdyhovHAq27shzT5MH1sYlM0pB7rqISR
         aP5mvxVdxVzmAWsiX0d4DL+RVNev97OowFZjdRDA5P6nR10XebCvpAT9xF+SMo1kTlR+
         B41oBZ+Blm2frLOyQRdWphyhfYEDaIBcBi9Z5LOawYEFN8TcDVHdgILcQw6iLOgtz490
         BNITN2gRI90v5mg87xUAkb4A1w9FecB671eIeZVhKHeG8HFm8GKGT6CZqrc/axp913DR
         TOUjWatV0aD1z79Wqx7U9oeQ49IXvBLkL6K+tKmdGunKanA2I2j4uIQJIurVqvHgPrZR
         3Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201440; x=1738806240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GQyMNNE3IzEIkbPvbTd5hpRVMqrNXcoariNlpmSQRY=;
        b=Ek6ejtPdL+T8P1WmOAtL9+4zSbZQhG4c4zToYQzhtBQRY0pmdgNymQCLDXmmsvC8Yl
         LvBSar36arOSLPAsabw36TeMllgJqhS9QaAxeeEo8dxtwy77r6xg1Cb9qvXLlUiqrnHA
         6ijcBUMEmmvh+kPuEy0RlHUcYmSXp1DALLf+JT3zewQQu/WgXkWb6CFL4Hr91q6QUwTK
         Fdd3PzjPKNWIpU8MzGeL396aJwB086OkFApU3q/F2NI/A1VTvEY6pBtvrrqJA5g4MtZg
         ebASlPH5qn6Ipp4LGkRbX0RWgNgsyOoDKW6ctiTU/IdFUPoxyZ77v4KgGFvy30g/jPR2
         F5dw==
X-Gm-Message-State: AOJu0YyZ14UCuG7hluno66M46Qf3o7mA+byMyaJ+mmMKnfNiDJ6XGCIX
	3YUWki6F0cMSqTPD6eE0msOhY7Pg45Foiarq4pYFGOcjmE/+pVeAcy5pIxnr
X-Gm-Gg: ASbGnctZNo6iJ3SdTikI9y+l6enToAZ57KN5iuI3ozFMA2VFFu5KN1kbycMWQZozAaP
	lTD7W8tKTkCeupt7M4zXU3KzULp4+VAgy5OW31IwLIzZnsEKNZsqaXtntQMCkq/fKsvycF6GMPs
	h9omtiwq92k7V2Myd5g64+6rWt1QcAcjm4/WW2Lm4yeux4HFTVt7DMmtPcwI05/2x3DdF4KbRg6
	YTGrZSD5+wrx7qvnJT11hrJutCS2wsQoKDb0ERiFwTn/k9Tzr28zfmatYgPF9fGAjFeVJRKaboM
	Iq2UnyA=
X-Google-Smtp-Source: AGHT+IF3jAkNfx19pJ2Jclzy19+G0MW58eA1Lo6AlyeZrWwtjMSOAyG5VKrS3syBRC5Y31DEozeuZA==
X-Received: by 2002:a05:6a20:6a05:b0:1eb:48e2:2c2f with SMTP id adf61e73a8af0-1ed7a5efa87mr10520728637.30.1738201439768;
        Wed, 29 Jan 2025 17:43:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427abdsm188532b3a.59.2025.01.29.17.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:43:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-pandas: Inherit pkgconfig class
Date: Wed, 29 Jan 2025 17:43:55 -0800
Message-ID: <20250130014356.1610566-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130014356.1610566-1-raj.khem@gmail.com>
References: <20250130014356.1610566-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 01:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115145

Ensure pkg-config is found during the build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index 1e7bb1f3f6..c12a237653 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
 
-inherit pypi python_mesonpy cython
+inherit pkgconfig pypi python_mesonpy cython
 
 DEPENDS += " \
     python3-numpy-native \

