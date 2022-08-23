Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2867FC49EC3
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:26:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.766.1661275586420330806
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KFY2zoxS;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id x19so13409354plc.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=HFw4goLqfeBEQjV3Dr5dJ1c3IAnjnGYo3gfHr04TtKY=;
        b=KFY2zoxSTSMIUHCPIpYxL/mWEFFY+hH44Lr4zQde5UXDtF1Ywm9aqmGe/g0fBBeo6O
         L9p+7YDSWKueHulG9tUMgQgYCOIhBscos0sl4kNnzuE//xC0TBEjAseh5QBGknXwwyGA
         IMJymu9WuNtB6Gp7wAP8MfjHx+Ew0XAJgAu0SxH/AlNBnMNBGPyHogM6ih4k9zHrspaj
         Trs7eJVJbwm6MFSSqLhtL057YvA1bEiMJlksOTbSFonYQ4aWcyduoRVlilhrtnspfwGt
         k6O6qKi7W8Kvj5anq/6WmtAoSun0QQnZh1C8xTRrJUpOsP/6ziq6aiJbRSmBCvOcgrpI
         8/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=HFw4goLqfeBEQjV3Dr5dJ1c3IAnjnGYo3gfHr04TtKY=;
        b=hPBSPNIDElQeMzZJqvGPyCJcUwXR3X2N17YToTTF6jJ8Hxo552kdkTtB1H4o6un1pW
         oWSOkUWh/4d3VBVlIkL0sT29hWcE7rjfAGTjmqzWZ5QLc6PcBXionML4dhtCt4kaWEi7
         BirNeU7/UnaRMkqfkqpbc7g5MERZwHQ/ZwgJ+BzNhan2MT1RaDHQbNM6QH6KmQvkRO5P
         qBJEM0EnwcmiSmi0As6XIP7C1lYRdPKrxVkaL2MhQv894HAnMtW1HEOMA5ciuhu2MJkx
         ll6LdOGrw/hRWFJQxbCq+39qwXychb1KpcId93SralnpZAsEudMIhU51u2fIaAWL+ZCJ
         P1Kw==
X-Gm-Message-State: ACgBeo3boRWIQaG9be0c/huOATn6qWt/fDw/Cs0pwyb24axHvr8owO3Q
	lRF+gxHw4Ani0dKW4KrUVcE9OvyYCdRdHA==
X-Google-Smtp-Source: 
 AA6agR5/lTx1R6lHIPkDfYSLDFqreIN2O2J5L0WcESD3usWvha/piKPTaMkgHAeoGuevJ6I6VTbnDg==
X-Received: by 2002:a17:902:ef50:b0:171:516d:d2ce with SMTP id
 e16-20020a170902ef5000b00171516dd2cemr10796049plx.171.1661275585729;
        Tue, 23 Aug 2022 10:26:25 -0700 (PDT)
Received: from localhost.localdomain ([157.45.6.126])
        by smtp.gmail.com with ESMTPSA id
 d22-20020a63fd16000000b0042ae03134a0sm2333694pgh.48.2022.08.23.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 10:26:24 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-django: make 3.2.x as default
 version
Date: Tue, 23 Aug 2022 17:26:01 +0000
Message-Id: <20220823172602.212-2-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220823172602.212-1-workjagadeesh@gmail.com>
References: <20220823172602.212-1-workjagadeesh@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 17:26:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98398

According to https://www.djangoproject.com/download/ python3-django
3.2.x has LTS support upto 2024, hence make it as default version
to build.
Also, add runtime dependency on python3-asgiref as the "django-admin"
script needs asgiref module.

More info: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14888

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 .../recipes-devtools/python/python3-django_3.2.12.bb        | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
index adbc498bd..17d402d65 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
@@ -5,9 +5,5 @@ SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad6
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
+    ${PYTHON_PN}-asgiref \
 "
-
-# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-# default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.2.2" can be added to local.conf
-DEFAULT_PREFERENCE = "-1"
-- 
2.17.1


