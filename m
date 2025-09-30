Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA349CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 20:25:21 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.1024.1759263921128446550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 13:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NN8JpsyT;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so12703265a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759263919; x=1759868719; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpVEEtc/szz9aaacVz4mdr5Zlxuogt1NpOgieX0djR0=;
        b=NN8JpsyTQFHpfRqohN+wdLIii1eSxRPuPl5lvLNakWL/41YNzrCuky/63BJu2lf8vs
         LaYz3kduQG1HADDGQ7COdFvJCzofiUFwrhGI5/HSd6ItDlR+7i37Bf9+ddLhCE5CM/E+
         z34KHzx8bNYjjCSqQnNTid0Vg6UxaQUIrMe8KcABz33mZIzBsqSQnnIdeicfE5J3lnQK
         KzVuEessRtW3fi7WcKeFTC2gZ0OooO8Nmu9Ei0U29nnnKZ+DbX+DzmhMF7bpd3sQR5rK
         gzPKFj+n3g+7sR2EQK5WUJsXICw11FASLFccFqYTfT3RB8OBLnBKNQeS9oa310PO9D0d
         Xhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263919; x=1759868719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpVEEtc/szz9aaacVz4mdr5Zlxuogt1NpOgieX0djR0=;
        b=XwNAfxzRnM/9g0bkCPoUoTh9l3BZEoWvh9Rsc3+7z9C1lCE8aFarUhxhMEQJ56wfiC
         W1wbMCFAsneJn4TLMHolzM4ONUiJrMcsZT8cqj3cdvD1cdMFaw4fLHXbiSNd0u3B9xtK
         1dE2AiU9PFBF27dDJloWEihiAG77nP0aDqMth4v5slI5ncbNnILX5JM7hSTM77WT9ONl
         wO2OpfgNqV61bW+1yYFKj2HNXW0lxcDMs//6Hd7R7nfs4PEdaHp46LnNtJ+9jDhAooxt
         cJgdI6RspP8MOrIDOEOqSh8qAWmAP0FRXU8GgVEPnpvmS1cfcAxHaPZrmojZmG7e9DWh
         6qPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbXelSHK4MFQM0lJGvFpKsUpMhT2zvxi7OW9gXFsuUDjk5LGyA2x6YWGZpp5nQ4wiiHaQ0XrtCSb+7RxAq6oPCaqg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCDw505gBjbuv2eXmUw+E3ECKlmsDgE3hRSGYUIH7ZdPMN/zgm
	tsTPDGp881lDLJ8EeXyxuDBh9W5vJ8W1CCkJBeKKjJ+R0Xu+KRjMJC+m
X-Gm-Gg: ASbGncvEp5LvThS72qN9pQTGl2FtLdJvceun2fRwAxqSAdbjR4PhZ8+3OkhpG63F24u
	CYtMM2gA184+Ich1sTYb89so1glO1yKNiTgciLU9HIhGtuL8YYbU76hPcRkkNBCtNJ25ZYT3Gaf
	EGU9RxSYL96/TWpEO4STFFFdA/YXSBbULLiKbKbtzV8/H7/D0FmNRACd6xdf9Y5k+sATLmwil7z
	CzzSLJTAzVBANUstq3mP+9GDn/iF6Tt/IUEzzzZHr2LDPbWrDeu+qZLYGUCEaLdEunGbREOXydl
	mj4ABmwBuDOw4WURJDM73BFPXJg4qbuy3yR+Rzr0AL7pidZaPuOL08tMwjeyC4+PfKWVLa4qp0f
	L3nFTt2XUQfkSZ7RhE8F/FvihEKe4uZg42qcP9mhk0MBNx0ouGGnXVGw=
X-Google-Smtp-Source: AGHT+IEjOQdcvI9klvMPUNQvjspSUl1AHCeOXtkYJFY1qwgBZEm9IxahqV6WdB2uH0oFn66xaopa0A==
X-Received: by 2002:a17:906:4fcd:b0:b2c:dc13:89e3 with SMTP id a640c23a62f3a-b46e9e458d3mr96008966b.59.1759263919177;
        Tue, 30 Sep 2025 13:25:19 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9978bsm1241134666b.95.2025.09.30.13.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 13:25:18 -0700 (PDT)
Message-ID: <344744b7-3ae9-4dda-89cb-c3660141aaac@gmail.com>
Date: Tue, 30 Sep 2025 22:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 01/22] zlog: upgrade 1.2.16 ->
 1.2.18
To: Ankur Tyagi <ankur.tyagi85@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
 <20250930091841.1693131-2-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250930091841.1693131-2-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 20:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120084

I am not able to accept relicensed updates in stable branches.
If you could send that CVE patch separately, that would be nice
though... (if you have time for that)

On 9/30/25 11:18, Ankur Tyagi wrote:
> From: Gyorgy Sarvari <skandigraun@gmail.com>
>
> Switched to cmake. Added a backported patch to be able to use
> the latest version of cmake.
>
> Also, add a new patch to avoid overwritingg all the CFLAGS set by Yocto,
> which helps with avoiding the inclusion of TMPDIR in the generated files.
>
> License-Update: License changed to Apache2:
> https://github.com/HardySimpson/zlog/commit/1a7b1a6fb956b92a4079ccc91f30da21f34ca063
>
> Changelog:
> 1.2.18:
> - patched severe vulnerability CVE-2024-22857
> - restructured build system
>
> 1.2.17:
> - Change Lience to Apache 2.0, for more people
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 8891ca87488384c0ab65b5d77c1278187080753d)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...01-Don-t-overwrite-systemwide-cflags.patch | 31 +++++++++++++++++++
>  .../files/upgrade_cmake_minimum_version.patch | 25 +++++++++++++++
>  meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  | 17 ----------
>  meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  | 14 +++++++++
>  4 files changed, 70 insertions(+), 17 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
>  create mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
>  delete mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
>  create mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
>
> diff --git a/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch b/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
> new file mode 100644
> index 0000000000..f09f517b98
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
> @@ -0,0 +1,31 @@
> +From ee35b6507993e79fc594e3b7ad50174e33e68daa Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Wed, 24 Sep 2025 11:22:29 +0200
> +Subject: [PATCH] Don't overwrite systemwide cflags
> +
> +Instead of overriding the cflags from the system, just append to them.
> +
> +Upstream-Status: Submitted [https://github.com/HardySimpson/zlog/pull/306]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + CMakeLists.txt | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 8981934..f2bd574 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -33,9 +33,9 @@ SET(ZLOG_SO_VERSION ${CPACK_PACKAGE_VERSION_MAJOR})
> + message(STATUS "platform : ${CMAKE_SYSTEM}")
> + 
> + add_definitions("-g -Wall -Wstrict-prototypes")
> +-set(CMAKE_C_FLAGS "-std=c99 -pedantic -D_DEFAULT_SOURCE")
> +-set(CMAKE_C_FLAGS_DEBUG "-ggdb3 -DDEBUG")
> +-set(CMAKE_C_FLAGS_RELEASE "-O2")
> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -pedantic -D_DEFAULT_SOURCE")
> ++set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -ggdb3 -DDEBUG")
> ++set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
> + 
> + if (WIN32)
> +     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DWINVER=0x0500 -D_WIN32_WINNT=0x0500 ")
> diff --git a/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
> new file mode 100644
> index 0000000000..9d02066d57
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
> @@ -0,0 +1,25 @@
> +From 3715879775f725260aeda14f94887bbc7a007e29 Mon Sep 17 00:00:00 2001
> +From: haydenZhou <mfkhao2009@outlook.com>
> +Date: Sun, 8 Jun 2025 10:45:05 +0800
> +Subject: [PATCH] upgrade cmake minimum version
> +
> +Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/3715879775f725260aeda14f94887bbc7a007e29]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5ddaf8d..31a1553 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -14,7 +14,7 @@
> + # limitations under the License.
> + #/
> + 
> +-cmake_minimum_required(VERSION 2.8.5)
> ++cmake_minimum_required(VERSION 3.12)
> + 
> + message(STATUS "path : ${CMAKE_FIND_ROOT_PATH}")
> + project(zlog)
> diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> deleted file mode 100644
> index b75802f09f..0000000000
> --- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "Zlog is a pure C logging library"
> -HOMEPAGE = "https://github.com/HardySimpson/zlog"
> -LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> -
> -SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
> -SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit pkgconfig
> -
> -EXTRA_OEMAKE = "CC='${CC}' LD='${LD}' LIBRARY_PATH=${baselib}"
> -
> -do_install() {
> -    oe_runmake install PREFIX=${D}${exec_prefix} INSTALL=install
> -}
> diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
> new file mode 100644
> index 0000000000..268f022b51
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Zlog is a pure C logging library"
> +HOMEPAGE = "https://github.com/HardySimpson/zlog"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https;tag=${PV} \
> +           file://upgrade_cmake_minimum_version.patch \
> +           file://0001-Don-t-overwrite-systemwide-cflags.patch"
> +SRCREV = "7fe61ca6265516e9327a51fc394b2adb126c2ef3"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +


