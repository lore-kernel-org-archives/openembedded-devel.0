Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06167C4321E
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.39286.1649093570681188581
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 10:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mwU29TVJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l26so5146794ejx.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BQylBInQqMdJJvUEexjK1LtnPVBdSdtVQLjmRSVTpA=;
        b=mwU29TVJTWNstvmGUo6vkOW5+ZqGSFSemYXW6DonTInnT179XqFHNWTS0jj+ryF8BR
         roWHwX8EmayJ7iMH/59iYJoDLwZpuK12BIWL76f0qw0LU8N9s/aA7evReK0wTGIkWVGd
         D/2jhZNlj7eJb+DB5zW1SEVtJXqw9OCdpSm7tLJar9s45NKW0V3h3ZU/wOyycQyLO1Nx
         KjjMwFyS/TNL5qTT4aqZxVdqrgB0MsorIto55/p6dJm9LzOm6Jjbu/oYaRuTHlXtCLwS
         mCqL4478BqhpSlkwf/u8fIu+QIUIUBpG1ONAFgoo3M8ilQB3gvv93+2YdbIx4pYPkpPv
         owAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BQylBInQqMdJJvUEexjK1LtnPVBdSdtVQLjmRSVTpA=;
        b=gtH6J/DeMLkDzR3esGoLmXx2L+5fZzqJKspU2NPMRmZeX5bbdXaFifCoH7SOvt4Qz2
         stcBHYmqdNN0oP21fBvR0OTSVhF9CNIGNAe8BGxIftGwwhWyf93A4gGED15y4Zoathih
         x1UOt1RRGCK8zPV1JScCtqm6opwkuRDj88ZwwH1PTXbMUY5SALkwZc8dVtHr8lEIMZ84
         RaY1zc+h6QA8oJhks8xERvejQVHGaAGZPwTF08/oJglsIUartSqqGCFDQUW3PVpvAl5D
         FoJsa4H4aZSEiAI84K1bqavdPZAOanHtuAzs8q4hJ7YxbHkLazp1Ja4d0duVMAJdkK3F
         v1Ug==
X-Gm-Message-State: AOAM533g57hq9V+flw35ovsXGxrwXEdtFKev7CyMIag/jXTUZsg3W3eO
	UXpaWQUbUPlw3548LMJ8rWcOOWonQJTtIw==
X-Google-Smtp-Source: 
 ABdhPJzZL21Jyi1zX9JS2ZWD1Om5k0K/wlrYlfbxOZdMb+0ro9BzAc3LaUC+Ez97P3opgc6w1LUn6A==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id
 nd4-20020a170907628400b006e0f895015amr1134013ejc.713.1649093569146;
        Mon, 04 Apr 2022 10:32:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 gg7-20020a170906e28700b006e73ac96f99sm2651861ejb.224.2022.04.04.10.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:32:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][honister][PATCH] htop: switch branch from master to main
Date: Mon,  4 Apr 2022 19:32:09 +0200
Message-Id: <20220404173209.2481128-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96384

* the branch was renamed in upstream
* it's already resolved in meta-oe/kirkstone since this commit:
  commit cef2d1429bedbc256c5fac7a1a336842865dc2d3
  Author: Robert Joslyn <robert.joslyn@redrectangle.org>
  Date:   Sat Jan 15 06:19:04 2022 -0800
  Subject: htop: Update to 3.1.2

    Upstream renamed the branch to "main", update SRC_URI.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/htop/htop_3.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/htop/htop_3.0.5.bb b/meta-oe/recipes-support/htop/htop_3.0.5.bb
index 2772aa577d..7be9a1186c 100644
--- a/meta-oe/recipes-support/htop/htop_3.0.5.bb
+++ b/meta-oe/recipes-support/htop/htop_3.0.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4099d367cd5e59b6d4fc1ee33accb891"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "git://github.com/htop-dev/htop.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
            "
 SRCREV = "ce6d60e7def146c13d0b8bca4642e7401a0a8995"
-- 
2.35.1


