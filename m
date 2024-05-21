Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644A6C27C41
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.3047.1716315032420322273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQW1p6rC;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1edc696df2bso3912935ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315032; x=1716919832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+6Mnbpkgor/lvdC0R0niCX9F0F6CloUEIOHIeYChI4=;
        b=MQW1p6rCMminkG72olEQfd6B1x8zhnvTABekHBNP+SYBA0jsMfEfjyHlMs41F0oKei
         z74YTgSA5tMbCpFUOOmBKUk6paXWFeWyRbFBd+apyYCRFlclOnEq24Hv3/6QWLqUNrAA
         ITBa1U4SwF0iBpDmnyRbsnLR2AA6Ps+WxhM7rNgj/q0M8wKk6UcQ1ldO87K3bFnbL1dG
         c7vb6q8kWYWUmeqGxYf7PAvaDJyAry5VUY5b0F0rsX7Q7tUZ6fcGnbD73ZirNCXc+zLY
         5yGnf+/NwlkieQm7L6x6Z3bTR+gn78/Jw91Uui1M28LEm2cbeOzxzDnFClPKoWE8n2El
         whYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315032; x=1716919832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+6Mnbpkgor/lvdC0R0niCX9F0F6CloUEIOHIeYChI4=;
        b=ARcg9xaW9XNUwvbTX+UzqxANh7YggxJhz5K1uIOzO6KSXVYN6E+L/IqRgCOqpxkgdg
         X6BVBTds2c0EGsfVdb9MGIMWjE0tSIPqwaU4XVIidJo4z5nctXU84wrDOxysz1HkT+JQ
         OGGk9WNNBxSj+j70KJRWH3gCzukdfMaZ+4AaQ/fQZwJXRMSc9Mll38dgyepfjxN7H6BX
         r6QLELZZqKld5i4hGn8ZIU9LNA0uYa9XkeLff4V6f8VFSv45yl/3UTqjD9HEsQjvSUQQ
         BErhcmpsJ3umsJGfjsJvgJYiW1k86Jqq5EwimWc8Jo4K3GZZN109cVvQOjytcGT3Yo/x
         Uu+A==
X-Gm-Message-State: AOJu0Yzfkr3Hm2TOZhFK73VkbVTD0EVL4hElZaGNZFcO8hQ940PxzQ4p
	zKct4p/wlFXUCqdOXPo0yYC4imQB05SGuOuvm1uqTTDmPkyMhM/IqnVhj+uTsMk=
X-Google-Smtp-Source: AGHT+IHcrrWHojKMhcvnA9iQ6FsReIEE3qOcecQCyDo9vb0k67zFwzv+NOPfRGhq4cMk4DBkxJKr4g==
X-Received: by 2002:a17:902:aa47:b0:1e3:f27c:457d with SMTP id d9443c01a7336-1ef44059ba2mr313531725ad.65.1716315031540;
        Tue, 21 May 2024 11:10:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 05/22] crucible: Adjust for UNPACKDIR/WORKDIR rework
Date: Tue, 21 May 2024 11:10:06 -0700
Message-ID: <20240521181024.426176-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110454

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/crucible/crucible_2023.11.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
index d53e1a276b..4247263b5a 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=201414b6610203caed355323b1ab3116"
 
 GO_IMPORT = "github.com/usbarmory/crucible"
-SRC_URI = "git://${GO_IMPORT}.git;protocol=https;branch=master"
+SRC_URI = "git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 GO_INSTALL = "\
     ${GO_IMPORT}/cmd/crucible \
-- 
2.45.1


