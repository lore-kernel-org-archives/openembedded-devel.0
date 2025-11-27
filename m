Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D03D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:17:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22133.1764260234161060187
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRygk5CK;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so6988115e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 08:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260232; x=1764865032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xpZ5ZFd3FI7uzgZlrbaDm1+QQLcJlZwi7fmetXPl0o=;
        b=NRygk5CKdjKaUcAL56FKvZe9ncDOwkk+hAcUOk1jmMHj4iSRnCJuzRTW2sZHEfiiTP
         AsbQ9rFzx7F0NJS+A1VVAZfZuNr5qcs00rGKcusZBEr+unW+61GYogHr87FG89c8iOBr
         gOw+sk6+/cecCqEGimEoH6mKe+1tluv2thDeSsSGBJX5cd70wx0TcOzfeYOMi7X9IcsR
         ER2Hk0tF7kDHnIaCVmwTjxZeZuLk/GO3wc3nGlOWASzTtacNl5wib6xXtT+Af8e+NGOx
         rpktDmWc6Qy/2bF3RC6t1khqIBcTi2+9QI+BH7mLNShK97d5OPVnZKIHt7gc+xS+0F8S
         MBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260232; x=1764865032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xpZ5ZFd3FI7uzgZlrbaDm1+QQLcJlZwi7fmetXPl0o=;
        b=MPYGI4AbSftyOQS2W2RGi3VstS/tXafkN97IdwPaCRpeALmhxjmV7fahF2++B4TaQC
         Bho3a2dfJL12AuZEfh4ty/qxGBsAoE86W99iLWZFQgThb77bxiW//xR0ojfJk6gIhBJD
         m0Bsg6hHR8KCbAvfcjpHhCwcskO4aRC03Sfi1HcYm4T5/mswpqLhTIj7GCpiBmn/FSkD
         aiT/62gkZ2qaXFyYWD2+eI1Pc/7V2LYCu51GSCxYYq2810KLJbFMWo/xA5mbT+R6PbJu
         n8pFiCsM9G4IY+yfDiYDl6ACa0hkRZRLN9aejhZcMgac1E0P+ygTMn3+FFXzTdP1tAqD
         iTkA==
X-Gm-Message-State: AOJu0Yy6D60led8bdPJfBpCrhIAieuVQntIZXC65yYVbqliHo9BtCuD9
	zxrr0TQjN+PDl/jtCzv7UYtl7XfXr4I6wklsYWa7K4YeuGXayovssOUvwtwPvA==
X-Gm-Gg: ASbGnctUSwABWBFudc65ICNJ1/jY6vrFKgwJhDMj+dYLb6UWmyrmgf1bYNKSM7wQvHE
	q1Qo2mMSSY94O9f+7E23Vm5NQwW1lxaYbCSg87T/xLodORoM2e/bcM+/tHUKoI1A8LFoo7tnLpt
	WZ/T/Wliqv2cAuldJOv6P3xgBULbswxwPLn4QOzJzm3hgHecV6Jg2qr2lJob1fWpbbzu+tPe//2
	2fp1QtOzof/yCau5H5/ak/8jWxTAhuYgKEERBMJwaqzZgeX3N44EpmT2jkX6JEQ2rulQrbg4vT0
	w95cAMvRUGgDt15zxI9s8oBvg3XFjaBq1WBxMGxkVQepLYxZI5lQLP+rX3lLhoRR6tK4FoDYEIn
	1JhmjUlOaGByuyxcRBj6fuw+slTERkYfdZdexsqoU/Xhpiqd8tSsiDLtw7UxSJLB40qXFuQWtYA
	urkLsH0Z6Z
X-Google-Smtp-Source: AGHT+IGhuWWc0XuH0dhWDn5cscb73YiZ7NlC6we0eEzoYJKoyQPtW02h4geJqhGzoI1xxL0ho48yEw==
X-Received: by 2002:a05:600c:584e:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4791348c68emr14782735e9.26.1764260232361;
        Thu, 27 Nov 2025 08:17:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040ac7e8sm75263665e9.1.2025.11.27.08.17.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:17:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] dbus-broker: upgrade 36->37
Date: Thu, 27 Nov 2025 17:17:09 +0100
Message-ID: <20251127161711.2341194-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 16:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122110

Changelog:
- Add `/etc` and `/run` to the search-paths for system services. This
  change is aligned with recent changes to the reference
  implementation.
- Support systemd's `notify-reload` to trigger a reload operation.
  This replaces the old `busctl call ...ReloadConfig` operation.
- Extend `org.freedesktop.DBus.Debug.Stats.GetStats` with all the
  fields defined by the specification.
- Fix a bug in match-rule processing which caused argument processing
  to fail for any but the first message argument.
- Fix a memory leak in configuration processing when parsing invalid
  user or group IDs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-core/dbus/{dbus-broker_36.bb => dbus-broker_37.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_36.bb => dbus-broker_37.bb} (93%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
similarity index 93%
rename from meta-oe/recipes-core/dbus/dbus-broker_36.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_37.bb
index 8959927a92..f0312181b6 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -11,7 +11,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b"
+SRC_URI[sha256sum] = "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+)"

