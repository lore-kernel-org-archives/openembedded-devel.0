Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9A3CEF16C
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 12:48:51 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.8267.1728391724963615895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 05:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HlPUX60V;
 spf=pass (domain: konsulko.com, ip: 209.85.208.177, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac63abf63so54181791fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728391723; x=1728996523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xDd9UGQ+AOxo1rLBzPrxiO1/K0EdF2b6Y4CWVQXU28=;
        b=HlPUX60VnKt8FM4O5j+IkiRU5W0Gu7xAAAMVdHhHS026yTAguWIBMfS27kaA3sDBcO
         ZVe5a+9V7eRbRb/PMzm9u+F+lwY4Hx0WcNP7k09IQmhVjkVccXY8+uNDg61XfAuJ7X3E
         v8KPWsULsL17J4j4HNdq0RT2YPLVHlQLbTokw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728391723; x=1728996523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xDd9UGQ+AOxo1rLBzPrxiO1/K0EdF2b6Y4CWVQXU28=;
        b=m3MrzVrl3IOzUXasbDl9TKgZbeIlPySxPsdqU/JUauVv/bUzDC+ckvJuiAj60GnFOu
         jlfJf3jm50wKa1MydUfIzR4puxIgFFtnoaATJYwTXAI3Qpx1OnTPpavhZiMKKuJ47M7B
         a8vCIj/i9xVkvTCvukBO/8UaEHLC+IoAoEF+SQktEQW8p4mdsreDT3cBwfI5uvxk0Kvx
         yEaCWmpuo1xi1/mQdGGFPOX8jhhzkEsngAA6TFaDCFDyLRdslqSgYAm7ujuMEN8YVOCB
         Wmhfl/hCfhSeLqBrN9cr3/SEP9uCebweiy/+GiJVaqFIIsGcS63ed7tUZj7wrs96vEn8
         tsMw==
X-Gm-Message-State: AOJu0YyKTcC7txcOJIZwd5LgAWATpvycs9Yausg+o8PPx2G3tTTJlCw0
	GuXvqcMbr8dGWZgisuOO2Epvhw4rbPXu+P9ac9qfVAHsnRjn47uBai8Ke1gGN8RqJLIGBqD2NKg
	F
X-Google-Smtp-Source: AGHT+IGfzr/wnfVvxd3tD8Wz4lda0BuYl1q6DQy5stLsIPi3QsOXBCXZUvGDOtCctHk6LQiHVSqlqg==
X-Received: by 2002:a2e:a7ca:0:b0:2fb:b59:816a with SMTP id 38308e7fff4ca-2fb0b598349mr22956581fa.45.1728391722780;
        Tue, 08 Oct 2024 05:48:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05940a6sm4313704a12.1.2024.10.08.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:48:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-gcovr: Upgrade 7.2 -> 8.0
Date: Tue,  8 Oct 2024 15:48:36 +0300
Message-Id: <20241008124837.675442-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241008124837.675442-1-leon.anavi@konsulko.com>
References: <20241008124837.675442-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 12:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112712

Upgrade to version 8.0:

- Changes related to added support of gcov JSON intermediate format
- Detect suspicious counter values in gcov output
- Add --html-single-page to create a single page report (static or
  with Javascript)
- Upload standalone applications as release artifacts
- Add support for gcov JSON intermediate format
- Add Exclusion markers to exclude a while function
- Change sort order in JSON output files
- Add source exclusion markers to exclude source branch from target
  line
- Implement consistent sorting of files with no lines, or one line
  with zero coverage
- Use replacement value of 0 for function call count NAN %
- Fix erroneous deprecation warning
- Fix display filename in HTML report
- Fix bundle of standalone executable with Python 3.12
- Fix merging of function coverage data
- Fix inefficient regular expression
- Fix missing output of gcov if execution fails
- Move tests to directory in the root
- Add MacOs to the GitHub test workflow
- Remove test exclusions for MacOs and adapt tests and reference
  data
- Link correct documentation version in copyright header
- Move tag creation before publish the distribution because tag
  from pipeline doesn't trigger additional runs
- Fix scrubber for date in HTML test data
- Add test with Python 3.12
- Add gcc-14 to the test suite
- Skip coverage upload if executed in a fork
- Only execute pipeline if pushed on main and add button to execute
  workflow manual
- Check spelling in test pipeline
- Merge the test and deploy workflow to a single CI workflow
- Add Codacy to CI workflow for tracking coverage and code quality
- Add bandit to the linters
- Remove Codecov upload from pipeline
- Add test with bazel tests

License-Update: Adapt to new format, remains BSD 3-Clause License

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gcovr_7.2.bb => python3-gcovr_8.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_7.2.bb => python3-gcovr_8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_8.0.bb
index 517124742..27a4972ad 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "generate GCC code coverage reports"
 HOMEPAGE = "https://gcovr.com"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5a58ca91c1758a53f896ba89d8aaac2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b307623752f2e1189349885b95b326e5"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=main;protocol=https"
-SRCREV = "c4b74b0859611283be646d590c7915e787911b6f"
+SRCREV = "029de7050c8a7fffdaaee13cccd3939b29412190"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


