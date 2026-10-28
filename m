Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36228.1793161588755936394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y/AvZIK6;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso191501a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161588; x=1793766388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75VYq1DXQg+OBSh6+P6xeaheaAaQsaT1yu2VLaj86xo=;
        b=Y/AvZIK6k2BdnTqY4hwhG5Qt2ICD69qARetBNaf11uxHLPhMpK551WJblneAWPrpQL
         aMJzD/AmrA7R0IOtmnS4v1ed2+j4Rvf+K1iqBe0UAjgQ+HN14ITwrgrR1ciPsA7vx3M9
         eShInH3anI8PgC+yuS+Ivizte62KA1Gc9hHsje4kvTYQvQl5r81J5djTfxff+WbquVj1
         OX3q9DLg3hlSp81HHQXMLci2gyF+RkGEFn+O+xmQqYPggJBrCBQ0V6Npdg0fiYCoIQKs
         yDNt5AUF9BX12cbTHzsQjL59b2uc5V4XMb9vKIfrY6GTd2Bc6ToI4vTHTWuiH5dYk09Q
         BjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161588; x=1793766388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75VYq1DXQg+OBSh6+P6xeaheaAaQsaT1yu2VLaj86xo=;
        b=zTW1CkEoqZnnMfRkGXoYjHmj7k6ojoZNr6hxcK8/EAQVcMdka5dXg8eMeQ6upHyvPJ
         sRBJntswBaWegBXPic7HYgy+CuA80lsMMEZg/LhYmHW/9MD3uBGUeo3YKacs0srH7wHI
         CL3m0+0nTAEahMSfw2KTvfdgODG3KXiAA+Hwt7Jn7u0QT0XLjpQueKYCuX/DkkL9JZtB
         WL9EU+Pogop2kDEIazZm9SZ1T/iOBb3h7QTYtfd66xYdvJcIGk8t/r/xH/7U3le5S7Nj
         cV/yv1aCTwG/kUw9uzJLpDRw/84Oc7lStKpxwQlD/QCh/tBEXRnvTdWmVn0Pcg96nlfn
         qM2Q==
X-Gm-Message-State: AFq9FYK18lI1ox0H49w5wPdrebhN0Vwx329m6oS9kCoTgFPHfPg3TeZE
	Vf6c8lhaAF3CFiags7T9bV6ToNPe+AV3E3PHWuUAQl/9fIQ+t5r2iR9TKx1bXQ==
X-Gm-Gg: AYBFou30AOfv/0CxTEi34qL903x4ZHC9k54AasYwcIAhU7fvCDARhmOpidEOzR/wSuN
	FzNb6cBMF9jV1IvJbvUHztz1srLzXwcaQ8oXsux4WuuBuAVdqcdH7PlaHD5aDh6aOs6y/sVARxA
	uzu/p/DqxOpyKuUAEAGZAirri/2L71ZzIlTI2LW2fkkmOSS981s3ecemp64wC8RenbEp2nPbjxu
	Rw96CssrkG3/RlPtRvVB2IpL89taT5Cm7xQaPkb5/7LM/zCF+SMIQtKUEbHiKd8vfD0HMeCC4o0
	j494jeZ37zvesz7IrBDQgDLmLDl+tQ5MfIzSPBnVTPoelSF512bH7j0UYDFs3oWwfK9jhX+hsoM
	A1LLjukoNSxJGQuLTT5Sk4pCJBpDgtO4YyJlTcZnP/qKabpE7+fnVFyPHzVHy1NK2GFqEF5Lo92
	RGggx6UwXfwmBvmyahT9CZJ2h30sFtS+tmhsEQ4hl+MWgGhUUOWzUZKWnwsIWHW3XBLJs/DMBc8
	OZmp0KiqfOkH8Pf0Zd0uoKynrw4IJZfldejGhE7Jllw58O/51T+O6BOBvUajA0IinGluzBvrySw
	a8EdmcLeIEDhrP/kDqiAfWaud6u2OZY9mT11THU0CthgT3hSHBRq5MihvJguTQ==
X-Received: by 2002:a17:90b:50c4:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3ae581b9f0dmr819389a91.42.1793161588123;
        Tue, 27 Oct 2026 21:26:28 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 56/60] python3-brotli: upgrade 1.2.0 -> 1.2.1
Date: Wed, 28 Oct 2026 17:23:54 +1300
Message-ID: <1ea3019791e727d9e739f3d7ab4e329b53d0c97d.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131608
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/google/brotli/blob/v1.2.1/CHANGELOG.md#121---2026-10-21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
index 8e493fd0a0..2c1bf23f64 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 CVE_PRODUCT = "brotli"
 
-SRC_URI[sha256sum] = "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
+SRC_URI[sha256sum] = "02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de"
 
 inherit pypi pkgconfig python_setuptools_build_meta
 
