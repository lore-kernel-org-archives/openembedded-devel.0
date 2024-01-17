Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8B2C47DA9
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:24 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.1289.1705454003413577139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MVGjSD8W;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso107022287b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454002; x=1706058802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi2c5JvA4UfLiXC9fwZZY/sRhKGyVk4IMiHxtzjqP0Q=;
        b=MVGjSD8W5xCOvnLc1/VURDAkqmXeGmTawOrJIuON24+IgwemVqK+rVANRr9wM16FAm
         hHzHFB23J90RDTlXczWkv9gV4FxQgyvB0ETQ/wAv3RCMuKrKyg2gm/ST2Muap6lJfBjJ
         s+1ToQEgA2oxZQPqvouY2z/UlTe58x415zJ7sJdKYxXpgxcHVXGqSJQ2RHyPBB2tZXqp
         us82Xv50U8/ZYwwA3ZBsLcP4sYPT/c6niuNizG2fUlLjt4N+BRe8wd5t1jYMv0aOXXKx
         yUCHUS3JA2JPK2xhA4xtk+PJZmQz7NfIfkDkj/cG4k2n3F0fB37AvMs/n3fTEaFYOG7k
         40tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454002; x=1706058802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi2c5JvA4UfLiXC9fwZZY/sRhKGyVk4IMiHxtzjqP0Q=;
        b=cfuxz2LVv5jIf6+TxD9v2u+2qGnuYp5E8/48qTZznUTLh1+pPjFq0Y0oDLHRGJSHWi
         aRoYw4BMsotC0gTxiVGHzfXz6dezpvgOtzIjtxL3OlF9A6Mnt7CqHzRgOjbq/Mm/OBAH
         GEMF1Gmj0V3gc9X0C4pCypwQc/hEC+NslCuoU80P3QRVoPGqM9nhK3GX2wJ7U/s5hlCJ
         /FQpNAyGIuOxJWbewvj4roDka40pVPsLqphLiPRZJjvUb21aUO5RjXNCq90BqDbzxHmV
         Zu2XRP+fUTTYzaaf9XffeeYfW7JJqcuimx/RR78oUbjEBpDhcQpnmuezkOyjjMVR0Irb
         zAnQ==
X-Gm-Message-State: AOJu0YyN/elvlx2KA0utf0UA4WhJ2XQnew66ISQTBFzMnwhvNswz6E7W
	YOKR3klHMx1ShoFmKZ6ygtztH75r2XHMgw==
X-Google-Smtp-Source: AGHT+IG5tNMuWx4WG8GT86S2EYtqR0PlCGI55mGW5VkpMFu4Fee9AdAuziDOwfrCoqqP1xkYpSHTPg==
X-Received: by 2002:a05:690c:803:b0:5ff:6564:77a9 with SMTP id bx3-20020a05690c080300b005ff656477a9mr216628ywb.95.1705454002286;
        Tue, 16 Jan 2024 17:13:22 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Meenali Gupta <meenali.gupta@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 02/11] nginx: upgrade 1.25.2 -> 1.25.3
Date: Tue, 16 Jan 2024 20:13:11 -0500
Message-Id: <20240117011320.1856392-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108312

From: Meenali Gupta <meenali.gupta@windriver.com>

Changelog:
===========
https://nginx.org/en/CHANGES

*) Change: improved detection of misbehaving clients when using HTTP/2.

*) Feature: startup speedup when using a large number of locations.
       Thanks to Yusuke Nojima.

*) Bugfix: a segmentation fault might occur in a worker process when
       using HTTP/2 without SSL; the bug had appeared in 1.25.1.

*) Bugfix: the "Status" backend response header line with an empty
       reason phrase was handled incorrectly.

*) Bugfix: memory leak during reconfiguration when using the PCRE2
       library.
       Thanks to ZhenZhong Wu.

*) Bugfixes and improvements in HTTP/3.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc4bef4648ea5ff73230ff2d343f498c93bd333b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
index 66eef23895..8aa9fa0267 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
 
-SRC_URI[sha256sum] = "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711"
+SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
 
-- 
2.34.1


