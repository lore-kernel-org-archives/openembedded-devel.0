Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4175.1793330716317076611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 20:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C0tuajMc;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so413955c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 20:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330716; x=1793935516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cV3+RTyOFDlu1/a91nVIe5LQyK5/OSBvYshXBBiNuhg=;
        b=C0tuajMcxEUofahTD3WI5JzuKLTGkQRFo99Jpili+rVyFhXdpE4tQCQcbIhevzM2Zj
         wjSF/FXr3cLf4MlLwu5FgGfsHe5l2QtMDP4grCZlIFV0KLg8z/yWxfao03BSI18udiOa
         uTk4wGj0BOcj3YJKQfjH4uiSyc+8V7YAnF16KL6ipU6TaIc5KMRU8tJDfzsIVRIjF1V3
         K7Gz0WplEBplKa8aWXVg584r/+m7KXVNr9hoX6hTqqR+KRhrU3XJu/R0w6Yethi+6Pi/
         ZXnbb9NoW3e39ZDyRkRtzjjpqVHZTrWre2l5ORzzMXXHzmTZ8NAPkccPzQVmy2yJsPRC
         jX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330716; x=1793935516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cV3+RTyOFDlu1/a91nVIe5LQyK5/OSBvYshXBBiNuhg=;
        b=zZNJH424AHYZ7ZBBSb6BtxeHfGTt11WG9Ch1Bk710JXz0do+pPwzC2mYtu5xj+l3Oy
         HsQfzQ3tXbVSlQVFChAcHv6NXMEHod4hlZkhSU9/167wvH6lNDVp+Z+GYL8ziPXQaPGI
         4vbA1b4Riyjcr/RKlWScEAXSOE1C7FG1omHbCU+x9E3NzOYhX3vgjhZmOq4yyaZmikWl
         xfKD8ZDd2lLeLc5XqP7XFPUb9rGD6thZi1ZT1YlkjjcfGMgC/tLyAj3od2W5MeGtQjl4
         uv9LySoPt+sYt9pMVwrJEMuGTP/HyMUoVzCAwyJWrj2N58UYaE8IOornxVDmsxa69dTL
         3t7A==
X-Gm-Message-State: AFq9FYKGczmJQuM9noOvsBgLnTUfgYv3htJpFK/1YLiioW+MJe1NO4JU
	UH72TeqQBBIsmY34uIoNuGwOPp/M3+EukuiCfvbUI7n5ogbQmQ2cNM6I3TQ9sw==
X-Gm-Gg: AYBFou2oTNEs2GVQP8DOWfw5O+6S49PnwByn3OV/ZQwtWY3a0hPzM+4Iyx6VG/lXRrD
	Jm06W3kLPhw1C7lbsty/5pfm8yw3dgleOI7Vt+PmoGohOcwR/2oDO0/OPZhkFKUfbFBHDd5Dww+
	JyW1dNGvCPPPZ/2j+AjBQ+GI/f5DAFQSoxbagZCZQrRMzw3XIijRM71NfMz6epfILf7W3pDIkCI
	dc9gIgLpi/psyypCbLNecf5FuLoK70vv1tFLGY+iyICtB6Ow6HuRVp1Rj6nEYBHOy9pXEAjT6Nk
	LgC6b9MPVdX96rhvbNwHwySJ/SvC9cl8kxRxAQ+jB+p+qoH6SeRPRc2OtPUmy97+GCCI2B/HD8X
	9ATfCYM1GldyHhH5252XV1xOX5BJoI5n8caypjql+SCQ7B0N+CoSQi3jYFSWAVaNZmi6adOYZrd
	1OjD3kTuaa3FGD59f/zwxE+T9HlYovhiZbHOY2IZ0ZVwDXCHvtmPdMLuUmkghgjeWjQMJJ/RvtJ
	hbEsxVy/lr8c4zW/0QhWrv9UGXdMy0ExUi77xiM4CpjMp4h18fqOe92T0/UmTfj8Z6dZfuD0s/o
	jsXnZF9Vqf0Rvvmr51Lnd8fUbi+W5ZDfdJ4AYGwBgPWKomVZaMZIGAkZemV9D6/Z
X-Received: by 2002:a05:7022:1108:b0:199:4f68:7710 with SMTP id a92af1059eb24-1ac55774becmr1518034c88.2.1793330715330;
        Thu, 29 Oct 2026 20:25:15 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm2862032c88.23.2026.10.29.20.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:25:14 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [meta-oe][PATCH] zchunk: upgrade 1.5.4 -> 1.5.5
Date: Fri, 30 Oct 2026 12:25:05 +0900
Message-Id: <20261030032505.102012-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 03:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131681
Content-Type: text/plain; charset="utf-8"

Security fix release CVE-2026-117556.

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 .../recipes-support/zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb} (92%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
similarity index 92%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
index 9d587debfd..a43ef98ef9 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
 
-SRCREV = "99e51afa38c723e7c25834c2c3b305d20ef55d04"
+SRCREV = "ae8e9f5b1e820a906c39f7eaf231e71bef72a3a6"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.34.1

