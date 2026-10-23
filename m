Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12661.1792777450838524983
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qWmx4bqW;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-487049569b6so685397f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777449; x=1793382249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1K1VdEB2m5SCuuyFO46lPUPkQb2R0kxabDeHxj0Ek4=;
        b=qWmx4bqWbQEJC1CCjWjqlSDkMXgSNb2xnHGQe8t8KguDciS4QuJQq+B7xdnGpp9GAp
         LvkwD/P1vwVjebzOKifxoYhhYO5lXUDCEB49chJohkT+wIQB5dZu+cAB7m44ZgEOJbeh
         OSpf3byNTQ4KnEaxc1bHH46UNz1ii67d1UANw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777449; x=1793382249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y1K1VdEB2m5SCuuyFO46lPUPkQb2R0kxabDeHxj0Ek4=;
        b=PvtV11/WlUIIdXu0bIORm1YPc+gxF2dhAc6N51uXMpPoaTVhQMg4XYWe0vc0uJnz66
         uSfP3b4etmwKf5/vRTeMHO56zLOhxmZyTT+z51GFoH8rQFnasa+3AWlBxwTc0rgTYzQH
         675F3ceCR2vXpoSwNQrpVq4hEVOtrNZUEVi3zGNxB8Oga5bWR6spZeCHnydRWsg6q1F6
         EyStWSUHvzR1r5Y5RHfihBlzK++x/GSAJ2MaqMiNcaJGFiHufkDgDQfDlJXZIE7m32Pk
         Wsx2uw16CaWVO5OWjxAt0oWyF8JTHVQdLsTeVwXZ/cm9dXltNNKEttEGz71HbZip3U2I
         oU5g==
X-Gm-Message-State: AFq9FYJg7Gk0leCuwaHKi+eR7WDO6mo8CDErWHdT3wRkqdKSmZnCeXH9
	t77eWuK13mhl8xAhssrRw5tp7P4uPy1KUdtJEd7OLECdUEf8CCfQGdw3n7YEiXewv3IXIlCKiYr
	kvA1b
X-Gm-Gg: AYBFou1eKNje/SmvHji8FPaWjmzor6V9ZHyxhqzilku3dg+1qk0lWHHsmJks10NbSg1
	rrhYKva+rBnniaB4Yy1aF0VN0ObU8KPH8qv4U2OypoblCHsv3V561v9A4qVoR3+daovik81K5uZ
	AkNT2ViOdEFXgOSWMjap+rek29kwiIciShCiV8BUBLaFWByTfzu2rLn8zAgOGCcf0MBoYRS1Kdl
	R935kYCwiMX1wk5o4KZtI+5udEcCZaX22vwHb5HidEz1HJC6ER9HHz9wJrHUrEdBZt5iwOBXMIw
	ffWgqZkNdLxo67C39Qg4fmJ6r9MI89/vhfu9s/6ROLp63Y1mXVCYhkxN9lblkj4soIVduzi6Nyi
	7SBgWkIDZ5rFS4SqDkAj1leiuNthiolFrRFXVoDTqyt9rdRiYx4UOpNbwpi9Py4Or6CQCUq5Bhu
	0yHKWDieBcuxJQoUIWF1MLHJdF0BX4k8ekRdy6lBlx6uPbupnxgDkM484cBVfGYh04MvVXBfJN7
	XtP2ynmWg3KBtKOpqgjvwr5eY1TvynKgH1MKeo2ecpBsEEUbs4CNg02+98CFwTvPNgNCr5SCFLW
	tAoSUGsImRz5EQGFc560Todze3vEUH/0WL4TKICoBVF+37KM3jhbJy/xss94s/eiCa/qRuE64Mw
	peVsrzND1TbIZiU/Cga+wI28b0g==
X-Received: by 2002:a05:6000:4a09:b0:48e:3b16:488b with SMTP id ffacd0b85a97d-48e3b164ab5mr3654923f8f.53.1792777449147;
        Fri, 23 Oct 2026 10:44:09 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/9] python3-httpx2: Upgrade 2.15.1 -> 2.16.0
Date: Fri, 23 Oct 2026 20:43:57 +0300
Message-ID: <20261023174401.3617912-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131384
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.16.0:

Changed:

- Look up only the cookie domains that match the request host, and
  skip the expired cookie sweep until a cookie is due. With 1,000
  cookies across 500 domains, building the Cookie header is about
  18 times faster. Cookies from different domains are now sent from
  the least to the most specific domain.

Fixed:

- Reuse the client cookie jar instead of copying it on every
  request and redirect. A custom policy set with
  client.cookies.jar.set_policy() now applies to outgoing requests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httpx2_2.15.1.bb => python3-httpx2_2.16.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx2_2.15.1.bb => python3-httpx2_2.16.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.15.1.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-httpx2_2.15.1.bb
rename to meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
index f6427c31ac..fe4919bff2 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "The next generation HTTP client."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
 
-SRC_URI[sha256sum] = "ff75485308fbe441e75b1218546e4e78d884df41e1a9741c1f79335ed8fcfef7"
+SRC_URI[sha256sum] = "0d54c98128e8f2ff7fbbde0fca8c359e5f032edeaaaac443cdb7f31f685bcd7f"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

