Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87310E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:32:02 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.3970.1736548315616081556
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 14:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cdce23f3e7so17137545ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548314; x=1737153114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUvTxImm//1IDntv88adWGtrpkajfZLdUwIp23avaY8=;
        b=Q98L+zn7ODPlE4s+0o7lnT57okAIV61UKT4gsSkQ8hIOt/xx9/scl3AEZDhEJs7DjW
         vsLBY5t2goMljW8woMDKID2UBJ8Ozu4C519yPCwhpscXuCWbOs4c+w6YkZwhEB8ASifs
         c+Pk7Fi4doOz4/3sYqlrF32WCAVV5qlknsT3/pQPfJk8BOT4R01Z6TClu3ieX8AGzQ3W
         8h5LMGXjfAOdckFBDbv/1dEBUZToruK/Ehb1zyBczLqZMK0FCO9EyX5HaksjY8o9IYr2
         tysBuwklpZAyuRmMtg+A85lc8LuvtcDU/ak675UDUH11bS7dsGKX9SnGDl0BwEX1K5YK
         AgPA==
X-Gm-Message-State: AOJu0YxmmfwSEgjbxeG0o30xkUmHSDBW4JXo5cCoL19ELMWBnCdUo2kW
	5Y0G51SF6XuhGYugSAWcq+rb4HLby+DkJeGZ5x4IffGJaoDdBzMoW9wiWQ==
X-Gm-Gg: ASbGncsKaxDe3OFP64O82OXOkDSKVt7Yo2UaElrt4ssqfa4Tt7Evj5fi9YIQEAvaAiw
	HPC4+dY3+EVZvQ2myFjqHhqOrhcmjHoURO2b1wr6RueuqnUBPgp4nX2vDZR5cSCKh+pkztAnD+e
	Zsv22GgcBTOl5YjBqucFeI30i8mV5DPj/q1rsNze+D9ekENXfC5qGpQJS+TF6e9Cv6LV+65SSzD
	hAoJC/63e47CbJ3a/eZrqk3E5IacpB8SJLNCW0bfJUgzwsalIgBtE4ZMSt6+S4K1Dvl/NGRfkI+
	j99V1snlOotC/S4wraGf+FQIww==
X-Google-Smtp-Source: AGHT+IFHxbR3FCGk4qm7qglyi4bIQEkSeYxOZTaQnaIHzSOyR3O85ZpW9pQx3tMwBerziQJxfZjfNw==
X-Received: by 2002:a05:6e02:17c9:b0:3a0:8c5f:90c0 with SMTP id e9e14a558f8ab-3ce3a9c68b2mr95150795ab.10.1736548313882;
        Fri, 10 Jan 2025 14:31:53 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b614781sm1120035173.44.2025.01.10.14.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:31:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/5] python3-smpplib: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 22:31:32 +0000
Message-Id: <20250110223134.4177993-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110223134.4177993-1-derek@asterius.io>
References: <20250110223134.4177993-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 22:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114812

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-smpplib/run-ptest |  3 ---
 .../recipes-devtools/python/python3-smpplib_2.2.3.bb  | 11 ++---------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-smpplib/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
index 7979f04c5..2fdd2a463 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
@@ -6,11 +6,7 @@ LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 PYPI_PACKAGE = "smpplib"
 SRC_URI[sha256sum] = "5215a95b0538d26f189600e0982b31da8281f7453cd6e2862c5b21e3e1002331"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += " \
         python3-logging \
@@ -20,12 +16,9 @@ RDEPENDS:${PN} += " \
 RDEPENDS:${PN}-ptest += " \
     python3-mock \
     python3-profile \
-    python3-pytest \
-    python3-unittest \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
+do_install_ptest:append() {
         install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/smpplib/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.34.1


