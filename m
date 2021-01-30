Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8737.1612035474128787548
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aYQGd6i7;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id b8so7703073plh.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=doB+bhDf0qf1lTPdN9y+3qsM65eGsMGR4lN8A0TsqB4=;
        b=aYQGd6i7MhKb7BNURrnev2mco0PsDpLe0WNqSi/fq22K8Smj8BhiuJENGLOTf1ICnP
         FFV6yTD81aZ5woxCKpzUUzlG1UpqdVUZrbqc17l/YlyT7qaigf0RV1fO+gkqRESE908H
         DnoaBPApn6VxR1m2/bKJK4rq+5CmV2HaUhtKTPAaesKvY8O2I8MgWRsbFmlpqiKnpHKu
         7Qkwe08AF0dWhzpy2MjGc7A8dm9gaXMobDoP1yf6Pijd/pcqD5ZlNQ2gclccfVMR4xwM
         7IzkVaqaRaJ9bduLinMHAskpkhWQb4RoMYBS1j+LjFCfhdpCbULn15YtNfjirbOO3+TF
         qtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=doB+bhDf0qf1lTPdN9y+3qsM65eGsMGR4lN8A0TsqB4=;
        b=rRVac1X4cew2lciD/z0l+CdPbmlC20RA8IyxfzJw3CGGwpBfe/gRySTiy5WLfyCM6e
         +QR26LsENITEUU44gC8Q0yEMFqS9HcXSFapryIlFSd2bs81wa4tA/udDQGQVBLIhNMLv
         F1+Oc9SbWWIGLVbwRp1ZnHnAb6vmYNJpjoFh4+9u/IX3IrrHUcYqvHMvi/trjXrICIVR
         70F/PayYvQuIo5XX9YHevh8lsN0wSWGW9jfQNET4ZUBfq1/z/p8FuU+a2gvWETaTQUoO
         tmZR6fBf/kkuh+3+h73KHKvESoJJaAIJD+jASafdRTrf0n5ZQY+L45HrXp8YWVJCwDSk
         qCUQ==
X-Gm-Message-State: AOAM531sPtqUWclivX/ZCaTvw2Ta1BktQYsEUZhgebBTb/d+1dFP6L2r
	EJJchkFYLOMpLu5oJKqS3fF/iqxRJGzYjg==
X-Google-Smtp-Source: ABdhPJzDzeFClUNoai8//V1CvnyId2JcTjrVzxFTexbNBr+6v57LNq5S0+0oU9ycq3IUDiNYmtaJLg==
X-Received: by 2002:a17:90a:ba02:: with SMTP id s2mr10478305pjr.53.1612035473482;
        Sat, 30 Jan 2021 11:37:53 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:53 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/13] zram: fix sourcing of zram parameters
Date: Sat, 30 Jan 2021 11:37:33 -0800
Message-Id: <b523c8c7c8a00771411f791fec4d6eb702c6c489.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Søren Andersen <san@skov.dk>

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c8ad9192c1c9f4323bdc7ff28456f11db689adb)
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/zram/zram/zram-swap-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
index 0643dbca23..ccc3aafe3a 100755
--- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -14,7 +14,7 @@ fi
 ZRAM_SIZE_PERCENT=100
 ZRAM_ALGORITHM=lz4
 
-[ -f /etc/default/zram ] && ./etc/default/zram || true
+[ -f /etc/default/zram ] && . /etc/default/zram || true
 
 memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
 memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
-- 
2.17.1

