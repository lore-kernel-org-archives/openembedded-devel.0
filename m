Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75ADE909CC
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14900.1771342911858006759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=hi5M9Kt6;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.210.171, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824b621ef8aso560319b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342911; x=1771947711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMPynyhERK3jWp60OIfByzRiQbjyxlMKiLYmsI5ciaA=;
        b=hi5M9Kt6IKaxQNOSkyLB8/A3J5FN5VEUX1ag0tGPNC5fyoUoPdBLi1CeBwrLbFsKMp
         jyeSBZg3GpLdpfQVCeR0MAwZ8wdFGH2O23yQOmWvIEgLAp4ABlB4osbAza99W6v3a2DO
         dX6Bdr065quMRZQJtqDG41WAiypouJ23omt2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342911; x=1771947711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oMPynyhERK3jWp60OIfByzRiQbjyxlMKiLYmsI5ciaA=;
        b=VBUQXGZjL10lkKPckrl7rG2uPVOV8IxfwOPMDp3XhozC5oIM1nawgcU33DCs3v1usS
         jcoeBDbuzW9IgPl/qIHml5siWmvWUNQ27De7ouTlA47rJ0vavOlKFbpY4om4R/ziapoZ
         hwKH+HZTuzD8Pv0UHveIA2iENRBFx4q/ZC46XnoDr/IaAuJ8zqzZzSR4cXJDhpBamSgg
         ZYSIehYeZtGo1Nu5cJQYsfzB+28TE29RLYc750pwR1A8lr+tuV2bLvoGGXi+EtFo/IbQ
         pu7Wgg5OKhpvVdAGD3Glr9XXbViWP7STNlWCsezpKS13PWSmVis6vFPCJaXCC+Iiv9LP
         J7gg==
X-Gm-Message-State: AOJu0YzaOBRnERC+TG5vMkFdXIifhE0jS3JeFQOpl/xMeaPM/X7pvwjF
	cYGK0ZHs3BkmZMaZ9cP5OfYaJMVbcrTzBTY3S+uPr3G2aBnynZY+eHPW4fePsZd0KkdSJLvieCZ
	j5twJ
X-Gm-Gg: AZuq6aIAaQVso09Q6rvTqP2O3/6me5rr81b6Bkzvm7rmoFxH1KYRJ8JsFCH8nPD9GwM
	kx9v2subOIu2H9khCmDO2XDwI5Q8p5K/8cZcTUQMfpkKvVyws0MHC0sM3//AL+NsrqVd7RsXtBL
	c4ZvHAxlXiU1wg2KslWDGPS6HT9adHjgTXB1Xnc7t/PIYlXn8SCUKyR+ca9qbtHbWEMD6WWVw4J
	yffMRNvO8NxQhwOSq1A2Ce7BpqyRLY2Cri/wwg5tMELYtlEDLtRaQa2iYBr7OMeu22Om6n1fN/t
	kR5ltItp0cOw6sYQzYMZfN3KAUwvvvgzOBu6PCOx3X8R5gIkR1v6K9iR4Ju9b6Jc5N3Um08Q4Sy
	5wOb75KVrQROTgCd6a0TqlAvqX34WIbiAk9iGwpCdRExNhevD70R+pmMAcVy4FJ1zn9jDTnppBs
	cd8UL3Il9GbEuwd93m/A+p9o1dZtN6mqM3sqftBnx1
X-Received: by 2002:a05:6a20:7f89:b0:394:5721:5910 with SMTP id adf61e73a8af0-3946728a8cemr9593061637.4.1771342911285;
        Tue, 17 Feb 2026 07:41:51 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:50 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 3/8] libtoml11: use gitsm for SRC_URI
Date: Tue, 17 Feb 2026 16:41:39 +0100
Message-ID: <20260217154144.713423-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124463

Using gitsm also allows for the revmoval of SRCREV_json and SRCREV_doctest.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 38786b79ed..d07e49c4fe 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -12,17 +12,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
 PE = "1"
 
 SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
-SRCREV_json = "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
-SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
 
-SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
-           git://github.com/nlohmann/json;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/json;name=json;branch=develop;protocol=https \
-           git://github.com/doctest/doctest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
+SRC_URI = "gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main \
            file://0001-Remove-whitespace-in-operator.patch \
            file://run-ptest \
 "
-SRCREV_FORMAT = "json_doctest"
-
 
 inherit cmake ptest
 
-- 
2.53.0


