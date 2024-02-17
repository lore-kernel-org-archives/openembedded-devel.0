Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6DBC48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.621.1708129036526930267
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VG18xasj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e11a779334so1707070b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129036; x=1708733836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/y4DfXnuN2OjXxSDXp2fyt+2Q29Ji81a4CsvGAtN0U=;
        b=VG18xasjwd8NTGDYidgse4SiaVg+glSFLosbumiEBOCqFFloIJkJ3ixX/WwdKjFl1Q
         CtMqOs0Cmu14C1O3lJpzRbFXY/ngqjscz+8v+pkcx5DssvkTmez5Wcz06LOKkL+l0IZk
         S1CA1x4x5DRl2qftU2bZGk+BGExhCrIDo6DOK3rXy6uzK4WKC4uWH8eJGPDD4rXl/yVC
         Gicfz/1Wa629IAdINNnPPIAp5I2UoIeCxUEb0eoHuoEITLlYJR6qg94ajxgQp8aijDLF
         7egeJ9yLhiF/nS8NE7uiQLlA3t9UD2R5WqOd3Xr+I3LA1C5tuRYmp9U/hmmj170Ngk6R
         CYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129036; x=1708733836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/y4DfXnuN2OjXxSDXp2fyt+2Q29Ji81a4CsvGAtN0U=;
        b=H2WPucmJap5VGDv2idm+RZS9K6ZufqDZ8P0hwoHp7XygCfvTUaOFen+hGpsnDvw6nU
         aJ4iAxmzItb9M50+kEuDp3y4p007P+ZpxyzSMpdENR7urK4RYeEbjDfLXKVFa7axCZzt
         YtGWkvhoA2ruH5vSefn3dHwzoi02KoZ3daZET47XZdySWW82jhPD+Bjv/+5OPmqB2/nL
         GO0B54xALbPKRqDUuUIzuUmTYT6LCjGB19CZyijKp4MIdGK7We4dRZeaSDSns1r1j2Iu
         PSM08BFSEXjVTt68yW5Qiy1SL9yYTGN5FgOhME761BY1gCJYxYco1Qi1xGghy2EWlwqB
         w0uw==
X-Gm-Message-State: AOJu0YxmBia4Rvib3eVjjNhW4DgkxuwTxqpsStljHk809EGvC7K5BZ5c
	sLvpwh5N+9EGEzHXNacoSfRiknAAhNnRrpjWZf2Yr10G5p3Ft5cVpqafiUBJ
X-Google-Smtp-Source: AGHT+IFcwVkHGot58kv1iv8Pm1AzplUCL5PFP48QuNSG7SLmpK9iIZVPCEcmtrwfBMlgeyYyhAZI2w==
X-Received: by 2002:a05:6a20:9c97:b0:19e:5ac2:a342 with SMTP id mj23-20020a056a209c9700b0019e5ac2a342mr8901821pzb.17.1708129035748;
        Fri, 16 Feb 2024 16:17:15 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 50/60] python3-semver: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:41 -0800
Message-Id: <94a11779526e752b5d59a0231abaf846208eb5bb.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108820

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-semver/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-semver_3.0.2.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-semver/run-ptest b/meta-python/recipes-devtools/python/python3-semver/run-ptest
index cd2bc8537c..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-semver/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-semver/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO tests/test_semver.py --disable-warnings| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
index f90ea0c9dc..25222bb5ff 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
@@ -17,7 +17,8 @@ SRC_URI += " \
 DEPENDS += " python3-setuptools-scm-native"
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


