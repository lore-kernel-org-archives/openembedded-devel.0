Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A150BD6ACFB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:34:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40894.1766061289301021125
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emJF9uvB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso2453575e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766061288; x=1766666088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yg0OfO1kh+fLFxq7P0Jro74hLEiPwCOkjTL7swAg3Zs=;
        b=emJF9uvBfu4yGLmPKAiMvwq7MjQIlaBmWnilmtNWxjGPedyXxXl3vUfng2Yta6Wefe
         KZSZmPDsUryR9oV/LdBOV9eH/DKZAC9n5q6kvR0R0xfxCAYXU1kZ3J3uhnw8mB5FyUd/
         rvYyo5oEboFVE77UNyhxKIaLZmFUEOfPD6k+Ji/fytH+A775hs9TkW3Q3+k3oF9SgXqC
         zPuti+bJMFhgXwQILQyMVkrzU4HRWr0NqnH2kJ4WYhV1e0UexuYcLBZJBVlUtPn7zq2m
         l39bvViSqqwh/Wr26nhHjYJZSSuFXzYS9GKb0mnTuxpFMMPsZD/MkVBGY+T455+c3GjC
         oaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061288; x=1766666088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg0OfO1kh+fLFxq7P0Jro74hLEiPwCOkjTL7swAg3Zs=;
        b=Y/3hvv2hTGxnBdswbUaNdbwXK0einnq6qvEWG5XI9RIsXrktsd7pB94RxBvbNGHR6X
         0d2j7UvZpO2mYws+N8jqO5V1hsfYof/XKBCEp2cFHieTazZ1i9p52FhB7odmaPH+Q0dl
         5PmnEdC28ltDWbUUt15UrwZeQ9SCg2znYvd4zLD/zz3FvpXStbG1VFCrJnjXemVHyUTi
         leKGWdT5eZcm1CQ5PpYbSLPGJ8d8bjEHMulTx8YRRY04ldiHdz67Ut3k2X2KoiDVsg83
         BLFF2Lrgy9ysSDjysVrNCaTQqiwxTtswlBQIfdSwzy0blFRPZlCHKj3ITpSZEXVNXI8M
         CDbQ==
X-Gm-Message-State: AOJu0YwwK1uTJK+FxB+w10n4EOYgYPan6zXXUpA/L3OyU2D96ZrSs0PU
	HJ+KEZYaYOfvpWuCtZWtbYjWAI4CAa7DnCmTgQ9ziMultVF9IlNL7/faBWc/pQ==
X-Gm-Gg: AY/fxX66o/zW1MiXmMt1vgifZDcvDpc0YjPjozf0T9oDZkHsDXI1BQ5H2kHNfAPvOYB
	X9aUKhH1aNfHkwxbuHFVg1+5dTNwDsdiUeOKRO1EX6sdL4fMGxwEGCOco/XFLZkNns7Fc7Z68/7
	cMmp+ckNTcqM6QayDWIFKWXKV8pidC2w1fn1cj9rAwozQatoSKfwwnJWGfQ7WBAsWweQqvb0k+q
	NCJKtQAifEyi7je/il4Zu7EPWYQVSemPGk8AbfMfB9pN+BwXnQyqHlkKfPTKBlJR1QZeKdNkMGx
	+kuWgN5HilyzM9XIf1PMIgYhmCepZDIZNT5aAoVWv+d5yji9xNLPRiwVq7GRvFqvdMzXogpgj+D
	Wzhhppvmm3Z44vBk0J8n6hJ4I0qFhSKUVis5Ox9ai+PQ47qVGs8j7k5YMPmqs33dPhEmaL1fpmd
	vqqMgP6uHi
X-Google-Smtp-Source: AGHT+IHLTe1w9rGcViM0gFY7U49+8QYoHas3TtycIkv9vHIh+f77ACfgZGoPFFB04ZGzOJ41TNxKUw==
X-Received: by 2002:a05:600c:6290:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47a8f8ce390mr270761455e9.16.1766061287480;
        Thu, 18 Dec 2025 04:34:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a3ec73sm12679035e9.5.2025.12.18.04.34.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:34:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][kirkstone][PATCH 1/4] xfdesktop: upgrade 4.16.0 -> 4.16.1
Date: Thu, 18 Dec 2025 13:34:43 +0100
Message-ID: <20251218123446.3489941-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 12:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122760

Changelog:
- Resolve deadlock on background change
- Allocate memory after error processing
- Remove unused function call
- autoconf: Remove AC_HEADER_STDC
- Do not delete property not set
- Set a pixmap XID, not the XID of the root window
- Fix next background
- build: Fix intltool lock file problem during make distcheck
- Increase opacity of xfce-verticals bg
- Fix Applications Menu memory leak
- Fix gettext extraction from settings/xfce-backdrop-settings.desktop.in.in
- Translation Updates

https://github.com/xfce-mirror/xfdesktop/releases/tag/xfdesktop-4.16.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.16.1.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.1.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.1.bb
index 4a1ece8bef..72ce890473 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.1.bb
@@ -8,7 +8,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "934ba5affecff21e62d9fac1dd50c50cd94b3a807fefa5f5bff59f3d6f155bae"
+SRC_URI[sha256sum] = "e31dcb0008ae55e99e42128a4694002203305287434a8ee0f9937e7298a4bd11"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"

