Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC738C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.34384.1675055356401758899
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kOTBZkrE;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso12744568pju.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMDxZnhRkCW02Ug34JsYKKbnNLSZCLZk3wlmas7YDFE=;
        b=kOTBZkrErtNtDDrwmSEXZToC0hhJSHsh1cE/EJXhNu+2mh6sxJNsmRdYbHijejj74X
         Hgo3UlHgKYtscZK4sKr7hVOx4YyePEvwuoa03wy0wkssIs+mVf2NWgZTZdtjZncV85uh
         DkGJXBtb1gHdXEZn4ZITwo1Q9K3QgmRcLPuqJ+YpzG4l9PI6nCOkq9uKMCR+6QeLz56s
         9li3YKDz3vQ04iOUE+AEhXWcldcBcvnLOAE+qZwXDfjdn7SRuQbfyX2Fi/0ZfdlDYR/q
         BiKOTUYE2++mBJwZgPKTARcvs0D6IzEEVb7IeoiYB3tMfzjr8j/CHP3rIYBs3mueycsD
         keWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMDxZnhRkCW02Ug34JsYKKbnNLSZCLZk3wlmas7YDFE=;
        b=x4GGoa3GhEMsfmOMEvCnxZT57eHRQneQbG/wkAuKiajuwciDhjDfpFgLSZfWBL3Ld4
         JWSAkNNJKGvqPcXbvwVKF115UbVQT4qNMyZAOSIiBD38si0pH1/jCtDhtSAAMtJElax3
         Ljf7cqxBK6q3Afi1UztmuYEm2Ntenz9lKRGww43ufQtLSlSqkmUDUCT3WKld5RVVvYNT
         liWWST7srdoOtH43CFKfHmK/nS8h/c4hZwBYHHMYOqjf5LysqnaNwUonxp5eOKfokvgv
         OvmzXnm8pZhxQOdSyezZu2hzjCcbCHTR42GSoELYpe8NIH/dHN12qbkEJGSrdKyTbB4K
         XQ2w==
X-Gm-Message-State: AFqh2kptLOmRVg9fOWRQFkIMub0XYYTHhL0tWRo79q1qpHBkkZ9AAQym
	j5vvxNVafznwTrn+qJ82ZgUEHuewtgtAJw==
X-Google-Smtp-Source: AMrXdXtphG+ncleeCYqamKegSQXmZ/hwJQHAvIlMxbFyglOhFUNQjCaAnrMux/X+xRXeh2xVCqgL5g==
X-Received: by 2002:a17:902:d894:b0:194:3dc2:5c29 with SMTP id b20-20020a170902d89400b001943dc25c29mr47419431plz.38.1675055355555;
        Sun, 29 Jan 2023 21:09:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/12] hplip: Inherit python3targetconfig
Date: Sun, 29 Jan 2023 21:09:02 -0800
Message-Id: <20230130050909.133727-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100849

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index e054553d85..d8e249f047 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1
 
 DEPENDS += "cups python3 libusb"
 
-inherit autotools-brokensep python3-dir python3native pkgconfig systemd
+inherit autotools-brokensep python3-dir python3native python3targetconfig pkgconfig systemd
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.39.1


