Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E07D1119E
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3904.1764190159400476034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuVv3JZA;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29586626fbeso2462845ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190159; x=1764794959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s+O8MTA5D2Va7GHCmvu7Kr8IwDhvRSt+rrWrMLLvxw=;
        b=KuVv3JZAmwI3/1B0nGBo0KEx08deDp4cO+ecjh0ijCNJrAaTYY1F/0WB2ubdXM38Y/
         Ibk6FihU4Pfw9dwpxDJLJTeIPIPBCAKl77kM9syPndY4FeQ62VhKDiTMkZL/o7fGaNqC
         YUvj65wqVKcezqsA/96QkZOEzMBcMb5P0LzascfCBQewLqzJiiG8B27xuZZHYCLe4OWe
         eJ1mRS6fvECXDgzyVqo99/4cBEYtr/7/gRKddWBuhFjlUYC6wUATJXAdfRCB4XXrmJwY
         0nGkhIl0nL4d8akhzmmedRM5zfzeZdbz1BdxOXVJDIIjLkp3GrXsrGXMUmvkmwyc0oC2
         dGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190159; x=1764794959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2s+O8MTA5D2Va7GHCmvu7Kr8IwDhvRSt+rrWrMLLvxw=;
        b=Cc5OUnWwM90yNDjIWJj9I2dRo4TKGLG4zyVNOH/3LlNP5C0fQTpA0W3UwsA22Wt5+r
         w6N2VTeg7Cy6DfEZ6EEMhOr7YsDvI7KZkGTkbXYrrGzgWyJ8hjvfoXdPlMrCxuyq+6OX
         KTC8kPlgZGdJkO9fTS1Kyfptn3GpZFlhwmqTqzv5b1dLfyy8usdhJ6+HkU0a5vdA7mxY
         GdGt9HMkXEK4WokXPrQ4EqF2OyAPyaKcA88UWyahBWULH/OzIUv3it4+E9YeMZOay2MM
         jBB1dkKoLWl5OqsUvA21VKgJuV0udEXQUcGknK9YMuor+Op6z80DAarQ7WB91eNq323G
         oNSA==
X-Gm-Message-State: AOJu0Yx5OwZtsFNm6fDiUB1D6mlxmx0P1PmTzZJAJz9RZ957fv9yk6ZX
	2lhOqVTfXi7SEm+9bXNCf0GkIPhNQJ00nubh8nLJEsa6jMDsvoatzua7XRmmWA==
X-Gm-Gg: ASbGncuhTXAX6JfPNpXSiq2rDqeYc10yvWXzHTcDv6VFA03m5om6/wP+MFJ3ZcSZaEs
	wZCNWcoLyPqMnSP5jlb2vOjdP2Oqli9U/7QQigjHhAAAV1h1GRlvZph1bVciunVo97avXzs1+Dm
	0+bwO7jpkfgPHNydya8bYXur8j+ILs5sheAyuIsl11xGTiE/76etWnjxEi9K91dch7By81INOa8
	3YrCcNXU01XAVODx/blnoavPaUELg597iwD7AL+41ZixOO4TBNS6EvAUvbYbBmxnfZUsd0DWWLu
	j3TvTg3h1O4gPUjcmU8sxt/cYT+PEOto8tP08Uy6bidD5qxDLOaSZ+eV9Mx9WjMNvLNIH4k+ITt
	lqXHzi7mfW77JX1k2rQJhumOcqrpOLizlaSxJkl9F93YlEwdM7jCvevKy4MCuiBrJmnYJaV6LbL
	FUfXbOsTwpwxGars5ccXoFmkwDCyeX/r5AIg==
X-Google-Smtp-Source: AGHT+IH8jmB6TjFsrVSTaQSaGQ+0pDU0wgMr2iWre6tt+xCxTJ/g/dSdFUyjd8X6/tEFvnzIA69Umg==
X-Received: by 2002:a17:903:3c4f:b0:28e:aacb:e702 with SMTP id d9443c01a7336-29b6be8be1cmr255402635ad.2.1764190158658;
        Wed, 26 Nov 2025 12:49:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 2/9] xdebug: upgrade 3.4.6 -> 3.4.7
Date: Thu, 27 Nov 2025 09:48:39 +1300
Message-ID: <20251126204847.1969339-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122084

From: Jason Schonberg <schonm@gmail.com>

[2025-10-26] — Xdebug 3.4.7
    Fixed bug #2359: PHP 8.4 Lazy Ghost Object inoperable/defunct when Xdebug is enabled
    Fixed bug #2371: Step debugging initialize lazy objects
    Fixed bug #2375: Xdebug's exception trace conversion initialises lazy objects

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8a04d45a4e32ee29a12db23e1359729d16549b12)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
index 6f8540c0cf..a3947a8801 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "4cd6a2523d9c1576c818eb4d15fe0c1650a25dde4d31d1d20a616e9d9435cc20"
+SRC_URI[sha256sum] = "7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"

