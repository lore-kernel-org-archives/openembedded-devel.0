Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.11730.1618929789948741055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 07:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ajoEYsr6;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id h11so8050162pfn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WsF4ueIjJMQ0XqVg2emGKsPAqzi3fEZQVlRbtC/8J8Y=;
        b=ajoEYsr63oO/qdnQV9yi0pQQB3g6OPN9MUeVAYFq83oYj/BwLrX3oqEXVnjHzdoCcA
         rVxrC0gsGi6brTc5Jga9exWf8Wo7bADao1A9rxCELR/yGo2eaH86LuNrxR2Jr6ZUwCyU
         P/G4zNRXOg/s9b1zWfTvxLkVVPl0xf6kVh7afqYp3UPjH4tBP8teXrHD4ACFKRUCehi5
         nJVfLagwwRwHpyMGNJgoePjaEPZqtJHOKtqp7n2TYz4SHWPvhMEfA6RvaboA7wwpmMTc
         /JQEGURFhXwSB0iXhm0vs/2A1gmLigERcGxfYWI1aBhyWkvY5b/9V5qxSY7CxPkmVU9B
         MuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WsF4ueIjJMQ0XqVg2emGKsPAqzi3fEZQVlRbtC/8J8Y=;
        b=hylNUvhLBs7fB86Sm/G5pmqNI/ORh315VVrk3iclbU9RazLegmmLKhURPuf6BV2YSv
         Td2WxskIxttKmzWlZ7m/IZ2f3/Kj0JWrk3EAtrvLiLabac2sc5ifsdEnDWBE14213+Yj
         hVHd650hDNQSN5Zk4tM78h8BF7IGAMiiymqpfkG+0mxCWNVyvweN6DpTbtUkc6+xUfAQ
         rpNLIyGrSYeePqGSgSDFMfLkzyrli6i3C38WXd62iGp/BzZis+JrAGCc8SKUPol+ZgkV
         wG4ZZSLhni4lS0EW4Pq1CmWl2jQkDOAGIuMfnWse8zv4rTgxXMKFtzH+TTHnhBpAzVWW
         zQkw==
X-Gm-Message-State: AOAM533qxS/xF6zR3hD4X97d8BWbvsPpx15qqAhw+kfLWAl/lihs8PkH
	2c9A7TQBlyvak9eC9w1TFQGDMJHRKLMCNw==
X-Google-Smtp-Source: ABdhPJy5CU4TAv/MSlXj1jga/5CoUkY2qo0tRCjTSMH6CVLm2+UBdzhwTHxozQFvxHeS2UPzPQOYeg==
X-Received: by 2002:a65:48c5:: with SMTP id o5mr17227330pgs.101.1618929789082;
        Tue, 20 Apr 2021 07:43:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id r3sm10586231pgn.82.2021.04.20.07.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 07:43:08 -0700 (PDT)
Subject: Re: [oe][meta-oe][PATCH] tigervnc: upgrade to 1.11.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20210420065508.16247-1-Qi.Chen@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fbdaa43b-b1e4-cffa-0a97-1da77679fc06@gmail.com>
Date: Tue, 20 Apr 2021 07:43:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420065508.16247-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/19/21 11:55 PM, Chen Qi wrote:
> Upgrade to latest stable version.
> 
> The 1.10 branch is not maitained any more, it stops update in 2019.
> The 1.11 branch has fix for CVE-2020-26117, which is a high risk CVE.
> https://nvd.nist.gov/vuln/detail/CVE-2020-26117
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
>   ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
>   ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} |  6 ++--
>   3 files changed, 28 insertions(+), 35 deletions(-)
>   rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} (96%)
> 
> diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> index 4e875ba82..5a42e67d0 100644
> --- a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> +++ b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> @@ -1,29 +1,30 @@
> -From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 25 Apr 2017 01:36:44 -0400
> -Subject: [PATCH 2/4] do not build tests sub directory
> +From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 19 Apr 2021 23:02:45 -0700
> +Subject: [PATCH] do not build tests sub directory
>   
> -Upstream-Status: Inappropriate [oe specific]
> +Upstream-Status: Inappropriate [OE Specific]
>   
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Hongxu Jia <Hongxu.Jia@windriver.com>
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   ---
>    CMakeLists.txt | 3 ---
>    1 file changed, 3 deletions(-)
>   
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 94ec2ef..fb72a00 100644
> +index 7bf99441..bda80598 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
> -@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
> +@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
>      add_subdirectory(media)
>    endif()
>    
>   -add_subdirectory(tests)
>   -
>   -
> - include(cmake/BuildPackages.cmake)
> + add_subdirectory(release)
>    
>    # uninstall
>   --
> -2.7.4
> +2.30.2
>   
> diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> index 97b0a388a..5f14665b8 100644
> --- a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> +++ b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> @@ -1,44 +1,34 @@
> -From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 20 Jul 2017 17:12:17 +0800
> -Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
> +From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 19 Apr 2021 23:14:28 -0700
> +Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
>   
> -The static libraries in Xregion/network/rdr/rfb were linked by shared
> +The static libraries in network/rdr/rfb were linked by shared
>   library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to fix
>   relocation issue.
>   
>   Upstream-Status: Pending
>   
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   ---
> - common/Xregion/CMakeLists.txt | 1 +
>    common/network/CMakeLists.txt | 1 +
>    common/rdr/CMakeLists.txt     | 1 +
>    common/rfb/CMakeLists.txt     | 1 +
> - 4 files changed, 4 insertions(+)
> + 3 files changed, 3 insertions(+)
>   
> -diff --git a/common/Xregion/CMakeLists.txt b/common/Xregion/CMakeLists.txt
> -index 40ca97e..9411328 100644
> ---- a/common/Xregion/CMakeLists.txt
> -+++ b/common/Xregion/CMakeLists.txt
> -@@ -3,4 +3,5 @@ add_library(Xregion STATIC
> -
> - if(UNIX)
> -   libtool_create_control_file(Xregion)
> -+  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
> - endif()
>   diff --git a/common/network/CMakeLists.txt b/common/network/CMakeLists.txt
> -index b624c8e..6c06ec9 100644
> +index d00ca452..e84e0290 100644
>   --- a/common/network/CMakeLists.txt
>   +++ b/common/network/CMakeLists.txt
> -@@ -9,4 +9,5 @@ endif()
> +@@ -16,4 +16,5 @@ endif()
>    
>    if(UNIX)
>      libtool_create_control_file(network)
>   +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
>    endif()
>   diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
> -index 989ba2f..20f6489 100644
> +index 989ba2f4..20f6489d 100644
>   --- a/common/rdr/CMakeLists.txt
>   +++ b/common/rdr/CMakeLists.txt
>   @@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
> @@ -48,15 +38,15 @@ index 989ba2f..20f6489 100644
>   +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
>    endif()
>   diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
> -index 5047e5e..88838ab 100644
> +index fc5a37bf..7f5ce131 100644
>   --- a/common/rfb/CMakeLists.txt
>   +++ b/common/rfb/CMakeLists.txt
> -@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
> +@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
>    
>    if(UNIX)
>      libtool_create_control_file(rfb)
>   +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
>    endif()
>   --
> -2.7.4
> +2.30.2
>   
> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> similarity index 96%
> rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> index f97c2b2d6..1e7160aea 100644
> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> @@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
>   inherit autotools cmake
>   B = "${S}"
>   
> -SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
> +SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
>   
> -SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
> +SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
>              file://0002-do-not-build-tests-sub-directory.patch \
>              file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
>              file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
> @@ -83,6 +83,8 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
>           --disable-xwayland \
>   "
>   
> +EXTRA_OECMAKE += "-DINSTALL_SYSTEMD_UNITS=OFF"
> +

I wonder if this should be made conditional on systemd in DISTRO_FEATURES ?


>   do_configure_append () {
>       olddir=`pwd`
>       cd ${XSERVER_SOURCE_DIR}
> 
> 
> 
> 
> 
