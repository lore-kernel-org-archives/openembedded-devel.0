Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3080C4828E
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:26:19 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.12781.1700054775267693013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5OZAZXE;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5afabb23900so79338187b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700054774; x=1700659574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyoPSRrw/awWLOMMdDw9BWPVrUNSQXa/PlBfj5CYCag=;
        b=e5OZAZXEfjkicbxF7TKg4Nh8QMAH0CR4l//3S2TMSluXxcM3rt1BZw94lSRbYBLHoR
         ydHHlRSQKRrrbSSloKteQ1q8rP/5QP7GIIiQLoV1/YuXhUFJOT+CoW+tQhldkGLNq2BC
         y3OjmbO17HFdhjZHX0UH8/tjlSApvw3OtCcOpSh5hCPLdmhJ71PrSayoYyBYMV8JPjJG
         y/Iw8xBsdfOUWRrOBB2G/fVTVSO0GCtJlRtmWbJVzYdZwhqFqf75R7I5MJBWncWc1EnP
         B3wUyMUl8ab57eGTXCsA7daBLmRUn7kUBy38w3zqTvGL8CogaUnp2YXI8yGqZUWTKplD
         WjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054774; x=1700659574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyoPSRrw/awWLOMMdDw9BWPVrUNSQXa/PlBfj5CYCag=;
        b=is5FQZ0Rv11ReREK1X5/JqlTTrSWhRhpkVthEKK2e50mtGBE/qoNz/6r+wzTseal9X
         O5CCW5fGvg8Ys7biAwLPvZVHMC5gYJ0mbHYfKAKVLGj0nUzlxxdFX7a1TjwGPDfUo6Ak
         Y8+WmudytQEHCIwm6SznjdGDi1TnWryujfKiwDNW4z8EWqnyBcn/Y4IWPcYc4JjtVg9G
         qVBy32Rnj+Sk9Iq3CBXDqH2WxkpstJWA5ALhcSyUdlNR0YaMfFq7+Se84EhGUhnSwQ1N
         XYKvPohrC7Vc2Qb8eTWkCQrIQ2fAp1+NfRC7nICswDNCP37s7uiEqEUWwt7z4f7C1cJQ
         RSjw==
X-Gm-Message-State: AOJu0Yxc2BtXprKMhTFFgT3UsaPzUKnG2nHipswtrT8tfImdtnJgLylh
	Fkm/sGONyQJipo1jyNgtEoqmqZWq4yk=
X-Google-Smtp-Source: AGHT+IEw8nofI0v3RZOo5HqfJaFccgHb4zavjMHMZggoi7txlkmijbGSc5IWLgRslhxq3hZQdYZlOw==
X-Received: by 2002:a81:8081:0:b0:5a8:960d:9aef with SMTP id q123-20020a818081000000b005a8960d9aefmr14048739ywf.49.1700054774223;
        Wed, 15 Nov 2023 05:26:14 -0800 (PST)
Received: from keaua.. ([12.110.163.194])
        by smtp.gmail.com with ESMTPSA id r68-20020a818147000000b0059a34cfa2a5sm365846ywf.67.2023.11.15.05.26.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:26:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] README: drop netkit maintainer
Date: Wed, 15 Nov 2023 08:26:11 -0500
Message-Id: <20231115132611.16589-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115132611.16589-1-akuster808@gmail.com>
References: <20231115132611.16589-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 13:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106758

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/README.md | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/README.md b/meta-networking/README.md
index 34e11a96dd..ab2640618f 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -33,7 +33,6 @@ branch: master
 Maintenance
 -----------
 Layer maintainers: Khem Raj <raj.khem@gmail.com>
-                   Armin Kuster <akuster808@gmail.com> (recipes-netkit)
 
 
 Please see the MAINTAINERS file for information on contacting the
-- 
2.34.1


