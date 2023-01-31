Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2C2C64EC4
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.2807.1675129927427982313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L3l2FwvB;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so12938680pjb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxuN+8dk6aSz4//XnQ5A4xa8kDIpuFWG8xYVzudNB30=;
        b=L3l2FwvBNmI/idlyvBHcfSVExUkvFUFBvcgsW0NvojBmIvkxmCJ1fLophenj44Zen+
         i/nPVinu9BbY1BLhgFPfLSljIo/Wu0KBgk8uY7nHrAwN04SBeQx7bxnbz6GYwXUEkhba
         clv2qlgEitWAAn7Wzu4TvFLQR82qQoCmtG9IwVrzqw9eUGHZzIXVY20uJSUCvyDNz642
         kEDkoBgGUxsjfczKx+2ShCisigYa7mYwdXQ1E93adQsypeZnvY4AgakrSvFoPACK4/F0
         ChRX2TPAI0sbR1tOCmgMGSrcBgr649Q3fPW9Rz7DsgxP+x0x9TfYaMMii10ckAGGfMpS
         lUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxuN+8dk6aSz4//XnQ5A4xa8kDIpuFWG8xYVzudNB30=;
        b=Hc+SUSBs9T5zPvcuySfvnyEWm8RbVzKry9GEpVYT9VXaU7+kCdbA80pl430XtzWV9v
         zoljLoB6/hn1hKpQyEF6R4/cF1/uSBbNWBM8N2MPb8xR1gxnriHbbUcp0HrpAX6D7jFo
         BRr5Rf8ERuoIdx8E5Q08hx6tFY2Up9A+ODBKxeu1pPiH3eDaPvDF386vbkK4jV2pBl+s
         yVWf4OvyO2lf5N90EN7bTK0cnJVlYEizdwdxQU3y2A0knTQwFILiB5xc1SMEWHDOm7wJ
         TCeGAUiYF9/MYjYFkVHZYZrSPEebx8FRA8d8wUjU/RspXEcrtZ9PLUUrxkf2a92C0GDi
         sJTg==
X-Gm-Message-State: AO0yUKVgT82o2+hqz4bl0iR/x7UNM836/1M4FH6BCzdbwYu82KTe/3T6
	ycnz365d6W5PE9JXdW0GvLKhL10G87vWjQ==
X-Google-Smtp-Source: AK7set8PffTIWBeoY5B0wJ0JRl97usrEhQPesCZk3J6rP/oRW6lP7SVpHGK/Dh59Mf9K0m2KFSreRw==
X-Received: by 2002:a17:90a:1a05:b0:22c:7e4d:cb01 with SMTP id 5-20020a17090a1a0500b0022c7e4dcb01mr9134357pjk.41.1675129926570;
        Mon, 30 Jan 2023 17:52:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/8] ntopng: Add hiredis to depends
Date: Mon, 30 Jan 2023 17:51:57 -0800
Message-Id: <20230131015200.3862532-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100866

Fails to link otherwise
ld: cannot find -lhiredis: No such file or directory
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index dca929b574..110ca36866 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -6,7 +6,7 @@ usability, and features."
 
 SECTION = "console/network"
 
-DEPENDS = "curl libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zeromq"
+DEPENDS = "curl hiredis libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zeromq"
 RDEPENDS:${PN} = "bash redis"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-- 
2.39.1


