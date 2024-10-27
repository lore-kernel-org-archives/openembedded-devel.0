Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C82D13582
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:15 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.30521.1730039168254369237
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTKxHPmM;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e3b7b3e9acso31275857b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039167; x=1730643967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taDPazYpzpSrA/rraRgCcNk3WqldvEi7Tg8++pT9IXE=;
        b=DTKxHPmMc2jC8ArXEmEoRhMsA+MI1lRQCYZOxhqtvOOYpbsE3rRjUcFF8L20kG2np1
         FlVYobw5U4TiV/mDzV+4C/c56+E5gubp68Xr4YWl6iP4Wkp6+5rJZNUVzVStZiXJ6zWg
         A3q31sq0ens2/3uS+qihDDqUDeT+28VLEQxzSd3d+LJ11vXfCTom0OUpCBPUtpcP0Faj
         ehDwM8dEj1WVZCaS6I+wMkiqF2GOFSIJ95obqmdizjt/c+7PxIW7lYTcGsxVk3ECqFAL
         LlJkOl9ttQxCvYhYhzozM6Mb7dil+RQkhV3muRGx7ku7QfhYY3JN7HW+aHgkwO4tKtvj
         ssyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039167; x=1730643967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taDPazYpzpSrA/rraRgCcNk3WqldvEi7Tg8++pT9IXE=;
        b=dOXIh5dFZxHBk9d4EDrzf9BF55c4OUskAw3YOubVBlGyqCXvPYb1nGaScScapx1geR
         pggpkZyIU0qYeP7NkviQ5QUQdUvaB1fTKnLNFXUZ4kmdquUehLAtJRWPUmnxYdOC06hu
         2/kplRRzphfUsRxlcz6nN7EpQFZd0epnI6XgFQE3y4b7BUODzj5qepoRsdU7xy8DqobU
         9D/o7x+uyvB0mqy55/gxM3aaTKRIQIaHKF6DWO0VnBprLCgAU+oZKLiYa8zxJ3gKVc81
         jta8Es7dfZKqr2Re4oj0bEIarDcD/+VhQCQCjRSXhxPx3+jSK3joH+jNoBtXoFOVLOSF
         Rz/w==
X-Gm-Message-State: AOJu0YzrELugD3FdY5vJiNNzhZ09bV1wp2CZdRFkjWKSdsULJ8vS4yrt
	pe7mAfPYxlfX4nCjZy0BvED7BudrrNxFNpJe9c5hIJ36U1yAJtI+CX6ZFg==
X-Google-Smtp-Source: AGHT+IGpxQAcsh4zlhRsHWbngZoGtkdpdQzW0rjZZlmxzPvZ59rtlxlrCjwFp+fmezr05i2/mP/dHA==
X-Received: by 2002:a05:690c:9b03:b0:6e7:e1aa:ba80 with SMTP id 00721157ae682-6e9d892d790mr49206317b3.18.1730039166786;
        Sun, 27 Oct 2024 07:26:06 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:06 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 3/6] libhtml-tree-perl: update HOMEPAGE
Date: Sun, 27 Oct 2024 10:20:54 -0400
Message-ID: <20241027142547.261248-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027142547.261248-1-schonm@gmail.com>
References: <20241027142547.261248-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113248

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 30a8e0781..f07019660 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -6,7 +6,7 @@ libwww-perl distribution, but are now unbundled in order to facilitate \
 a separate development track."
 SECTION = "libs"
 
-HOMEPAGE = "http://www.cpan.org/authors/id/C/CJ/CJM/HTML-Tree-${PV}.readme"
+HOMEPAGE = "https://metacpan.org/release/CJM/HTML-Tree-5.03/source/README"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
-- 
2.43.0


