Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03900C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.11447.1685531599503629456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bf9uNfY6;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-565d354b59fso55171877b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531598; x=1688123598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfCJb4yJrEYgOBS9IQh5W+83QPEdlryPx0x+gEZz1/U=;
        b=bf9uNfY6y80iW9Y68YB4WAQ840yH6PhOtcJeOcvMjRJn2ZWcW5wx0JOZbk0USTAYQB
         W/cYvAjoplGMP6ZzHaoj97LyulA4eLf3n/VhSjoMJkFbkAAXeBxQpKZiBqmCppljOtf/
         ZH3J0e1aMT5Tr2zU43s5W23rGlkpUNmnCDzbMSZUpkZFAt2QREx3hT8CFwXtSAVyMqJC
         eW14hwduKaDqdM5T6pZj8UM0eseWlQrMweXXpoyBsXb2XBoQg1udDD2s9g2Yw+VCTTXC
         IIWQD/v+1HdtDfR9UHEg4B7Xa4oA1uEOXM5tI2+2YibFFVu/fiOvfksDFjN6pc8sTreM
         cB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531598; x=1688123598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfCJb4yJrEYgOBS9IQh5W+83QPEdlryPx0x+gEZz1/U=;
        b=lNZjbAsP64HRttBLm7Ec4L0xAPwe45ZzCzLRJ2ANOY3IsSIQbk9JNn9R1Eg7ZnCPbY
         k9gtNrU+QA+/GghIsSj/4r9vE+IFvVhUyqxx/ncn+P9pNNmT+ifriGKWEWL7b7O3d+ns
         LW/Da9qiGfBqF1slm9Tj/BgloycEcay2lqSD1Y+YewMYk2de+DrBxGtLvsPdNhGDzP8Q
         m22qfqXvzI4jMn5o5IJfl7w/I96l8GEvXoq9Z+GNLZBB9xkyVEXsvxTzumQza7YvTKX7
         NFe373a68zbNiw8sl9N3Rsr9vhAhD02b/I8uZvmt5uTj7dyUKIrbcYdvlqmHpe6RtmaC
         7UDw==
X-Gm-Message-State: AC+VfDz1flpCppUepom4ccXVWgceaQbADiGPDLFBQYHqd0c67HUAGNcY
	mvqXIsJA1GsCz2IM2FgjiF2xqGnEWDw=
X-Google-Smtp-Source: ACHHUZ4oDsRrCuJGUqnNOKWd4U/Q+piztaOltoShsv1c/JXeLtc6mnRjGso9tcQ9iKyqDE745SCUlA==
X-Received: by 2002:a81:49cf:0:b0:561:c5d4:ee31 with SMTP id w198-20020a8149cf000000b00561c5d4ee31mr5779640ywa.38.1685531598468;
        Wed, 31 May 2023 04:13:18 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 10/36] php: upgrade 8.2.5 -> 8.2.6
Date: Wed, 31 May 2023 07:12:43 -0400
Message-Id: <20230531111309.2454603-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Fix inconsistent float negation in constant expressions.
Fixed bug GH-8841 (php-cli core dump calling a badly formed function).
Fixed bug GH-10737 (PHP 8.1.16 segfaults on line 597 of sapi/apache2handler/sapi_apache2.c).
Fixed bug GH-11028 (Heap Buffer Overflow in zval_undefined_cv.).
Fixed bug GH-11108 (Incorrect CG(memoize_mode) state after bailout in ??=).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8ae640c02eebcf6082df40dc3adc0634e1e1ef2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.5.bb => php_8.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.5.bb => php_8.2.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.5.bb b/meta-oe/recipes-devtools/php/php_8.2.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.5.bb
rename to meta-oe/recipes-devtools/php/php_8.2.6.bb
index fc11e65af4..d302878999 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "e5a80663cca4f6044ad86a489798147c7af037eca96f6cd357ab36d28cb63757"
+SRC_URI[sha256sum] = "44a70c52f537662c10d91eedbf51fd765c9961be6ba2508ed63bf7a26cdd3100"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


