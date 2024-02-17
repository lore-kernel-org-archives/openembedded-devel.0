Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87286C5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.617.1708129046130666378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tbuslgxe;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e10e50179bso1946504b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129045; x=1708733845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtBSct6lnjLiVFI9huXMJ5nXIsaCH4wBBP9+bGQUcQc=;
        b=TbuslgxeJ1QPfmkug8/aMFhtdzZAA/0R6loTssBiAFrpVrpvU0URCEn4z+5Xau+w3i
         5Plo6F0eQcIR5w9fpt4PTxXSE8C1wl3tgjGVypVRGzC5sMq+Eyfoy9POZY0gbSeNGMw9
         /gHDTNTizjcUnIB+b9NoxwNKog4WOYSmwoy6JXQHITnHUOUqUjmV/Myugu6puHFF77aS
         zVAL6jY4ZKsy54+ciNWYg49vqs94ystpKDWcfQptZg9Wt0enG1Nt4zcQjW90xwaLgX9i
         pPD3Cdz4/zAjKir7xP8PAP+dfVB/XyvtokzvnLr1Rt/kZcrBIJGb4eRzaNaFv8jlPBf9
         THGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129045; x=1708733845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtBSct6lnjLiVFI9huXMJ5nXIsaCH4wBBP9+bGQUcQc=;
        b=VwUeLbO3tIyXSuVISwybsoCyuMbXXoh2FvnuK7gt6RDD6dz2RWphHK0a2HUOEWprXe
         Xkyehj+DrIkoYkl/Ixc7Mv6DHA0SincBssDqkQfuOnAbMDfqbrSQwIttxbHVRCd+56Sm
         WRtt4LTKIs9Z/UV37lXi4Ch33V0nOyCPrJyJqwitRO5VGZNHHCXrn24gyPHxEX0I1yxg
         uVdjrgrBHLbdIQ6mwmcQMZGSNKeBGkT2Tfso9Phr7HlPYliJ4neZOVSsKZTZus5IMEjj
         UX+c0NFOtlFbzXiFgNb6PcNFShyeJ1nnYmZySoTIXtE12pjRCDNYRIZ2HGaHLk2o/MxN
         N1ow==
X-Gm-Message-State: AOJu0YxNN2R4wCPukmBNsbdQKR0gJBSdiCrRwBBQb31OU79vAxYrdie0
	Ssdaf1kM0I1bUK6kZM+HpksobVnoHYCRKVBvuq5h6EC8RApbxHI2TUVY5yYT
X-Google-Smtp-Source: AGHT+IG9PIo7RDyOnuwy/Jf8l37tCxbcNx11+6OXqiX6inwDdCfHtvY3qJfTKGx8LR0qZTM+DZ5Dzw==
X-Received: by 2002:a05:6a20:6f8e:b0:19e:4a68:46d0 with SMTP id gv14-20020a056a206f8e00b0019e4a6846d0mr7326546pzb.60.1708129045361;
        Fri, 16 Feb 2024 16:17:25 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:25 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 57/60] python3-execnet: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:48 -0800
Message-Id: <18c5feb1d6c159b9b972ee048ae1b2f63570d396.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108827

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-execnet/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-execnet/run-ptest b/meta-python/recipes-devtools/python/python3-execnet/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-execnet/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-execnet/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
index a934d1c461..78a15d3572 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
@@ -24,6 +24,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "\
     python3-pytest \
+    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += "python3-core python3-crypt python3-ctypes python3-fcntl python3-io python3-shell python3-threading"
-- 
2.34.1


