Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9E0D609AD
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:23:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25121.1765898581099060541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtYw8ski;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1646187f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898579; x=1766503379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PP9EdksCsYoO381Q/kWnrblXIGT/UL1ZgzClp5D66Lk=;
        b=jtYw8ski2Be8Nt2ZbWyjmLm2QEzdF5p7JR1jN65UrwIymrHqt5JViVpElD5kpT/y0r
         dg1BpWe0WbkMKG8yQM8ChGN4Ti6sYTPDm6G5xISUaGWGs3vBPXCwxlFOhoQP7p4okOow
         NtVaBKJLcojMEJHUya5l+rhRJmeoNZUATzjVWFSINqfTQ75WS5zxysBJyfb4fhqc43WU
         iod+JUBa32dBpZ7czLOCykruKmdPNCIPCgTeKf2lQtJZoD8KPlLg1fTgVUJSa/pvPQnM
         DZ1DNqiviVniHowlRrO+nSHkCCvBDayuDe06NmQK877Pf/Wc8efnGy+lTsmWGLcXoPnn
         w+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898579; x=1766503379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PP9EdksCsYoO381Q/kWnrblXIGT/UL1ZgzClp5D66Lk=;
        b=U477NZpg7RO4CmbaFtu41xeuc9iEQADizMjE/Aiw+SXq7GPsOJCJaWvNMCmKKFjTye
         7xXiNDYnbsjD2ETy7F9NOX1K05dKzr757NU726+3+bqXkYd2ZjfErTtt6UqlO0zMdduC
         y67F787TxJuKJ1lsXjZB5p9k87cX5raLY6bk6yK1L3iQx0zZfbTwWHNU7xDVMJy0sj3l
         Qnu23MHu7QmaJgqtpFD1MUHJzUd7pMkK/f+Hqd6rFfZcPH+M2i+pz9po/hCE4FqqIuE+
         //LLmrjk172LSQKkyxyMCdicavOh1aQYjImTYhJ2LuWByOI5auGD3U7vaiy97RfsEeQz
         T7kg==
X-Gm-Message-State: AOJu0YyaORtj8c7FJd7l7UjZ0EaIpJxMAWixNLAaPVDvudurKhRdhrf6
	8NXCtCv3DW+f1WotPdNqx76dJWqaWikBOcS6Z3+SsMbYayiii0qqHm6iMnp4dQ==
X-Gm-Gg: AY/fxX6PQAB3qgeATfzInLLnw1svUfyEcJePlpFjRIF08yfTnJu9EwXKrib6iNOO7ii
	cfwZX4OG7aEPzKyAkYPBcyq4Mi9WpzcHrjj4fCfjBmtSmBoVdTBGzhSCCqbeJ5qI+YYOB3vHI+n
	E9NMzthIUaALHvKLcS1Ccd2bxGSioZ5KY0/M2YCuXf9+RW7n0rMsKVzu5usm7ic33FrYyNP9kr2
	LGzUaU14bDaVPnZww6QyTtTmco/4+OQDnYwt0PbJz4/xi9wUtlOqyineSmVfUVAt1H+Yu8hI5gc
	TB+qQyj6lxbnRffNzfL+GsItzhIXp7ZjgYuMkBNazPBZhVOhjUY/5qDNy9Y9H2TU0Q/Xgw3Yf3H
	9qYVLedq58hA5SM96MovzAvHcfoEG/xqgRDk1XZawry4o1xCBn5WsS9DHXSLvLBlja9bfhSJwUy
	d/fEyzfg9H
X-Google-Smtp-Source: AGHT+IHJXHcPgEAUSAbm1YoDwVGoY/1RNkmQlorlt7k1gHE9eLxv92UAKza/mr79QwdhaptzFFUjKw==
X-Received: by 2002:a5d:64e8:0:b0:430:f687:629b with SMTP id ffacd0b85a97d-430f6876460mr10915541f8f.4.1765898579222;
        Tue, 16 Dec 2025 07:22:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f280cf05sm21933938f8f.7.2025.12.16.07.22.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:22:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-django: upgrade 5.2.8 -> 5.2.9
Date: Tue, 16 Dec 2025 16:22:56 +0100
Message-ID: <20251216152257.2577206-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 15:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122698

Includes fix for CVE-2025-13372 and CVE-2025-64460

Changelog: https://github.com/django/django/blob/5.2.9/docs/releases/5.2.9.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-django_5.2.8.bb => python3-django_5.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.8.bb => python3-django_5.2.9.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.8.bb b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.8.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.9.bb
index f205b5b247..c0aff44a78 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "23254866a5bb9a2cfa6004e8b809ec6246eba4b58a7589bc2772f1bcc8456c7f"
+SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

