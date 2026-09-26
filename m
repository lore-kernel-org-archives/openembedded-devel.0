Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E88C9831E
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 03:41:51 +0000 (UTC)
Received: from mail-yx2-f16.google.com (mail-yx2-f16.google.com [74.125.224.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13390.1790394108501285022
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 20:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=snuF415r;
 spf=pass (domain: gmail.com, ip: 74.125.224.144, mailfrom: schonm@gmail.com)
Received: by mail-yx2-f16.google.com with SMTP id 00721157ae682-8a7c33dbfeeso14497427b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 20:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790394107; x=1790998907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlYZRnUvw+M4U1c/Bf153ffVXy8iZJAzk6mEIhdwX8E=;
        b=snuF415rKfCizTpxmk9+JfCUnMmIH3s1guAZvy95jWGFOkIe0SY7Ti1tzHSy9hdSQS
         b5iyG4dYnoyIfm7Q+5zH00aLq0PiqRhCGlFVJxF1wjU0zW7wQ/DSOzOYznmH3ahtTyvU
         buLqUFrFHVwcTGh/G0nAEK+wdU4KxGLeJBnm9T+lDJbFUDjdKb/3LT82s2dLgPzBScTm
         Xxwam/95PsgHHRFUT4QA7SbHnnVlLi3OZJMmh/NEp4t9/a6d46XAsHcOtcMfd+Dz/45j
         IZefegT8v0k6CC6uHElbN+sLTuD4j1IpuyXwoCNhKHocdEDodQIvsmBl2YWaYWgHG4YW
         kM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790394107; x=1790998907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlYZRnUvw+M4U1c/Bf153ffVXy8iZJAzk6mEIhdwX8E=;
        b=RNxIKlKbf5yQmLEnRQVpnOFPYCpAoPDLo20/RVdIxox28HFCuv9GU2bd5VpBdsIj8l
         9mETJ1LQuCmsOJr8nv3pX+FdmhzQwQ3/T07Ro1f2W6aVUNTYGJBnvvr8Cj88qtopeKcJ
         uFH3ijiE5VjWW+vfBiZng6wcqvH2zUmRqp7I921SrXzT8rYFrfRssZ5yU0D5b00PG8V2
         XZZlqVaXjGhdLZJ6e0Ple7q4cgmx5+YrXspYIVFbYBYbQsktVSThd9pwUWNj6zBmpFWz
         fSCQxr2DPguHHXJXftKYrWi8x5Z933st5bGS8quDH66aPO1H3OQ57IqQJAQdnUENtWvb
         0u1A==
X-Gm-Message-State: AFq9FYJ6sJWQL2pVCbcQlctqvwWh1V9h/yCaFqXjkt3cLCE0RJ68hfj3
	uVDk48H46EEtYiuUMUWxYZi4426qzwh2VWQXiUQX5vFptO2Z639XVSwwFBOjotjB
X-Gm-Gg: AYBFou0TSUClFhteboMZP4/iDd+gGCm8osHaf5hEsYsjFe727d+dL4II7Xf6Sie39TO
	03UcX8nLKmjD+ss48L7A96e/xizmcyQ0ZSgbJWaYoF5UALc53sfHbtROoGyRffAcrxJdCAoMG1B
	K8ed+BxV8uXVKXcwGP9ywBI6KUeCefsQHUcmeNLm3YBKOAU+laki+ewNRKQrxUszwy9PBftjZbi
	4GCbsaL7LIDpEdyNpd1izCPFAukGBjhQ8LBsHUMMKj6zLJRROLieaibbTlpx2yz28T5uLf6QaO2
	Nq3mn6Nps5soyL8T0YZlvtgsd/70+8Y4BXQLvqjuWjAsCwhluLXp2g+3AVKIWSkldi3P6CAq0KA
	/SZY39qca/L3Hvr2SJSrgMljvLVVCccKesIKUGAh44LouuSf272B/bBXy72AOzWQapBB20d2UD0
	LgR+oLIuelbYD1byDKMIxq8jQxy+nVCup8MWhMv+w49b++rPKkhKhvrlclGhnEeNmeYNRITnEr6
	mou9UQbL3WKyMuyluPtvo3GAryWWYIycHuJmk+eLaYJ1TnbDth/AXc2RJpFXkPkzZRSouj1ma2r
	kshW6ZIwj+fpFD1hptzQEQ==
X-Received: by 2002:a05:690c:e297:10b0:873:5bb2:6c10 with SMTP id 00721157ae682-8a64dfc7ec0mr31487037b3.58.1790394107386;
        Fri, 25 Sep 2026 20:41:47 -0700 (PDT)
Received: from localhost.localdomain ([67.233.63.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86104911csm16777297b3.44.2026.09.25.20.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:41:46 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.33 -> 8.2.34
Date: Fri, 25 Sep 2026 23:41:34 -0400
Message-ID: <20260926034134.875896-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 03:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130316

This is a security release.

CVE-2025-1218 CVE-2025-14181
CVE-2026-91765 CVE-2026-91766 CVE-2026-91767 CVE-2026-91768 CVE-2026-91769
CVE-2026-6103 CVE-2026-17545 CVE-2026-92842 CVE-2026-93682

Changelog: https://www.php.net/ChangeLog-8.php#8.2.34

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.33.bb => php_8.2.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.33.bb => php_8.2.34.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.33.bb b/meta-oe/recipes-devtools/php/php_8.2.34.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.33.bb
rename to meta-oe/recipes-devtools/php/php_8.2.34.bb
index 29a2d5b6ee..41a4a4a4e6 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.33.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.34.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "5362f2a7a0e7168ce722fea0048b1a1d28e0f7cc265c417df670c65670695018"
+SRC_URI[sha256sum] = "0467d63a819016811d35fd14f734764813ab149750379790634294c723cd7562"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


