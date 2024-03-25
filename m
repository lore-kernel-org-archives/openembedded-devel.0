Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD1C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:21 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.51952.1711373229705783342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JBzb66sx;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c8bb44622eso112744139f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373229; x=1711978029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+M8qOCDQD/oIO/vhdcUrrSBplpchbrCehN3jWfjyzLA=;
        b=JBzb66sx2PiNKQu74KLfHHsrqG6s87zIrki+y7jMTIaZExZ+4yMaTxvnfNkUnUSiO7
         LvQDWiHGMKaFBc3blhWqcd9R0fImeHPliV49clDOB/jM+NpixyBVrIihdMV4tO1/dn8I
         fwtxh4H6p4DumJpsaAExtGBDnF7BE7VWuxPfjkWl4bQuZEsio+iU9o3xCAoRYF0rdKHg
         uXNAvKqUE9bCqYZHVjglrWw5oBkXBiXwO70HYmwsEwvMSecMdZzx6dsylf9xhNPWrmbG
         Zm09QzDtmXT/NxOKADkKeKVrEF2hVIKnBdWQ3S+wdJDdwZ26grq5i87SFtv0y+YxaAEP
         FEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373229; x=1711978029;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+M8qOCDQD/oIO/vhdcUrrSBplpchbrCehN3jWfjyzLA=;
        b=vIwnU63e9HmKs1M83YltXwzoE1bpVMv+My29nvAL6Im/MOObNAhOBw2kMwTRxA+qM4
         kdICqXlSTrVG+9x15ZpG+/dN5G74IFv264P35aMPGtHr9flN21DHySC1+3RRbvzX4QLQ
         Z77LYmqEhhysO1otayEfzDDHE7FMeMYDDvVf5UIIkDxVtdzxiBiGdqp3GXWgoxbC08Eh
         0ALy7x/i9qdGyw7k5Bq0xLucinMXF5AR1JfUEU4cgqrkEsPoRWp1Httqbpyk5iLqjqId
         x0KNTGzQsn3s2ltzHjcKbOU6u0/e9Cnpe9dYYchmUYU8gnNgONXxQQobkdATPA8Two1P
         TjNw==
X-Gm-Message-State: AOJu0YzMfrjQBsXH9f8DOxRHaVGtQyChWzMJt1PTXZJlbn7wJFC3tzRZ
	hsQD0FxIgYeHIJ/pZNNmFolk7r/utG+BIY2jBmIiOUbCho5KAIGr1KTiFrGn
X-Google-Smtp-Source: AGHT+IHQZxOGa8+ATO9LHHYDA5d2KobEHQMHDOmIJxSdsrR6pStrrQc5V3EGqyKG86ShkqZ7Dd79eQ==
X-Received: by 2002:a05:6e02:3310:b0:368:99c4:e4de with SMTP id bm16-20020a056e02331000b0036899c4e4demr756164ilb.1.1711373228877;
        Mon, 25 Mar 2024 06:27:08 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:27:08 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 3/7] junit: Update SRC_URI to use https
Date: Mon, 25 Mar 2024 14:25:58 +0100
Message-ID: <20240325132603.2477-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240325132603.2477-1-jermain.horsman@nedap.com>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109581

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/junit/junit_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index 57dd459..a1fd265 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -5,7 +5,7 @@ LICENSE = "CPL-1.0"
 LIC_FILES_CHKSUM = "file://cpl-v10.html;md5=67a4b75d42edcbd82d2878eba913691b"
 PR = "r1"
 
-SRC_URI = "http://downloads.sourceforge.net/junit/junit${PV}.zip"
+SRC_URI = "https://downloads.sourceforge.net/junit/junit${PV}.zip"
 
 S = "${WORKDIR}/junit${PV}"
 
-- 
2.43.0.windows.1


