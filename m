Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D45DC3ABA3
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:30:53 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.117818.1726417844150569933
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mb9poVYi;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db20e22c85so28897817b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726417843; x=1727022643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz1bCrrM8yGloXQuno4Maq/DNxDlseelpmyKmFA/EmA=;
        b=mb9poVYiyRaGQQwi73XX2iuldlEzfMzNgzdhqCYm0UcRoo8vMFeiQbBSPP0g3FhnrZ
         kbEI4g3rmkUw47A5RcLsl1m2tuqy9DKlnfCrqjlvk0p2TMwMUPboimgNSAV4G1Rkxyv6
         3wt/n67fAttggg5gAEj0yOQF8MHHuukl/Cz/b7c5k7qie9d5/ZemqB4KskDflGcnIYfy
         vyZVznL36fXUQPkyp4tY4G7hMnBWsJMwfCwOV2fU6k9GHzLiB5mAQtSYYG+IajIfNszG
         bvPl7HsTmQPWOKyMCZjJ1fm/TFfXRnZtg8EoCZrqZ7s6oeEbKRAaIvrGWWJRSnx/2ZHK
         oAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726417843; x=1727022643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kz1bCrrM8yGloXQuno4Maq/DNxDlseelpmyKmFA/EmA=;
        b=UnEJYrt/r41gBBVWuj0RAk81Lq22itzR47FdJt9OAnjMkLzlwef5I/XodbjdnwtPTy
         j0MWGIEfCG6F31DVis/qbmI/z9hnlbjkAcXKkdqSOQSa56OOWjenNYzrEaq0Awpo8tGu
         1utIZXSTWj8gGN8Yr8Bk5HVWJiMHJ3jgaAHA76Jo1LsRuqI7YBoLp6YtkQBnZjt/C0od
         mPnMq/z4SV8ZFPPgVexrrwkUjYsrlHMPUROJKIGMgI6OBsxM3yph/vSgNxNTk/uIHRps
         XODVmdibUdeh7q/F7jqDwv3YWLoSkRY5vBsKl3Jyo+aBgok8+E6GY2JEeBYB7LhnF3VY
         A3HA==
X-Gm-Message-State: AOJu0Ywqu+QFpDYLQl8xOxkTSsG1E4oBST8cWvp7wRSrop4uuujxCWBF
	s7SOZyQFH/TQYkgcJYX0m4PWdseeR6WcQhZxz0YmOVMJf6Q2jjD3D6ShCQ==
X-Google-Smtp-Source: AGHT+IEPpIK5JgLbdiqKFrXYmyG5+QoF1Q79OYNOSaX2z3hp3mw4NPedM45aXYxSZYQSrL4DCCdt7A==
X-Received: by 2002:a05:690c:397:b0:6ae:7b2c:aefa with SMTP id 00721157ae682-6dbb6b3e745mr127542747b3.21.1726417843094;
        Sun, 15 Sep 2024 09:30:43 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e28e55sm5777867b3.70.2024.09.15.09.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:30:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 4/5] samba: upgrade 4.19.7 -> 4.19.8
Date: Sun, 15 Sep 2024 12:30:39 -0400
Message-ID: <20240915163040.189190-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240915163040.189190-1-akuster808@gmail.com>
References: <20240915163040.189190-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112307

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.samba.org/samba/history/samba-4.19.8.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3cbd140c7d85d99afc81ffd83b75698ee621c1c1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/{samba_4.19.7.bb => samba_4.19.8.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.7.bb => samba_4.19.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index dddf594515..429f983c93 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "2bbb800af2d6bc7b9c23e708cd58d008da3bfa6ef7e621d9ec8b53387efee445"
+SRC_URI[sha256sum] = "1aeff76c207f383477ce4badebd154691c408d2e15b01b333c85eb775468ddf6"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.43.0


