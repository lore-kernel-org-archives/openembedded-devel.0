Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB93C54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:23 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.584.1708128975852073477
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Je8F4wMi;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5dc816e4affso2375451a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128975; x=1708733775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl6SDC7GeZIKndznxOAWYeCpUhM1X7VC5DDMh72Y3pA=;
        b=Je8F4wMizVafgn1IUHfBUmT7O86VEMWSc35Wr+lffMn7F14yKDAS+QCpq8JBcMKfrC
         a2xicNIkOD+8lNeRFyqNydIxWSQtxPtXA0270em0SExQRYH3bselfQdf9JFYzHL3a9Ln
         RNbdttQyiypztSBxpDhWz/nqkpCGzvFUidjtKJK7cfjaIneLi7r+Ltp7HKGPkrEh2gaZ
         jZtXPWlEBkZsRgZSlu2sbzQc5WGTHP6s1JwkWDrmBPv4cE12SR2FIadd20IjMmSTd90E
         lyy0SYEiNkfn92HIY+QuLhqL7YWXF93On4E9UfKaIWX3lfxUbuIdaHBTcDgw9iVcpxBj
         mzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128975; x=1708733775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wl6SDC7GeZIKndznxOAWYeCpUhM1X7VC5DDMh72Y3pA=;
        b=lPQBHs8eesDB0Olfl1eBkPsfI/FNc0xEIYQIuF4kdt36dePrCyo5vl9FFD6HIuknVy
         vpK3IPApV6kDrR/vu7AsTPfcCAm47OgJa9TKJUSvSCFipL9rQOmk2XbRLUWZbABQ6btm
         Dul2KXN1VVTuHvozWtnIU0aVtXYr1bB/e8PbOl1JuzjKEfKvGKZdBl8LPfHml6QxOzjz
         eAlttF7w/0RhJnTvAE5+eNV65mfdV2LBgh0yrWriquRwUs8Z1F63z/zjBZymW3uicsyz
         +YdDw1FjFHxfekXebYU0stn8c9UNpK7/kodzK2Rg++aCqYhlE/A7cgYf3eV70PuH7pYz
         vmfQ==
X-Gm-Message-State: AOJu0Yx+332pgfr5S5eYrdihspHVVyW77GoqqEb50vkqK2ds+xyOwb8r
	tGmHHzuGmItn9E5I0MQNhRmHM0phjmWjLRpLBZMDQoc8HZpUltUUd7CkgLbV
X-Google-Smtp-Source: AGHT+IHiarsT5aYYRty1ihavvHHCxuIompwZxwswOjv0WOrKvQ2AssSZBO2PDm1UZ3Nt8eaM8ki6xA==
X-Received: by 2002:a05:6a20:be9d:b0:19e:c777:5c61 with SMTP id gf29-20020a056a20be9d00b0019ec7775c61mr4877115pzb.22.1708128975141;
        Fri, 16 Feb 2024 16:16:15 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/60] python3-dominate: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:01 -0800
Message-Id: <b039f2a5a504c797efed80e2194c01eb99750321.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108780

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-dominate/run-ptest     | 2 +-
 .../recipes-devtools/python/python3-dominate_2.9.1.bb      | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dominate/run-ptest b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-dominate/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
index 3bd9d87547..054d5236e5 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
@@ -11,7 +11,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -20,6 +21,6 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
+    python3-numbers \
+    python3-threading \
     "
-- 
2.34.1


