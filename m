Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C17E105F7B7
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:20:35 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18391.1773415234416592053
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kW4lfyyR;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79901821bb0so25713067b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773415233; x=1774020033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKy3xlpt8Pq0eqoGJLotJWmukl4kEtICQKaLVWuCO6E=;
        b=kW4lfyyRx0qg3ZU/814dov118EtTYv7+y2QV4+lzfBDAK7/O2QKoz5N4yPSsGjUaZ1
         UGJivD2i8EF3a3SgOxkOY1WsBY6Q9cn6wp4btgUmwtgpnQqbmoEx4ARKHPCwb/6p8TX+
         1lhMeIIeOLgEjbP3apqJEx7ljXQ9GUe1WB1x0cEu9+qPOYIevx73DDiry23RP+QyWoh/
         FdjR88ve37z0ZhL93KBuwsL/fBTSUX/0e090Voqhx85aof0WysGpMEg6kQiM9HY5roul
         10mAQtc+dSMb587yK9i/A77Q7h1JEZAD6S+CV6lqho9SMoni2cH+nlIJ1VLjnCz1e22o
         F9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415233; x=1774020033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKy3xlpt8Pq0eqoGJLotJWmukl4kEtICQKaLVWuCO6E=;
        b=oSE0B2om0qwhrre5S9dSJ8yOBqOjEs5lHUAs1TWlVPzzifvzYD1neUmTtsyVXuAEMd
         CVezEgcDJgMktlaHSRaPHjgpSZ+iMhju2QtGXqshiL/PCcWkilNguIkWDRjKTLStRp2v
         7VMVodPwpSDODi9e8XGjPGAIkAXr4pJaYW+alVPquMVwQ7jlrwkgpGFWwI+u7Y/nOi7G
         pZ4i08ApHdrtcp0ztxUAZIeZ3sEoV+8Il9K7GXI82HC50c3KMlBZn9XxnzHOi9UqPulX
         ZUwGDA5VxLoIsbAWW8T2NY7IxTUXR9cqV12zVkjALCa2AW99QYvwUHS0MqkIZSewAcR9
         Xz2g==
X-Gm-Message-State: AOJu0YwvU9zqEKB6jZl6g8rvWWLKImD7i9fpwJcwZvIADKqIfU2wl+np
	TCqX5OSNMBYPsbDtCP0mYhf6kI/iLVkn3ud/RWgoztswvsLTbqJSKeFBwX3Be1f7
X-Gm-Gg: ATEYQzxa393FZb1uXPozJM6xaJxD/eIGFyK0n7BAuBRWW+mAqfA6pWgpxd0ypWGt10x
	vYNdJ5e4rO0OiFOywpjJPYCswEKAXBUUrDxu4qOay0t4LR7YwyeATqU6GxE4W24R1jPteP311Nh
	rnTP6sykrCpceZUjyUg0Ft5Ly2aYZvMNNXkxvYByk6zbosiHuKLx+DuMaMeFq94EDcJB4wTr/rb
	uZ97MTUCF1H4rfnqKU3QS2zsdnyPSdL8jW9GLbUIZ+Slw28+y2wOWapNMpydPEzrwqcc4vst6Fl
	Y+GZAAqsBlvcezrm0NcCP7E3UW2e9ualFfswz1ud4xGQrpvDzefmOZHSq6RaEyBMApG4jEnXfKN
	kEyQ4CDWkoj0/FnBoG5qWx1mdNRfmTeUPvAc2zFL1/5NwYBsYBZUB7Gmqq/M5FRn6ihwb5UEPbQ
	R6Br3Ds5fMpNPqYBM/c4Vy06VgRkQyWLM74b0S8AYFLVgJ8IXHoGcd9jvwv/P+iuSdnTNyz5mk2
	bp9TL+k8Ze4BvgdR29lYoeonkKyj2KW8gpQASGKpSy7HvYH59A=
X-Received: by 2002:a05:690c:9403:20b0:797:d7a8:c540 with SMTP id 00721157ae682-79a1c0eed72mr32102247b3.26.1773415233052;
        Fri, 13 Mar 2026 08:20:33 -0700 (PDT)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee574bsm48256067b3.26.2026.03.13.08.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:20:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.3 -> 8.5.4
Date: Fri, 13 Mar 2026 11:20:12 -0400
Message-ID: <20260313152013.1712471-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 15:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125191

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.3.bb => php_8.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.3.bb => php_8.5.4.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.3.bb b/meta-oe/recipes-devtools/php/php_8.5.4.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.3.bb
rename to meta-oe/recipes-devtools/php/php_8.5.4.bb
index f4d02dbf22..efa778b6d8 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.3.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.4.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "fc5ecabc183ceb64d9fca3dcd387bd29b2b67448326af998fde003124916823b"
+SRC_URI[sha256sum] = "2ac929a29a6b7ef4b8acec981a417b91bdf7f548f597df665cc56ab9ea95fc75"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


