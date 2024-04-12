Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A4DC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 03:02:30 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.38016.1712890943782799284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 20:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RX6JpMzl;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso497215b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 20:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712890943; x=1713495743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xmfY40Q37srgtvcKFd2UkQ9Vqnn8S6CV4M/IQDOwbtg=;
        b=RX6JpMzlRaBOxZIUKgvYn06FteyrXwpsAPMA3DhkJowmpqHJH623W3srLZIOn24Lvx
         BuoQrHN+/misqfshINRYcR4GBHYCS5LFbpLPReo3qCEFwa9W1ZncnWTWaY2hbBzDjv+O
         LAi9crkCzMX2fmedEUsvFElzjW2BQA0GEqVQYME5QrrUTsjej5jqcdFNq9qLZ7T0Bg+s
         mN5AtMw1mqu1CR3Q3pGd6a5JNeZKNpJHVTOxyVqvaPXylKRvXYrLRxd3RpAZrLcQUyV4
         5/sH6+t8MTtRdQ2hf+LQbudLippRY47ANrPXtG5GcDMEETOPwN70qs79MknPXgG20hLZ
         pSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712890943; x=1713495743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmfY40Q37srgtvcKFd2UkQ9Vqnn8S6CV4M/IQDOwbtg=;
        b=sZqkJMUh00f4yuJpmppKLRSLYcYyOTgcy/bbh2jdFJwUs1D862wkDRs9f5hIQ64Nmz
         t6dMI9ZAIEUtRePGTuTR8ZobnBjchlrpz4HgmuLugtCZMhsPV9ZRFR33etqLfJMXTg59
         +1VZhK3SRpDjcF8VPSqQ/OOa1+1ko2oIhGPHjUwHxyC7boOYlRgMr6L6TmB+1SBJ8rXf
         hTZMuu5KRhoGafUV85S+LVe5m6YK8a3W0856AxPlPDLV2tviQgxHC3tnjeQlKu3jEI+W
         c8ApEKXzNtA/V6oOYUv+Rl4HgQRHwcx8f8Ng6jfzNIGPxsuS9avW//FScqIEGGb/lB+B
         regw==
X-Gm-Message-State: AOJu0Yztbc8Ul7yFujmQfirkUXS77Hg9mkVX0Qhs/ODOW6ABAn9UqkqN
	eV+jUYocMJDNTDap7t6ROiUVsjF8E+Pd919QObWN9cRMYyIaonz5FmOXFzCQ
X-Google-Smtp-Source: AGHT+IGa3vCvzye9YVja/yDxjawVuJlCKM4DPwVSAg2AyzoHUx4DoUlL/mrxOLt39YAiLQM8hL7VeA==
X-Received: by 2002:a05:6a20:19a2:b0:1a7:6ca9:2925 with SMTP id bz34-20020a056a2019a200b001a76ca92925mr1499581pzb.59.1712890942749;
        Thu, 11 Apr 2024 20:02:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b001e0648dfd68sm1879321plg.296.2024.04.11.20.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 20:02:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jemalloc: Update to tip of dev branch
Date: Thu, 11 Apr 2024 20:02:20 -0700
Message-ID: <20240412030220.3073678-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 03:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109932

This fixes bunch of ptest failures
Failed ptests:
{'jemalloc': ['test_alignment_errors', 'test_oom_errors']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index df499fbe50..7e0272f898 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -13,10 +13,10 @@ SECTION = "libs"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 
-SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=dev;protocol=https \
            file://run-ptest \
            "
-SRCREV = "54eaed1d8b56b1aa528be3bdd1877e59c56fa90c"
+SRCREV = "630434bb0ac619f7beec927569782d924c459385"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +27,7 @@ EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
 # For some reason VERSION file populated only in tarball distribution.
 # Adding jemalloc version since this recipe is using source code from git tag
-EXTRA_OECONF:append = " --with-version=${PV}-0-g${SRCREV}"
+EXTRA_OECONF:append = " --with-version=${PV}-0-g${SRCREV} --enable-xmalloc"
 
 do_install:append() {
 	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
-- 
2.44.0


