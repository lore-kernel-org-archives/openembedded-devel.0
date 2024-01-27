Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0245C46CD2
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 12:24:22 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.14535.1706358261496252284
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Jan 2024 04:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5qMwBPe;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so247487766b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Jan 2024 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706358259; x=1706963059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTtNS3UStkgYpzWM9tA/ilBzs99jLPmjjP6Ar23SKbQ=;
        b=V5qMwBPerOYf76yGXkZnkBVGVy6XdYBtV19fdFY0MvaPSk7ol7V5wc5zbwkgPxNmHY
         eorhNChlpMofG2noZrt09jq70+xgZ2XQTKH+MFljnFpPdzVgIPaZM0Vni9GQ3diVKc84
         HIRsj3983snPmj1Y4he0RsmTmt9C+Z8pGKjyLoKS3ZTXaSq6THW/JntwqZ+st/ARWPQA
         rjuRXB23IqJtnpsGEJdtWhik+BDwzluHm4hcr41srOQ9lPt9RX/9Jb8JPDKKqbAvjkoP
         eHCtk2rrphyKO8+sLdK4H3sadQI5mDd1mLiOJ2dX3zH6+n4n9M2O9EYsXH9/0PpFFJoF
         +c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706358259; x=1706963059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTtNS3UStkgYpzWM9tA/ilBzs99jLPmjjP6Ar23SKbQ=;
        b=R8z+tZx4//jAoJuQjuE3kMtZOIoCcsnczb64kmf9TnWCTAgTN2Y10UJ0pNqY3fT0C4
         +N2GFrjY6tLnnp5QziNQApUZX6u0TSoUkim1wZrsHuS6mhVebqVYbDW/+aAZx/gxsOFO
         AQZEfBHccDjVAIDEs7B4/EUpcSGkRnqf/szzM1wTU8PAVK3GhxME+ZHS8R+eCkMateFd
         WaZGFpevwjm0tSt81nOcrsyV5XPh0LOk87Afk+87qpu9FS0CrR+F3v9I6WSor1DzQX/w
         aXI8DogPihjL1HCLibcl0m/0RkQNFbhntW17hQsQ0NPfT25U1+Dg2HVdmMMbVz7NNJc8
         qcoQ==
X-Gm-Message-State: AOJu0Yz0H2aO0MtvjXVFP3hdL5pvUrDoLehhQRNcazAt9Y0AEGSQWMg9
	h+I62HEpDpFyHqzbFL2AutS4KCEiD939bXnqtv+J50DHjDcjD+1DdHsnNS4TsAE=
X-Google-Smtp-Source: AGHT+IHnxHfHWmCgWJckIvXi1KardrJyZxK5rubqAIKHyYIsoQtvB454GV7216x7H1hqCCPaP6HakQ==
X-Received: by 2002:a17:906:e2d8:b0:a30:d9c8:cb73 with SMTP id gr24-20020a170906e2d800b00a30d9c8cb73mr3556378ejb.30.1706358258719;
        Sat, 27 Jan 2024 04:24:18 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id kt13-20020a170906aacd00b00a3407760e89sm1698539ejb.222.2024.01.27.04.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 04:24:17 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-toolz: upgrade 0.12.0 -> 0.12.1
Date: Sat, 27 Jan 2024 15:24:14 +0300
Message-Id: <20240127122414.48210-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Jan 2024 12:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108477

Changelog:

* Add support for Python 3.12 and PyPy 3.10
* Drop support for Python 3.5 and 3.6
* Fix typos (#565, #568)
* Use codecov for coverage instead of coveralls

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/{python3-toolz_0.12.0.bb => python3-toolz_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-toolz_0.12.0.bb => python3-toolz_0.12.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-toolz_0.12.0.bb b/meta-python/recipes-devtools/python/python3-toolz_0.12.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-toolz_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-toolz_0.12.1.bb
index 4025fa3e0..f1763ee51 100644
--- a/meta-python/recipes-devtools/python/python3-toolz_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-toolz_0.12.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"
 
-SRC_URI[sha256sum] = "88c570861c440ee3f2f6037c4654613228ff40c93a6c25e0eba70d17282c6194"
+SRC_URI[sha256sum] = "ecca342664893f177a13dac0e6b41cbd8ac25a358e5f215316d43e2100224f4d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


