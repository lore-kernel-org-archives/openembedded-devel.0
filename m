Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B48E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 04:41:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.40608.1736397686382525631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 20:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g63wRRX9;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163bd70069so7589215ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 20:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736397685; x=1737002485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKBtyHIWhgWu5E/UmuJeWNOE63U2Ae9y+YJSo4Ylk6E=;
        b=g63wRRX9kZl0noet3Ix/iDWN0AtUpTYM+ZJ+rspLxOMp5UBFJyEOVTMpwoDVTuMp7q
         d4j21kVZJ2WaKCZGKZ6qCiTs6lX+nymAOEOSM8+inAS0iatwgct2m+BNOCSpyeTV2APA
         ND2oWtvQW3nb1EUzITqRrNywNDJVOJNYbZzYpzKYv/4qz7XbCJPJhslcoOMW+cafODW0
         LorIS953jJkstq0mAc4IsgPNzNunMAUwh4MFruIaRhSF5Iq6ITBbFz+cAeRqxCl1m/GW
         ae6cLErsRo08X7WzZFPbTUTwSBgZDvE0BmYf1fktuX5rg9ATw3hPRl2vQO7XG4ahIBmx
         md7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397685; x=1737002485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKBtyHIWhgWu5E/UmuJeWNOE63U2Ae9y+YJSo4Ylk6E=;
        b=PlEChMmoel/s4IGpVvjw8R0fy16oLz2+s0N0anpnY0y+ml15lbOugq0VjtUYxVBLe9
         R6XQ4Da5w7HJJFR2S12DlKgFriCQbc7RmWOzmnPnCgw18/psmq2G/YwPEdwV1ICDC1bg
         ZkrHpXx3PR4i3wJWQ2M+9cAXl5cJ11f7QGQ/h5sGfYP0DBLLRqIAMhaQyNkH9Pk804/A
         jlLKRUhPzbKeDstboeEVjq8VF0vppRJEZM29tBQrXss7gfPiDUwOTOWDyyVugBaBOh78
         Vec8YD6/jgyhfDjaCfMKB/94B0ydVHk7EWpCbEE3C+iSedjJ1J3gtt6zU8u1qY0Ajc6a
         NkCw==
X-Gm-Message-State: AOJu0YxyQgBlJOKYifTwijmI08C7ffFAim6UJtNiwdbiOLH8OFS5IORr
	edXGnrjWTbIeSebCLHKuHnTlbULSTcRvuTxlwdxsADAuSdueamUKrL/t5A==
X-Gm-Gg: ASbGnctcO8xKKVbiYCdNbE+DOTiR7ni1im4ADW0sUto8V/PSLcmXQj5/biPTxNkCSMl
	hsTTaBo4vE1sPmeK7YREcSkk4AeUu/PQO1Ii+rVdO6cKdR/cfAjGEBNyLXPIBIXnwq944fQgvl3
	uPi7FnF0DG0C9lcqYksNe+z6KPeO+490t1y68Lflpy31rt8O9pr1pfVH5oFAbgFhlMZqlAhy9ob
	o9yZVIW2XrxUM7rXgNWZd2R9Gdr9NTi7yHMgBYRdIb6vh0=
X-Google-Smtp-Source: AGHT+IFp+92zkF9RdxT9YKXwKi7A6BlHVYRaIPl4PwsKRnuO5iCDLEJXksoIw7SgYNSz53dcn/PH0Q==
X-Received: by 2002:a05:6a00:6f0b:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-72d21f7aef9mr6902471b3a.11.1736397685567;
        Wed, 08 Jan 2025 20:41:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::e3f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81622dsm36106342b3a.30.2025.01.08.20.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:41:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] spdlog: Upgrade to 1.15.0
Date: Wed,  8 Jan 2025 20:41:22 -0800
Message-ID: <20250109044123.2467102-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 04:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114746

Use bundled fmt, it still needs 11.0.x and one in OE-core has moved to
11.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../spdlog/{spdlog_1.14.1.bb => spdlog_1.15.0.bb}           | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.14.1.bb => spdlog_1.15.0.bb} (79%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.14.1.bb b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
similarity index 79%
rename from meta-oe/recipes-support/spdlog/spdlog_1.14.1.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
index 19bac0be89..c6adf5a4b7 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.14.1.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
@@ -3,16 +3,14 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-SRCREV = "27cb4c76708608465c413f6d0e6b8d99a4d84302"
+SRCREV = "8e5613379f5140fefb0b60412fbf1f5406e7c7f8"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
-DEPENDS = "fmt"
-
 S = "${WORKDIR}/git"
 
 inherit cmake
 
 # no need to build example & tests & benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_FMT_EXTERNAL=on"
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_FMT_EXTERNAL=off"
 
 BBCLASSEXTEND = "native"

