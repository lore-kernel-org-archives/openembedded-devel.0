Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2323C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 16:14:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.16753.1707581691484889495
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Feb 2024 08:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frGxPgD6;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51181d8f52fso623040e87.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707581689; x=1708186489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVKwcE1VXgzooF+hGZOMnC/l6eP8WwaoJzU8/RybCsE=;
        b=frGxPgD6Rav7lfIyqgYtgA7bVhqFFNMYNW0xMbM5z2jHP/ijNcXE49sgxskGrr5jNC
         OqqWbni5wMND4A6E2jSqmVlG+XFl0qLzIBTWwTvXG5aHCkmxlwv1UUAouG9wQ0S/hLAu
         QEXDD0KB3d+/7bQgD+hcDN5C5Fxqdt0ns7hILDZIq4mCPigp7HQ7fiWB+hRO9RySYGnh
         ntzlD8kFkU89/urRkXSYBdaNybslUG3OYJUYLCXUoMooC6cUrZkMZDd8iHM5P0By9xyq
         Nl3UJrnJZVfLlQX4Jt8NfS7EmNQ7VSIZOAWCnOj29ug3SXhTFvjVEYTN8aNaCXJP8tWx
         xung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707581689; x=1708186489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVKwcE1VXgzooF+hGZOMnC/l6eP8WwaoJzU8/RybCsE=;
        b=oi6RaeIxR32RNrDbIvUskL9I31LEtR+FuDKvc2sKyUiUxbbT0/S04lCPOV8n7+fZ3V
         Uk0BcpCqK3XU2CuUUROiTsD5Z66njvv3VnBmIopwd0Adf2BOf9tIy1kXHTMODZVR1NK9
         u7kIVRan5tCZp83v/CWih3bTIq+BPWgXeLojiTXGoWF4WnWTYNB74nG1ZmPPb9QdTd3Z
         OhkRIYFSf4oHt9alrrUBes1p/wgvmRiq24VOcGlYf+iTA/THycfsC1GFJgf63jZ64I72
         xo3o9XQLr+/d9i1zYSwlRwQfYPwQLdHbYsqX/kbHU1AnX5nr4OTIrAKnULK/+dHvYrYd
         H2gQ==
X-Gm-Message-State: AOJu0YxAjRhfeB6976SPiKTnkytHkvWqqml4isg2sA6xHY0jXbkK7RDS
	wyoPsfS3MfGgAcB9uP9Frvg6NMjxu57Cn6eWyoXwixRGwsUqSq+BJzaL2vJV
X-Google-Smtp-Source: AGHT+IGqpyXjOP+Z8gPEGeHcGtSDOtzuDW58bjjbOJlp1KmYY7/6l7135nrNsgp3DtdUG/QDZDyZCQ==
X-Received: by 2002:a19:654f:0:b0:511:5660:69d4 with SMTP id c15-20020a19654f000000b00511566069d4mr1172133lfj.36.1707581689033;
        Sat, 10 Feb 2024 08:14:49 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d016:9a35:28cd:913d])
        by smtp.gmail.com with ESMTPSA id by16-20020a056000099000b0033b75e5bc13sm650313wrb.1.2024.02.10.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 08:14:48 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2200.60.25.0.4 -> 2200.80.16
Date: Sat, 10 Feb 2024 16:14:44 +0000
Message-Id: <20240210161444.20858-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 16:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108700

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../mdns/{mdns_2200.60.25.0.4.bb => mdns_2200.80.16.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.60.25.0.4.bb => mdns_2200.80.16.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.80.16.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.80.16.bb
index 09af3d5ae36e..c516eba6ea85 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.80.16.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0001-Handle-interface-without-ifa_addr.patch \
            file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            "
-SRCREV = "8acabead9ae56551011172d6835822a89c5298d6"
+SRCREV = "5fdc65a52db5c31fdf4b872d912590235b36a4dc"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.39.0


