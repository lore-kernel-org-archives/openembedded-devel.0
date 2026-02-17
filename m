Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67A6E909D0
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15049.1771342913023622344
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=mOqjMF2q;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.215.172, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6e49b67239so207474a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342912; x=1771947712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VxMbSQuK/Ar/OZ0F/h6MfwlpEsu7sS53MIgCU/byVk=;
        b=mOqjMF2qoba18n8/+8e1mDLwS5EwZjoXyvXUxw116A41bUAely4Z/A9oCMxpLQ24Ei
         uJpSi3RaAIDRgESDUWhC3oVEdcRY/FYqRFEdKh09h9fPkxnbpAep8YWpPQ52zLEiDVCE
         bpMCImywHljlMjQMgFxzCF2BXc2wC+fJNyJzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342912; x=1771947712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VxMbSQuK/Ar/OZ0F/h6MfwlpEsu7sS53MIgCU/byVk=;
        b=q49ES6gNVN2p5SjsHObVnE20SbUJWu/xCnrveYcveNqAWLS+934pb5VCB/KzEJR5qR
         h6pTwhv+DPFDL487D2q8IEq81tNlKMwOVH26EXmQqA4nFAM/HKbWV7oYcY042mFJOjyu
         b1k6crjh+95syqbmKZjJHMxvUZYjMswgSf/Y14L1VFq6J5wPV4oQpYh6bGHJvGg9HFPb
         hFeesYWY3vxXJkKplF9q6eaOrc/U4YKeZvkEz99epc7QarVih7mcGrluAoaYEgamkz+R
         bDe4CRhFrho4KZHe+3yzoVtZ1VieOZWPq5G/iXUWKQEsLEhxkC7LXLg8/awD9BT7YDeN
         08RQ==
X-Gm-Message-State: AOJu0YxuR3W/usorkLjNAyckNw9FMX9EmxaAYO9ZowliiPlqwmoYkp/4
	60kswwa5YNRcv7NLe+uv4sw+LduOc5pTtqeCe1ORE0tBRqanZH582/Z2ZSu1NOMEExqCgSL4ulh
	OgLsj
X-Gm-Gg: AZuq6aLGdIfBRheIeD0sdsK67MGtKJ15iX8FLXLHAsNNKUqFS5DpzCbGIwM4uKXEQ+y
	4S+6SrzlW9Vv+7x25HQVYJTP7s3r0lCB/30yIEDUyhvitkWi0zCXzKqRrJ/zfXKq2gPgeo4xbzV
	6NgfterwegUheGJbjJbmP6pTfr6sxiA4YJsK/MG/Uh7w2/DL8sUDLjyFXhQ9y8MB2ismcjaB1x2
	NlIpKih3+B+PH/d8RrJz3MnpUqh4hf8bA7z4zcgqiJb/u9GHGEzElXHdWVcN5UaGRiFmrA0wsMx
	dO8S9zhfecd4EcO+85dJ8mv3dLd26+SUFfb8pAm949DQ9KCuDKU4j0ZaYA6GwfHS5TiUnl7cLHM
	WKtWV2/q5i0DrcRGownRecSqb7/CkOWI4w2v7F5RA22cf/CD8uxcHO2oQgtVD+WuWrE15bURIY5
	jbGiBN5B81qF3G8+7wqSTvD8fugUt7q1ISQGGtAEZH
X-Received: by 2002:a17:90b:3d86:b0:354:bcbe:7511 with SMTP id 98e67ed59e1d1-356a7a72a3cmr9142197a91.5.1771342912285;
        Tue, 17 Feb 2026 07:41:52 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:51 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 4/8] libtoml11: check PTEST_ENABLED instead of DISTRO_FEATURES
Date: Tue, 17 Feb 2026 16:41:40 +0100
Message-ID: <20260217154144.713423-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124464

Checking for PTEST_ENABLED 1 is the preferred method for enabling
and disabling ptests for packages.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index d07e49c4fe..4b9eccf88d 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main \
 inherit cmake ptest
 
 EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
-                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
+                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("PTEST_ENABLED", "1", "ON", "OFF", d)} \
 "
 
 ALLOW_EMPTY:${PN} = "1"
-- 
2.53.0


