Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4601C9EC77
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31000.1768216823711861000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 03:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Egs5KB2O;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so45718325e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768216822; x=1768821622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu2Cky51lqz5Gcq0WdV2UWfA1/HdBe0me2pproHykw0=;
        b=Egs5KB2Op4tsNX0ZfWQNWKwoqlz305nftIIUihwJ6XrrZ2q0vrsQWeqLBTsYO9Xjce
         2R2iyjsyV464cLxz2o+U+oZGuA8KX4XurlAlXjXzUGiMCBReDceBrE35ybbaRDZDQ6zO
         kvXBLjU3CJ2TO1Dn2F9JTNTnlFa22qWHFSa3qgQ0XmiYGdqKFfNwYO0WJ1WuMOrq0Ryz
         zG76t4WJWTMp5P/tQsLz429cxf1K220X+Mmt1le8xQw10V+jurlqU7AAUJKivPw/up6/
         GepLu/Lw6j6bSoByaFQkiVNOOveq11fsK6KxeE0N2e+mg9zeYENTwWbNaEk/azlzuYFE
         PofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216822; x=1768821622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gu2Cky51lqz5Gcq0WdV2UWfA1/HdBe0me2pproHykw0=;
        b=SBZ6VZ/nZfqVirJ3EGvqXSqtOg0xJ1J75gw7tJsgg8yrTzhy02ZwhI1ev5HlCAiUd7
         c+vmb8iWn5gH9N1xQ3ldk+cTIlE0v1hoZeKAQfB20++2wz3hjNpI3WYcjEEDfiHpSJB3
         X+Wv/NHgFpryrHotfdGo2D9XWq06nrBIu4X6lHvYhQ0zTFWj8I/t0Mgyr/kDiFpJxa0m
         Xgo/eAcoc8jTRfYFKntO+A5abWZS/BnATPjdm1BFBUPM6XxXk7QD1Zl6IZ4bdWF0NKHZ
         //7QsO5UlxEnxzlBKIxiqgHGFE0WnQKLJX1wjLF2ISD/dGz98SFfFGU4A0tx7Fkk3JmS
         WDAw==
X-Gm-Message-State: AOJu0YxTbPkVaNdP0Tt3669c2ulQkeP/eyIaMrvxUHV4mZz1ihm1yAg0
	hZOYzCZrUAFO6H9z2FHS9mKUYvS0TBHaH6ySqTi0pamyddUDRGE+YlNjcepXXg==
X-Gm-Gg: AY/fxX6/+sRErylyXAx1tAZT7DhXL6MF1hLFlNB0PAaOJAAcgGoWaeIW/7rsxFdOkI/
	GGZ0ZbUhzQBMMH2SiCqPSEGCdSVsbyaNU3V4H7YWRePhrrjY/rx4Wtpv0IZVfOE4/L7sBgiH4LD
	cAD00Vv1wHxaQVMGqPoWsRbZTkMWYuIZSq4C2uFbSbNhCFpTASFesh6XSBWz/nkghE/OfzTWPDi
	H4YWOw0WH1i6PAu366M0hYdVUZCs+g+XMDAZsz3JRVPDlltZi4NeuOSmxPk+4osxQBFJ0tr/WW7
	R6qALbV0bWpO10YORHXYvh3j+aXdBW9FT2um9YD215QeWBc3AMvLm3epmxUi7hECQnEwTmeZD0c
	htHE811H2CsZ0kWwlog8I0SUsJZmjL70JBXquLFJ4190FaRyZWy5pBQ56nSvPNUU4aXsR3OJY1n
	ibf913ol+iI3P3rbCXTiA=
X-Google-Smtp-Source: AGHT+IHucfZKuD45FoDenCJVLoFjeXwYIAZg7ZRXEBBgt7W/ibJDIpzm7DASR11m3pDnO+WmilWRvA==
X-Received: by 2002:a05:600c:4ed3:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47d84b34785mr220161925e9.21.1768216822038;
        Mon, 12 Jan 2026 03:20:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695225sm351382935e9.4.2026.01.12.03.20.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:20:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 5/5] squid: upgrade 4.15 -> 4.17
Date: Mon, 12 Jan 2026 12:20:16 +0100
Message-ID: <20260112112016.515266-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112112016.515266-1-skandigraun@gmail.com>
References: <20260112112016.515266-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123381

These are bugfix releases.

Changelogs:
4.17:
- WCCP: Validate packets better

4.16:
- Regression Fix: --with-valgrind-debug build broken since 4.15
- Bug 5129 pt1: remove Lock use from HttpRequestMethod
- Bug 5128: Translation: Fix '% i' typo in es/ERR_FORWARDING_DENIED
- Bug 4528: ICAP transactions quit on async DNS lookups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-daemons/squid/{squid_4.15.bb => squid_4.17.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.15.bb => squid_4.17.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.17.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_4.15.bb
rename to meta-networking/recipes-daemons/squid/squid_4.17.bb
index 575ad76ad3..b0b13f72d5 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.17.bb
@@ -43,7 +43,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[sha256sum] = "71635811e766ce8b155225a9e3c7757cfc7ff93df26b28d82e5e6fc021b9a605"
+SRC_URI[sha256sum] = "acf5c3c1707695147226742d1d6cef8993bb32536a622743b51514c3cb501da5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=0e03cd976052c45697ad5d96e7dff8dc \

