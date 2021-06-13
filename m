Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.23470.1623627170022192622
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jun 2021 16:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5Nnb7+S;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id y11so7205742pgp.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jun 2021 16:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kZ2Z6OdqyfhKsOPMaA9ASj1bWTw/NQwIfidKCdm5Gws=;
        b=n5Nnb7+SJNDVCGx9OMvxLVusdoc8fzMVzufBd/BvuXBS1n/h/3kfyu5S0UX8HerwIK
         0W/QJzFX/+zEpYRu0ahgiPHRASa7TfTiEY7lvxUGzyTSzg9Bs+Es4v180YanL0t0o1rR
         R9xEBY55zJycD8HoqZ/sN3xkNunjSeIeXTK0QrRzpQIyJLy5+wzz+9f8mMhY04MDT+48
         UgcjWF6p6VPQQXZNzdd9G2G/4ptKeb8nbj5Z+y8wgQntVBHwgsbPPlnqxU6hoq0egA0k
         wJBZr6ncCE2kiHEiJwYtktut1z9fVYSdwP4Bn5OnzYyOJJ7aymRg4vfXFhE6fO7+OcPi
         Qnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kZ2Z6OdqyfhKsOPMaA9ASj1bWTw/NQwIfidKCdm5Gws=;
        b=kOFSS/KXSqygFfgliD+t3UhRUYLg411Ee/OvLTb4ElCojUnZcza5G5riuJ26iEefMm
         75rHIGf3L7BgwFK4uE0OfWkQXDcb4JhL1XrmWy4KwuB44YtGffoxO53iM6P3Z31VLS8E
         L10fsnoDZInuAmaqIqhFsqe7L0q2Kd2Wac6ODjdfsdcC5WTUIwOMWooNjGHC2w+MrFjz
         vqrRjjwvRBC2XxbJ6xid8Jl5ZCf2CwWLQYo1KR5SOJ9pJVXr1t+rs0ApoQB/nPB15eER
         /Vg9pSAuH3S4MEPvUhf6uJE+62ZZGLKB7kIfQjmloJEBTkVa2ytgT0xTjD4R1x09NihL
         /jFw==
X-Gm-Message-State: AOAM5311N6QEFRkeVBIaf3+7o+/bfmxFrCZ0nToXhIn0f8ayDQBpiN/u
	PGLvQ7KMShgWj8c6Ps1dy9uvNag6k9jpkQ==
X-Google-Smtp-Source: ABdhPJy/sQRa+cT8A6T+VjcQ/d3jD+WeyTzlbyJuL1Z6/uAwkjnT6feigvrYJuOoRFOPN6PRBdTYeg==
X-Received: by 2002:a65:46c8:: with SMTP id n8mr14778419pgr.301.1623627169295;
        Sun, 13 Jun 2021 16:32:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id gd10sm9933924pjb.0.2021.06.13.16.32.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:32:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Hardknott 2/5] nss: Fix build on Centos 7
Date: Sun, 13 Jun 2021 16:32:41 -0700
Message-Id: <f8bd86c9b2f7ed5d15e04af585258987410ab89e.1623627089.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1623627089.git.akuster808@gmail.com>
References: <cover.1623627089.git.akuster808@gmail.com>

From: Marek Vasut <marex@denx.de>

Centos 7 has glibc 2.18 and nss-native build fails due to implicit
declaration of function putenv during build. This is because of the
Feature Test Macro Requirements for glibc (see feature_test_macros(7)):

  putenv(): _XOPEN_SOURCE
      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
      || /* Glibc versions <= 2.19: */ _SVID_SOURCE

and because nss coreconf/Linux.mk only defines

 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE

So on such system with glibc 2.18, neither macro makes putenv()
available. Add -D_XOPEN_SOURCE for the Centos 7 and glibc 2.18
native build case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30148b33b5d750702d7749ac59d8d740d8cb7024)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.64.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
index 1863db131b..9c4c03df99 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -49,6 +49,8 @@ TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+CFLAGS_append_class-native = " -D_XOPEN_SOURCE "
+
 do_configure_prepend_libc-musl () {
     sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
 }
-- 
2.17.1

