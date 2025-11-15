Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A856CEB2D4
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:00:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8040.1763211608173349051
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGUYS0+W;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47755de027eso21093985e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763211606; x=1763816406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZbE1Rt3Iv2vwMQQTdJ1QycAmVOmdFOGPDoXVW6kMkQ=;
        b=VGUYS0+WwXi2KaEDIvMkGywF/6kkhOQnFmAhDhMYEl0cK3cax0eTlAFmhczzeNcjND
         wFvcX2eNbbvRNzQwgwiNc4sfjaBuh7YyPh0JZ2fsFeUWkdxy5tBZztIsoUsoi6uMFAqE
         IbPvMH5Jasi+dJLu6jOTTJ85E/4PdcZM2+AFw7DbglnEum5WXQ3r5JkilzrZMMyKDG+e
         kaZzJptVv/oLeQvlAgRP18yfyW3t42w0NGhHMe1r0wPxC551UMdsYhxTtPBjYD5ndU8l
         jWbp4y2DeuQ0UTliP4sNGPtvhGcMC/3AN1eshO6G3Bm884nr1J2hWlaMhfARj2exXbkT
         5LEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763211606; x=1763816406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bZbE1Rt3Iv2vwMQQTdJ1QycAmVOmdFOGPDoXVW6kMkQ=;
        b=WlKUcR1DsUvZ+1ET5BwK3B4bedmHBummX5TVwJBLE+L0ZbRd0GMLMkefPxwfWCmf/h
         vHacZl/xEro1mFUn2yPu6eEYjQN9MGCNqasyaNUUNje1k/9pevTP71twRO8MgbyXY+ym
         kpQ1jc4A8WBrYMn8uQrH6tWPQ0FV2gpZBlpVrFE/Q+XLc1zv4CVuULFvvi2fZis+uylU
         W9xpeQMs+HPXhhwAT6pfOb7pU0XHVqJVG9bNaFXMmfXiCoxtQPIFrd7RRlCXlxsy0GS+
         QDgNvoY4jH4ywbksSiZPktYgWcW47dKY+lfCK1JK4Wf/ceOYOBFaGp96TkNEP0FW3fw9
         rXhA==
X-Gm-Message-State: AOJu0Ywlbe/mwmTYQwBhW3cJIeaj49+kqw5Vp+WExECjdEUL7TtmuL4v
	AbNfEIoVU3flU1tFfUhaiS+oM7uobbDhX7+ly/nvQEFMf0tZrSsiifUTMosLvsaT
X-Gm-Gg: ASbGncuCWkn1jiBXzqCCH4vfhDdpN3yHpD2PWfDraWXPb9zgz6MrA8dTe8aEkE0m+/v
	Ec1UWOrhmWiUKSBKFctFso3pHzWFBr2jEiYIS3OaOP9OWklMJQPjGhUjw8WZrDhIuutWUlDF2hh
	LIX4v/OFgmAXtHkEFipzNaIUarXU7jYLaDmhZX6I3KZXWWQ4jAQXJP5Qjej1ytbfO591NLWj78k
	q6P18g8WTc7NCtr9ZEIq949jZN3tAlNkwlIG0deRvO78NmRIOb8t8CuWseUSOL/6i2bgypYypxR
	jI9UQcro8B/ilIHvVsWNRfVc/TTVZpVwUpLxwWQH4Vm3TzXlFI2CPQgbOKgfwtxE/n1bC8uFdKp
	OpoGGhFQGWigjr3cJTZ/ren+VYgfFvS6K2myZhYcLFiN5V3oqJUxD1lJXwj6iQxAudZWy0PCS4g
	ImXuQr6HtD
X-Google-Smtp-Source: AGHT+IGr8IUMmSgw1aju2uVIefknb0Jl5lG80IAIQhiJmYik96XLT3u3bnUXfL0ZwzUKt/weW9OZ2g==
X-Received: by 2002:a05:600c:4e8d:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4778fe41c0amr23307295e9.4.1763211606267;
        Sat, 15 Nov 2025 05:00:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm198104075e9.14.2025.11.15.05.00.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:00:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/4] rsyslog: set status for CVE-2015-3243
Date: Sat, 15 Nov 2025 14:00:00 +0100
Message-ID: <20251115130000.1121405-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115130000.1121405-1-skandigraun@gmail.com>
References: <20251115130000.1121405-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121729

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-3243

The issue is about file permissions: by default rsyslog creates world-readable
files. In case a log message contains some sensitive information, then that's
exposed to every user on the system.

However the rsyslog.conf file that is shipped with the recipe solves it: it
already sets non-world-readable default permissions on all files, so this
vulnerability is fixed in the default OE recipe.

See also this package in OpenSuse[1], where it is solved the same way.

[1]: https://build.opensuse.org/requests/619439/changes (rsyslog.conf.in)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 3 ++-
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
index dbfefb7597..6316efb629 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -13,7 +13,8 @@ $ModLoad imklog   # kernel logging (formerly provided by rklogd)
 
 #
 # Set the default permissions
-#
+# Setting the $FileCreateMode not world readable fixes CVE-2015-3243
+# 
 $FileOwner root
 $FileGroup adm
 $FileCreateMode 0640
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
index af46cc14d7..59944cd70c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
@@ -37,6 +37,8 @@ SRC_URI[sha256sum] = "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_STATUS[CVE-2015-3243] = "fix-file-included: The shipped default rsyslog.conf contains the fix"
+
 inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"

