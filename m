Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7512DC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:10:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6226.1708402246611317044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WXfj6Al9;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d73066880eso48262595ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708402246; x=1709007046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9U7MFXYS7/xwG7XPJuF72ZhXEH9fpVraVt0NFwIm9vU=;
        b=WXfj6Al9Jk+5CDDdSsdvuZOv21SEuM2hA1u42/4GinHD3Ex15mpK9K98OFQO7ctKsf
         bY+aBlTfJkHZQMwFXzRTTNSNA0XlpFOZLLhbgsDkBqnSronBV3MxtRRLBvKC7Fz6puMj
         V+bhJUHqa2K5RXmSoDPOnzKdRgeLiV1UT9qzh9M3mJpqLTdj+/IrLc1e1EHk7RR1fooC
         Dtxul/Q8Qv6aDLYlARrcV+7tQSBtMrY9u7ftK2RVeiK21MojTIpEJLSqXrecfr1GutMW
         KbeZMwn9ADw697t/nsUXWHhQ/CeaJee3WTSOdZ9X+7HNISad5RtrZa9fNV7Y14657S84
         RALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708402246; x=1709007046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U7MFXYS7/xwG7XPJuF72ZhXEH9fpVraVt0NFwIm9vU=;
        b=K6RDMutz8f1VVdsP/Y/JbikWPSA8MaaPB/0l7uZpsOERjEznTInzMRj47VJxg5ODPL
         jd0hWC7nl+zWnpa9sPqES2Pj/krEdmtmzhc29InwUpi2pPvLt2+gH9twUYaMJZs8mORA
         0obE6UjtGCYBsUeQ8ISUgysmc86t6I+Ze68rh7MGCzwp+2xA8XTfFdklFqNbV5PVBIAM
         /i6zueGX56X5qsni4VBHvdjbdPRN4Fq9wDvIp89Hm0KmrsemMkft7sJFYhsQwhO+wkeG
         rsIsQaqWkLSSXLQ5+1GKbXFjqXbXZ5w4IzflkXXn3vVHjYda7NUgKCs3b1sNOV6X8iHZ
         LnmA==
X-Gm-Message-State: AOJu0Yzx2IFNCAkJRpDoQcLxQh26/w1/GrSEs3QJhsM5Nd+ueP1HTL6u
	cDJR1UgkQ/sEb+qBx+pMyfXmRTRD3jXbcROddq1OSD+SjhnwbbZ7nNp1pHRk
X-Google-Smtp-Source: AGHT+IE1FM/dUD/Spel82o7J7nizupwOucWqMNRCFXCPgts6V7jSk5GWNKZf7iFPEZFnv5FqDILTCw==
X-Received: by 2002:a17:902:c402:b0:1db:28bd:2949 with SMTP id k2-20020a170902c40200b001db28bd2949mr20729066plk.0.1708402245748;
        Mon, 19 Feb 2024 20:10:45 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001db45ab819asm5229733plc.106.2024.02.19.20.10.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:10:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v2 5/5] meta-gnome: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 20:10:28 -0800
Message-Id: <bd9086015b1485d8b16d91954f9140901fd9a0fb.1708401702.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708401702.git.tim.orling@konsulko.com>
References: <cover.1708401702.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108906

python 2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebase on top of master-next

 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
index 7d7d508c11..9512f0b584 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
@@ -50,7 +50,7 @@ EXTRA_OEMESON = " \
 do_install:append() {
     # fix shebangs
     for tool in `find ${D}${bindir} -name '*-tool'`; do
-        sed -i 's:#!${PYTHON}:#!${bindir}/${PYTHON_PN}:' $tool
+        sed -i 's:#!${PYTHON}:#!${bindir}/python3:' $tool
     done
 }
 
-- 
2.34.1


