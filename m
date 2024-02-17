Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B31CC48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.606.1708129011912700192
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKbBMbnw;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e09ea155c5so1000934b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129011; x=1708733811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJOdZZY41oMZo+Ug/w2KBWljPRc+zcdXC1IpK577V+s=;
        b=HKbBMbnweirCFdHhkMJwS2cfj7+nVpffdlB9t1BKxK6rvNd3y7s/4JMp0k3Em4oOmJ
         Xp3lrZ1gm15bsF5+YNe44aQRASjoDdYrRtmq+Z2vYZ+6uLbuyhhTXr7sxNe+GkkIRcUN
         S/ip2S9HfxejRJEPpsPeLYNq8+RUrbCZfU8b8jaWQEgD/sLpcO+K96fogVDdfJI5oNYG
         2Gp2Oc/XgHc4cQscqEE2xbTrWaBDHzKQQG5Q8trxz3jiy63jrKdF+m3ubqyqNUyql0pM
         VwKP4EhdoOao8BiGTGQw6W2oq9eHaK/Jl71viDjzgSjsM1A29gqp52T4jg/UYraXrXQt
         E4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129011; x=1708733811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJOdZZY41oMZo+Ug/w2KBWljPRc+zcdXC1IpK577V+s=;
        b=o1mkj2ANdRA2xrAtCZQH+SVwSQMdu3uvNk7wAOWIUJm0oYnDIq/7rgUw4pochGLpak
         /E0Jsu2OZtj69nonUIZZu4PboXJEqr0Q8Exh3voDHO1+IBRXPG4KoWAkt1wd1lTT8Rnc
         qK4LnPg5yDUtsas/mw6vhsOHcogD6lC5NgEW7vumlTJQD06akx+IP9uj/nmI1Ik1bVhh
         O2++OpkSNYC6kx2Zp/Z0mYsVcekcsrnmXs8L3KTCZ0UV1Mb/gyjBtke4yIZBZ2JCZ7AA
         hFPRmBGq/80TXYmxWUcqWrNJ6qGSObK5IqOslYbEfP807ii5wd0pJAQDr3DUUkFEgaFf
         5w5g==
X-Gm-Message-State: AOJu0YwYVu2eXsBC1VwH56F2VSNN+D9afOzotjyLd4bxH1PSeficfO/1
	VqrxsHF/iJb8bxa/QoGLYxJj7X6JjDLwVLHfRESTZA15ULrwX+pRknnjdcDD
X-Google-Smtp-Source: AGHT+IES08uF3LP8mD15FwKGqCaISSVJHN9PiTnkb677bWdWfGdOQqCOzqhxVYMagmAKKZzGvlBYGg==
X-Received: by 2002:a05:6a00:1da2:b0:6e1:1843:2e91 with SMTP id z34-20020a056a001da200b006e118432e91mr6956782pfw.9.1708129011001;
        Fri, 16 Feb 2024 16:16:51 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 33/60] python3-serpent: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:24 -0800
Message-Id: <b37b8dafdb613c4acfc72579b7c26a8df76ab532.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108803

* Also replace ${PYTHON_PN} with python3
* Remove trailing whitespace

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-serpent/run-ptest |  2 +-
 .../recipes-devtools/python/python3-serpent_1.41.bb   | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-serpent/run-ptest b/meta-python/recipes-devtools/python/python3-serpent/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-serpent/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-serpent/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
index 480e3ab388..941b5ee0f3 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
@@ -11,8 +11,9 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytz \
+    python3-pytest \
+    python3-pytz \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -21,6 +22,6 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-"    
+    python3-netclient \
+    python3-numbers \
+"
-- 
2.34.1


