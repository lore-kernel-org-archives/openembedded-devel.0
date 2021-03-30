Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.5503.1617115083675485408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 07:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pqi5GXoM;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id o2so6270776plg.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ydHE+uVj759we4YZ16xtxcupFdgF2sCYcCYzy7NcMnw=;
        b=pqi5GXoMjHjdhxejfJuR7LNQngfzU8XHeu/cEuEK15M6KRANZMa+gSU5CcpovMJNeO
         nRAHttl6uvuy6UsPZzv9JDiQ+TzwcTiwH9kOBdXaJSrYoA1+JMddzVEz1jxiyYdaeD6K
         vSVNdp8OykzpijF0jKb9NMK/lSrHCctb2FiXoNTnL6f3bC2OICvBhW9DilJe03sZJIEt
         o5FcMK2CaoePGzFyzcNwyKk002QRgyPX2WXGw/4lq66pgiLoVU0pp02sk3nMdwjztiOs
         AK611Q1Ogrgrwz7lP3ec2TVitC+1Kg3tFhF6TJ+6x0gb8nlBuh9qihZqgI7MbRwwLsUj
         ckAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=ydHE+uVj759we4YZ16xtxcupFdgF2sCYcCYzy7NcMnw=;
        b=VCQZlWpmYA/xR0jJrGh7EWvfSefyGonzYcy8kmXXOLCKQQcXJVJ29llcs3pB8cW/DM
         c+kpDehFCepZXWjCtUtmOD3wrc4S2ktnH3Cpra3c1ng5gA6hyfejEyfmDswQo0HPWsNu
         zrADtzLzP8E1S4CKvlW59hk7rjhyqyOGrapY5nI19JexEpxpiXob7Gm3gAKhJ4/KZvq5
         xqw7436/wiFC+qy7y6GJHfaRvzgisY6vNMtV4jjmC02yq6YjTFRJkdv7bI5GB1nL06z8
         0Rcgt0UsxCyEnJXouCvrXt7mDKsl3g11O0VHeQ+hZBDgyk6HWckEP+0/0jAC+E2za3yE
         vQ9g==
X-Gm-Message-State: AOAM531o86fKul7apniCw/zczurwp+iM5jD0EO9m7NhbNMyXo4LIWknM
	4VM5w2DuxEbnJV+EBFPLfsU=
X-Google-Smtp-Source: ABdhPJxeEAPlbs7xs3qKNnfuitcV1BRsFEjjmwAi4PCzfxk4WE9VF0s/hpZxlMmVpUG79ZdU49dfvQ==
X-Received: by 2002:a17:90a:bf91:: with SMTP id d17mr4577369pjs.138.1617115083145;
        Tue, 30 Mar 2021 07:38:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:20e0:2ff7:e997:1a04? ([2601:202:4180:a5c0:20e0:2ff7:e997:1a04])
        by smtp.gmail.com with ESMTPSA id p22sm3022683pjg.39.2021.03.30.07.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 07:38:01 -0700 (PDT)
Subject: Re: [oe] [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted patches
To: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 "raj.khem@gmail.com" <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
References: <1615790942-1428-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
 <1615790942-1428-2-git-send-email-Harpritkaur.Bhandari@kpit.com>
 <PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
 <PN2PR01MB4410638FEC7DD1F273E6524EEF7D9@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f3cac26a-dec4-0c33-7662-79b4818e4826@gmail.com>
Date: Tue, 30 Mar 2021 07:38:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <PN2PR01MB4410638FEC7DD1F273E6524EEF7D9@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/30/21 5:06 AM, Harpritkaur Bhandari wrote:
> Hi,
>
> Can you please confirm when this patch will get merged
> in gatesgarth branch?

I can not at this time. Its in my testing branch. I lost my one  build
system last week and I use it to build both Gateharth and Dunfell.
Things are backup for both.

I hope to have thing sorted out by weeks end.

-armin
>
> Thanks,
> Harprit Bhandari
>
> ------------------------------------------------------------------------
> *From:* Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> *Sent:* 22 March 2021 12:37
> *To:* openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>; raj.khem@gmail.com
> <raj.khem@gmail.com>
> *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>
> *Subject:* Re: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove
> unwanted patches
>  
> Hi,
>
> Can you please confirm when this patch will get merged in gatesgarth
> branch.
>
> Thanks,
> Harprit Bhandari
>
> ------------------------------------------------------------------------
> *From:* Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> *Sent:* 15 March 2021 12:19
> *To:* openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>; raj.khem@gmail.com
> <raj.khem@gmail.com>
> *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari
> <Harpritkaur.Bhandari@kpit.com>
> *Subject:* [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted
> patches
>  
> From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
>
> rapidjson is upgraded to latest SRCREV so
> removing the below patches which are not
> applicable:
> 1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> 2.remove-march-native-from-CMAKE_CXX_FLAGS.patch
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)
> Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> ---
>  ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36
> -------------------
>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40
> ----------------------
>  2 files changed, 76 deletions(-)
>  delete mode 100644
> meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
>  delete mode 100644
> meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
>
> diff --git
> a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> deleted file mode 100644
> index 745f5d0..0000000
> ---
> a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
> -From: Ruslan Bilovol <rbilovol@cisco.com>
> -Date: Thu, 24 Jan 2019 18:11:39 +0200
> -Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
> -
> -Currently this path is hardcoded to lib/cmake.
> -Some distributions have different library path (like lib64).
> -So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
> -configurable and usable in such distros.
> -
> -Upstream-Status: Backport
> [https://github.com/Tencent/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9]
> -
> -Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ----
> - CMakeLists.txt | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 7c60407..0275672 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -199,9 +199,9 @@
> CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}ConfigVersion.cmake.in
> -     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
> @ONLY)
> -
> - # ... for the install tree
> --SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
> -+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
> - FILE( RELATIVE_PATH REL_INCLUDE_DIR
> --    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
> -+    "${CMAKECONFIG_INSTALL_DIR}"
> -     "${CMAKE_INSTALL_PREFIX}/include" )
> -
> - SET( ${PROJECT_NAME}_INCLUDE_DIR
> "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INCLUDE_DIR}" )
> ---
> -1.9.1
> -
> diff --git
> a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> deleted file mode 100644
> index cf3e16e..0000000
> ---
> a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
> -From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Mon, 19 Dec 2016 01:37:11 -0800
> -Subject: [PATCH] remove -march=native from CMAKE_CXX_FLAGS
> -
> -Not appropriate when cross compiling.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ----
> - CMakeLists.txt | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -Index: git/CMakeLists.txt
> -===================================================================
> ---- git.orig/CMakeLists.txt
> -+++ git/CMakeLists.txt
> -@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
> -
> - if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
> -     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR
> ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64" OR
> ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
> --      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
> -+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
> -     else()
> -       #FIXME: x86 is -march=native, but doesn't mean every arch is
> this option. To keep original project's compatibility, I leave this
> except POWER.
> --      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
> -+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
> -     endif()
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
> -     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal
> -Wconversion -Wsign-conversion)
> -@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
> -       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
> -     else()
> -       #FIXME: x86 is -march=native, but doesn't mean every arch is
> this option. To keep original project's compatibility, I leave this
> except POWER.
> --      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
> -+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
> -     endif()
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror
> -Wno-missing-field-initializers")
> -     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal
> -Wconversion -Wimplicit-fallthrough -Weverything)
> -- 
> 2.7.4
>
> This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected mails.
>
> 
>

