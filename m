Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91EFC43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.23297.1668873534374276137
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AArEuBp+;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id df6so3120303qvb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDPLGyEPwxdzrP14PB1aBSUb87hFJ4MU1bawYBYrxw8=;
        b=AArEuBp+tXS3pIffjSOmtFS9rqJjAuDnHPfbsuUutT7pZtI7A48eesLNDxLDVlp6c9
         XId4Eu8eo7C4e251v+cvyxN+4db87kTovdgGoFGdWMDqEu6gAOZFtbuOj2ssAibZCTh5
         hSmT7B7DEbbSWPHpVdIERbo5Cl9xMKhpVr4/C1hTCaSNvCAISb23IX6GEn8oG1KnCjgi
         +Sfj6/kGriphwjtJJs0qzZzaf+gL+2wP+CxEzHH9QTGu1sdEiAeXZKLuo4pFT8Oz7S30
         OGeXveiqJgTlKL3N2hdAb1A9uR5vEkcUMRm5MQpv/nUY51oXDSkiHE2DW0fFITd6FO+v
         w4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDPLGyEPwxdzrP14PB1aBSUb87hFJ4MU1bawYBYrxw8=;
        b=Vw2jS923OEhV/2ZDUs0C86h8kfoJEriTeTQIGMui5pvNTrsCNBtPhOvlgyXbmTnNv6
         SIY5drW+2n0ogpC+KbYYrkn4kI9RQW9617AHdAIKPsYTDtkJvK9NsNtLa/whr+HNrtNA
         t5ZGmFNUSHa7XGR53yfbqEX0XbTTlUMNPRJz+vl4Tw7EUa9mzFi9u8/J12MsZEL3xtMW
         xwkBljThmGo1eX9xoMxj14NJ4L78NEGPzywW/TF6D8RRKDjbcQ9bnTVRfkyQfqCTFPvC
         CzGho+LSCkW1erSkoln4jrC5oOBuGX2prOPi41GJL8D8djCfRjQuE4tR4J+kJ6+IoIac
         3YYA==
X-Gm-Message-State: ANoB5pkwr1A1nlK2qDIArNdUYk8xwclACLCtmS//bQQGWAWimwi51hOZ
	plY0qqN21SxZilZubNZO1ngG+F9VMHiAkw==
X-Google-Smtp-Source: AA0mqf6lC3DepTbBdzcNWtTjoWSAgsalejGPrAzO/zb5DjR3PQrUm8pg7tt0d5a+JdFhZ07wbgprJg==
X-Received: by 2002:a0c:e810:0:b0:4bc:10c8:96fc with SMTP id y16-20020a0ce810000000b004bc10c896fcmr11079401qvn.120.1668873533028;
        Sat, 19 Nov 2022 07:58:53 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 33/35] monkey: use git fetcher
Date: Sat, 19 Nov 2022 10:57:57 -0500
Message-Id: <16c5d44d421a10510e7d31f9368df5a9560ddd05.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99672

From: Martin Jansa <martin.jansa@gmail.com>

* monkey-project.com doesn't resolve anymore
* use v1.6.9 tag from github

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d04444509a220fcb61496d7e64f3ba09c647543b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 5b7e32733c..d3e22757c4 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
-SRC_URI = "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz \
+SRC_URI = "git://github.com/monkey/monkey;branch=1.6;protocol=https \
            file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[sha256sum] = "f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb"
+SRCREV = "7999b487fded645381d387ec0e057e92407b0d2c"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
-- 
2.25.1


