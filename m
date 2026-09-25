Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9B2C9832A
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 22:43:00 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9604.1790376170627355206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 15:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OHYzd1pR;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: schonm@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20a33so1676604d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 15:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790376170; x=1790980970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5GENS2OWzUyDO526JoU7PixwGkuxRI9nnDi28zSqTk=;
        b=OHYzd1pR4bCneFot8LxPRbtxI3y89OF0KA5avCyfTJF+jRh9a31g23OwRRBg6lgAug
         vLI+0r6z1hVsMEZGejGBfQ01lbwJFjUoLh2PtR1qyD/gIDPdMY8WsRWN0o4EmP3jNVtb
         wd0qskDFNS7H/ybIapc3a9jLKEYUleILzj0cZRh1gPuJTffPpqvzDPfk53CGLenxKXqK
         lC7OzgLwitIE5IAz0bBlY318LqHbjnUwoN0O4HZ5nQu1KicM+W+uTaPXArGQxLpJsaTe
         02/2pFbda3xQh1drNtuQl4JaWrACIJlpi03lLnMWewMeEGDtfJG6EL0h05us4goDcQWV
         Kotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790376170; x=1790980970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5GENS2OWzUyDO526JoU7PixwGkuxRI9nnDi28zSqTk=;
        b=S6c8ljo77XijaIffW7muIuXQqqaPOqGCeWyGShJ8zqa3l8ThuiU6WfLLUEEsviv1sh
         gSqPlsca3oCtozuR8uu+mWiPt8l3qNSzzp3uJKlibg0/syn13II+5IeC0f285lAqMxQV
         wSvJc+lQrvU8BAVjRI7gfztSMMzNIeA3WoOFRQF3aMW5S6anYqsWOcORSVEB2i8CfFUk
         dhXZfUUeUWNuzHiw8T6f07mCylvy+pnBjyoe29i6YtrAKkj7bWjBLh5HIte17DXYrJ2J
         x4L3pFLzqXydn2JH3KWo5azyWUw54Y+So2WvWC1QJUNTsAOJhNihs5sozUZAQQV+FTTk
         G9UA==
X-Gm-Message-State: AFuF++mDUkPfW8i0X92GLYHx/BeXjPguEtTk4c8KvxmgzImuoN/aIzHZ
	6WQ9K2U0ozn8kCGThT+4HEDr5/2jnMPiVBarRpMjl2CAzs8BSIFtIYOQEMLBVwY9
X-Gm-Gg: AYBFou3bbOJwDLFf4CaI4VyTu7GmTrHeS6VKZHmoHoLTXfpeM50LKLLNTlV/Gyoj+1M
	JkynZBD91TQM/BymjDDTFuU1jivo383cmxi4ZYDVW9mN5oDZevCftxvadMM4nAbKLQwsjMv8tpQ
	3To1VkAPkzyn8D3KPmQd9k7kXmzfh4qrYmeBKX/RP9UL+lCq52Prp7xN9WgFkHtTwtgGDM0+giU
	vJDKaCa8kRMK55ObqvWE2VQVG4kD7uCHofFlYZNsBCjjBtiuuoOTpPRXu0kHCmpc0+FRvP7z2Ou
	jhfrNvP7GYsljHCuOkduy2x1GSTxZn9/sHlyNnYx7gl26WCuHR6rIpSmDnAxACgH0yQXnpZytTC
	kIUpAdMW1VTiQTtp2n1Ny7hn/kF3mJr7NKqb/pkvRQnfEQ457uDjst1Jvog8GhqP09Q4QG+v7DZ
	utWihivuccp611W04ziEYtvc+riWy2Mglcsp4FeSraV8g+Izp21vz0u9qrM4N9v0hTeuLUhznvm
	bN0uElIBTjC2YFyYir4z7g76l1GqMkEQcs2V6qpFdWWiTMM72/U6dtMJh11kLOl8L3hnOCczm8Y
	xsx0/QNgtN0n4JpU3DwOAA==
X-Received: by 2002:a05:690e:11cb:b0:673:e272:f3f3 with SMTP id 956f58d0204a3-674111a92fdmr886194d50.28.1790376169325;
        Fri, 25 Sep 2026 15:42:49 -0700 (PDT)
Received: from localhost.localdomain ([67.233.63.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740efdc5b9sm1586408d50.21.2026.09.25.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:42:48 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.10 -> 8.5.11
Date: Fri, 25 Sep 2026 18:42:31 -0400
Message-ID: <20260925224231.1094386-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 22:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130315

This is a security release.

CVE-2025-1218 CVE-2025-14181
CVE-2026-91765 CVE-2026-91766 CVE-2026-91767 CVE-2026-91768 CVE-2026-91769
CVE-2026-6103 CVE-2026-93682 CVE-2026-92842 CVE-2026-17545

Changelog: https://www.php.net/ChangeLog-8.php#8.5.11
---
 meta-oe/recipes-devtools/php/{php_8.5.10.bb => php_8.5.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.10.bb => php_8.5.11.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.10.bb b/meta-oe/recipes-devtools/php/php_8.5.11.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.10.bb
rename to meta-oe/recipes-devtools/php/php_8.5.11.bb
index 130a98f634..831e926880 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.11.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "d79bd4f3a9248e5cb5833766ba0d51cd35dd01b8727f23f30bcdba6fabc51d3e"
+SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
 
 CVE_PRODUCT = "php:php php_group:php"
 
-- 
2.43.0


