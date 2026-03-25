Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA729103A9A1
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:45:09 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14320.1774406700964318337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BUsFHBdI;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ac94fc3ffso14150417b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 19:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774406700; x=1775011500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EZAaTOrATdolkAw865uKHSUNug9ueNqBBrK6qiMkPc=;
        b=BUsFHBdI7sqMISa6kPv4mQUPev15V5B5fC6Uz2yjGTi3xUav5eNAetHudTGmCxsvIY
         Ov7hGuhkfRVYhoFEHthx/NeyksXbiXNX4NyWL+PfTSRcC7UIryr2gZuB74hQ4K0CFL22
         WlSTgK7d1aPRolaEiOcNRNOJX9SFR487Qembx/EWHfHC8skR8AormNW70kPkhepgX0mu
         a10nipNxxGfloZd2WwgESKbe/0AVIYtl6oPH1Z4/Hb7gSGoWDek3XznTCkcqXcOYo1y+
         JIyZJoTAygy/A1C3KGm88N/5Ia9wYhCdvs/GshweUngB+JoTGf3za01E+IlYTmZNmHPd
         tEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774406700; x=1775011500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EZAaTOrATdolkAw865uKHSUNug9ueNqBBrK6qiMkPc=;
        b=m0y6Sb8le7vfEkSgm1QWU0tSBBy55usPD0vR70owt1JhxV6zDcd0vnvyl0s1qV+hnl
         7KIFUK5JB8082EqSlFtqaYXIqHOfJbzLWAK6U2nT4ZeIVfHWZMqAhXX9kPSfrDXcfeRO
         u+HIperVqBIvkWkARMZyKOMmy7yXDaachBt9pW5tNqVpnAla+tjtVO4TnmlxkrXmFb+b
         uOI3OmiDmVCouIEh4jDGVBYirQWLm79vC5yDIxN3LwuUggw/ceCXU8toJjYYIViZTGfQ
         51zCaEhWd2XhF/wv1owDbN+xUNXQbKu0i62sv5d5/F+O0TQuR97jpr6JtQ/aKw1UfpJo
         /l1g==
X-Gm-Message-State: AOJu0YwBWZfH2iJSkzwFKuGBFqU0HgkRIGkR3xT7OKlPbHhwWKfcY57R
	sIyNq3u+16cwqBv5TsxbZ6SlPSe5rfEVpxQBjncgtHjYGQizWHFgIymhJBXbhI3T
X-Gm-Gg: ATEYQzw2FkIA+W42BCHMPYGGbUrvDS5rV1zaADITRVZdntSo+xRSHDwjWE49MkgkNgy
	5n+n7oN6W7VAGVrRqbXVAC4hNVjMcMZRKaRvDqlKwNq1Hr/mKMb9P7NTKcSKNtfwjiTmvp/HzCc
	Gb6aSwd9BpjGHs7mE2Z1z+Eha/+QR/NpptLDTSMriI/OqJpwhot6tuK6MK2c7/+JsOrt+gixz7I
	Dsi2z24OswvsVWwY9J7ikdrqLNYwGMCku0+E+i4mgCxFbp1dVkX1uLTzMleP4srNAPQGLxQcKV+
	refvyzdui4eLLpn12/eGpzBTb/yVIKFlNyWWWfzHKDwwrqbThMj2O6eN6+fBnb8vf46hMWYT3il
	r+KeSNUnyuTn8oxE0JqWnIcj/Pfia2gCFuFghGDfogWrdGm4OWfd+/TYRyz6HVBMp9pIHZnC66f
	4QVCwiXk3LqkuaO+IoLzNc8kikJ4ufBpgjbcOjs9BXGtZViHTTrIyvqFanyvXhDTPXdWZsifrAb
	L/4oUKo4ULAuhVk7qPaL332wSSSC+EF9EAUU5AUTUDv9333Gg==
X-Received: by 2002:a05:690c:e090:b0:79a:1fc2:be05 with SMTP id 00721157ae682-79acf2e968dmr17224677b3.1.1774406699608;
        Tue, 24 Mar 2026 19:44:59 -0700 (PDT)
Received: from localhost.localdomain ([71.3.195.88])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90553b04sm81016977b3.28.2026.03.24.19.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:44:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.22.1 -> 22.22.2
Date: Tue, 24 Mar 2026 22:43:55 -0400
Message-ID: <20260325024355.1465716-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 02:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125599

This is the March 2026 security release.

  2 high severity issues.
  5 medium severity issues.
  2 low severity issues.

High priority fixes:
  CVE-2026-21637
  CVE-2026-21710

Medium priority fixes:
  CVE-2026-21711 (affects only nodejs v25)
  CVE-2026-21712 (affects only nodejs v24 & v25)
  CVE-2026-21713
  CVE-2026-21714
  CVE-2026-21717

Low priority fixes:
  CVE-2026-21715
  CVE-2026-21716

https://nodejs.org/en/blog/vulnerability/march-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.22.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.22.1.bb => nodejs_22.22.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.1.bb => nodejs_22.22.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
index 09d6b896b2..8bd5f008af 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "87104b07e7acee748bcc5391e1bc69cf3571caa0fdfb8b1d6b5fd3f9599b7849"
+SRC_URI[sha256sum] = "b6bedd3a8cacd5df7df015a5088264b12c74a277ba60684cb9642ae8eb743132"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


