Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBEDD33A40
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.27737.1730831904737797635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DN6/eAxR;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea339a41f1so50035887b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831904; x=1731436704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpfXUQOcDQexGuoRvCIRv3BjhI8frCSE+sJQ9TbQknk=;
        b=DN6/eAxRxDIdT9QfyWpkQeaXoYBsfeNy+2ksqsHNrUHhp5vUHR6p8MRtmMDuV4Sy96
         R8fZOQjoeN5oUc/KeA9u+HeiWRoGorHQgTOvBC2EU+6n9VYQJCcoJEDjV547GA9AZT9q
         T96ZA0G6uGCe+4FQWk544wJ4El4Sa65F+wzkSi0CAwS6lneYPqCbm6M4QEJgo9bSJFXI
         K85t5secXhTIzRePAeo3hVHS9Wf2fSxWEbyb8fmdBL7Jfgu3IGnq5+cH3J3ZwsZ1dKHH
         zyPaVdSu5argdaT8H2nj+G5UCE9yXtcixv7YT0330VmSxHvdL7OioaBQyks/BlhFFQW6
         gpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831904; x=1731436704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpfXUQOcDQexGuoRvCIRv3BjhI8frCSE+sJQ9TbQknk=;
        b=CATSmZ3p47vgqL7b6mHHv232o0bgKHudU/bhAczxtt8hTyMtc18kBqyzRiH5LjYfTi
         c0N3PZFt7fb+jy4sVLTQ9u8dPrFgn2agkOVzzx30sQjEDbwyXFh376d+EXnM/yXrZpkG
         SQzwBVKWqhVt3iqORncuRyy3Yy2PVbO+PCMkaYpySt5rd5Qk/locA2VddYVmvEYGy/bS
         MZ9vC7wdwkgXQQax2ZnElXV/iXnVwF0xPsPeVNVQGsNk5jHWDOeDCCZUZZ3DJ7Vl+lj7
         850asq1P5NNYr3HgWhkdCvV/4z2JBIxWLj0AU8YcaEDimYrtbITrNhpVBRieaeFJcJhl
         Kjqg==
X-Gm-Message-State: AOJu0Ywohtaa9zOM+8K2Y0ydCc+zxWIh/Gu3WSJbsgu/q2r2Y/dP8CON
	ibB9H9MalPBZ+QBR+zCXiGKzXecd/xtAAg+IItj6V7peTokRuO/wFvwWEvvz
X-Google-Smtp-Source: AGHT+IE2lidAKpIeE56xF11ZbiDFiNjEfbbGBbSZAJW+txw7B1QSLHg057hlU31PEznNeii04hltkw==
X-Received: by 2002:a05:690c:998d:b0:6e5:aaf7:68d0 with SMTP id 00721157ae682-6ea523c78a5mr209047477b3.18.1730831903435;
        Tue, 05 Nov 2024 10:38:23 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:23 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 033/161] memstat: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:09 -0500
Message-ID: <20241105183658.34982-35-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113548

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
index 7e0ff54dc..502843c0d 100644
--- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://sourceforge.net/projects/memstattool/files/memstat_${PV}.tar.g
            file://0001-Include-limits.h-for-PATH_MAX-definition.patch \
            "
 
-SRC_URI[md5sum] = "2c3acc0c62b2a18f6601b84e54aa7462"
 SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
 
 do_install:append(){
-- 
2.43.0


