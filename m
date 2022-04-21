Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE30C47088
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web08.20126.1650539860630242205
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 04:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=jdic+ytm;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d729:f54f:8837:7fe7:f862:a69e]
 (p200300e9d729f54f88377fe7f862a69e.dip0.t-ipconnect.de
 [IPv6:2003:e9:d729:f54f:8837:7fe7:f862:a69e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 09D6BC09B3;
	Thu, 21 Apr 2022 13:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1650539858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8kdnPyXBGcLbcXCcTr1ZNTZ+3J/GIfdIxhzBdSrjlw=;
	b=jdic+ytmtL3wMZjoKn7FjDBfpJVUlaltZ3uJ/EZN4lRcIrxScCGlYb36KcVXNKFpN/DQ0h
	1cKOA+iXRgtLADjOmpkB0MGiz3EFuzqKq6F4FKV9ID7UyfTPlC0I7Hn7xIbXKvOPSbwD4P
	lK1Zeu896PmxhZQYNHQhD9QsiaScew0JnOymn5PVTT8SeHJRjA4mnY8XJFvOSxd1i7tU75
	7Q30n200p+Z9QpsUWbMoNlIjwWxnBrkmbgEsZJiaZ6WJx6w+a1+Y4C32I8KzWFiM2omuiR
	tRYx/ipLMHOmI+Nzzm7S+qKwlK6awjKJIdfV6lVML5Y1DKYlpRB2tVqOieXHLw==
Message-ID: <ffd74e27-c68d-c86c-00e8-bdebeab7f2dd@datenfreihafen.org>
Date: Thu, 21 Apr 2022 13:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-networking][PATCH] ot-br-posix: Fix build with gcc
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>
References: <20220419210846.3638856-1-raj.khem@gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20220419210846.3638856-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96727

Hello Khem.

On 19.04.22 23:08, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Stefan Schmidt <stefan.schmidt@huawei.com>
> ---
>   ...sable-nonnull-compare-warning-on-gcc.patch | 40 +++++++++++++++++++
>   .../openthread/ot-br-posix_git.bb             |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
> 
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
> new file mode 100644
> index 0000000000..f0bb392a9f
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
> @@ -0,0 +1,40 @@
> +From aa706d714294b83db696de2beca9a722a512796f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 19 Apr 2022 14:04:40 -0700
> +Subject: [PATCH] cmake: Disable nonnull-compare warning on gcc
> +
> +GCC finds a legit warning which clang does not on code like this
> +
> +class Message;
> +void SendResponse(Message & aMessage)
> +{
> +    if ((&aMessage) != nullptr) { return; }
> +}
> +
> +Perhaps it should be fixed upstream but for now disable treating this
> +warning as error when using gcc
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 59a567e729..3134740ff6 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -57,6 +57,10 @@ endif()
> +
> + set(CMAKE_CXX_EXTENSIONS OFF)
> +
> ++if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
> ++	add_compile_options(-Wno-error=nonnull-compare)
> ++endif()
> ++
> + if (OTBR_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
> +     message(STATUS "Coverage: ON")
> +     target_compile_options(otbr-config INTERFACE -g -O0 --coverage)
> +--
> +2.36.0
> +
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> index c1af388627..a16b77849e 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> @@ -16,6 +16,7 @@ PV = "0.3.0+git${SRCPV}"
>   
>   SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
>              file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
> +           file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
>              "
>   
>   S = "${WORKDIR}/git"
> 

LGTM

regards
Stefan Schmidt

