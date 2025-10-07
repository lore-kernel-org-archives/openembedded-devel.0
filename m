Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DA4CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 11:10:23 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.15633.1759834820752280539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 04:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y35M5I+W;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: joao.raul.434@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso1154518e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759834818; x=1760439618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwb/HbnwzE5TgmJ5/wf40ncfLtJl41+p/ryuB8gP2tw=;
        b=Y35M5I+W+r5HORx80ZrXiePkhPObn25eeC3+14/tEYDczYanbYJD07HGQWWK28kIY1
         lPBnJA+zNwwxPUwUdNEZIpRMoqMOgD99hqkpX9fA0XpqK1gqcE7V2D/jxOvIlsa7zcsH
         qPyqWd1AXBUJl1yaAp0rXZX3U1JaHvXd6kX8/fLVMhyg/9a0MSBF1i1zM0WlbWwC4m4L
         ShoYbL3sp3dG7mY6v64rm1zxvavap7uhGG/3pXY8LErMF4McTziw9lw0FzE+xYz+qTNZ
         k1QC64+JlnClgmHFIxPK9+DUr6F22KSNrYCuZ0rNjSUlUXjjOzScEEW5NAhiSyxBO1OJ
         SWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834818; x=1760439618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwb/HbnwzE5TgmJ5/wf40ncfLtJl41+p/ryuB8gP2tw=;
        b=SBFLLMcuBR0ykz9qCbGoG25PAltQnx7RH0qzQzt53rAr786BZmFC701fqKZaB/priA
         lU102hF1yTDbOGeJgokC5QFxV0O2TWQo2dSayk6eoK/dqQPFrKTRUp42U8scBBF3NCBN
         ZtC3yxhWrXf7GrXfxJxbA4/wGup4WTZJ9uq4JhjgjVsKyMjFRRPohiszh+npsc1jQ1oO
         WkXWUKCPF7tpezkUS1rXzCzcAwa1pGTs9h3Ff3+inVaEW26QZMBO9gsQch03D19V+a1y
         Y9RMheKl8+jlUg1z5EM4IjzNWt2pujT3bpBY+mQQk8GqkI+RLYO7ZgbVbbZbAii+PBx2
         7wRw==
X-Gm-Message-State: AOJu0YxYkuIkLTcPTTsODOsFZ15V/aXajqwdsa309323aFdIgFeh9qSj
	NPq35qZJ9Q5sckopYNgaWRVWgMEGQzhJQBeFA1vGlMj8RW40rxtATfVbOay68lp/s/Y=
X-Gm-Gg: ASbGncvZKvSvM9O1ClGA5nYfhb1UgS5HCj3L7NZKSiaBnaF3c+fDgFLmpUeDWepbaDZ
	CIFnqWwNxc17+KIVr0oZuh/+TijmgEavPq3axQqBypdqx1GYr+mS7sXLzyP/G/39SU2o7UR5mRz
	4ZnPtHut4Lc2caXhsLeYnWUkIWrSYesuwXjQeLGC7Jc2/n9hMvMeZVdA91ra1Zr0d1qE8HgvmLF
	feF3OpeYq5DZKgOO/Uqzvi/W7AzkuHZ/Gvvxh63VSg7+cFOKGdXFUYQ0gQ7UJfNQQyX/lGyAbl2
	wbuWQOE4Kikqk3HO2qngRlAfeJbd1gi8e3nFyTxfwlb8+WMU6cQ6zvdKZ63xk4+ZPQwmfyXR1DR
	lel1Dy675reiriP4QIg35eWycvqQpUYfL4lbGg2CT2vaxNINTIcp/XU+MAXNp4IJeYYlHzk1Is6
	xtStfgDyDyRTPiWWO/ZtqFDch/NCf2BLkyjkPx6bzQ+/jeHw==
X-Google-Smtp-Source: AGHT+IFbYlyu5HAttkChHYhRaxibKbyqo48mpg1QvGhoKjpTmy4gS4spS+dN12FUDcuUtU+gqq38XQ==
X-Received: by 2002:a05:600c:698c:b0:46e:36f8:1eb7 with SMTP id 5b1f17b1804b1-46e71124219mr107431345e9.10.1759834455091;
        Tue, 07 Oct 2025 03:54:15 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723593d8sm225159795e9.11.2025.10.07.03.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 03:54:14 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com,
	ivitro@gmail.com,
	joao.raul.434@gmail.com
Subject: [meta-oe][PATCH v2 1/3] openocd: bump the openocd, jimtcl versions
Date: Tue,  7 Oct 2025 11:53:47 +0100
Message-ID: <20251007105350.1237-2-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251007105350.1237-1-joao.lima@hbkworld.com>
References: <20251007105350.1237-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120332

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 3bbe33ca1d..3b7705c41d 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -13,10 +13,10 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 

