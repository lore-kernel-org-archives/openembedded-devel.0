Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911F0C3ABC5
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 22:35:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1630.1746743731329735071
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 15:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ekKmvEWV;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so11210235e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 15:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746743729; x=1747348529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsm7UJXGpAQkZTwSf6LNzfg9qBMczXG1ELP/kpwPWIw=;
        b=ekKmvEWVU6TxEx+Slu7otR+wqp/xFVD6qBf0T7seQekRwiSXj5htB/j0su9mIJgMGS
         T9EiGACUAymIfv1NtqX24RQA7EB+RqlR+SfgPrSb+iTeEneLyZG9R3dlprQ/TOAzYtTo
         PgNBA205eCQeIkUMygA0Bc7Svqdg047wLJVbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746743729; x=1747348529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hsm7UJXGpAQkZTwSf6LNzfg9qBMczXG1ELP/kpwPWIw=;
        b=wR4aQOuwOAfwuFV1eEiE5l/EGkMNqdFCy4x8HXBn7GRyRcSKojnM9R0a3fL6Ob1gSD
         UH4vZBOfbbNgw5fq4LcrgrK6rkoK/VmSArG3NH00wPM0Bch8/vmuNlkpij98HJIVrOI7
         5WONQUzmyCNJwv+nV6nmoF+HWU9ARsaIN3LjJTeF+tM3qeebHbN2agjGGqXQPZyvabf9
         3WNw3J2h9iNp7kd/Sal6SrWSZhUuQ4IqiMc9ENvRPjwPAfHp6u1JItU725B+Onsk3h3B
         tKGUx3DIakgRJWj8q80d7xidRihAmpz2Iue4EiMD+BihrOKBvxun3H3N8O/J6xq8t4jE
         oO/Q==
X-Gm-Message-State: AOJu0Yz0r89GYkYQ1fqMIAO/DR41ZXEDV+t+JxRZEASYBqRRGAn+td3r
	TtALc9SmZyp2E2+cX8yzZxtF1ucmzRFQ6sUtj+h0cUnd5imzh/VZZCMUS3tPsX2mNNGnACEFx+V
	2
X-Gm-Gg: ASbGnctAb6SWjFTEhGdJPXm7jMowJHMNaKcT5wUfsYoNoYy8hlhsX4eQfnwYvC1xgaP
	lscxkNQI28uG1kV4JvxJKgCLuVOOaqyg8KjYFXb2t/ZT4Bn8kb+5DKTTqbfJ/8K7crTasbZp63F
	0gdX1mPQ0t/kkTD4Y14LUk+8QcSf3gCDNCmLbnPxad8yUUoksa1jRFrezLWfFM+3EEiSfwF4zka
	u/lTrLykUN7TwjqWlwjWVl7zb/h0p627eG18Mr30Z6rBqrOIod48O7wGsJKlpIKUfRLJ32cJ+AI
	E8+y0MrZU7E4Y6wiSvl0feBup8bYmYPxt0cDl3lkgSFdHpIq5Lip4cKqaUzwZ+qjcRzoWR0bhEu
	RrgCzrTfwCrhyyIAPffVkb8JS6pI6Tlzxl1VgZugB6hVCc8/Y
X-Google-Smtp-Source: AGHT+IG9UtXsTpHX79dF4QWgCZxuN4QA+oenJ47VuxvK7XivS4owR3EUBWLXq4ABdlXil4BiKMMskQ==
X-Received: by 2002:a05:600c:8106:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-442d6dc564amr8402055e9.24.1746743729492;
        Thu, 08 May 2025 15:35:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0087b736f9b546e683.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:87b7:36f9:b546:e683])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bd79sm50511715e9.23.2025.05.08.15.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 15:35:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-webserver]][PATCH 2/2] hiawatha: use -std=gnu17 for compilation
Date: Fri,  9 May 2025 00:35:14 +0200
Message-Id: <20250508223514.999569-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508223514.999569-1-yoann.congal@smile.fr>
References: <20250508223514.999569-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 22:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117371

From: Yoann Congal <yoann.congal@smile.fr>

hiawatha does not build under -std=gnu23 which is the default of
gcc15. Forcing -std=gnu17 fixes these build errors:
| .../tmp/work/core2-64-poky-linux/hiawatha/11.2/hiawatha-11.2/src/hiawatha.c:814:25: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
|   814 |         signal(SIGHUP,  HUP_handler);
|       |                         ^~~~~~~~~~~
|       |                         |
|       |                         void (*)(void)
| .../tmp/work/core2-64-poky-linux/hiawatha/11.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
|    88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
|       |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
| .../tmp/work/core2-64-poky-linux/hiawatha/11.2/hiawatha-11.2/src/hiawatha.c:294:6: note: 'HUP_handler' declared here
|   294 | void HUP_handler() {
|       |      ^~~~~~~~~~~
| .../tmp/work/core2-64-poky-linux/hiawatha/11.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
|    72 | typedef void (*__sighandler_t) (int);
|       |                ^~~~~~~~~~~~~~

Note: Upstream project has no published way to upstream patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
index 169e385da6..098c07e954 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
@@ -19,6 +19,8 @@ SYSTEMD_SERVICE:${PN} = "hiawatha.service"
 
 inherit cmake update-rc.d systemd
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DENABLE_CACHE=OFF \
                   -DENABLE_DEBUG=OFF \

