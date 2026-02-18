Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F66E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:23:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5992.1771392216913501589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 21:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQiLWQIn;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48379a42f76so30973005e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 21:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771392215; x=1771997015; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvLRWqzP93yAYl8za4EsUWRMTpBMLurc8IYOogxdYlg=;
        b=RQiLWQInWTBqQy5yZFWZtfJYpnqL6rZN74JD7lk4tGMxTVT3e4YD/dEQvEiL//HSt7
         g3owo2p0MWqAlBk2mMY03fpASgNkiazSIywPri5poiESYMPKyTDM/LoUwOIBK99KfJQ1
         Fv3qegBRda8xEnCM6TeQbtthVGbKPY/7z/wdAvlEmOF5S4+vkId3FI3awNZ/WXwn8HsP
         NNY2pjGBLWamlA+JliOt+Ny0koQDC6eQ0pZblnv23OJX75XzqVtWYa/U8R01P0u9bGPz
         im2GrHNPDk3rShkjwyz6Zdb9WrrOK0X4/hbAOSzYKc9iWoXx2JIKwTBbKu1187dhNNAj
         mkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771392215; x=1771997015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvLRWqzP93yAYl8za4EsUWRMTpBMLurc8IYOogxdYlg=;
        b=FPwZl69iQzWw7JK0n7InouubuzMwig/sndQ4fueO1O5FKDrxKloK8Cva5Cnp0jBtpR
         2qf4DaAi+yVczc+ty3m+VeuUatMumOo6yJPy/h56x1DH6+Vc1G2+RvCGViiGnDSR68+p
         M56kyGG0Nqg136wJDYGfZL799uWZenDbZDqLpLgLrMsn2d6ljeIwYZg0qTUio+0p4gWS
         OAVUonKu2CM11pY3JjMHBtyMgGM+G7ATOSolEw7+TvdYslP0fL2531WKI60RL1r7Z0Xx
         62o77TZSCDe3frRcWjWOvg0S1giP/L/Zs/BbPDAZcgTLxphX5tS0lzKUnOgfHTZ3l9Wf
         zmMw==
X-Forwarded-Encrypted: i=1; AJvYcCUf9NDpLMgebjd10ABEp54XdDBqPc5Kde/30T+1tg2pA6dZS1HrieWI4l/PvIwiN6zFbWVs8ngScKYfXuRGRQtBwiI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaWic1oimbSdjilvbuKJCGamjZPqPL0CzfEXspEdtCLnmhZor8
	nrRdHTT4DFVZARia40QznMQZudmD+yRblNOeXuGMyrLEicR0dteoETw5
X-Gm-Gg: AZuq6aL6DbbmJOqYqALAY0Sv+n38W/HA4nmNeBJVi9R0Uf23zcfck5xGA5kj73QqocW
	FBlhvjSclqYeDzCHKFBowb99ZINp9buPk9laRzXvddPM55Qix0uJgmvOp8au0Z7zkUfcdpJkZfa
	SNB3ks5VMFuuxQy4B41lesdmou2Vf6jvSqT6n8JZRHpeKLt3RsdmJYetsv1DQP+w4eaW2AsHsAP
	GFQHX/urkioxAQ+tEl3GAVhrQs4vrpRDq6rb3zzRwoYI25N17W/YJQ3qct6qbupxJEbWmk4gI06
	0p8huuys+qArUjBJXN0eyac9jYY5LEuB8Z12rrwGz/kOmmCtshtahiIO4klNoze9w7nBP8V4lpa
	W/bMxziCNSOAM8zJB/pgjoLUyWebieyShUD0vWF8xNK90JWZjAgUxgMLP8iAoakn/Ohel0Bluo0
	1wtCIpj2ZDKwSgqDhXYRs3uf9xkohSLDA=
X-Received: by 2002:a05:600c:1f92:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-48379bfd727mr225113715e9.17.1771392214786;
        Tue, 17 Feb 2026 21:23:34 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48397318da6sm21092115e9.2.2026.02.17.21.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 21:23:34 -0800 (PST)
Message-ID: <1727f87b-6567-485b-93ca-4b63e5b8d831@gmail.com>
Date: Wed, 18 Feb 2026 06:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH V1] rocksdb: Add an option to set
 static library
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org,
 zahir.basha@kpit.com
Cc: Bhabu Bindu <bindu.bhabu@kpit.com>, Khem Raj <raj.khem@gmail.com>,
 Armin Kuster <akuster808@gmail.com>
References: <20260217125514.34002-1-zahir.basha@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260217125514.34002-1-zahir.basha@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 05:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124469

I can apply this, but don't you want to add also an optional
PACKAGECONFIG knob or something, so users can enable this behavior
easily if they want to?


On 2/17/26 13:55, aszh07 via lists.openembedded.org wrote:
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
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  1 +
>  2 files changed, 73 insertions(+)
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
> index 8164f856e2..7f4a4e8ee0 100644
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124451): https://lists.openembedded.org/g/openembedded-devel/message/124451
> Mute This Topic: https://lists.openembedded.org/mt/117855568/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


