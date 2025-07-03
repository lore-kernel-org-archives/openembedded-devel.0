Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C06FC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 14:09:26 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.23670.1751551759220410760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 07:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ckKFIpZm;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-710fd2d0372so8525217b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751551758; x=1752156558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7hUGzED8WVvkeOpXK8BM2izquwul1JoNlSlS+LAZLo4=;
        b=ckKFIpZmPXmO+RRSMW2gaDz2EWBautFzzCHbwf61lCf0nAiemp8/G7roROtOWJFpLg
         kr0sWSInK0uPqyNj0V0IoX71aImM5F5x1X3ZN4Tg/Zyqb3HIpJ/aEIod/y8bY01gqQ5t
         fC9p2ZzK/zyACDmPG3MPh9srMqgo2OQsEDoELLHshLs5MJdejQKsa2Nv3Licdr+MZMRq
         ZVJX5f4ObLVVpex6zD7q4dz6Q3tE1WJlzuY0wVAuzK9aLRL6GDAJj4bEBfgULwVSzYAr
         echbm49Iba0TdXg4Poat4IvyiPSW/v0RhPapPVXAt2uAPffBUMGku3V9zaoLfmPfSBPR
         A4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551758; x=1752156558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hUGzED8WVvkeOpXK8BM2izquwul1JoNlSlS+LAZLo4=;
        b=Rxd5ZRlmgOIE9QYB8K/H0KYj/UZezhMgkL0Q1GpvvdesG+xHDzP0EoweNe8V0YIeSt
         /aMtAGwr6eqM3pjTgFwqGET5CPKQzaH5ZWZ4u2ccrqGdDOKkb9u5xUEeL4twslRbGvWp
         kFk+O68tI34KdUcJsRZBsEXsJ10qF1zd9L7WYri/N+qB6dSod63jXN83rB1wZ7g/a7vx
         XpT3ecKaL3PoMq4xycChErmx70Cg4ePi9cO6oJL2tjIYmUQYhuIpPBGj383O8LEVYq3F
         rhF/M4PuOJNO67q2EIRn1rtyktmqKMtLi/8f7bpdjIf04SKE8Z6RGfp6QqvMaqwzwFqR
         PVUQ==
X-Gm-Message-State: AOJu0Yx12vO0WiFJj5rdzWfckmsLl9XeuTxbm8aXOU8Wa77CusnDahb9
	MSGKrkTHb82WbhXAX9dOKAF2DFn8HwNk4LrUdwUXqkZmU/iKeBxYtGCzgUjrG8ny
X-Gm-Gg: ASbGnctKIPn9+Cd/+s/hR2EX+xsEzhDXusu9ZmsZToY5KGY6Od2IdS3Z7bnAQ3KqkcH
	JghR+rnUkDdkq7m/VI7vp1sYAByMYgdgWWRdzSkUYCimeZi89xYMSGxzRh5hQHB2FQDaGa2iI/w
	1HFiqEbKZczH4YGOXQPdtxA187g6s5KnnhBPFfpsRerDSDLS+WYtFl/GzRG44NoSJvUiOxL6NZp
	FRnPMwZEIudO382aayxBGcaj7Ywnds+SaXXfpQksD5e9nFEHf3i+qpNvlhAJuZZVmITf6lIU0N2
	+iYOgRy4/fLv/ErO+5CCWhkEwFZH2KDT2zBmUvG7x1JVoy0QfOr1kdY9WH3YJ6QdFW53fzynQu+
	OULHcCWnjeIsZh3YPo8xwWkr/7/fXhQA=
X-Google-Smtp-Source: AGHT+IF6Owcbg2yTOrkY+x0FcrS1XWPI3s/5K12m0KR03xDKYkFrltnQQt8mymHT/g8tc+FZEqZ3VA==
X-Received: by 2002:a05:690c:6d04:b0:714:b7fa:2d7 with SMTP id 00721157ae682-7165cb256dfmr32647167b3.13.1751551757605;
        Thu, 03 Jul 2025 07:09:17 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515c902acsm29208437b3.70.2025.07.03.07.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:09:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.8 -> 8.4.10
Date: Thu,  3 Jul 2025 10:07:30 -0400
Message-ID: <20250703140730.816996-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 14:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118224

This is a security update.

There are fixes for memory leaks, segfaults and CVEs.

CVE-2025-1735
CVE-2025-1220
CVE-2025-6491

Changelog: https://www.php.net/ChangeLog-8.php#8.4.10

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.8.bb => php_8.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.8.bb => php_8.4.10.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.8.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.8.bb
rename to meta-oe/recipes-devtools/php/php_8.4.10.bb
index f38a407968..4d598949a1 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "36569c64dd1499e570c436603b641eee7cde4af576af786597d0ee711b3a3a8a"
+SRC_URI[sha256sum] = "8815d10659cde5f03be4d169205d62b7b29ed0edc7cdd84b6384cda0310c3108"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


