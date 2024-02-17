Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7247C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:03 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.602.1708129019281968386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNj9+rUZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59a1896b45eso1031950eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129018; x=1708733818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8cqdYI/0wtHYtvaJj7k8JTRbN3x5ijE18ary62Cjos=;
        b=XNj9+rUZIX99BNP8KhHsTWHELCLqTg2lr02AAap4/o2fS0/sAoAeSj2Eb2NHxq+I3q
         w4YLaEZ9HxzFOJl18Ko9vwQiKlI9Li0KgDPdbJk2Y1cYSnN72+YpYUCTXJzm98lNWAqs
         ms3KiYi91jatWPOX7i3WHyzlsR95GrR7iWMPYLh0ID/Y7fqYY5Y/BR7m2WNmoyJBjIy0
         75P3dHwdsIRW7VbuILFesGWhI6xmMdIIvW9LYFrneUgZzSGK3ODcdA0nersWuAHdPQdc
         ScCQzjNPKUxbH2XlYTKn3TZ0m0l206UaRDvXsX5Zp/D+cxVmfonuvSo/rZGhQy4BT067
         AoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129018; x=1708733818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8cqdYI/0wtHYtvaJj7k8JTRbN3x5ijE18ary62Cjos=;
        b=beYq2kFXlpHQRYWDfJR1MaLcOJwTxSh+SDeU3laSPKbeP/03IJi1CYPVIES+mfsGDJ
         mpAvRwaJpKYvkuoGk9NPCKW7F/SIUj1BDu8XbU/pjHZ0m5EeeFJd3GhHMHGsIevnI+9A
         da5xzynfACOpKv6MXh8CsCFMo7ApV1O3qftVh2FANMwKwaG/R2Fwj5YGElttqf+3JH4z
         175OoTz1U2kr+KpR38hOllCF9XiKVdMAXYX/+cMsLuLdwjChA8kg8EDYbSbZzYwgscWO
         NAEvADmrsGOtKn5jMoKfdcP/z/JYKN70GzHvjA3Ixeq8AkK9NgEz6bh3cungiPnD4jr2
         qUdg==
X-Gm-Message-State: AOJu0Yw28bBVh9PnW6ZflhKMu9poN5CGjFRGErpHt3vZ443Nl5GgIUnU
	aC7bqGk9Fw6gfYZoURsstN5iGZTxwKJyV1UMGw+VQp9alx83MFD//1C750R5
X-Google-Smtp-Source: AGHT+IHKRz2rHP0ZtzRIs1W5+fsXjFX9NZNMDVzCNDijau2S1tg9g7p4jAV6IRmGg69hGiPA4mHYBg==
X-Received: by 2002:a05:6359:c85:b0:179:24ae:25dd with SMTP id go5-20020a0563590c8500b0017924ae25ddmr7399691rwb.25.1708129018273;
        Fri, 16 Feb 2024 16:16:58 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 38/60] python3-ansicolors: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:29 -0800
Message-Id: <e1c9e23c930544476e38f93cb7c7fdd615f2868a.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108808

* Also replace ${PYTHON_PN} with python3
* Be careful to point pytest at the test.py file

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-ansicolors/run-ptest       | 2 +-
 .../recipes-devtools/python/python3-ansicolors_1.1.8.bb        | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
index 7dc3ef32be..922353a1f3 100644
--- a/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO test.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake test.py
diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
index 0e32443992..b63cc32a23 100644
--- a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
@@ -14,7 +14,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


