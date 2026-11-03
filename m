Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1481.1793731034100259543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iOKnLdwF;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6762528c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731033; x=1794335833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA1XyhPYKdRIPYXVs4oW8BD/tm3+zwDJwYWOpUU9ygI=;
        b=iOKnLdwFMBQ21cXzVC7Q05uQS/k3RiW9lx2Ae25jBvebqLTMhzwL1HaKnW9BuYFbXm
         8UXZBk2ocjOBHuXcf6syCAC2iHPW6BwWoSlUnSPBcWm8rhvV0V0WFvjM0m7TtAMefmjt
         H+CVyUFNksJ1q6KlGYpaUcilKNNCtc8H1UzbXxY2T+i+jv61YXaryKzo33gI3ovLgRId
         48VrlGdQ72Fzk6OV5v4ZnKE80utpUCBcFiS5TzzL/mCSVE2rCFTF4vl2+lxvrDOW64Nb
         +3DHpxQNw2jh+adbsbf1CnAO8dlOe6qKVt5N1v99w9WI6eq7hLnrlsUL96e5h4Hra52q
         ytRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731033; x=1794335833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA1XyhPYKdRIPYXVs4oW8BD/tm3+zwDJwYWOpUU9ygI=;
        b=d0zAMpqmZ4Uz3uBsJITXRrVG1nMtLFZgx43T7hTkecxLqQtOdUQ6R/PYGlUxAgt5iF
         tHUr+qfhFzJaFo9niXJL9YXM7lYJdWy34t0h/HF8/Gy22LOJvrgLktOMuJjG/uXIG/tG
         1Bsn0/MNY/vrHwMMn4lqtdgcILyEZYpFIhF2QVFQvtkxVwaz3nNaYw3BD5FL8yMHvofS
         MM7IOt49qEZquCJDtK1PeaZtCnUy8WLl4qFEjcdJBU6bZbDstIPeHSD2SHEQCU1saAub
         n2e1jIk3quTUsLl5DTk26QZ0paYzoPMwsDvA3SPgnq3FInlPvh1f6D4FjA9WHfXiFW+S
         XKnQ==
X-Gm-Message-State: APuU4Z8c+35pcYbTXYsutcLjRvn7RCcfps1b2qWIv1z8J05UmFjHtbEj
	TcokuoxuO+K3NSZgwXX8e7DRtaenTgFXEUfUXAERf2GscYmdFQujau+t251ogw==
X-Gm-Gg: AYBFou11MQJNWwIt2Ha0+FBWBWvPZuyGLCzrcocVdj6EeAtJWwJSi9XbpuTR/QrwXRE
	ib5oHRoIf9ywNfA4Ne0WRuc4cIddhzBetNqf3Po2DVVR51rQJr60+gBbj4+5893p8MJTqAUWvtl
	eiLCyKeJQSlRyDr6xOCNeQThwwNVOjBPl8S9jfdmTm9IJkPnbSl1QEi30ux0LcbjLX38NTVaFn8
	zbHfKJYZy12d6JqumfP4zIXEc/R8pLNKTr8FHtxtW7shAB7DoYA3PtMGoYM9W95SjayTn9REovo
	t8D/jQ7bEbhhPmR7T0T3sEn+J9OBQYaMpLXmIigAgUesUETeT4oeax5vrnXBiMzxpujcVFSwAyN
	KxMzCRkZ0P9XziTuBV+0PuUxB1KForVfGzULp7SMgFmkl83kEvjoJC1zXUiiCrrQ5/Y+9KJjhQm
	my40jjvVZOcHW0JdjTt0rRHflf2FtGGnvhTVfHe9bAA3p5ts3twz1psXlsibTE/1Vm8auPUHy0/
	alR0BJPx4nsjmFwvwRMWUu1ifnlNN/0fGgB/LkwAX0+phUx0xVWGyXGWk8cVxMrBZ2IsUWiEn47
	iWDbdkYXjP2NnYScewdI58WDtoUgto0XcLpoNPyD4byjlDzH9MavKtAytz+z10t4
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr22219622c88.24.1793731033389;
        Tue, 03 Nov 2026 10:37:13 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 14/20] toybox: upgrade 0.8.14 -> 0.8.15
Date: Wed,  4 Nov 2026 07:36:34 +1300
Message-ID: <20261103183640.919438-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131812
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://landley.net/toybox/news.html#03-10-2026

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-core/toybox/{toybox_0.8.14.bb => toybox_0.8.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.14.bb => toybox_0.8.15.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.14.bb b/meta-oe/recipes-core/toybox/toybox_0.8.15.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.14.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.15.bb
index 80ad89d4e7..473db46fa9 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.14.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.15.bb
@@ -10,7 +10,7 @@ inherit cml1 update-alternatives
 SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            file://0001-kconfig-use-HOSTCC-to-build-the-config-frontends.patch \
            "
-SRC_URI[sha256sum] = "827e4cdfd69f5da973e00e2a59b30b3c9857fb7fae74c362fd0b4f96be7929b0"
+SRC_URI[sha256sum] = "44e2bab43dfe2c171743297631ce558c6d9ed38b87a66fd751cef617574b375e"
 
 SECTION = "base"
 
