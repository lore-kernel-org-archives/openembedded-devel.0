Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBF8C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:02:11 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.49073.1743418925664534158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 04:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHkw9szL;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac29af3382dso677814066b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743418924; x=1744023724; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtlbCqdwP8FEBtqNXS0tEUi0KKeWW4hvnGvDDgtEo2o=;
        b=FHkw9szLbbFOyX/XnS2vtd9lRMYHSJw67Tcx9SYXWPaOYf35qbXCwkuQEn78eU+kFK
         oFNcI7RCgQln9BcMl/q0oQTIluGaJxZz+afLrD3tooIkNoheZNwE2bHIPzen3FF//X/S
         gS0805FgWInkEni6CaCjTwMOhWaR+xDfqL7lxtK5kIiKpOsX7UndRWN3oRxC0dsDYl5M
         G28CoxPKkmDESScaesbsGbFo/oACgT5bH6kTQFa/EmnZOl0YuId/Mpe0DlaqR+PUOT42
         cP2dlyt4C2OVMdbO20JlrrPL9HQZk13A5l2lAhFzqGGz4+MNW29G36gf/bpCoqoHuybI
         1wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743418924; x=1744023724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtlbCqdwP8FEBtqNXS0tEUi0KKeWW4hvnGvDDgtEo2o=;
        b=V6bIkrtQGVVt8T73/s7T41/xpP2PiN/Eg/PqeoicUCCP8xo6o2fz3ZIYyt7B9Vas4d
         ZmLhG/4gFXsLmHhcE148v6kvwlkbWwtN5JHa66jcTib6SVdX9xXTy8+pwgRVLL0KBTRt
         blXKGESjs0Jk8poA4mBYQqRbJYBFMO6tSakRz5+K6jFFIlJ7Es9hnAMW8mQuZqga7qup
         eHgQybfA6ru/6GMCS2ovVJD3MbZdFDx8Kl7rCDqg1E3ADQFtqUzT+EjxoYBvho6txzKG
         fY4X4NCk8DmwpN+RgodG0nuNqFRYD9hJg91QF77o4e+S950Uptpn84b2bsacHF/QlGQq
         dpmw==
X-Forwarded-Encrypted: i=1; AJvYcCVFo/+tzc7Eel2qhZ4NF7zfuInK4y8fJWnXWqwy7Xv4Pm8d5wEgOp4qvgNBtVw+JFUPvRgRhKObwaxlquP6FjRleEY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+z+xfd0Mge+9sxeiPTUJU4NXmPE1LviwoTHRs+logLOrTi0ke
	EkoLECmpSDSVO1yH2BSYBMnpAFQqFWUnPWpZtRqpypAvy3bHk0AO
X-Gm-Gg: ASbGnctNA+HwuX/ADhbErf3APiNVPRHGORxM0x9EBaTOkUuJF9+GAZDOdx0W+4fARiu
	+tCkqJ6k4jC734L5hJEXWzkOKKLy2lInVV/ressM5ho2mJypdsHJ0H4reIc6JBf7tBuChIoKeMI
	1Ns4ftSGjfQ1vzz4mcPJXEAcaVRbNCr68J4LIb4japauubaMNdzXYjwSdBQbOR++a66LEmCZefC
	WEPA5gngbXAtAmV6yPK//9bCC75qG2zqGvZj7XXh74MUluMt6/npW294USLA/EvrqglGWNstHAn
	doOUvgglSU2O7F+nmgRQPRGR1JHtQRXtHDtEdpqSj2wLMhB0fmr7
X-Google-Smtp-Source: AGHT+IFfgoiuZdsJ6VYbWsjqCdk2VSU8V++hTLd51p1Kz/e6OTPabsa/MzNtCPNMJ1dA4ZhHNNhO+g==
X-Received: by 2002:a17:907:7b9d:b0:ac6:e33a:31fc with SMTP id a640c23a62f3a-ac738c262demr947614966b.51.1743418923505;
        Mon, 31 Mar 2025 04:02:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927afcesm616266366b.55.2025.03.31.04.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 04:02:03 -0700 (PDT)
Message-ID: <5f8af9d4-fa0e-4574-9d83-f296ae853149@gmail.com>
Date: Mon, 31 Mar 2025 13:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH] protobuf: upgrade 5.29.4 -> 6.30.1
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
 <1743412308-21887-4-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1743412308-21887-4-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 11:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116431

This was just discussed a few days ago[1] that it should stay on 5.29,
because it's LTS. Or did something change about this?

[1]:
https://patchwork.yoctoproject.org/project/oe/patch/1742964890-10872-1-git-send-email-wangmy@fujitsu.com/

On 3/31/25 11:11, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> refreshed for 6.30.1
>
> 0001-utf8_range-add-version-marker-to-library-19009.patch
> removed since it's included in 6.30.1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  8 ++--
>  ...-add-version-marker-to-library-19009.patch | 43 -------------------
>  ...{protobuf_5.29.4.bb => protobuf_6.30.1.bb} |  5 +--
>  3 files changed, 6 insertions(+), 50 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_6.30.1.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> index 7a8906a9a4..77155af4ee 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> @@ -31,7 +31,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 4 insertions(+), 2 deletions(-)
>  
>  diff --git a/examples/Makefile b/examples/Makefile
> -index f7ee9b116..8cd1359e2 100644
> +index 5290fdb..8cd1359 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -4,6 +4,8 @@
> @@ -47,16 +47,16 @@ index f7ee9b116..8cd1359e2 100644
>   
>   add_person_cpp: add_person.cc protoc_middleman
>   	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
> +-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
>  +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>   
>   list_people_cpp: list_people.cc protoc_middleman
>   	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
> +-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
>  +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>   
>   add_person_dart: add_person.dart protoc_middleman_dart
>   
>  -- 
> -2.25.1
> +2.43.0
>  
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
> deleted file mode 100644
> index e58fdc1d19..0000000000
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From fd020ef700dbf2d324aecd087b8fcb6ff329feb6 Mon Sep 17 00:00:00 2001
> -From: Jan Engelhardt <jengelh@inai.de>
> -Date: Thu, 21 Nov 2024 11:30:17 -0800
> -Subject: [PATCH] utf8_range: add version marker to library (#19009)
> -
> -Unversioned libraries / libraries without due ABI indicators are not allowed in certain Linux distributions because it precludes the concurrent presence of multiple versions.
> -
> -If you have both /usr/lib/libprotobuf-lite.so.28.3.0 and /usr/lib/libprotobuf-lite.so.29.0.0, both of them want libutf8_validity.so, but if the ABI is different between utf8_range 28 and utf8_range 29, that's a problem.
> -
> -Closes #19009
> -
> -COPYBARA_INTEGRATE_REVIEW=https://github.com/protocolbuffers/protobuf/pull/19009 from jengelh:master 1a5f8682be2f2b84da07fcdd32474baae8088959
> -PiperOrigin-RevId: 698855702
> -
> -Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf/commit/ced605d0e6a7ad20985375b596b2ca6720e07737]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - third_party/utf8_range/CMakeLists.txt | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/third_party/utf8_range/CMakeLists.txt b/third_party/utf8_range/CMakeLists.txt
> -index 4276b97290..e054893c63 100644
> ---- a/third_party/utf8_range/CMakeLists.txt
> -+++ b/third_party/utf8_range/CMakeLists.txt
> -@@ -19,6 +19,15 @@ add_library (utf8_range
> - # A heavier-weight C++ wrapper that supports Abseil.
> - add_library (utf8_validity utf8_validity.cc utf8_range.c)
> - 
> -+set_target_properties(utf8_range PROPERTIES
> -+  VERSION ${protobuf_VERSION}
> -+  OUTPUT_NAME ${LIB_PREFIX}utf8_range
> -+)
> -+set_target_properties(utf8_validity PROPERTIES
> -+  VERSION ${protobuf_VERSION}
> -+  OUTPUT_NAME ${LIB_PREFIX}utf8_validity
> -+)
> -+
> - # Load Abseil dependency.
> - if (NOT TARGET absl::strings)
> -   if (NOT ABSL_ROOT_DIR)
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
> index 30b805e6b1..c3e701b5d3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
> @@ -14,13 +14,12 @@ LIC_FILES_CHKSUM = " \
>  DEPENDS = "zlib abseil-cpp jsoncpp"
>  DEPENDS:append:class-target = " protobuf-native"
>  
> -SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
> +SRCREV = "0d815c5b74281f081c1ee4b431a4d5bbb1615c97"
>  
> -SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=30.x;protocol=https \
>             file://run-ptest \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
>             file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
> -           file://0001-utf8_range-add-version-marker-to-library-19009.patch \
>             "
>  SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116400): https://lists.openembedded.org/g/openembedded-devel/message/116400
> Mute This Topic: https://lists.openembedded.org/mt/112000733/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

