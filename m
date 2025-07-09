Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E982EC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.3042.1752082270529559538
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3eQvVg5;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-558fc8f0750so81182e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082268; x=1752687068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4A1fJfJcLcacda4JC85ZL8Blx36VXEF8sju2HRNuz4=;
        b=O3eQvVg5xceABRmIAQLX5u4SYgaT4FsmUo8EBOSxmZ266wWcaQ9xdUWMt/kSRvqiP7
         mssYL8B9IPYNY3IbzE4gXuHn1TIcIK1qHqd0tHUa0DTUs4vQUN/Et6+9Y0ZpRlNJkfVn
         432hpjBfYRRodrP3xKLGrw9de/lzG1NFNCW3CGL3bTSUNtchoRdi7YyhHZSuzWEoMDSM
         P+MxJoRuTLvizTrrupaOI3xZjnhHVa2relq6kFIGTY/Ix4B9IZsM7UB0ERNZ5WToSejk
         zshZn73Ps7s0irnmMtpCzzSrBCrNVE8K2i8UukSgTunkwx1HkMBPEZkBnNT38vCR9rua
         M7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082268; x=1752687068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4A1fJfJcLcacda4JC85ZL8Blx36VXEF8sju2HRNuz4=;
        b=wETnzHqfdp6HzwgtzA2cgU8/k9ujOgypkYMwYeTpPTzB53SZt9RurKrEEQ7A+15rIo
         gBG+qPfZkrjqbBTG9UMU/1V3Fck7tqos/0eFjp8W1RqSbnVfy1csuU8FSUqem902TXyz
         gm1utURja/z0sVbwB/MOIqJR+LQ+XeSxiCz6HWKbYEbTUQ0imi3+81DrsnOP2CY5PfvI
         Z0qBH9WDzTOspIghZJ7ijkd5wp3N4HLHwxgekbBq09hjEDNcdnFz5JlI4eLaozDYqgyg
         8j487ZszYtdbLQEXs9WzZXkDHNEvX1fPdJQ9KrR5XY9i7Ca3MOJHe9pwgnrbTaczURMt
         OOsA==
X-Gm-Message-State: AOJu0YzUjG39yj/TN2LnfUexQdWhuWnSZdaAXBtPri0kGZIMekyUWM2U
	Zm6kp7PVbvvimgJidwvoSF2IatSHjCOZ5SHN5/LeIi10BGfgwErWx//NIGpFxA==
X-Gm-Gg: ASbGncvSV7kkxyg577MFZ2UlnEEuLW5kCbrftnNldBTPPAaTMsCovF2A9peN0QWxUv6
	UNJ5nE5LyrxurfErDHxoQ8rVfvEdSKI645oW96EuDdUOf754MF6UUDkn3imBBJleVxZTcboM7C6
	1paY6bFefhcr6pqpita6hyVw9dUeb5qkJk3nVnI7SO4XRp96pOsIGpVWc4U24oYON1slkpqg6ex
	Utq4cCRiqtrOEStSe8oEUOtH/oRUlrsNIfpddwKG/vUs6gLKAP0zEdzzJxyEXHhxorm6SFJTewj
	Fw7M0SLzXXxbsMyberAUYi31LF/q9DePVoTTHQArtvJKAHt57IDu/yhYYnkKAWXnwKxVFw2e5+7
	q3HFpuEsJKj780Q==
X-Google-Smtp-Source: AGHT+IECq1aWX3wCLEd5Ct2cPOkJRTGfXghwarQE7KxFFo0JpqTD7sUqfJJ5YYKMDk8OKqrOjIbk2g==
X-Received: by 2002:a05:6512:124c:b0:545:5d:a5ea with SMTP id 2adb3069b0e04-558fa877d37mr1522692e87.3.1752082267967;
        Wed, 09 Jul 2025 10:31:07 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:07 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 02/20] msgpack-c: Upgrade 6.0.0 -> 6.1.0 to allow CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:36 +0300
Message-ID: <20250709173054.605430-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118356

Changelog:

https://github.com/msgpack/msgpack-c/blob/c-6.1.0/CHANGELOG.md

Fix:

| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../msgpack/{msgpack-c_6.0.0.bb => msgpack-c_6.1.0.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_6.0.0.bb => msgpack-c_6.1.0.bb} (82%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
similarity index 82%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
index aa7629763c..b7f3625c2a 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
@@ -7,13 +7,11 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                     file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
                    "
 
-SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https \
-           "
-SRCREV = "8160ede5e20fd3019a77eea46d9c72cf6163f802"
-
+SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https"
+SRCREV = "445880108a1d171f755ff6ac77e03fbebbb23729"
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE += "-DMSGPACK_BUILD_TESTS=off" 
+EXTRA_OECMAKE += "-DMSGPACK_BUILD_TESTS=off"
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.43.0


