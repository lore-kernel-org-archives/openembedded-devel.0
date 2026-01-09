Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08135D1A618
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:06:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9498.1767963984321131706
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUY+zEin;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1246347f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963982; x=1768568782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4tePouu+nmCl0r8qRh7FuEO6rOIM0wD6Yw6P8NdsnU=;
        b=TUY+zEinqMdtt4bCl8iunHq7udzoQe1C2UonKRo7g9dy77LBe3F4UXquM0W7eTZLF/
         Vzqaler1f3ivAE73OydYIMoZVHecnF2OgN/rg7NIx707XCoCK6mgWua5b14CamvbkIuS
         pjNNcpcS3fzY1wb/PKgh8l6itJ7eAOqYaR1CFe3uJ2EgMkbGs8GO6hpoRWyH0+K5qUHi
         E6jnpXFNb37i8htJTaoSZB3mpQ7TEocdGyjqPrLZ7tkmTJE6KkyBhETGuAwZNn7KK4DE
         ZS8SnlV4aAYAzuGTVw4PNw5Eed8ylW3wjHbQ2U7tvjpxYxVSmMhpn1qG0GWJGlsJpR7w
         J21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963982; x=1768568782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4tePouu+nmCl0r8qRh7FuEO6rOIM0wD6Yw6P8NdsnU=;
        b=Kvby4i6WSXPuxStPhwYgLkwKYe1jCp0CeGcHFNz+kqDyDk9WpAhIRCf3gqfBNKFtDq
         nyUWpUQPaGuluoGFHmHU6wNbiJXbvTEFz4CQSshaqXc6Q+Y/tSp4i/LPrDn1K8TUsXjG
         BXZOrRfa/wy7jlNR/orKV47g+dYrwt5Pewl6nKd241RwfH/J/rrS51XRqsEWFL8LOJwk
         +Iq3FjEjZNHALmVOrmv5xFYYKHaWalFRu6oWmF1jkIDX88GstEn2zlyhat5arvcsw13i
         fjwTSdwGx1SdYEAZwOWxd2BQvahLGOy/CGRiiHHT5qvz5jzifRstnZePTHXzR8sdgQ2s
         NK7g==
X-Gm-Message-State: AOJu0YxA4APqXFeDuZ4JTkpruMcs/VB46HJjOEdx26p6WEVjVt++U1/l
	ZPxrQptzCumly4Ng5+/31jeUYMgcDYzJaQ2Apr08We6CJwVJWFBaodG9bjl5XQ==
X-Gm-Gg: AY/fxX6SetDdxOH+TpFPj/0DgwYEG0/qYQ4LEyzo6CdLlaG/yhKT7aV36uItyW2KZ73
	AyP4PpuHSBfr7yf7+VehojjIaS2Aicbhj6NHQu/6FKh985Cny0AnjQyshnnXoqL1pF8O15RB1ds
	sUDFAN4lrY3GcS4KWwRJr+81hYU9JRkFFlEOR3GMkMMfiePuHFR1DnOtjPMcf6vjAONWfST8rki
	cxcJwW41rKfzmx1eYuR66DIpRRYijeBJ1YQlHQ5RvnyvcKeS98fRC+DRxDTkBCQ2oBJb2Bw0OBw
	iDhUD8W5/DjYlDlLQO50d36CrxrwviSCEUMALHEcv0/+ktImUF1Ut4b/uSGikyL8TKjGO9EgvHo
	I5TIHSTeuH72t9LMWlqZs6X//eS9TIZ2Sr78PDcNCP6Af7T4z3nZ9A/XqWDmYo3e0044GOSO1e+
	8Y+llzBkP7
X-Google-Smtp-Source: AGHT+IE8S+GbG/IzAtjyz1bYQAKx9OuoCNSqiuiLOWbDnEVNt1K3sqgSCbAzu+gfs+oVfhhAyp+WGQ==
X-Received: by 2002:a5d:64c8:0:b0:431:32f:3140 with SMTP id ffacd0b85a97d-432c376107dmr11900171f8f.12.1767963982437;
        Fri, 09 Jan 2026 05:06:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm22363067f8f.36.2026.01.09.05.05.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:06:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/3] memcached: ignore disputed CVE-2022-26635
Date: Fri,  9 Jan 2026 14:04:17 +0100
Message-ID: <20260109130417.1591074-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130417.1591074-1-skandigraun@gmail.com>
References: <20260109130417.1591074-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 13:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123302

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is a problem of applications using memcached inproperly.

This should not be a CVE against php-memcached, but for whatever
software the issue was actually found in. php-memcached and
libmemcached provide a VERIFY_KEY flag if they're too lazy to
filter untrusted user input.

[1] https://github.com/php-memcached-dev/php-memcached/issues/519

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 889ccce6848276fa68b3736b345552a533bc6bd2)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
index b28bfe72b7..76e4768fb9 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
@@ -24,6 +24,9 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "8d7abe3d649378edbba16f42ef1d66ca3f2ac075f2eb97145ce164388e6ed515"
 
+# disputed: this is a problem of applications using php-memcached inproperly
+CVE_CHECK_IGNORE = "CVE-2022-26635"
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 

