Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 963737C4A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4553; q=dns/txt; s=iport;
	t=1549560704; x=1550770304;
	h=subject:from:to:cc:references:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=YmbI2GJsrky/88zataWyZ6RRKtdiWutznH1h2xh7xYU=;
	b=MzaA9kGQ0u2OmYSMLvX5OzxrI50Q77ooZSqHTSbJoeG+AZW+QychuKvH
	CzvWOh2dyrL4gyDVVMbkUTKXO63G6aq1tSmovyoWzkr6JmlsZTHuDeK+P
	3l3Mket5r7O9JSP/kjj8YTJm7DM18gV4V/E35DQrco3kt3UMSWfCVH3Xc Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ADAAAsa1xc/xbLJq1kGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUQQBAQEBAQsBgmpRMieEA4gaX4w1Oy2YEYF7CwEBJ4N?=
	=?us-ascii?q?/RgKDSjQJDQEDAQECAQECbRwMhUoBAQEEIxU2CxALEQMBAgECAiYCAk8IBgE?=
	=?us-ascii?q?MBgIBAYMgAYIBD60ogS+ELwGBFIRoFHeLT4FAP4ERJ4Jrgx4CAhiEUIJXApE?=
	=?us-ascii?q?AkhAJhzeLCAYZgW1ShHSDF4gLii2FOIwXAhEUgUY4gVYzGggbFTuCbAmCIBY?=
	=?us-ascii?q?TgziCVoI+hUE9AzAKjnABAQ?=
X-IronPort-AV: E=Sophos;i="5.58,344,1544486400"; 
   d="scan'208";a="9940547"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Feb 2019 17:31:42 +0000
Received: from [10.63.114.252] ([10.63.114.252]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id x17HVgDF008726
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 7 Feb 2019 17:31:43 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <1549537201-4781-1-git-send-email-rbilovol@cisco.com>
Message-ID: <9c35bb5b-c262-c482-8cb8-08bd76df1c43@cisco.com>
Date: Thu, 7 Feb 2019 19:31:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1549537201-4781-1-git-send-email-rbilovol@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.114.252, [10.63.114.252]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: Re: [meta-oe] [PATCH] rapidjson: fix cmake artifacts installation for non-default BASELIB case
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 17:31:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

I see you picked up this patch to master-next, but the patch's author
is incorrect:
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=cf54629463841242ce1faa90f6ad4a2383df3b2c

Could you please fix it?

This is the same issue we faced with oe-core mailing list, I remember
Richard Purdie had some scripts to fix it automatically

Thanks,
Ruslan

On 2/7/19 1:00 PM, Ruslan Bilovol wrote:
> If BASELIB is set to non-default value (like lib64),
> next 'installed but not shipped' issue happens:
>    /usr/lib
>    /usr/lib/cmake
>    /usr/lib/pkgconfig
>    /usr/lib/cmake/RapidJSON
>    /usr/lib/cmake/RapidJSON/RapidJSONConfigVersion.cmake
>    /usr/lib/cmake/RapidJSON/RapidJSONConfig.cmake
>    /usr/lib/pkgconfig/RapidJSON.pc
> 
> This is because rapidjson has library installation dir set
> to 'lib' by default and hardcoded in another place.
> Fix this by next changes:
>   - set appropriate LIB_INSTALL_DIR
>   - fix hardcoded 'lib' in CMAKECONFIG_INSTALL_DIR case
> 
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>   ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 ++++++++++++++++++++++
>   .../recipes-devtools/rapidjson/rapidjson_git.bb    |  5 +--
>   2 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> 
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> new file mode 100644
> index 0000000..745f5d0
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> @@ -0,0 +1,36 @@
> +From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
> +From: Ruslan Bilovol <rbilovol@cisco.com>
> +Date: Thu, 24 Jan 2019 18:11:39 +0200
> +Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
> +
> +Currently this path is hardcoded to lib/cmake.
> +Some distributions have different library path (like lib64).
> +So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
> +configurable and usable in such distros.
> +
> +Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9]
> +
> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> +---
> + CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7c60407..0275672 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}ConfigVersion.cmake.in
> +     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
> +
> + # ... for the install tree
> +-SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
> ++SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
> + FILE( RELATIVE_PATH REL_INCLUDE_DIR
> +-    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
> ++    "${CMAKECONFIG_INSTALL_DIR}"
> +     "${CMAKE_INSTALL_PREFIX}/include" )
> +
> + SET( ${PROJECT_NAME}_INCLUDE_DIR "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INCLUDE_DIR}" )
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index c90eab0..e3ed9c6 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -4,7 +4,8 @@ SECTION = "libs"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
>   
> -SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
> +SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
> +           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
>   
>   SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
>   
> @@ -14,7 +15,7 @@ S = "${WORKDIR}/git"
>   
>   inherit cmake
>   
> -EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
> +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
>   
>   # RapidJSON is a header-only C++ library, so the main package will be empty.
>   
> 

