Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB79C433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 19:00:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.8369.1639854012144625373
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ygoi5x1G;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id v19so4709890plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=il8VWTvloA8FZUiyXDNdkvkmGPZYIEGNbF+kPczLHZM=;
        b=Ygoi5x1GTa4VkkR/v7+EXSTkPrfoDxwl3Wgi9QrXjBkn2aty5lhtqEl/JfHFYSIblR
         vbk9xeWMqT/ii6dgTBGK4mGepWAL+jrO4BMiUZWwi8Xs7wBKTeiQm52c0G3Jg/4VppFU
         LGmMTX8/RIG50725JEzuJTbWMlcsDAsRAuSx1mRXr4RTOYjVPhBVvgZG60HSKT6mMxTH
         cp7eY2SLcZDw7cIJYMfCDNYvbgisU8v/eNPsOyP1XnYma3iwzb+zbSZpSGz8JV02UQo2
         s+0lQAlOsBT6K4V7a68GXu8koQvHREkMTK6TY9fMaH6CoUW/iwTFu6sqquKsUe8ghkaL
         nybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=il8VWTvloA8FZUiyXDNdkvkmGPZYIEGNbF+kPczLHZM=;
        b=lxyGtz2T6pW2Vxr+580AZaHQb3lSVYCB7vIHdn14sd00XEv3W3mOdWxElXgxyLYVd5
         244xp2qhaC2MLtWQHzDenJwHv/5Akoq4+2goM/+8ocXIpmsuXn1CWbFq53jm3D5hSbQ3
         idTslcC/+LzG1N4eLzOnZOHURd78ecvcfwhfP+/5QMrJaEgG5hUVZ48xjfDYibSTc0kz
         /oGl3aoZcpSzBHv1U2qDwk3qD03GfvIcX4ZO72ch6ObMBPVTzhg4uForD/HNavieWCwh
         3Hc8ueEuq3apVQbFGYdRo3hJiU4+2VCpEsRSzOS4GKWnPIbtN6cbav4IKhWPtv/OILYB
         vx7Q==
X-Gm-Message-State: AOAM533e1MbCe3c2LoIjV6g5rRhgjR+xSZf1C5QCsOW2ab35w4ZdX8qD
	HP8Q90FPeMCTi0BQ0sGW4znm3E7a2VY=
X-Google-Smtp-Source: 
 ABdhPJyuR6FBSEFh26DpsiWdxEo8n4ZXTf5yLPRZyZ7n9C+Rx64AJoP4lpm7fUzWTBva4Xu/7RXlhQ==
X-Received: by 2002:a17:902:a60e:b0:148:ad72:f8e8 with SMTP id
 u14-20020a170902a60e00b00148ad72f8e8mr9487567plq.143.1639854011533;
        Sat, 18 Dec 2021 11:00:11 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8259:344d:2281:ae46])
        by smtp.gmail.com with ESMTPSA id
 j6sm10371127pjv.35.2021.12.18.11.00.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 11:00:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 7/9] syslog-ng: adjust control socket location
Date: Sat, 18 Dec 2021 11:00:00 -0800
Message-Id: 
 <bc906a49dcc070c219587e6cf98caf2ea2219043.1639853918.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639853918.git.akuster808@gmail.com>
References: <cover.1639853918.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 19:00:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94435

From: Changqing Li <changqing.li@windriver.com>

Commit [1] changed the pidfile dir to /var/run/syslog-ng. This also changed
the location where the control socket is searched for, causing the following
error with systemd:

root@qemux86-64:~# syslog-ng-ctl config
Error connecting control socket, socket='/var/run/syslog-ng/syslog-ng.ctl',
error='No such file or directory'

Update the systemd service file to point to the new location.

[1] 00d1d63e4f7f ("syslog-ng: provide correct PID directory location to
                   restart/stop syslog-ng daemon")

(master rev: b57d824fdf822a4c3fdb153b92063f88705e3a6b)

Signed-off-by: lmorales <luisalejandro.moralespena@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/syslog-ng.service-the-syslog-ng-service.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index 0e1d09492b..7334800304 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -38,7 +38,7 @@ index 0ccc2b9..7f08c0e 100644
 -CONTROL_FILE=/var/run/syslog-ng.ctl
 -PID_FILE=/var/run/syslog-ng.pid
 +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
-+CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
++CONTROL_FILE=@LOCALSTATEDIR@/run/syslog-ng/syslog-ng.ctl
 +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
  OTHER_OPTIONS="--enable-core"
 -- 
-- 
2.25.1


