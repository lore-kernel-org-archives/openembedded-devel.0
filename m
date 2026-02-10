Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175EAEA8123
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:34:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20937.1770734044969865854
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m3rLgce/;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43638a33157so729633f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770734043; x=1771338843; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BA4qaGrnlW7bDYFbigtz2pIrsxUIgNCa8l1kUdIZ4gE=;
        b=m3rLgce/fT0303vOd4aaB1l2l72KkSq2pWMLW0p8e2uDce9bg3x4tzQXfLhX4kqOnN
         ng7x8hNTlOCieSXVOhQiyX7tNLrAoYnSZX1RZEInQ/dJcRebn1hy7If0yL2/PuBVcP4G
         OWf9pALgzflEZqyIC2i+pEdv9aWFfabasTzsmu5rhprLYPDncVUx1jQ7ukm1jK24ghVX
         tHhJEPwJSrGqC6AMsB8ynQ/oGaWplAeOMvPDPinIr+nMzcUG/ah6xkz0PPq+CNKrT6u8
         Mfbdr18pXgJ0nuef/99E8eeV2iIInjiL+s0eJD9/vZrAq7TDEn6Ynnz1IdgxcjjDTGBL
         YiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734043; x=1771338843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA4qaGrnlW7bDYFbigtz2pIrsxUIgNCa8l1kUdIZ4gE=;
        b=FzoTg6oaG83DQJWuaYksegUJ4U5mSCv9hqacot1VoaLN6koayNSkV5Os00x0gtRHsf
         ixKqYn8uycEj1LBBf+H4zK15yL1sX6ZSbJOx74aohKWnrXGdUGp0SVqqAZ2Gi0Vj30Iq
         MxZS8Qd73BtQarVydaA1oo4PndutW5qXCWBGRcelzB8B+ldZM44Rwk51M4otpKDAjqKf
         nBj0OT8gOChlZ//OXSRsKAKcE0GwmtlOsTVdDZQsHvFknpzf01gqA7l8mQ0ghyHMAjxi
         pr0ggCv7/p/9M79ld0zbFuQiolI21++aq9WC66sfKaFz4cFqksu/BRophH+GP2Mcdxqw
         RvpA==
X-Forwarded-Encrypted: i=1; AJvYcCVZQ3zWv96c5WmqhQSfH9DSjcjuFfUQoUIucIFQnCmSS7SDv47/94Rlo8uW+oCO9BBl6z7jfrmIAJhHxpPaP4WoBxk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPvRVRXmds8LTxOCDYpPug0SSEmEAo38pFg3Ps3mxt8qGDPsx/
	QQB1fPb5h/d7zp9wRxAuf5v+k+q0DhdlFdL+6AKTgaf33msHoVLMbX0Ox3/B5A==
X-Gm-Gg: AZuq6aKVN2iIy/OsgE6P+bLlih/Iv5VTxEBlmnu5f1TGUJFjgZkBbXjTku7BE39/8uD
	G6bE77cJ1HEEcfFiHT9afM6pAFXO8YHJap1++qC+VD8tltxTbqV3sLK6YqTzioS38E5vd0DuLOf
	bM8VYWpsU9fhvXtoBi/9jbg7hqchkRqw9j6bj+lCk30hdwCAbSk8lC6tVAMFqU81wQ617Jy63G4
	M0eMHAc8vl/J+xGHr/5HiCrJ8lzlSJ4wEi61DaqqiaIhFEjVD/cfA7MZHAQoZfw7D4K5JRDo2Sv
	hMHSMcRxCE86v8bm90RcOgYzBdLGMDRwLCTb2SbT9GIvwvXAiNZLitdKhAxJZTfcfNwh6p3DUxG
	eC+zvb5YL3ojTCIvRpjjr4AybHPtN54CVSU2jx028p7P5xnUxMw4dqO7moBFwr+9T21bEvZ96Bm
	dbHFEi8qQkXHJcl4+bpZKcJHE3XmTMs3Q=
X-Received: by 2002:a05:6000:2502:b0:437:75c1:5777 with SMTP id ffacd0b85a97d-43775c1639fmr8160251f8f.16.1770734041907;
        Tue, 10 Feb 2026 06:34:01 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm36984363f8f.28.2026.02.10.06.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 06:34:01 -0800 (PST)
Message-ID: <700cc6f1-6aff-430a-8e8c-086df76cb5df@gmail.com>
Date: Tue, 10 Feb 2026 15:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] rocksdb: Add an option to set
 static library
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org,
 zahir.basha@kpit.com
Cc: Bhabu Bindu <bindu.bhabu@kpit.com>, Khem Raj <raj.khem@gmail.com>,
 Armin Kuster <akuster808@gmail.com>
References: <20260210133500.30649-1-zahir.basha@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260210133500.30649-1-zahir.basha@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 14:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124321

On 2/10/26 14:35, aszh07 via lists.openembedded.org wrote:
> Modify the CMakeLists.txt to add an Option for
> STATIC target import, as available for shared library.
>
> Link: https://github.com/facebook/rocksdb/pull/12890
>
> Configure static library default to switched off
> as shared libraries are sufficient in most cases.
>
> Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 233079a41caded6b68972317f01dc09435ba1ae0)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> (cherry picked from commit 72018ca1b1a471226917e8246e8bbf9a374ccf97)
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> ---
>  .../files/static_library_as_option.patch      | 72 +++++++++++++++++++
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  2 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
> new file mode 100644
> index 0000000000..09b30681f8
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
> @@ -0,0 +1,72 @@
> +From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
> +From: Bindu-Bhabu <bindudaniel1996@gmail.com>
> +Date: Fri, 26 Jul 2024 15:14:45 +0530
> +Subject: Add option to CMake for building static libraries
> +
> +ROCKSDB creates a STATIC library target reference by default.
> +Modify the cmake so that the STATIC library is also an option
> +just like creating a SHARED library and set default to ON.
> +refersh the patch according to kirkstone version.
> +
> +Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/12890]
> +
> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> +---
> + CMakeLists.txt | 25 +++++++++++++++----------
> + 1 file changed, 15 insertions(+), 10 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b68a82b..6f0de6f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -919,6 +919,7 @@ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT_SUFFIX})
> + set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
> + 
> + option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB libraries" ON)
> ++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB libraries" ON)
> + 
> + option(WITH_LIBRADOS "Build with librados" OFF)
> + if(WITH_LIBRADOS)
> +@@ -938,9 +939,11 @@ else()
> +   endif()
> + endif()
> + 
> +-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
> +-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
> +-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++if(ROCKSDB_BUILD_STATIC)
> ++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
> ++  target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
> ++    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++endif()
> + 
> + if(ROCKSDB_BUILD_SHARED)
> +   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_VERSION_CC})
> +@@ -1021,13 +1024,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
> + 
> +   install(DIRECTORY "${PROJECT_SOURCE_DIR}/cmake/modules" COMPONENT devel DESTINATION ${package_config_destination})
> + 
> +-  install(
> +-    TARGETS ${ROCKSDB_STATIC_LIB}
> +-    EXPORT RocksDBTargets
> +-    COMPONENT devel
> +-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> +-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> +-  )
> ++  if(ROCKSDB_BUILD_STATIC)
> ++    install(
> ++      TARGETS ${ROCKSDB_STATIC_LIB}
> ++      EXPORT RocksDBTargets
> ++      COMPONENT devel
> ++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> ++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> ++    )
> ++  endif()
> + 
> +   if(ROCKSDB_BUILD_SHARED)
> +     install(
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> index 8164f856e2..9cdc2edf30 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
>             file://mips.patch \
>             file://arm.patch \
>             file://run-ptest \
> +           file://static_library_as_option.patch \
>            "
>  
>  SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
> @@ -45,6 +46,7 @@ EXTRA_OECMAKE = "\
>      -DWITH_BENCHMARK_TOOLS=OFF \
>      -DWITH_TOOLS=OFF \
>      -DFAIL_ON_WARNINGS=OFF \
> +    -DROCKSDB_BUILD_STATIC=OFF \
>  "

At this point in the Kirkstone lifecycle I'm not sure if defaults should
be changed. In general I have no problem with the idea, but could this
made a PACKAGECONFIG that's enabled by default (to match the current
behavior of the recipe)?


>  
>  do_install:append() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124320): https://lists.openembedded.org/g/openembedded-devel/message/124320
> Mute This Topic: https://lists.openembedded.org/mt/117737559/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


