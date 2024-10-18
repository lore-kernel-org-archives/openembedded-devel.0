Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55612D3F2A4
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.29972.1729278814730536804
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gy0uk4mQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e214c3d045so20733297b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278814; x=1729883614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAgzrLozgiOmrjIx4WI0OHaIP7idQsu58l9AjbbZns0=;
        b=gy0uk4mQBi4gNrcs1Pu2mufRgj2C1PtkN8YG1FsHwl/2/vczOCpDGF5zXCRS9Cp1f2
         FY4PXdLhJo/8N9mJRYDEHtg5xBqaQRg2b29fT+Uia5MN5u9+l8DXIZmgzwhaP/cH1c/L
         8MDD7w09PT2nqlUltBaK7jBvMHlyMDHypYsBlK6yUS2lZQixlaVYPG2q7l7E17eCC91F
         oqXy1qGeC9bu+ehzCILVT7p2sOEUYJYSw1Zwsz11kWHb9SmP7KIp7/YtCqeOD3hjAUxo
         NjmJ+VLudCienSZSQ0YI9dPU2cPkxExyTWlHPe4oLQV2uby+amt2PJQ549t6WudiZI1f
         65dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278814; x=1729883614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAgzrLozgiOmrjIx4WI0OHaIP7idQsu58l9AjbbZns0=;
        b=dk5McS5NsRnDsQV5RVB81xdX5Xn4lIrx/nvPJhCHIqPQARieq7TyXjlBG84DVrb1P4
         aOYgzUUZtvcqrdTzQQ0UlP4tkLjqIxzUQhNJBvrJtvlu+MsjLf3SpNzCoym+5v1dP4sQ
         p9mSRf6knNqo83OBfhEtQiQ98Mbxa8TDCKflP78WGB49aAkLWaGc19Xwfset9y6KaxCW
         G9T2xsynXCjgKOLov8p/3RPJjRL9Q+3VTxy//OO/7M7xTavU4bIEkIw/T+aRd+2DWVEO
         GPz7NCtyZlFE5aQQbG1oRVSX/YwMDlKi71uyT43M4Gm5RV0FdB8BInW1Q1/YBXo806ps
         gQZQ==
X-Gm-Message-State: AOJu0Yzo6s/u+agJVflbNS21x4Ta0rLqiL2FLa43wZ6pJ/Nb+jC4vN84
	EWmtofsyfQqMK9nwgx461Hik5qIaZA64CqyA65bwRzIvBhijQrS/W7V2xg==
X-Google-Smtp-Source: AGHT+IF9UzumkpqcdXOE0K33GBUW5wfbWn13ixHgKygWdASRc6fNMyrmyyUPEPPhjim5Rm79zhgQaA==
X-Received: by 2002:a05:690c:93:b0:6e3:3dbc:ca60 with SMTP id 00721157ae682-6e5bf735420mr33821197b3.8.1729278813340;
        Fri, 18 Oct 2024 12:13:33 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:33 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 35/68] python3-libconf: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:22 -0400
Message-ID: <20241018191101.25184-36-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113022

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
index 80bc59d97..a4ee7bddd 100644
--- a/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
@@ -5,7 +5,6 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=05f696c084eaaf5d75bc150f70975758"
 
-SRC_URI[md5sum] = "e212611cbf6a696e05742a983b3a0c57"
 SRC_URI[sha256sum] = "2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a"
 
 inherit pypi setuptools3
-- 
2.43.0


