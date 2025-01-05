Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E668BC02183
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.48449.1736119446566020624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMYl3NXK;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e53537d8feeso17779798276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119445; x=1736724245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6hYrNr932XG9emjBbxO5CpKALALDAFApu9pnPw8+zk=;
        b=AMYl3NXKQ8Ue96N7CqMC7DrCqPueZCBf5eYsoyPRXWSF9qjN29oPk6JMMDv5NQw25p
         DD2m3MlW/d2GsoWMiR+3T4rkJFwKYQqzjepr71TtrVgDJjb/nrzdOYYdilS5k4KJhQ4L
         g2Fee06gSIAXOd2Ct3M1WGr9iQQ2mI1Y2g6ItMIhLQoFBh7pWObtgcMFmFYVMBBVA07i
         9DEf+pviVldSe3jaP/MoxK47fzAZglduxc+yH04qt/3hWpGKSwQOgB6yeyH+PSPby9a1
         MHzHkfs84h3C6geZoM9QmQ8bazyWd3gxbP406E4kMaLIRgWWOaUeJZClWDsmBxV9HAv8
         SZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119445; x=1736724245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6hYrNr932XG9emjBbxO5CpKALALDAFApu9pnPw8+zk=;
        b=m0DtLmvYfQ1FOR1m2ggqtrja4pUovWzh0F6qhtOa+ADg/1qyprHoZ5M6HtuS/f3S6G
         Ym01aOXMVKFyMXHL485bha5h06mCPu2gY1SQXcaJdAw+PRsQw9U9WelMdmjwG4NSEtnV
         MSd2fb9WvmeNdw3Jjosga5dr6kf7kgHCnoc2v9Usf5FqTUKF++JK/R+2KrmFnLtl9cqt
         geL+nSjzIR0NYoNm+Ag9wM5H/7zpsPnG+dcPVY6TbnAaBRsI5FQ6ZzFV668lHeOEtRWe
         a+3Dj99klkhi5eROAqs4TBIegdkaEBuQUb2Y3ADRU/D42Tq3uEMKBB9VgrAr/at3nfka
         BQBw==
X-Gm-Message-State: AOJu0YzCcXepYwM0wDJeZFD8DQXQi11XBDi8wEEI2twpiiAmKLOvf51K
	LFK3gNEkepR41PTlZ7ZSFAt4TsXl8HnG/kKiuICntCJW/3zCrBM6gh8Zr6at
X-Gm-Gg: ASbGncv8nngO313qPuz+R++truoSUDZBHQl8vCkAE/ZDWy8kSPm+0ixyR0B/AfllHJW
	euLgH5HiXEuh5+Rmg2fa2kfWvd+LJh/8GpefdAe48VgpJo0qiYA29f30SMCkNkGRq8ct+SgKBTP
	D0g1kbetH/WqxLp6nMDhSNcfE/iD9F+T6zDISeL9A80mIkKLvjWnkLqIQCkXiPaJQxe/4HZdD56
	SP3NakCwr09UT3C/ZIDmu7bSoxj79G09yp2BQN/0Uw75pyRqNo4Hof3efAvfFTWNO8w2g==
X-Google-Smtp-Source: AGHT+IGpoVfjhcwFej0tDSpNHrcIw8bfUmwRu6XCZuu4E9y417kxzP7WPt2gyFSm+9aBbJC1Dox/Ew==
X-Received: by 2002:a05:6902:2413:b0:e4a:8c56:5903 with SMTP id 3f1490d57ef6-e538c2237edmr41231670276.15.1736119445685;
        Sun, 05 Jan 2025 15:24:05 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 11/24] nginx: Upgrade mainline release version 1.27.1 -> 1.27.3
Date: Sun,  5 Jan 2025 18:23:44 -0500
Message-ID: <20250105232358.1502946-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114640

From: Derek Straka <derek@asterius.io>

License-Update: License file negative and empty space changes

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1f4b413ebe623810007d430a73cc6f8a26c8f578)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.27.1.bb => nginx_1.27.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.1.bb => nginx_1.27.3.bb} (53%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
similarity index 53%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
index 5927ecab02..2f1bfa3b9e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
@@ -4,7 +4,7 @@ require nginx.inc
 # 1.27.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8323c46a4f3aac555a90caca346bb3d2"
 
-SRC_URI[sha256sum] = "bd7ba68a6ce1ea3768b771c7e2ab4955a59fb1b1ae8d554fedb6c2304104bdfc"
+SRC_URI[sha256sum] = "ba23a9568f442036b61cd0e29bd66a47b90634efa91e0b2cf2d719057a9b7903"
 
-- 
2.43.0


