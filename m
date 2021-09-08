Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.11951.1631110810289630174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B7sxnqX3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso1755274wms.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qqetvo4Eh5mfkHmx/KwE4gm5QX1nObSO8+FO6tueEZg=;
        b=B7sxnqX32p7wgYAkzEQ5pwHKvg+gErhaE6Bkfov5dZP0hGweYtSclwd+9Myr6yO2jf
         EF+gbA7ABt0hWBS9EE04B6nUBiAvltoQr5cTFUiFSVKnOAYqMp7i9GEPNVf4AUwJZCR0
         sI2+EbNFtX019Rbm8l9owLZ8UzIUCZji9+eDWlzi+8VmzFMEzL5rKowOMzYFnGrzzXD+
         4FOHLsj3C/17KU9yVw1kxOZriRdxOJpmaUdy3CtuMyXY/RvMpm6/DEgRPIy/99Y4y0cy
         B5gNTlc9hWc3dDNWRdAfZ+t5k/OJw9Bi2XJ5A9BI4z+cnFvty7L5Dl6AAI6WcbJs55sj
         yrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qqetvo4Eh5mfkHmx/KwE4gm5QX1nObSO8+FO6tueEZg=;
        b=eOI5EVFHvwcMfKIsf2u2pmWSSnOFCVbONauYmOtfUicjcl6sk8t/JqUgk0o1MNuWzp
         NC2RSL6YJHVtyOUCJsVxiyRXEwUZd0OmokemKnB4SZUzwkhA5GTf7oCWfn0B83O3ZR3r
         /MBkZtaPtgfVl3jUGntYWwKSl86UM+ePWkhsBk9LhFRxqvUrCAqJIeuozbmFv4LrKtZs
         j3Zil7JQ6wR0OGlmga5vdESyv9GJOXQ2GKc3O0Nw+9Q1OIaNznq718/GcpyjmVVmu09F
         veb/AYcdpH/T+EskOdKwu7utRyhGUPijzLBqdJnfMR3qkQ5yb5Q0uzJ8rJrjFmrsJGVV
         VJhQ==
X-Gm-Message-State: AOAM533fdlNm3DVbK6A4Eeyige07XW/zUjyhJS69BDd6SJqFF1zqxcl8
	VBZ8F6VM+xyTFHjxUsKI46fyjhcxS/s=
X-Google-Smtp-Source: ABdhPJyYhHkgj1XaaVxWgLaXEtoGEyX2u0ltN8GLcuvjiTBkvzSrTIURJo3VjDEymehaIPg2J3Ihvw==
X-Received: by 2002:a05:600c:3b0d:: with SMTP id m13mr53437wms.1.1631110808759;
        Wed, 08 Sep 2021 07:20:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id t7sm2553710wrq.90.2021.09.08.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 07:20:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] fmt: update 7.1.3 -> 8.0.1
Date: Wed,  8 Sep 2021 16:19:57 +0200
Message-Id: <20210908141958.866476-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908141958.866476-1-alex@linutronix.de>
References: <20210908141958.866476-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-support/fmt/{fmt_7.1.3.bb => fmt_8.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.1.3.bb => fmt_8.0.1.bb} (82%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
similarity index 82%
rename from meta-oe/recipes-support/fmt/fmt_7.1.3.bb
rename to meta-oe/recipes-support/fmt/fmt_8.0.1.bb
index 9820b8647..0dc8e038d 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
+++ b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
-SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "7bdf0628b1276379886c7f6dda2cef2b3b374f0b"
+SRC_URI = "git://github.com/fmtlib/fmt"
+SRCREV = "d141cdbeb0fb422a3fb7173b285fd38e0d1772dc"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1

