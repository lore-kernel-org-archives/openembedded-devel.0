Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B8FC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:32 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.51959.1711373247584275652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcT4LWCq;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7c8bb3c2494so154129239f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373247; x=1711978047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mTUHtZfQnjzOps0qm6/uQ0Z0oqEmFpHMUy2OgeKTNm0=;
        b=jcT4LWCq6DpGpMwdYHl/zVbinYyyexhKkkkAEdszDdtt6w8gsYgJhLBwqFVvutb+Tr
         dK6ihiEr6Ak5GUUqU4/lFSZ6sHbQPB7IcBoJWJuUNSIgNIBKF+CWUTZOn4ueB3e65ZXG
         CqS6fG+grSlSA2lnV404L5T+bUpK3UT3ze/sBNusketUD4cSvdGg8Z5ci+CevcLxTTOV
         UWUquBMvyG/53fEUZ7ZQ38iNj3yUQ8bjCvrGBTHJXKObcNVtxXE7ljaFu+UwNcmcFbIG
         CdKm585C2lXteUPp0UrwQlg3HsiaxlrXCsHz/yWV7YuaMus/Yj/WAw/8aer2nE3ZuLtq
         euDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373247; x=1711978047;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTUHtZfQnjzOps0qm6/uQ0Z0oqEmFpHMUy2OgeKTNm0=;
        b=T6U6tkFE2rW6snp465kDywYRmLLoC/afwqJCB+td/eFHLYGsrpneGJDZUSOArxkPBy
         r/maank66FcQhqAKP2gbbae1rcX71Jp7vHCOvz5xOFLu9PDEyVE3jD5DsF7tHO7zvN2X
         iTE3QNe6g8EbCaVqOD6nV/DmYZZvrAGbbp2Sg1sLQ8reLZSFcX2aXR2Y4XpeKGS6f2Dh
         IHsABAsFg7fUC5RrRcmMJmjkZ9s6rFL0+CauQdtHBvjn7J2CMjEmx8AtMB3skz+OMBuC
         M1z4R3Lc5cSPu8O/zxE3O5Tpz63yEh1D07DarUykJkTzzM1jee2DxaXpcGIHPKeN39BO
         uaMA==
X-Gm-Message-State: AOJu0YwmDLScTRneHIJsWs8bHfQi0tKDhEpzoWGTuBuXgWB+cSksAiVU
	EvSdJLVvRn0K/TMk2yJVLIrWS4D7ZTQYApWdc7yYqRXDcE+mvbbH9q7ynImS
X-Google-Smtp-Source: AGHT+IHfq0hqUcqbxs79UJaEhFi/T5eywZZtUFcKFrtBSSabJq5KuqP2SMkoejhUN3vF/+QKsKRaFg==
X-Received: by 2002:a92:6912:0:b0:365:616a:72da with SMTP id e18-20020a926912000000b00365616a72damr4635750ilc.7.1711373246822;
        Mon, 25 Mar 2024 06:27:26 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:27:26 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 5/7] xml-commons: Update SRC_URI
Date: Mon, 25 Mar 2024 14:26:00 +0100
Message-ID: <20240325132603.2477-5-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240325132603.2477-1-jermain.horsman@nedap.com>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109583

From: Jermain Horsman <jermain.horsman@nedap.com>

Archive layout seems to have changed.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 42ce703..b5d13cd 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE.resolver.txt;md5=d229da563da18fe5d58cd95a6467d584"
 
-SRC_URI = "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar.gz"
+SRC_URI = "https://archive.apache.org/dist/xml/commons/binaries/xml-commons-resolver-${PV}.tar.gz"
 
 inherit java-library
 
-- 
2.43.0.windows.1


