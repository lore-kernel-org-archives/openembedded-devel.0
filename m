Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5B1C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:19:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.79776.1674753559050651938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FFIc8hv3;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3688750wma.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 09:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3l9k72+lGiNv55CnKmxMBre7Bf+UbXE6CzHjRsrrW1I=;
        b=FFIc8hv3OtZ/He/2knEOVbkD4YiFYVJ/H+JEGZGlF+foRmT7TN15X9PpFB9aH8Glxi
         KsJU97N0NVC04TzjMO2f4R9L8lC6erKGJOrvd/U06MtQtotLgr6lRsjgK6LV8J6gCd1U
         6RZmKAWt0y48xBrk45UfIaNjFFZoC0CtI2JoS3rZfBvPLSdOq9V1USy/Ja8XbeVE0tKB
         ByaoJpM6MOwhu3z4Q8KrKKrLtm2qY9ueqWhATNtEB36mbozPS//M+QCAjPUbkW8jhO+x
         1KivH0b/39mdjJW4nPjeRVYAUySkHRn9OVO5zAyF8KCzVogj7ni+C8dzassE2B8/9q7t
         IEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l9k72+lGiNv55CnKmxMBre7Bf+UbXE6CzHjRsrrW1I=;
        b=5PQMqAv3lFBzem1GsWCurFDPgDVYsFKk7YtLjyk7L6VGSiz9I5MLd3qHbuj+KON+RI
         VQhqnh+l2pj+kFjUr0gwhfF1OX3KWeCyzz+WWrUJYzqLct9P7QADMX0NeYBHWQ3l2NE9
         CBYJaMn3Xdy8tnAJwmyZdkzcUDa+6MGKfDrVYuIhoROOm24ETogSbHq7f869tiUSO/U4
         r+yDkEY+OD4o67ztWgYwoD1s9qgReyPxTV3sFsrA7V//LZQtwbijXiZ9xBCQaMTxXDHd
         xhA5AYw1hDUUDg/hPxRQTsoWc/7sbBy3SC8UZEtBLJl4wyEfacrNpqDki5UZDq+6n3G/
         YQ5Q==
X-Gm-Message-State: AFqh2kq3/HZafd17mMIFV4M5HkpnD12FtPGkzAT8HS08HGq7kAHVqvGf
	UyYHnY6oQrGeV7lHTbnQUejMwP1K2Aw=
X-Google-Smtp-Source: AMrXdXvSxo8e/515yIOg86C3uWiYcQumRmtBUi+lWgj757x70Hky216ap1zCjqe2C9f0S05cklZz/w==
X-Received: by 2002:a05:600c:3586:b0:3da:fb3c:c1ab with SMTP id p6-20020a05600c358600b003dafb3cc1abmr35812209wmq.0.1674753557386;
        Thu, 26 Jan 2023 09:19:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j35-20020a05600c48a300b003db0f4e12c8sm1929317wmp.34.2023.01.26.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:19:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] s-nail: fix Upstream-Status format
Date: Thu, 26 Jan 2023 18:19:13 +0100
Message-Id: <20230126171914.2838495-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 17:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100797

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../s-nail/files/0001-make.rc-set-VAL_MTA.patch                 | 2 +-
 .../files/0001-su_INLINE-eh-no-give-up-share-detection.patch    | 2 +-
 .../files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
index f4decda141..9007bdbd41 100644
--- a/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
+++ b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
@@ -16,7 +16,7 @@ Fixes:
   # which sendmail
   /usr/sbin/sendmail
 
-Upstream-Status: Inappropriate[oe-specific]
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
index 2afaaac016..41f98281f8 100644
--- a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
+++ b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
@@ -4,7 +4,7 @@ Date: Thu, 9 Jun 2022 18:26:38 +0800
 Subject: [PATCH] su_INLINE: eh no; give up, share detection with clang but for
  a thing
 
-Upstream-Status: Backport[https://git.sdaoden.eu/browse/s-nail.git/commit/?id=de2a44c393a39d80ddf12154aec94cace84b19c1]
+Upstream-Status: Backport [https://git.sdaoden.eu/browse/s-nail.git/commit/?id=de2a44c393a39d80ddf12154aec94cace84b19c1]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
index e011f5c712..37ecb0c1ff 100644
--- a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
+++ b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
@@ -3,7 +3,7 @@ From: Steffen Nurpmeso <steffen@sdaoden.eu>
 Date: Thu, 9 Jun 2022 18:06:04 +0800
 Subject: [PATCH] su_INLINE: gcc: only GNU specifics after -Og
 
-Upstream-Status: Backport[https://git.sdaoden.eu/browse/s-nail.git/commit/?id=c5544b66c3b4b2e161166562349908a07e324b38]
+Upstream-Status: Backport [https://git.sdaoden.eu/browse/s-nail.git/commit/?id=c5544b66c3b4b2e161166562349908a07e324b38]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
-- 
2.39.1


