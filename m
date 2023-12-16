Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA51C38147
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 08:07:20 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.11804.1702714038735523412
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 00:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RV1NCsGe;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-550dd0e3304so1700847a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 00:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702714037; x=1703318837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXuQwWOfk7aU1moYGz4umsTVIILIv79KL9kP9t9zgug=;
        b=RV1NCsGeIDfMjumbGODtxlYZkHseg3gKHmbgAJQH/u63Q4A5dO21dxvUsAlWP2r89A
         pkyNYf2FVrD1FuiQbmO6nwJtD9z91/wRpfRxAYr7i39XFCY/kLHKpNOdY5DgB5fRwg0H
         r8Z4RQB28JPGEm5OwjhdIZw9AuBoddkgDiO6L6tj+4TNDXBatzJ+30jWiF7IBYoesu3g
         r4HUIh/7CYc8oN+qIcHXsYY7wFPHrkvF4JmsBquEaQI0/ewUJoyDXoXrUD9HxaXP9gmO
         NGmFyrMFN0oJq9tKZ9/o1dwx/OrI0Ah/l6U1AieWRBzWC7CnkFvUVqCRFSpBmx86Q6NT
         TUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702714037; x=1703318837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXuQwWOfk7aU1moYGz4umsTVIILIv79KL9kP9t9zgug=;
        b=UK7VHBqOL5KVYWQ2JDyIak7UF1dBe7GdyGewK1ef4WEjeGubIbDS2LT3Kn4a5E/L73
         gJ/eIF07l2Ou8Dcaovn9nFMaKwR58HbecpOzmQrD0putPyKL7tzhZjWhQ03xcFSQeSkE
         NFMrNnGSEnPiIrn44zTobiHfwgRE6AOKCw10S4nwMNKDK4pbX7yHImOuUtpofXklboNj
         sSIqOiwUv2DvbaqziVdKSCTAdYeVNvtEUvoVm4GmCzKiE7o//jCXHMdg2IaBq4iBWa43
         u/6q7q1UZy6t5WNoADEMstawWU1io4FjP2qtkLsQtvLnB5IyPeOzei7EYJ4MLENZoXnh
         WWRA==
X-Gm-Message-State: AOJu0Yws54PXiLtkSRhmhsohjXx/nAwrcWcKUxtyYqk91wS1GlGvBEUy
	sxFXxWE16PMdNOcBvVSoCLlj/J5qYsg=
X-Google-Smtp-Source: AGHT+IEd3UelsCOVOIOxxEOhQgO1WT5HbPmI6jgDpXhRpJOHERZxwXHbVSA/UwWvrk9ECAU6xkuNFA==
X-Received: by 2002:a50:ccc3:0:b0:551:5e69:4b90 with SMTP id b3-20020a50ccc3000000b005515e694b90mr4332381edj.12.1702714037105;
        Sat, 16 Dec 2023 00:07:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cm27-20020a0564020c9b00b0054db088c437sm8484280edb.27.2023.12.16.00.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 00:07:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH] poco: fix branch
Date: Sat, 16 Dec 2023 09:07:12 +0100
Message-ID: <20231216080712.3637640-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 08:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107531

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The current SRCREV is not on any branch anymore, switch to the 1.12.4
branch HEAD which is similar and the only change is irrelevant.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.12.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 51bd5611fb..5794a3beee 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=1.12.4;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://run-ptest \
            "
-SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
+SRCREV = "3572a1fb981672e2cd1d2533ffd836da7db0f414"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


