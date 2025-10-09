Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61712CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 07:03:55 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.6144.1759993428598515852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 00:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ml+2BfKe;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso1178432a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759993427; x=1760598227; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ZEG13dfAzcYgehTCegvYhuabYzygPEluW8FXI/+IvM=;
        b=ml+2BfKeOlYnVSkPXGWCTAwvjcM4rv5urAsyApiSbtVEU4kYGSvpjjKSl58b8EVzTG
         6VlbIYcPGQzH2E+g7nDWBpipHC4sdod65gfm1HCZYDblxn6NNoo5B9XNZP42GqsvQCFF
         yi3CoHcQwHeNV68H2hNjIXiFrEUMBf4HiBntCh4/O2pGDQ0Fs3WvQ22J4JkFpgl6RxFE
         w4Z7yYM7mkS/pL2OaYvUIb3qs1g7nWW3f2TwkejsfNoHjUDvxzHEN7ZNp5pIHmI9uKER
         H6WUZVUwBjfQfb8u6QZ8rIEAAal1L/np32gi57t6oWA+LhPgY9B3y5wKeIcQG7hMXPlt
         2KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993427; x=1760598227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZEG13dfAzcYgehTCegvYhuabYzygPEluW8FXI/+IvM=;
        b=RaC2Kkk+76JVSHU6rg4EOiq+Kf+lW4Mr0eWAh3fjRyZ35kQgjmB+GM/5AJoIPF29hm
         LdKlmAuV+f7aIvXZJaNrvoWQDTFtYub7t16HZuPM4LOF1qbrdWZ8CrMxe5S8+XuGxcpg
         bs52imrkR/GzNDXnq49aHBUy6UKYH9f+Ucxhs3aBP+YdzspVvAL/dxRvZ46DjoCAQZlI
         JRsUf/ryJQMWeiHWUnpWjZEQ/skgr8B7o6HnP6wZs8Fiogc0DCxsLyJjtEgVuRpzdGEp
         ZAmOsp3VRXQm5ecVLx29ZzeonBUmL2+YZT7X+Uop3gukPhWqvcE6MEr2zAJRxfrhoov4
         /LEg==
X-Forwarded-Encrypted: i=1; AJvYcCUdu7KWQfyhUbesjrBQkmJLFa+J5h90w3Mxw+1H57w8LmnML/qyVdYianuTkIxpdtNC8UYrx/zIjaHOVJtQIDVKfAw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwabnXR/VZ2e0y6RtDkiYh4FbDTIg989LgoFwfvdmNHGcLOXBwg
	tizzY3i/DfkJhG71/VjvYdLymGqlS07zKsURGGP6qDydZYepvLjiRi4k
X-Gm-Gg: ASbGnctcEdKidYsCjMeXMxiSzuT4pvVdr26qgerc3deylQOtYoJ/f4RXw5m9Zem/6+5
	L5M7BGXDbyr6wO7yFFsjJB/23cqdoFi0b1fnQAnsWSxhlcL55XjxdtqO6j114nKJQSO8AP5A50E
	xUll0PWPz0eCfm61CAtLsx0rAob7SwkmAvxLM7WsnN2PxxYqWKNZUA+hV1VLv0AyUTB5EE8ZwPP
	HWJPXN6LLXXi1viTmgkE62uqdWRHIyB1r29J1ypgp2D8Z97H1gV35VciJEaszSk42Z3b7H8e1HS
	RUie9YwsAG3KNpMNivhpMwrw8iu+r+yemjYE/OMvJfu5nUE/MjXfWlsnyqGWHvZ/5rXbJzxh7FV
	N+kpjnfE42wJs3vGtGmBT9e0rWDaCw+ep+73O4gHwIY499mAPzmMdc5CcXAg3x8DbJg==
X-Google-Smtp-Source: AGHT+IGFRO4QsY+i1FDMPtqKlqGJQAYlkFU5x9mhGfu351mg4L1jRQsgm6sFBgXiLVC/o5q3cFKJ9Q==
X-Received: by 2002:a05:6402:d0d:b0:633:7017:fcc1 with SMTP id 4fb4d7f45d1cf-639d5b8c2e9mr6064149a12.14.1759993426592;
        Thu, 09 Oct 2025 00:03:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f30e7da1sm1729546a12.16.2025.10.09.00.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:03:45 -0700 (PDT)
Message-ID: <602ae2b0-0a93-4e5e-b43f-268ce66a87dd@gmail.com>
Date: Thu, 9 Oct 2025 09:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][walnascar][PATCH 1/3] libiec61850: patch
 CVE-2024-26529
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 07:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120420

Is this the full patch? It looks like about half of it is missing - or
am I missing something? It doesn't look like 1.5.3 had part of the fix
already.

On 10/9/25 06:10, Ankur Tyagi via lists.openembedded.org wrote:
> Details https://nvd.nist.gov/vuln/detail/CVE-2024-26529
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...-break-CMAKE_INSTALL_PATH-by-trying-.patch |  7 ++--
>  ...AKE_INSTALL_LIBDIR-from-GNUInstallD.patch} |  4 ++-
>  ...ed-null-pointer-dereference-in-mmsSe.patch | 33 +++++++++++++++++++
>  .../libiec61850/libiec61850_1.5.3.bb          |  3 +-
>  4 files changed, 40 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-connectivity/libiec61850/files/{0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch => 0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch} (89%)
>  create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
>
> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
> index 3f0490cb80..4426bafabb 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
> @@ -1,4 +1,4 @@
> -From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
> +From 21d0a059097dfae1723255e5ff59665d39420be0 Mon Sep 17 00:00:00 2001
>  From: Romain Naour <romain.naour@smile.fr>
>  Date: Fri, 10 Jul 2020 17:08:34 +0200
>  Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
> @@ -14,7 +14,7 @@ Upstream-Status: Pending
>   1 file changed, 2 insertions(+), 9 deletions(-)
>  
>  diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
> -index 159ef4b..d1732a1 100644
> +index 159ef4bc..d1732a16 100644
>  --- a/pyiec61850/CMakeLists.txt
>  +++ b/pyiec61850/CMakeLists.txt
>  @@ -31,14 +31,7 @@ endif()
> @@ -34,6 +34,3 @@ index 159ef4b..d1732a1 100644
>  +install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>   
>   add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
> --- 
> -2.31.1
> -
> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> similarity index 89%
> rename from meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> rename to meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> index e778e8158b..46e1c42e1e 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> @@ -1,4 +1,4 @@
> -From 16d07a82242c3263ec0038c9b4c97355795d2dd9 Mon Sep 17 00:00:00 2001
> +From aa48ec52d5792c18a3b369a55ed6472a7dfa1ec1 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 19 Mar 2022 23:16:51 -0700
>  Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
> @@ -13,6 +13,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   pyiec61850/CMakeLists.txt | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>  
> +diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
> +index d1732a16..c19f889b 100644
>  --- a/pyiec61850/CMakeLists.txt
>  +++ b/pyiec61850/CMakeLists.txt
>  @@ -31,7 +31,9 @@ endif()
> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch b/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
> new file mode 100644
> index 0000000000..b55a40b240
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
> @@ -0,0 +1,33 @@
> +From de14cb2e053c95d9695bb41bbdd580f35f710793 Mon Sep 17 00:00:00 2001
> +From: Michael Zillgith <michael.zillgith@mz-automation.de>
> +Date: Fri, 2 Feb 2024 06:44:47 +0000
> +Subject: [PATCH] LIB61850-430: fixed null pointer dereference in
> + mmsServer_handleDeleteNamedVariableListRequest when receiving malformed
> + message
> +
> +CVE: CVE-2024-26529
> +Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/cf94d64206cf53298edf4799a75b31657bb7cbb3]
> +
> +(cherry picked from commit cf94d64206cf53298edf4799a75b31657bb7cbb3)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/mms/iso_mms/server/mms_named_variable_list_service.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/mms/iso_mms/server/mms_named_variable_list_service.c b/src/mms/iso_mms/server/mms_named_variable_list_service.c
> +index 3a27061c..3365f771 100644
> +--- a/src/mms/iso_mms/server/mms_named_variable_list_service.c
> ++++ b/src/mms/iso_mms/server/mms_named_variable_list_service.c
> +@@ -140,6 +140,12 @@ mmsServer_handleDeleteNamedVariableListRequest(MmsServerConnection connection,
> +         mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
> +         goto exit_function;
> +     }
> ++
> ++    if (request->listOfVariableListName == NULL)
> ++    {
> ++        mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
> ++        goto exit_function;
> ++    }
> +  
> + 	long scopeOfDelete = DeleteNamedVariableListRequest__scopeOfDelete_specific;
> + 
> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
> index 0e1f50164a..3fff45670f 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
> @@ -17,7 +17,8 @@ SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
>  
>  SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
>             file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
> -           file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
> +           file://0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
> +           file://0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch \
>  "
>  
>  S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120395): https://lists.openembedded.org/g/openembedded-devel/message/120395
> Mute This Topic: https://lists.openembedded.org/mt/115666831/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


