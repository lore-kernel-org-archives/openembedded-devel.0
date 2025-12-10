Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE6DD3C907
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15368.1765373280442126862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0XB1OmK;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7806099b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373280; x=1765978080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig/EaB+HFSIR2dJO30cBjHIKvw6Hq4STu1urwK1LiAA=;
        b=m0XB1OmKJSUzd07Gg7hX1aV5xzsbjco2mFKLEaVSmEcSHSGHMk1x1WDqQK19kWJaYV
         9+IsXapFvQx9+GeiO6qf/PXJUa+nA05Xb/BXmgUCyBRqQhTh8kN8jEi/NKOW+Jf5NTe7
         GU1VPVEobMdmdNv2ZsbaYwPRSxR1tEp/+uLHq1dI5vvFS+SkmsvMQmb3Sf8DATqjcb88
         WjkdhpqATwVzlBeq2wj+8MCt85rW/cgZhGe9jMBYHv7e9oDG1gi6mgtPj0RNyjdl8C46
         s4h0tGESuazqwzKaBowDa1hjdODzJ4Fagx+l+7U+n6bACwd3X+9/S+stSaxTZW0R/vfN
         jbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373280; x=1765978080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ig/EaB+HFSIR2dJO30cBjHIKvw6Hq4STu1urwK1LiAA=;
        b=buxbmlEvpZN5KsWWi+xUXet0/TcTySHlQfyuI4IMM8BVqYLJz+nBgZjbe7F4rS/HoY
         4x3+lcYzJoYS5dl1+KPvC2RMtPh8c9Qg23B3BUe0zqqOUsLqBD/ux6RC7HbmDRePcoby
         jwojkJ0WQl/pjpbgMe0u1ZOTklaJDdGKSRU3Kzv9+eK3XX9iSySC4bpVXJKESyi9R0I1
         C1PGBLzsWEBvuIXGHHHroXSDeQmQQDmsMoJoOaXltIayr/sy++ar78142XL1eFC7Xo/p
         KPoC1JRwAYhsi0nXQo4qld1LtaNu30mcQWaZi9rJ2OmAHqFlLsIc2mPahZWiCh2DV0j9
         ZSvQ==
X-Gm-Message-State: AOJu0YxC54tKU1X3QASpi8r6QfctyuiDOCHsJkwJM00B/wX+mQXxMv8B
	hpUVsqT3i8Drrh2W+ozRbXaiNZvBtgmnTYUYid4VRJe0lQMmRFZkFmr4HbdpMA==
X-Gm-Gg: AY/fxX6gNELSVK7PaGNw05opsIo980Ks3NGCmZJgZlagNd7kna8XIKsIFVRGqx8HNNz
	vEJkWvSLjW+OapG9UBa3ebn0cE/O1fCRC3mUm3HVxeurGylhmkTKDASvxB+0P/She0JyfFgM+tI
	8aWukXHTZfmYjHshRvQPkEJ5nCsOnkAkw7nA7qUvfz9YDDYVK6/Adpucwqisk8eg3OeuIouemBR
	6tllJZ7y0w6bPZZiuUKOptP8SJAsMv6b6fqPgqAX7Q/Wyd6QuWKphoyD+DSIcXcTPH0U7U12pvF
	QSz9KmD5+X1G4NIThQ9sNWNFSORr6khWlrsRHat3eFbmm8g+x+gFYcojiT8OMHKAGKhhWuO13cb
	tplI/MstHxg40EodYYuuGNhIDAhZQMUE3s9PN7JibDFVaNOBL5yzMZ869Mhab5ZGORp1qFwzUk3
	5LzEKw9ERJrEBwvwe+oNV90i4=
X-Google-Smtp-Source: AGHT+IH3pSzKIqSru1+Y4UFAmDFzx89OjF4aHuHSCkp+pKr/JGQUEqQwe9I41dUWSzUZ7un27Drq6A==
X-Received: by 2002:a05:6a00:3e1b:b0:7ad:4136:946b with SMTP id d2e1a72fcca58-7f22d300ba8mr2432126b3a.28.1765373279456;
        Wed, 10 Dec 2025 05:27:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 39/43] xdotool: upgrade 3.20211022.1 -> 4.20251130.1
Date: Wed, 10 Dec 2025 18:57:40 +0530
Message-ID: <20251210132744.336180-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122543

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix bug in typing/keyboard causing xdotool to send extra modifier
  keys in certain cases. When xkeyboard-config 2.46 is installed,
  xdotool would send incorrect key sequences for function keys, for
  example incorrectly sending "Alt + F3" when F3 was requested.
- Add 'windowlower' command
- Fix some crashes in xdo_get_desktop_for_window
- Fix mouse movement under Xwayland when multiple screens are present
- mousemove --sync no only waits if the cursor is expected to actually move
- Remove dependency on libXi that was leftover from Wayland detection code no
  longer used in xdotool
- Bump SONAME to 4 hopefully to resolve ABI issues with previous versions of libxdo.
- Code improvements intended to reduce compiler warnings
- Add support for Cygwin when building
- Test suite works again!

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1964be81d37b235769e2bee9ed374c760824cb2c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xdotool_3.20211022.1.bb => xdotool_4.20251130.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xdotool/{xdotool_3.20211022.1.bb => xdotool_4.20251130.1.bb} (90%)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
similarity index 90%
rename from meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
rename to meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
index 45defe82d6..75fa636838 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
@@ -10,7 +10,7 @@ inherit features_check pkgconfig perlnative
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://github.com/jordansissel/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada"
+SRC_URI[sha256sum] = "eee789b00d6a13d47b31bbc139727e6408c21b5f6ba5e804fdf6ecfb8c781356"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir} WITHOUT_RPATH_FIX=1"
 

