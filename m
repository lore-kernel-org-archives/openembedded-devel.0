Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788F5D2B933
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.19567.1730817439499620624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q27W1p5+;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e291f1d659aso4984137276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817438; x=1731422238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+XvF11mR/39E/XtttUJ6gRebkHcdrI2ryppRAxfE5k=;
        b=Q27W1p5+xcKOr1bgJ/nc1FEg1w/qBq5Fw4L5Z1SF6tvLgpnNSiEs7oBEeS3v2Ry9as
         twt3BwMc6pT1TBaaQb5zEP50pinmGD9w6hzUwSs/F6XKquXESaaSr8twMs7m8Jhrd87E
         yzWPt+t3g6jYaTMPJJO6Y2Y48N3elqLemfkCJ1MJ2evRYF4g9yJyV+7+lq3pdX+KXGvA
         OBZxsGNzC+VWRFwSOeSfb8s5V+niK/aNdAjnEiHpDrKoElfPH5+axg5LSGDvY1GD8SZ2
         aebl7TuoEOR1TLY/4jtbItyWVtK/E1Q3zESz8Q402wdOD35iLgYq91MZDg/l6VGD2YxE
         JUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817438; x=1731422238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+XvF11mR/39E/XtttUJ6gRebkHcdrI2ryppRAxfE5k=;
        b=eW/xm9zOhgqsg94fTgqNWN+T9dSDlFXJJ9lboTBgJDXL4l1aaAO0WhpUDSPCIPd/R8
         E5F0bnb4hnpiLpJ8MzZy63U96ZR9MR8rLnBrxxX8VDQdvsb59Bt397/jP0TJXOjbuBxL
         z2mpLMb6Y8DYqGYdZINA/miXMhlQ+vHQFFDQ6x/Xkb9ENIBq+xc+/4ExBoMemu8aC/5l
         oCGOXWJm4rLEwhqoN+XPKUPryzOXJccKBCJ2GhwiJ0tdzlifnuhFnT3hlAQHAF0Y2ocQ
         JQaugDt+1Mkhr9gpqS07zJ5kRFKDZUdEJzo4W0lOqdniR9328U7/ZWdgScheMWCP6dpa
         0y5w==
X-Gm-Message-State: AOJu0YxvaxseoZZVNqmD8qb0HELuvCy+9zPISWu9J66H5DC+RSzT7Zo0
	mXhbxKnxAaEM7GohXi4q+vpQ7FDuDwG/o0WDs+WPVCP2wq6XCk02EzN9mA==
X-Google-Smtp-Source: AGHT+IHqcF0r1vmNCwVPQr2c89UkQWLGe9mcXw+kHoti0eUJ0mBD9liBWTN/2vrxqT68hUobeM/tUw==
X-Received: by 2002:a05:690c:690c:b0:6e7:de90:3149 with SMTP id 00721157ae682-6ea64beeea7mr158721957b3.29.1730817438459;
        Tue, 05 Nov 2024 06:37:18 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][styhead][PATCH 84/90] xmlrpc-c: update SRCREV
Date: Tue,  5 Nov 2024 09:35:49 -0500
Message-ID: <20241105143638.2301245-85-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113502

From: Martin Jansa <martin.jansa@gmail.com>

* github repo was force pushed and git history re-written since 2018 commit:
  69ee98df Release 1.43.07

* $ git branch -a --contains 352aeaa9ae49e90e55187cbda839f2113df06278
  $

* $ git diff 352aeaa9ae49e90e55187cbda839f2113df06278 08b052692b70171a6fcb437d4f52a46977eda62e
  $

* so at least the 1.59.01 content is the same

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
index 5d5152b834..b667507ef9 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0002-fix-formatting-issues.patch \
            "
 #Release 1.59.01
-SRCREV = "352aeaa9ae49e90e55187cbda839f2113df06278"
+SRCREV = "08b052692b70171a6fcb437d4f52a46977eda62e"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.43.0


