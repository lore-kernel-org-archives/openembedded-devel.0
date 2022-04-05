Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDACC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 20:23:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.124.1649188686897245479
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J29yCjF8;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id b13so506575pfv.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=bj8LOtu3cWZ4DuClkqN5MW40p+FbCTg7X0i7hI4a5VA=;
        b=J29yCjF8gm7iaP+vtRYoT+kdOJyXohG6jS5Q+CU9gBgAZlF0/NxzyAsOtjBHd1fv/R
         VBel1fzT7c01yU6ax8TkYme5/MGh9dG+PfPUfbkP2j96udJS0UQH5RjrKPNcvS7RCp3r
         KpWKbmxdQbEqn5hXQ2O4js/qEsHbNn9c4krEZkR9RybhckscWpQdCMfJ5f4MU3DKg3Rv
         ts+On9mv4yiynDoQer3z5a+dV/i03f33vl7uvkCA+Anz7LADBxn4No/16VBV2MAFRUW+
         H6OOdE0lCqqUS2NNFc+ulg//WwfRPuDCOfyFYwUk4JtEVHwXsO5nR5Zu+zTExd5HvrM4
         il6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bj8LOtu3cWZ4DuClkqN5MW40p+FbCTg7X0i7hI4a5VA=;
        b=AJabIXPbv5jttp7zvoqhhJLN168yuWFGJyKbquQXL9Mh67pRFKJOhlVrVesRdFkQtu
         sle47hfbN6/TgSW+qUcUwO2IDqaJkBpdFaaHo3EoyCnWy7wcbYI1P8QjUFDx+z4BP0Ph
         M+36MizPlY+XO7ZU0wsvfmYLnRiBHCi9/tmvauxeXxqS3clMtUFdjQbtmq+Uce7Kz6ju
         JGta8spqdjV/BNUqha3JGP33yJ9WooWY8DklnPvl6ZNKRyqMLHKi4jxu+Qzh1HV0EcWX
         GcOcbi4eKlRuFb0JYTV0ttmpcFcsV/SPdMmAIOWnYrS7HFiSDdbUwuRhHmzqaJYAWHI6
         VC9Q==
X-Gm-Message-State: AOAM530Nu+PEKxgBS8vksQ1YX/uqwSFcmaTNgDZM4mNak42OTVPEZs3l
	qC8vgx/TxzxfuqXvYc1sse02J3d4ZwCv0Q==
X-Google-Smtp-Source: 
 ABdhPJz6wycXQ/kH2JYizAxQ12g3yqOJVOTyr6oR3MAwAgX4K+vg2uwhrk+Y5b3IS4o29i13Wu+n0w==
X-Received: by 2002:a63:2c4c:0:b0:398:997d:b5b8 with SMTP id
 s73-20020a632c4c000000b00398997db5b8mr4303504pgs.86.1649188685922;
        Tue, 05 Apr 2022 12:58:05 -0700 (PDT)
Received: from localhost.localdomain ([121.168.114.144])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0024c500b004fae56b2921sm16879367pfv.167.2022.04.05.12.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 12:58:05 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [meta-oe][hardknott][PATCH] multipath-tools: update SRC_URI
Date: Tue,  5 Apr 2022 19:57:47 +0000
Message-Id: <20220405195747.712-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 20:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96433

The git repo for multipath-tools was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index fe29fa855..a43d7a1d4 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPLv2"
 
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.17.1


