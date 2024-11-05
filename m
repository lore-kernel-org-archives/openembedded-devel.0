Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFA5D40D13
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.30861.1730840210955868713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hlfJmqcH;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea7c26e195so42051957b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840210; x=1731445010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSbA/bKRUvD6lI3PITYl0ghn4T3QLYaCYDjBkK4WKqQ=;
        b=hlfJmqcHN7KrqhIoRTZnuDENoNFVeRd6tu1wHVfPSPSpRvtMrz5fJY2Be/MMXbNWRa
         IYOYtTkn4N73RKtu90KYE4B9AQ1Asm+AwIflIGG4xOAhTszN6oZ6aCPllCwncp8zZQvB
         d2pnUBe1s5uR880T61ShKz0U29LjcDiwi3HNB2ncNHwlSCbjCXIwzckXKHocE1bvwq7D
         YBnGKregQZNUOUt+9SmrkA9rLB+zuFjUMi9DUYzg708vJaEO3+9GEYSpeEwiuGct5Y0A
         0pqpt/pifKW5ue5CWOUQ9umMOiUV+ZGuWRR9dscuip8gKlAhLhCfrUis7A7NR2c1iKzN
         Xtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840210; x=1731445010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSbA/bKRUvD6lI3PITYl0ghn4T3QLYaCYDjBkK4WKqQ=;
        b=OF6Chh7arfnw8P+DfGKbkdL1ef2TP0nQNO1ggHSRYXRODh7q73xlo1fo5kSe81mPiZ
         uG3SK0lSGbM3oaAFz85CKT562tPnDoHHoGCBTZBUII2R2KM/bJJdLqSqtKM0QPW9oLYj
         nTcVO7BomeG7TynUJwkAtbqlDyVgyKpKNzwjgJGFFhY0EmPMNUEcIkIv08yI/YjK3Ki5
         97AyOcMlPESqnLXsVpmC/NJ6sDrxS9Tt4EjjKcSQi33IxhAmLE19E8w1Qh8TiToD02wB
         mtNMSj8+JRTG7A3k08Q4CmCanYucpX3szJJ9hCUtpB6fqB6ZzR8yGMPMf6cpFEaZ7Nje
         go/g==
X-Gm-Message-State: AOJu0Ywkyi/Dn3TTtBCA8oDiakOM9Gyk0yA2mVlcNy5mkidVIXuw9XDw
	BzIVfdD2WmxOkI2oBnB/a4Fyy4X3rQjG7F9cx/BBICOczWM+D6QwnU70/93q
X-Google-Smtp-Source: AGHT+IFRNDulX9zX32PSpwk/+vLWYnSc4qEzLOLBIQvJoWuCeGkVeY9IxShAHhY87JhzrWR7Lq/mwg==
X-Received: by 2002:a05:690c:ec3:b0:6e5:bca9:cb8f with SMTP id 00721157ae682-6ea525509b9mr224212487b3.38.1730840209701;
        Tue, 05 Nov 2024 12:56:49 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:56:49 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 147/161] pngcheck: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:53 -0500
Message-ID: <20241105204707.4155-147-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113663

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
index 9cd27a2e6..3bd2f414d 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.g
            file://0001-make-Respect-variables-from-environement.patch \
            "
 
-SRC_URI[md5sum] = "980bd6d9a3830fdce746d7fe3c9166ee"
 SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/png-mng/files/pngcheck/"
-- 
2.43.0


