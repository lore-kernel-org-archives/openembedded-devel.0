Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3502D3F2BA
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.30089.1729278819359026164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GBi6T++v;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e35bf59cf6so34606807b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278818; x=1729883618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmLwYOjpYXfAOtF6tHH0OsXmXecCJQF0B4lwdprRVeQ=;
        b=GBi6T++vnple2UwmamtVPOqSVVEYC3cukF9o60pKl4N3C0i1nBrqdltWf60pFLnmkr
         CZ671PsOpi7sWea/mUujn86Gje//9/tOTRiI7CjogQn2G4e/1kLk+MYa1oZcUHiKUxje
         U9txfq3OJ2c6Ap+cbQZWRq6KsQwYcq0+Awfs+qhgQa0LRURPN2nInZpC+okpts0MyxBf
         TvE45bMmbfWWEGPkN37ocRqt6iukgdoB34i1446ygZp2JqkLs26g6SfJ6En13+ppQMrY
         5a88MyYpno6WnYYT7p4HE8UOrkyqtR3YZOAvxKAD5yB33jZags46paknXa2F3Mt2M8Fw
         bvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278818; x=1729883618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmLwYOjpYXfAOtF6tHH0OsXmXecCJQF0B4lwdprRVeQ=;
        b=vClDLemt9Nh0/p92wXalklAP9HzYj66FZaAmkh/ZIC4b7ACb/7T4gR9YArthin2c7o
         cE6ErKCASD0AYyeIoq9AyY4YH2zkDfqewJEpDnZ/q7WnBUi7OuM9hSwq1ZRUML0Q5qBp
         WRPOiWKgJiBQkJKLoFrk7t50T2gaVT6h1X7zcMlsFVgTSVSwPuZYepw0kqIZI/9mnChW
         OwAn6RWf1xrEDDMGK58NOEZZEPPRtKQOsMdcv0jS3Ih+6oTTcfGhx/N4pRhNgFwKQcDN
         pDW+UR2+eo7Rlzy4gvBr/K5lHO9zW5x9cx1A4V+FRGontUWIN/KmhUCCpaZRc0HCb4Gu
         DN1g==
X-Gm-Message-State: AOJu0YzLdUnkICDTTPbVFjhi1khxOS5Sa4HkN9hT5NGYdyMiOg0IC69x
	VI+vPpHTf4tEGdvP0xlydvpEwTywVmh1FzdCcrqMt654bAvnUodz3Ojx4w==
X-Google-Smtp-Source: AGHT+IH4CDwl1eGYWz+qDXJspdD0Cci85gTRi8bO4GI3sBIr4LA8XHO1kf+1GWAZcoqWGVouVtlm8g==
X-Received: by 2002:a05:690c:f8f:b0:6dd:ddf6:90aa with SMTP id 00721157ae682-6e5c162ece0mr26796547b3.5.1729278818049;
        Fri, 18 Oct 2024 12:13:38 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:37 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 42/68] python3-padatious: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:29 -0400
Message-ID: <20241018191101.25184-43-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113029

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
index fef6376ef..3e4cb1c90 100644
--- a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/MycroftAI/padatious"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.md;md5=cc85c733dffe81e8a7fde2e8f8a6a404"
 
-SRC_URI[md5sum] = "7dd2f1830737dc142aa199f77dacf32e"
 SRC_URI[sha256sum] = "e471f251b94e8cadf6e4214f0f3b7b36678848aaa8c51cd5638ab23ecb716f75"
 
 inherit pypi setuptools3
-- 
2.43.0


