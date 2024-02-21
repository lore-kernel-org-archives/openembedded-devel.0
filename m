Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC7CC48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 23:25:43 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.1058.1708557938499672287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 15:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21ea1aae402so2358138fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 15:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708557937; x=1709162737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjdpdrsVGGVzB18iynSVCisawNkDFjouBVEbhS8H+b0=;
        b=JKGDXy1LCNPeN8ydL6DA+uALuHCOrCTF5wyDw9ZjxBA9C6TsWLte9RhrNm8mruiGR9
         vZKqjBvlBYhYowQivBokPvso8Zk5Gqc3XGfQGNtInQxx/b81FKzrqMDp5O0Gf4NcjwKY
         MAaLQ0Cznc1l9y8SghEc4N5kZVyFshBG9y82uOMbW22RPncqWp6vNQ/hGumT9PcetUlT
         7ALWWN43THBjHH+EMZlU1PXkYjI7WzoF12H514OaCUVrPM6EilpDyC6Al0soCTTNMNdm
         HO8PGFXDlx6tXaPJjFJXU4fgOWI8BPW9A5ST480KK9sX/fn+pYDu1J3FFJzAppDMeNgZ
         mOzA==
X-Gm-Message-State: AOJu0YwAVsPRIEswx1riyRAumYzmwhxWzVbX8ahS2xxmnAIm6odKx+mg
	Ye9VyXmYN8HU5Q5pCdpo2qYfOEc6DC+P58ctgmgPF/BuMIRwZy6k1J7YRBuzwUw=
X-Google-Smtp-Source: AGHT+IFE2NGJF7zlnmG71h51niUNW8Tac3KhiqAxm8AfUSLHAxA6Rcsoqb0BJw+Y7P13d8zyrw4M1g==
X-Received: by 2002:a05:6870:51cd:b0:21e:fc35:73ec with SMTP id b13-20020a05687051cd00b0021efc3573ecmr9014446oaj.34.1708557936796;
        Wed, 21 Feb 2024 15:25:36 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id oh25-20020a0568702c9900b0021e7c192093sm2600909oab.27.2024.02.21.15.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 15:25:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2 1/3] python3-jdcal: re-add functional ptests
Date: Wed, 21 Feb 2024 23:25:19 +0000
Message-Id: <20240221232521.2196633-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 23:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108973

Verified tests pass with via the test image execution
(bitbake meta-python-image-ptest-python3-jdcal -c testimage)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 -
 meta-python/recipes-devtools/python/python3-jdcal/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb  | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index accce5391..8593b65d7 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -75,7 +75,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-gpiod \
-    python3-jdcal \
     python3-jsmin \
     python3-msgpack \
     python3-ordered-set \
diff --git a/meta-python/recipes-devtools/python/python3-jdcal/run-ptest b/meta-python/recipes-devtools/python/python3-jdcal/run-ptest
index 5cec71169..8d2017d39 100644
--- a/meta-python/recipes-devtools/python/python3-jdcal/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-jdcal/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
index 018a63a5f..afabe14a8 100644
--- a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


