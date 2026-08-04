Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08A4C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:01 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24813.1785872460538531304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pYoV9Rfc;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so80468a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872460; x=1786477260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxbx+GllVfwTmIlkiXsy2UanFXD9QbTAvc4mI8B47NE=;
        b=pYoV9RfcZ3zeIRMBB4un5jIZuhXC6Rn9lHn2gsKrJjNhs5sGpdSMAMuwcShbIkMreO
         YmzkZ38lh9aPlPx33D156pXKvGcxXqRWYuRUCvJIlkgEJ3boGWM1Fg8mwwp+5rPJwfST
         VEKlvArMz0Dya9tWacIfcdtQYxl6szIRMrhC6qXdnt/jdRwJcyeASe+5gCr09QsrxV0q
         YUBWS5IaOIW7znYO6TMYgv+ctqfytYavIOngv9zIq03RzyQXs6u8X8VR/XAGgzZH7aMf
         y79pABPzXxuFsMZWpj7FOvnJrVZBhMxvetAgbdoNi35cj4iEb42LBlfBaV+sc6DjiXBD
         PIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872460; x=1786477260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxbx+GllVfwTmIlkiXsy2UanFXD9QbTAvc4mI8B47NE=;
        b=UXcxvMGsEBGrnSi24a/tqPV8xXX0QUrBS/uScB7MnsjZKxuG/GdEHsBpg8ig9izmut
         5vTxUCIa+CkMLW6fls1wQ9eqRlkI4CDdn/g5HiZ1NVkQirSt3fRKOuaJyXPwbxCbFnZ0
         Yxdr3o6/mPwBmB8Q1Ay+YNquDzLKmQ9lsiKkoec8cU4BmCXsZ3j4/QUr0/j4lptRkkgB
         fHpb6s4mdAQhvGOf4YbCHjzrIDk+vC9JDHKQpx2tM7UVoXFTVRslgDh1pdTv9uMGkxrx
         IYqyfoSCgw9miwvaDOg70MWkz8ZYDJ7XcgRQPxfh/V0eps78Iaf7T46OfDKhT7Typsq3
         LFcw==
X-Gm-Message-State: AOJu0Yzp86iG6GcUbpsqQbhhaQoGNC3HYHDYDG/zbp7ZaANmFspQYKSE
	kcKas9iJnn+G48CFHtkSQMyhLD0XCBhbfNc+gGOBtQBb3gyuObptd75fQnX4BdhZ
X-Gm-Gg: AR+sD12WFnLS3suZwpTa3YKXMLX6GM31l/0/EuIrgzlxTifI8fwMqI8B/aY5rVtSroh
	BOroPmFPodxU5d4digxXxScr/0O5eieGVZbja8hIcu7jYe3YfusEwCbFrJS58z7UqmJ184di+hD
	gLafptI3kj98ebv7Zwbu+kAowu8CR1izRYjjRJ6wJRCTg02HUA0yxcu0cavZLEisY7fuXRQGafo
	d9PbwtbytkchZPVDoA9ko9UKVtEg3KrgTFh8g+MZ2ISqlRkIGbIsGuM6MLuhHHAbeXYIXF88Wjk
	x2JAedHdxcYXNr3RyYweVkaPcJza39BY4RiiOr4zVa6UMbK2jILNUx3avDr30cnWIQCzVvQFFis
	1NfyHTKgAIoBijLl1gc42ENBsMiZwXDSN0tVyyezVbl6B4PpPzFr0DlZwjZAcaRNIurRZzCp3gE
	N6/LgxpPESNh86FmDIMYIJP1Oz3hceIVd/s5s4kHkRywYE0RIiFq6Z3o6QXMEUVpCpiuIJZjiMs
	IRuuZj5/Xdp
X-Received: by 2002:a05:6a21:114c:b0:3c4:3767:adb2 with SMTP id adf61e73a8af0-3cb85df2783mr1240819637.1.1785872459814;
        Tue, 04 Aug 2026 12:40:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 20/36] php: upgrade 8.5.8 -> 8.5.9
Date: Wed,  5 Aug 2026 07:39:47 +1200
Message-ID: <20260804194003.3158916-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128767

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ba40fb6ba9fa2261913ed760bb3149b3de3d5efd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.8.bb => php_8.5.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.8.bb => php_8.5.9.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.8.bb b/meta-oe/recipes-devtools/php/php_8.5.9.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.8.bb
rename to meta-oe/recipes-devtools/php/php_8.5.9.bb
index 8d9b91aa7f..bc249fd0d3 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.9.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "22f938efc6c4eaa8bf2e40ae11466140309496aa5d5a19204272fb2596fd11dd"
+SRC_URI[sha256sum] = "703c082ad9d2946ac647f3596812300d2c62b360d2f31a999021692a9b39476c"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

