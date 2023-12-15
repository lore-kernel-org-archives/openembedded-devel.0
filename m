Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2C1C46CA2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:01:15 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.65785.1702656074296164213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rGrA0noF;
 spf=pass (domain: konsulko.com, ip: 209.85.167.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e2168ab09so441919e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 08:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702656072; x=1703260872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGHgf2nmS7X8KBowfN4HyEHsBn/cfAp+Dk4leTE68cM=;
        b=rGrA0noF83sMFoWd5wJVXjJyw2ONRapGpxHDfnGd3+PqHi0cWVF1UqxxOla2MGemiV
         4tvO7bg8RWZxiYAGb5vRbEctgPn3NmApki0679WKdSN4lYmPI3CP+qR5wRUrET65YS2r
         hyWiDTSmHKLPiYcdnaBOo4cFJ+1UYfoJ8xCdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656072; x=1703260872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGHgf2nmS7X8KBowfN4HyEHsBn/cfAp+Dk4leTE68cM=;
        b=uUHSnaybHicyOy0jduL3h8kb+2hNfc80KwbB46I9DfcKzxVNxNrn8Bml9Mh5Tm11CH
         GPR8Y+TUjRdkY5N0gZfLcxBY56th/XjNlG7Q8+h28rf3WbjP9O32FeteaOW9WWq/oTXw
         6lp4FY6w5txxH/+nx+O3c+OXNYXsj/DRQdTdSzbaiQ0Mm9VTWtt0zcytASJ03BNmN29c
         1u5cli6ER3n2rXd6YUUQ3u7r7Lrj45OJaBbehZv2jvD17Tvefah7OiMwiuaKSkxAlby7
         v1e6dYCvEyFIbWZ+g/Tb7zgnejTYkk4ov6csEH3hjWdxW7Dsyrrlj9J4ZhHUvkCV5h9m
         GZDQ==
X-Gm-Message-State: AOJu0YySGqCur+3gKl1GvsNr28e4SXCV4nN4RWlMSueITPzGZavFPb0t
	EqBk/Yv1j+n/uTTGDHYmi7qjZA2oHrjWHlvF2Aw=
X-Google-Smtp-Source: AGHT+IH0p4O3uDWKt7YWaBIUb+PnAZ5v1bJdbfra38OgOHX8Y7zg5iWeopUSMequ/FYHI4Hi+rgDFA==
X-Received: by 2002:a05:6512:1081:b0:50e:d5f:2c87 with SMTP id j1-20020a056512108100b0050e0d5f2c87mr3655137lfg.27.1702656072050;
        Fri, 15 Dec 2023 08:01:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm10926896ejc.132.2023.12.15.08.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:01:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-coverage: upgrade 7.3.2 -> 7.3.3
Date: Fri, 15 Dec 2023 18:01:01 +0200
Message-Id: <20231215160103.2164505-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215160103.2164505-1-leon.anavi@konsulko.com>
References: <20231215160103.2164505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 16:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107525

Upgrade to version 7.3.3:

- Fix: function definitions with multi-line signatures can now be
  excluded by matching any of the lines.
- Fix: XML reports could fail with a TypeError if files had numeric
  components that were duplicates except for leading zeroes, like
  file1.py and file001.py.
- The coverage annotate command used to announce that it would be
  removed in a future version. Enough people got in touch to say
  that they use it, so it will stay. Don't expect it to keep up
  with other new features though.
- Added new debug options <cmd_run_debug>

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.3.2.bb => python3-coverage_7.3.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.3.2.bb => python3-coverage_7.3.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.3.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.3.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-coverage_7.3.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.3.3.bb
index 12496b03d..16a67e9e6 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "be32ad29341b0170e795ca590e1c07e81fc061cb5b10c74ce7203491484404ef"
+SRC_URI[sha256sum] = "df04c64e58df96b4427db8d0559e95e2df3138c9916c96f9f6a4dd220db2fdb7"
 
 inherit pypi setuptools3
 
-- 
2.39.2


