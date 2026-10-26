Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39902.1793009955793746875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M2ep7kZF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2642601a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009955; x=1793614755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v+kFaeUGo9KEUia8cHGBQBko9kHDBMiE6A9qBQY2Pg=;
        b=M2ep7kZFUlpcC66LV+yLj4YAh6eK+mNvKkTuYgRfVKTrFSHgCgmIeOqWHwumJC4iT7
         4QU6rzhLGdsfqM6zOd7WDBjkVpR/3meYbSiPbWehiUUIl+xHrSGLtGxjYfhQ8/KAtRNu
         /5t1SysgxeYm0cKOWlqdHICmL+381zdr6g837qz49H0BUfWAyMSZMvt66+zrqxYq13U6
         TwYhKXn9rL14LaHSBfrx5lVvenE/uIkNkDluroVoSqbjMudHeghGnLLg5EZ41SzHEIoS
         C9jaEY85uEwRqlM7JfpBGkLIywmjDI7kw4VNUT5Kl1IuLxD1/bg9g+CDqaJrskMxBnk2
         aFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009955; x=1793614755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v+kFaeUGo9KEUia8cHGBQBko9kHDBMiE6A9qBQY2Pg=;
        b=YwF9lOYi35ZTjz39vwwaDYKmV4mF1N0QdlsNz1IiOJuJ9nhMELP2svePKd0ErhZRxe
         NmP5ISVMZ/M73z/rUwD3UsylJfBaGmjc4wiPlRg1T2/75uX+MLMAiOJEYQTHuHqqFAkL
         osRQBw2tn8HpWMsmUmY7yVj4eaKLiaO0GCTgMdT5Unfa9CZRTqQw48xqeZV+364ELZcZ
         Ww5oNEGjFKR1pGa+pNM/brb72HwG5qDW4Hc0h0van7yjH7U+NxU+KOvSPL8KWUQL5N/I
         DvxFzsOQE0RiLbgedK+iHNl9gwwOB+aHaXEvBm1fRI/hwSjxFmR7Dadsmh7zSg99tC3O
         mRXQ==
X-Gm-Message-State: AFq9FYJJ0ZfLY38TddJOk7/KG0M4E0Y/CHgWcmpgp9VJFVnMCoVXjQ0j
	1KX2VetfMpqYUiGPhJGAomSX2xzVj5j0uPN3UGpSpX88HEILnO3U/Movra3R8w==
X-Gm-Gg: AYBFou0xF3IE/WqMrOZ0SBl0Qfhd0fPqdeTxBN5LI7o/ghTosS9bG6LUOLI2PElEPIo
	ElT3lWeKeyIf05Hr/Xa4N9XtEFSaMdrhxJnqG8Mz0eunCvFoobwYEUEqmsuBKf1P+0HVjPNnWBY
	IXJHx8UIkgfrFpzxJRXi7yq8yfYMzMTOVdrAP6YEPO7KXsX4niJ/KejtILfnDLP3+t6Bw5nH4Rj
	kTrBb3QSAsey4u9w7ooI3X9+PGlEbN1BBZcXOEEyAWYUL3h3Bal6BCWCxbceTjG+2/IstTkDcCj
	MlyORlrwzil3ax0tcMStSGkVS+y++gZITY/KNfGQnLwfRyDNUq3FPd+A/Z+Yu0PeN3PhIuccKnt
	HKOqUKiGfvSxBLp+eArskPdPWCJBSSaVONQtLklZ4eQMeCo6RTNpdTJtIaDIkPTD9dgQI5sVFoL
	gb6VkCcJqWoZLBmcaQsbHTBALXCydyCIKmPXd1KSU3DZW3VcFF2eN1bwO49Ygw9dgUBhSHnb3cE
	Z3tFuF5cOp1C3q1YYVRcF9SyWAK7NYGMMj0igOqBJ9NzRbZBxrY9/H6k4ncU60pwjEj+dipHZg3
	g89Hndqiw1HEW2d8CcJNq7mRzUuOjDY=
X-Received: by 2002:a17:90b:3f4c:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3adeae7b904mr5412508a91.44.1793009955214;
        Mon, 26 Oct 2026 03:19:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 5/10] php: upgrade 8.5.11 -> 8.5.12
Date: Mon, 26 Oct 2026 23:18:45 +1300
Message-ID: <20261026101850.1470035-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131427
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security update.  Fixes unauthenticated remote code execution.

CVE-2026-109618 CVE-2026-109619

Advisory: https://www.php.net/archive/2026.php#2026-10-21-5

Changelog: https://www.php.net/ChangeLog-8.php#8.5.12

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 898ac0ba1caaefb583cb3785c8c466360fc18f63)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.11.bb b/meta-oe/recipes-devtools/php/php_8.5.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.11.bb
rename to meta-oe/recipes-devtools/php/php_8.5.12.bb
index 831e926880..f9759cf7a5 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.12.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
+SRC_URI[sha256sum] = "ffb60edc437ced63b5137e4984db379a8111c50049c711510d8b958277efc1a8"
 
 CVE_PRODUCT = "php:php php_group:php"
 
