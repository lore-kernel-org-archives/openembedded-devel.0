Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D4AC04FE8
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:39:59 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.3489.1695235195977277886
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59ed7094255so1847357b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 11:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695235195; x=1695839995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Trcax5jvVCZMuVZCCexreystUdTnMbqj3t4qMnTJi5M=;
        b=TkQy0udA5pY6Bs7LwZYBzM5656i6tLgiNrRT0Mlw0ZY05wFlnVUwi7IPKersSU/G8I
         GnTH3zrtRK5vCkMgGntXOUahRCLrr4lxkzeWbBrCwDnqEJcxsy2qv02y/FWaYgNHQxWR
         OW/9FSTOMEmWhrZ3KFg2NaQAqSjlNujrL9Juxa5a7tyEl/oN6XNxxMxouKRtCDajKm3E
         dom298jsRD2SAM+vlSZD/Ef4GAyxVNJxW4Kl/QSttkFthRKysqHA0n9meKcB8O9OGlri
         M7j73V/1dlZovG272UlcJWclne1JxtF+7tShvZtvb+TZPbqdkhFJH/nmol+iHYLDEC9M
         /YXg==
X-Gm-Message-State: AOJu0YyTaoUSvccrtDoBLWB32FnyrF6YZQIqkWoyCz5HGqipq5lleuuU
	MGPFDMlk2TNpg4T3ooM8SCqZpOSbWy+EKw==
X-Google-Smtp-Source: AGHT+IGiy0ml5nUbEDKXf2zapfeJKgZUXPbziOUhM40hw1vI7d3JvareoTGWb0BX7wPxmAy/zQR4GA==
X-Received: by 2002:a81:92d2:0:b0:59b:bea7:29cb with SMTP id j201-20020a8192d2000000b0059bbea729cbmr3297372ywg.1.1695235194693;
        Wed, 20 Sep 2023 11:39:54 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id s10-20020a81770a000000b00583803487ccsm3929221ywc.122.2023.09.20.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 11:39:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cerberus: Update version 1.3.4 -> 1.3.5
Date: Wed, 20 Sep 2023 18:39:44 +0000
Message-Id: <20230920183944.1324633-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 18:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105021

Remove outdated setup tools dependency and inherit

Changelog
=========
New
Support for Python 3.10 & 3.11
The HTML documentation uses the furo theme

Fixed
*of rules are skipped for None values (#582)
Validations of mappings would raise an exception when the field's rules were provided as reference to a registry item (#599)

Improved
Various minor improvements of the documentation

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-cerberus_1.3.4.bb => python3-cerberus_1.3.5.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.4.bb => python3-cerberus_1.3.5.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
index f9f885349..eb3453aee 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
@@ -4,10 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
-RDEPENDS:${PN} += "python3-setuptools"
-
 # The PyPI package uses a capital letter so we have to specify this explicitly
 PYPI_PACKAGE = "Cerberus"
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
-SRC_URI[sha256sum] = "d1b21b3954b2498d9a79edf16b3170a3ac1021df88d197dc2ce5928ba519237c"
+SRC_URI[sha256sum] = "81011e10266ef71b6ec6d50e60171258a5b134d69f8fb387d16e4936d0d47642"
-- 
2.34.1


