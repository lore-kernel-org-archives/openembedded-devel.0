Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70195CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32792.1792042977166396527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JdZS3Ff7;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5fb79ce82so27170745ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042976; x=1792647776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TAfdUnIwmvrzKpbSCQYVK04czpkDUk+G/wFJ7mMs20U=;
        b=JdZS3Ff7MOG9gOsGOOZ++i58IZCcgMFDLDpnPpeJvlmW3itGF6/+pQuRZx274ZUgAM
         4tBc9pCPe+Kcmvkh3F4hbbcd/lqMfQ9t132iff/6k469q82Lv4jTR+mI1XDueAKw14rq
         xrZWx3TWUx4K5Tq5cXLtH6pHwP8RKm/1r9bioOMROVlqGLy3J8sCUaaR2/cu66D2TgA5
         36pUoLd+dV46p84ZOzTaDPkONbyOhmT+T363q4WSg1swxGCLIrB737vc24Tw3prPJLnV
         5WZK585Np4KOnxG7Tm0+zLsV2+ZiTFcEn9fHTgwnPgQ15blfRC4h3Vg4equziJWSJ6f+
         79xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042976; x=1792647776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TAfdUnIwmvrzKpbSCQYVK04czpkDUk+G/wFJ7mMs20U=;
        b=Jhklo6RlXXaPU7aZtgkCFR6ZMDj2nkwfB2kb+9DBicC5tqS0Tzs9lj5+e9KdboXuMi
         8tPDn4BiZjUSaNkJS/B1K6/RKjLZgN5/a/Rix0lh76+8FfxunQFuRu8moGTySbbOiygE
         +mfgRl1FLSU4xQ7GS+wIly6XyhGYBv/s259qq/DFTPs/ggmfTPI0msjSIHXhCo5in4vR
         j2WadyjmUvNQjxgrdYh440mPoIjJWXY/aC15Ill66gai7QB0lbCPZV+hGRRuVBcSHY0x
         mIETMVON+F2CKuHKVmWMkcu+Hu2t8nplAxxQ9hbdb6FYsAJ3JDuteZT9q5qULAWgtYja
         59MQ==
X-Gm-Message-State: AFq9FYJvq8Ib/xslLGfaOc5duFunF+Ej2+j3ppvd85hQH+rj1lT4jO8A
	bNhNe9QNvYW3vL/mXgpiCWRtQk4HNgJ8byCBDgzaqrF8Tf2njhUhwB2Y6/sAJw==
X-Gm-Gg: AYBFou1JyUTCWIPlszVJNn79biHOtP2rt9eQ7nj/JnmRG1pR6p/r31r/cDOf+eGrDod
	G23NnaWp233gAVBglhTMQg86+ELuIhgasfBrO8zMan9RpVdVcJDmWuXh2S79PggxyHo79CpGIzC
	kqqhzBTYqqgx8f1Ge/x0aXGsAKX70idKujwz2jYWxh9+rGA3Doa/5kgRsZ5hu9V5PPIg4VOZjzy
	gWNhKN6mUZ4kKVpXis69HEwIWWhosPGYW+MVQLf7LEMQUYgpfJkigHfzCCtxk1UfhMkbVcfKua9
	pbdx0zngGXYBlN8acH7xFjj2mHlVaCv+Z++j3JX1fcXnLCdXA22CnRZ5db/ZanOCPimkjHi0YcZ
	ByrLm6fshj68fSltTcVuWQjvFDxgbT2S6M1xZ0bWkkwdWyJhtK1cO2mEoovCzP8+nRUuDx+wuc8
	vj+9Tx0E93edPjsXREC5JzRNxKpkPyId0BQUQfk+HR7kxh8zlAl1CUVtkgjZtcz2/Yz6CF5Ozy/
	wabBzVp2QdYxFt90L9vCsA=
X-Received: by 2002:a17:902:ce12:b0:2e2:aa17:477f with SMTP id d9443c01a7336-2e842f11b4bmr161356685ad.58.1792042976483;
        Wed, 14 Oct 2026 22:42:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/82] Revert "gnome-shell-extensions: upgrade 50.3 -> 51.0"
Date: Thu, 15 Oct 2026 18:40:52 +1300
Message-ID: <8c6b70d35aed8157362126052116c68b97576193.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130924

From: Markus Volk <f_l_k@t-online.de>

This reverts commit 89448d167e9e672609801802286c432ad0b88218.

The extensions follow gnome-shell, which goes back to 50.4 on blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-shell-extensions_51.0.bb => gnome-shell-extensions_50.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_51.0.bb => gnome-shell-extensions_50.3.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.3.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.3.bb
index 9b58d976ef..a7a5b06fb9 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.3.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "3c078d7b88faee3d0f68adcee1392b1bed84731b91a337ec894cc88aa8a8b813"
+SRC_URI[archive.sha256sum] = "68fc74306f88f697a6bcdb8243cb32a9ec0cd3f6e2bb92249b24b60fc57450b6"
 
 EXTRA_OEMESON += " \
     -Dextension_set=all \

