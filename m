Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4690.1607406931324071432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 21:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=skYsiiLW;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id s21so12844764pfu.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 21:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+aUJG7A26h7bX1ExEyE+JdoYx9RXRtzsy3S2fQFknNs=;
        b=skYsiiLWJ8UW9ae9fgNtx0e/vYMSxU4vJDK6MFu6Q0dJkMn+U60cDCSbmzZ/kjW7fe
         O0x4HW2HwdozoK2PP+Pz+5FpqKC9eLoP3jrLDib673ynKuuOentsPxhS3aPR/J5ftJPD
         /Vur5SWQH7sGQ3r/9DLSGV8Al0Ltr7gxoLdVT4P24UF42YYmmHNxXutK3NN+NGg9hGWI
         GCmsqaGWMLQhXoot7b8ZjdO4hjTWNccHJ/OgJkph40s8ocECrmBGLsv/0F4TsB+HWOjC
         QNeGxUl7y7LzKah6VPzqQUe5G1h7vVeQZEv/0V623IMfGeuH45Bksa+9cbCq4Jm6OrCy
         xk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+aUJG7A26h7bX1ExEyE+JdoYx9RXRtzsy3S2fQFknNs=;
        b=Og/en1Te2FgCvW2BO0HkdBL0LNAWoOeM86JvvQc1SXaX92bRXNsHkQ2f0emxFG1wOE
         Xms5kANJJ5VgaJXtS6VCfB3kFz+jT3HHoxcI5OEbws2XrRlZvl7hghbDvaLg1g72eLAT
         iBM5/+tsbIWo4bWdloes0LdC2ev4FjXxiunvUvkkFdoqQnBLwdcS+LdM4bIyleSA7v0i
         HCUrTfdRp7NQhsaAf7TECw0CoXwZaF0F3ic0R0NhUC3CBSIGtLx8CDQNv9weyqJOJ7Rs
         2c50CUWfbWQHpx9ukU548tH+8U8Sr0vIRoAU4273OTk4QvNiNnLuQsh2R7BqCsMFfHcI
         iAYg==
X-Gm-Message-State: AOAM530M+q0wpjF+bfL5o+apxFXfIhNhWuvkajvJdc3HllFraLrnNPat
	LV6I6JQi9q8SNWgpkLzVa0qSUyftIeNntw==
X-Google-Smtp-Source: ABdhPJw+/j/YCq3++4/WmSkVWVMpnUKF+/wNtj5vNto9ACGkC9MshMO7Tgf45alFg0kz511FB4/9zA==
X-Received: by 2002:a17:90a:4042:: with SMTP id k2mr2697326pjg.160.1607406930647;
        Mon, 07 Dec 2020 21:55:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::23fd])
        by smtp.gmail.com with ESMTPSA id a10sm16182009pfi.168.2020.12.07.21.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 21:55:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 3/4] liboop: use upstream SRC_URI
Date: Mon,  7 Dec 2020 21:55:24 -0800
Message-Id: <20201208055525.877400-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208055525.877400-1-raj.khem@gmail.com>
References: <20201208055525.877400-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

The Debian pool URLs are not permanent and the package might vanish as
soon as the version is no longer part of any Debian release. Use the
upstream URL directly.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 8ba3f72b76..8894a867df 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.lysator.liu.se/liboop/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
 
-SRC_URI = "http://ftp.debian.org/debian/pool/main/libo/liboop/liboop_${PV}.orig.tar.gz \
+SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \
            file://tcl_dev.patch \
 "
 
-- 
2.29.2

