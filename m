Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C3CD98D8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:18:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87538.1781338726828957482
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kIGfirXo;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3315c5dso18730375ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338726; x=1781943526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl8KXiKnUHWb7nDYwy3SkP0Rb6SatzcjfpmVESOQitU=;
        b=kIGfirXohXxya9DBs4GxLUrLMUjBqGtGOJwikBe2PovVQiYmdo0K6tvYRE1Y75kY7S
         U7bZ72tJPNTI6fm79SOCe/FeqXdj95GMHX2TKomENRhhjxsoMDLPYFjKyRzA5n68+eRU
         BJ8vq4eG/l/tSjbrt1mg7rOE3jDsDOo3pN3BS8uWMdfyJix4TI+8j6YT3fi4Qta+Rwg5
         IuLoLISD6cU+vpra0NTMnMPvZ8Xd1b14YawzOd0fE69zL7kx3OXPyezRDjuacRfZmWTf
         r7rAWx6mRLH8iDFpY/EMz/+24pfgHAFGMExehsG5Ru785WSybn6L6Zf4xOSQ6XXbgVBQ
         aMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338726; x=1781943526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl8KXiKnUHWb7nDYwy3SkP0Rb6SatzcjfpmVESOQitU=;
        b=Y0Xf4FQz+Q8zqcdNVTkh4p/x+zuVJcbQ1ZE/6sE3U24NU/ND8h+Ir+MXN9ZD4FBOvh
         LBpJf81y9BwUYZwVrNZVJAf4P6kcir5XrP48XPW16RRicqDtS97oYQn5+m4NunpMhpVC
         ScQPC03OHpeI8z07q6LLSwNxal46wwAFZKg3yReliCx8HFjotRI5AjLulEwH0r20e8d8
         IX5zgcqFEFbzzhQnYY02XBRzDNMgMtVWjHDeoYneanHHiQWcSLwRGsh03BQIwXVHlFAv
         LSVtndxbizI5LVfMc5gPRp8582ozVVeXUNn34n6KDEc+FcrBb0LmgqxDdNvNIGzfj8LE
         dTQQ==
X-Gm-Message-State: AOJu0YzNsz4nH6vxy5IgW95yzWuy95vAr0He+M1otNVdBZlwLycHpKs9
	IBhTjX7S8GSK4MWJgmsMWGS9MWsg1jPIVFuxoOkUiwZNIaAnc9vZnD9QWevNzKBX
X-Gm-Gg: Acq92OEWdm1DVgpKTJ4j6WzGEEwX4OD5q1XfsIVEq/QPSN6L7RIPb4MHdQCcp0T2biN
	W74cg704+xv4+izpFxeOZxnxc4+ZkhzdIP0lrH2q9DiuMdfkZXNBdRC05SeLM+c2KmzGBBiRbCb
	6BdjNW7wGpZQ2G/0rbN6Wne5/JHsvJQfDDvBI3XTbnspruwLn8dfId9lzKyVvBE0lPGs8f6BM3Y
	DO78IgAbjWZYGXfV6NgdwWaqnqPF0jko4obRjU6BjO9rj0UwjG2ao8ETno5+C/xOaQTPe2OftXc
	OAidl2Nl+yi1v1+be3E24iG+2i1ZX4IojdWJAp00yA9kjvgx8sSKfh+LwFVWkigOz3eTLC7VFva
	FSFrsDWJHQ6IdXKqpt9+Q3OQljnKZ0fBV55svQVbE4sl7LWIiPrCUoMDOZiJfG7hKWqChuWYDxn
	lqMGv4FAHYjeOiuPFPKipUXnQQCvY0yzVo5YU7
X-Received: by 2002:a17:903:2285:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c412d25493mr70386245ad.36.1781338726139;
        Sat, 13 Jun 2026 01:18:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/16] php: upgrade 8.5.6 -> 8.5.7
Date: Sat, 13 Jun 2026 20:18:13 +1200
Message-ID: <20260613081824.1223609-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127557

From: Jason Schonberg <schonm@gmail.com>

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e14f72c5d7832011fc18760f1a44e56044c981e6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.6.bb => php_8.5.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.6.bb => php_8.5.7.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.6.bb b/meta-oe/recipes-devtools/php/php_8.5.7.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.6.bb
rename to meta-oe/recipes-devtools/php/php_8.5.7.bb
index a78b6baafa..4fd517f789 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.7.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "4457240f65f0c59a620920d66cdab1b12100a431e03ad9febe38b13a1b25957f"
+SRC_URI[sha256sum] = "4ef9355f784d4b320151eb3f31c5941c0da297025eedb97f2838b2ce73dd59bf"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

