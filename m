Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.2220.1614830111477640568
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 19:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RFKNML1z;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id g20so15381251plo.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 19:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qVQnLpICY6mB4sIvcrHD4dy9uPDgMpcmzMqC+csISF4=;
        b=RFKNML1zkNEe/kvlh/59ryDRpySZSVaWTsbiFyoPS/stFcB1cph20pdT/1CqPiqdGU
         8bt8etR0zQtZbTdDr7SiDXbVwPNmLj+TuEqvXVROEa+IBMAXHUHbkPKbiCW65B8toCgv
         WXzZzud+jnaor/19dJ+MfqyyUtjm+4mQhcjYsH0YIMr9vqCzzOQzdOcCrhgU1X7JJyGq
         iTXs7jx3gC+EzntRgFoyfvRmUGjIxZuzHs3VSQbppuhWKZXybOA6n2xZKtt7+40njvi+
         +o1w2fAODdqyivKKB63g6SZHak8Qg8D2QN2GXhiO3yVcJMInt8GgYNUHAeNYMaNtCNS2
         79TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qVQnLpICY6mB4sIvcrHD4dy9uPDgMpcmzMqC+csISF4=;
        b=jcQVaNZJJUhd2DpfXNNPOFoSHnhSoEEfGNkq4qjGbo8rOsnDpgFr750YAH233CLZXb
         UHjpwQiMg/Uy/UnF82DxYj5X55O8AblDqWCz/sJEM9+its5AmJ4fEK6279lDXWWqqgr1
         yqWOJ6gWHXVlKGmeOmNhKcJkDrnNH7BIcY6slL0wM8OmbOQak3SE4Ls32gNcSaRzwDTZ
         S1au689CFA+wpUzS0xP/dwcNhzS2s42bQo3Uev9cQ+h7kWOj2AqwFmVMHOjcGS4jCAOV
         nTngQJmSMg9fEG0vn5xfaa5+J2GAi7oMrbtk9UrYKnV+nRNrosOkoYdVfsrguNC+Te1p
         nKFg==
X-Gm-Message-State: AOAM531Qzhw4Wz5/lkPr3WvJIa/uNmN/gL6eg9YXU0Qq5EuBk3MepEM3
	i3SptGV2W8sdQUkEnx9wk9aT73Ed/cd3uw==
X-Google-Smtp-Source: ABdhPJxzQJoGD6LT5UrOkei1rxxc4/3+BGjjXe/r4Zjgf7YHQNQmNqxjHskvoEyR0jzPQQfwlba3cw==
X-Received: by 2002:a17:90a:4882:: with SMTP id b2mr2299047pjh.78.1614830110559;
        Wed, 03 Mar 2021 19:55:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id n4sm25477494pfa.188.2021.03.03.19.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 19:55:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libyui-ncurses: Pass -DNCURSES_WIDECHAR in CXXFLAGS
Date: Wed,  3 Mar 2021 19:55:07 -0800
Message-Id: <20210304035507.1405131-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want the wide character functions from the ncurses header.
Unfortunately it doesn't provide them by default, but only
if either:
 * NCURSES_WIDECHAR is defined (for ncurses 20111030 and up)
 * _XOPEN_SOURCE/_XOPEN_SOURCE_EXTENDED are suitably defined

So far we have been implicitly relying on the latter, because
for GNU libc when we define _GNU_SOURCE this causes libc
to define the _XOPEN_SOURCE macros for us. Unfortunately
this doesn't work on all libcs, because some (like musl libc)
do not define _XOPEN_SOURCE when _GNU_SOURCE is defined.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
index 333163deba..a3a4a15066 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
@@ -21,6 +21,8 @@ BBCLASSEXTEND = "nativesdk"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DWERROR=OFF"
 
+CXXFLAGS += "-DNCURSES_WIDECHAR"
+
 do_configure_prepend () {
     cd ${S}
     if [ -e ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so ]; then
-- 
2.30.1

