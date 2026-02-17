Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC27E909C5
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15054.1771342915106777897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=XjJflr2p;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.216.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-356257a9351so477056a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342914; x=1771947714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/DQOYfdYaY7r3AsuGmTSv7rDxX7Pts78gulUGu4F3U=;
        b=XjJflr2p1ZYty/5UsrduvK6/6EEZjxJMxKiSp0zyMcQXYOKIlJrbZm9L7Gr/JkxN1W
         lvRmbxD5r7uU38MY6O/1v6Md4HgGiC3QE+XZpKXWiW8XobAql7Fvd+vFtBDi1+FuOOeu
         c0Ev6xrHoMF0ckFaa9n7a8rnbc7PiPay4SJ4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342914; x=1771947714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/DQOYfdYaY7r3AsuGmTSv7rDxX7Pts78gulUGu4F3U=;
        b=CJK5NWg6CjZMbLSG3NLA1by2qvJ5mv3WYZjlFiGj8p+X5RV9jT+bCDFfdzww+zAL1M
         bVF2XElIdkCrC0C4Agc9F5QugIgom5i21v+1orcF0Re0NAHvZMb7cQtHqnPQdiYTooEE
         OztP7wVUpR8oUtAntE8NcdnXk4k2G+1X7CDgSR1NjMJPEV4/6fqwE+R4rRWfwrCSqIRT
         wDZhpDaqPFjhLms3rPypWjr7dbWMMsNxohevEZO+3N+9rYUrWElLWNcmm8XRUfOPMA7P
         p2bxPPjo9nWPrEuB/7ukqnXjsPYaVR/O+vK1hBjGbo9Tu+lY31CJydQbsKb6kB8gpTXc
         v59Q==
X-Gm-Message-State: AOJu0YyXsLhhZRDnkF/aP43d5ip1uBQficOKAthHN++B42M7lbT/Gb8P
	lWezmuZe51edo8JLhmIs6C/7wkxZ7fuf7MW2Q62NzAamsSq4bRDY0VZQnOqsMEXCqXaLXfCk3EG
	wfVpL
X-Gm-Gg: AZuq6aLnaxmdlTCnnbY6NYn2P0+9Fv4QeAU/wIfRTnMAXfQ/jnC6cRAfd8brs3JAcWS
	AC/y9+z66HT2dGGO4m2BHXiwOE+oxqKW+fFZ3FF6QdLxjcVSrXNub3mOYi8abVUhm7Kd+f0anIj
	/c0/ZXpb7/aUt+e7uff0ZM6/RX6gS3E+LTGiL8mqTAfvhvQGDGOW3FZA2r5K2LAaFYkN+hbCd6O
	pLVNosi1INM+IpXTLP2NbzfRBkN4yr+Elzr2BiTfbYxYoCOV6bDUF6M4zZqOK9emwgFGRUhsPtH
	FGO2XEiYn9RA2N4rYsgZif0tSoREXCR3aJS4Dsl/5+67qpfzYDUczHR7nf3Go7fbbMwSuHYt8wA
	sE86omvscFY5Tvl7vnrqs17+UZFts2g5n37sWRj5jEJNkC/d/JVKL0nNnsiiEyChpd2rDGijpLs
	5E4vijQOajJdBdTPXQoy2PNkuJ1YTjOCxmkxQ7aI+T
X-Received: by 2002:a17:90b:5252:b0:340:b8f2:24fa with SMTP id 98e67ed59e1d1-356a78d97admr9652248a91.2.1771342914503;
        Tue, 17 Feb 2026 07:41:54 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:53 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 6/8] libtoml11: add a cve_product
Date: Tue, 17 Feb 2026 16:41:42 +0100
Message-ID: <20260217154144.713423-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124466

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 60c97b1c2c..5815a5e574 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "toml11 is a feature-rich TOML language library for \
 
 HOMEPAGE = "https://github.com/ToruNiina/toml11"
 BUGTRACKER = "https://github.com/ToruNiina/toml11/issues"
+CVE_PRODUCT = "libtoml11"
 
 SECTION = "libs"
 
-- 
2.53.0


