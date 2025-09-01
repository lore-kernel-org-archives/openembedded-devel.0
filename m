Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A361ACA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 20:15:52 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.61624.1756757750726349679
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 13:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPZzOIdi;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e98a18faa35so2400252276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 13:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756757750; x=1757362550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qciephwYes0HhcMKWi+1Ki0hGtNsaV9v5+NkyPFLWKI=;
        b=cPZzOIdiucc1VgCQkRD81zB0NhxRlelwD8GQYZAzJOSNlLw0K41fV9vtrQVMHbf04o
         fVQUk2MEey7sGXz9tK2765moZ2EMvkgiZocK+cy1gqN2kuxP0xTXMvMxugGMMm26/AcQ
         HrMonEedNtcRX0So/MTdzgY0AS4448/yBu9k+wKMxnjiNCSNEusv6PnZS4AWhaUukiUz
         waPUxIG189qAmaQsbCM4EMHJxpIFBKKtA41EY0FSORuZSuhvCw/oXVHr/Akz3YzCV9jj
         1txonPXaVv6sn7IzycLBmruL6PNdHY4MCzJTayaTO2iendu3YvFK447sk4PjjIPbIpwS
         e6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756757750; x=1757362550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qciephwYes0HhcMKWi+1Ki0hGtNsaV9v5+NkyPFLWKI=;
        b=lwlI7wtvAQ3QgNeLm+2BbkGxNlYr/0P8/2fH63bzMGpRzUQ2MPVL/C+I6OGsHo2EfK
         HVnmHclJfzoky9IhSvZ5wwQdC3KtRxXtk+9TUBMlhappEyomt2OoYF+DjACbzrXrpQ/M
         +wg8C+ZI7ud+m3nfhOYg0NS9gMajfR60/izHRIyBhO8K+NiE5fF63dr38iPmEXE/oQqb
         TMjCvLRTsDM0uT5B1XLbJcJ6jTOtqDI2keU2ykF9KtT3+XMDp6+GCmXq8bc/Sca24uX0
         W7VuuM1p675ro74+8xifwRh4j/Truk+neKMNrY/mFoieez2FidtnpvzzgQJnR4fbwIoF
         qL+A==
X-Gm-Message-State: AOJu0Yy5shGgRn04YIeWDBS+v56ZbrPukI2SC29NdwOt29cWEOs0QQb2
	Y82IMimZ9woimQVlECDhzXJfVBTp1o2qU83C6n2ZAv3kn3JJV3CBngAfu7n7ew==
X-Gm-Gg: ASbGnctrs0Szzzsr/XFLXuYag/eJmTNPHV8A4AMwR6MjWvCoN9unmGyX16dumJ8OOR8
	xqevbTZZR4YwMRXt/jgB4x0ExQWYR6fiCgSiXi30ltkvou6iKkB9KkHGasVMJVUoJ7+VjLrUBly
	/MGc4cakfoL/T5AGiZNl5eWUYjsMB0iEbmsNjSc+hEpwbsdKbMwARWiUaYtWM85iTWcFZvsL0hn
	28X60wtRTxKfKIT3o5PXI/1bycqK+lg3mNXfBnYydYt4JB1Ti2ksyZWgbGuNUkGTIZKDpivhdQw
	kZC+vMoun9jV7LulWf5fBdp+3E5Yr1LBxpSkv/V3IMeF2/ItKAw2TA5u8NYIJ2VuTNl3K7S/5H3
	a6koJ/hrdL8UAA/O3tQOdefuD1EUM
X-Google-Smtp-Source: AGHT+IHN6IwK4xNSQ+lPyByr4okrrtEWW7Qj+ZC1UlAJgMR8YfLGjX3sNIP+sblvKciC/+PU0PvUEg==
X-Received: by 2002:a05:690c:f8f:b0:721:369e:44e0 with SMTP id 00721157ae682-7227656b070mr92767507b3.43.1756757749067;
        Mon, 01 Sep 2025 13:15:49 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7227d8cc1fbsm16901337b3.37.2025.09.01.13.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 13:15:48 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] xdebug: upgrade 3.4.2 -> 3.4.5
Date: Mon,  1 Sep 2025 16:15:22 -0400
Message-ID: <20250901201522.16275-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 20:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119161

[2025-07-14] — Xdebug 3.4.5
    Fixed bug #2332: Segmentation fault for code coverage with nested fibers
    Fixed bug #2356: Reading properties with get hooks may modify property value

[2025-06-12] — Xdebug 3.4.4
    Fixed bug #2349: Regression in Xdebug 3.4.3 breaks throwing exceptions in nested generators
    Fixed bug #2350: Crash when a certain page generates an exception since Xdebug 3.4.3
    Fixed bug #2352: Crash when using latest Xdebug version when throwing exceptions
    Fixed bug #2354: The __invoke frame in call stacks don't have the argument name in the trace

[2025-05-14] — Xdebug 3.4.3
    Fixed bug #2322: Xdebug tries to open debugging connection in destructors during shutdown
    Fixed bug #2325: Referred chrome browser extension is no longer working
    Fixed bug #2326: Step debugger finishes if property debugging handler in PHP throws an exception
    Fixed bug #2331: Segmentation fault with 'invalid' variable names
    Fixed bug #2339: Trying to throw an exception can cause a zend_mm_heap corrupted error under specific circumstances
    Fixed bug #2340: Xdebug case sensitivity issues on some files introduced since 3.3.0
    Fixed bug #2343: Fatal error on virtual property hook step debugging
    Fixed bug #2348: Xdebug does not resolve breakpoints in property hooks

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.2.bb => xdebug_3.4.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.2.bb => xdebug_3.4.5.bb} (86%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.2.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.5.bb
similarity index 86%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.2.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.4.5.bb
index 32a10f75ee..fdde88e44f 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.2.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.5.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=afd6ce4aa04fdc346e5b3c6e634bd75c"
 
 DEPENDS = "php re2c-native"
 
-SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
+SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "a043888c86e1526ac5ddb220d37ed3a1809e79a16bbb059b9c7e2d2f83b43cc1"
+SRC_URI[sha256sum] = "f58442306ce55fe3b811c31759a247242989164f2a7933f05c8d59b06665b9c9"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.43.0


