Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EAEC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:43:25 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.19094.1641962604128481908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cRL3d9kM;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ie23-20020a17090b401700b001b38a5318easo2512367pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E4yQ6SlRPqQiXlm86CKl6WqTeAFOeA0kSRyrxF5iuDo=;
        b=cRL3d9kMvgw4H97mmhz5tzklSs0Gjk4km6RN/IitUectWDS4Kz/ka5oS+YGQL3zy6h
         K+33xRjMzzODlr/LCcJWJDEBZKNTpDNltG55efMf+MSH9PLr9eXWIHsBJ9nRA+w2zSyK
         ZXXjZF+YS5Roz33mFRhZ819ZWKKoyUuTf6TdzkN6J6caYFzoFMzxL9sGn2Imxw1887zt
         xLnLIwxpokgmLnaItsfeRPcUyZMsEMJNz532OIDZKb0PRbPZZ1oecQpK5TRhfSXOvj41
         682gBlM7h1DKo9KXw8nHcOmZs1JGQyEBN49Ai0/ltbt4H57FD5006g5RgXBUclIX1hOj
         fIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E4yQ6SlRPqQiXlm86CKl6WqTeAFOeA0kSRyrxF5iuDo=;
        b=v+Wc8v1C7AOqd3UcEwlNthXZPm7VlB1UcSPG0A9SMvuP/g2NGNRlh69YAg3ZgQfO5l
         s1+j0cxjdXii6ajarrKZxQwGwOh0nsbEf9qEIlf3elWAEU/6XX273FBny4d6bBFdYiNQ
         Sr+3Y8C/XXU/u7mykLbuOQLWCqsYaNpGLsXtjN1/bGWhRekX4H/bdoCvJBN4iq0VyeBW
         Qczk8VrqWlUaA4buqpZtNULKKUapC43Jh04k8UxuKbopM2lr0SQn4uUA2li/Y6Tm0fZI
         +INY67dJ6C1pmKh0w8dFngGiX1YgDxqelYhdWuPI/UzU1YqkP/XkNtlyh/JXinkj17ZN
         mh1A==
X-Gm-Message-State: AOAM530g1o0iEpWU7OEuqPC9cxt1fPbENpMY3ZZK3d01XKT496o/QIUT
	D0GpqdYhqVaDnFPmG777Dcc=
X-Google-Smtp-Source: 
 ABdhPJzPG8eYRbjE05O0WF5XFs3cG9AWp5ApmK48onnteeEWIW/UT5NXydqswTYUz3DXalVJolD79Q==
X-Received: by 2002:a17:902:b718:b0:143:72b7:409e with SMTP id
 d24-20020a170902b71800b0014372b7409emr7908159pls.28.1641962603646;
        Tue, 11 Jan 2022 20:43:23 -0800 (PST)
Received: from [10.14.2.168] ([12.196.124.196])
        by smtp.gmail.com with ESMTPSA id
 h13sm902870pgq.63.2022.01.11.20.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 20:43:23 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH 3/5] freerdp: backport openssl 3.x
 patches
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220111224714.1289840-1-marex@denx.de>
 <20220111224714.1289840-3-marex@denx.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5aee9cf3-0ba9-ae52-8fd6-1a4f54585681@gmail.com>
Date: Tue, 11 Jan 2022 20:43:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111224714.1289840-3-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94773



On 1/11/22 2:47 PM, Marek Vasut wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> (cherry picked from commit 17ad891757f0a66fabcb7f224c4d36fe6d69ba3b)
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  ...e-support-and-build-with-OpenSSL-3.0.patch | 43 +++++++++++++++++++
>  ...d-calling-FIPS_mode-with-OpenSSL-3.0.patch | 28 ++++++++++++
>  .../recipes-support/freerdp/freerdp_2.3.0.bb  |  2 +
Dunfell done not support openssl3 so why should I take this patch?

-armin
>  3 files changed, 73 insertions(+)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
> new file mode 100644
> index 000000000..04fe644d4
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
> @@ -0,0 +1,43 @@
> +From f703b1184229796d504a2e833f72ace4cc605d15 Mon Sep 17 00:00:00 2001
> +From: Ondrej Holy <oholy@redhat.com>
> +Date: Wed, 12 May 2021 12:48:15 +0200
> +Subject: [PATCH 1/2] Fix FIPS mode support and build with OpenSSL 3.0
> +
> +FreeRDP fails to build with OpenSSL 3.0 because of usage of the `FIPS_mode`
> +and `FIPS_mode_set` functions, which were removed there. Just a note that
> +the FIPS mode is not supported by OpenSSL 1.1.* although the mentioned
> +functions are still there (see https://wiki.openssl.org/index.php/FIPS_modules).
> +Let's make FreeRDP build with OpenSSL 3.0 and fix the FIPS mode support.
> +
> +See: https://bugzilla.redhat.com/show_bug.cgi?id=1952937
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + winpr/libwinpr/utils/ssl.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/winpr/libwinpr/utils/ssl.c b/winpr/libwinpr/utils/ssl.c
> +index 3a8590390..03b23af43 100644
> +--- a/winpr/libwinpr/utils/ssl.c
> ++++ b/winpr/libwinpr/utils/ssl.c
> +@@ -244,9 +244,17 @@ static BOOL winpr_enable_fips(DWORD flags)
> + #else
> + 		WLog_DBG(TAG, "Ensuring openssl fips mode is ENabled");
> + 
> ++#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
> ++		if (!EVP_default_properties_is_fips_enabled(NULL))
> ++#else
> + 		if (FIPS_mode() != 1)
> ++#endif
> + 		{
> ++#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
> ++			if (EVP_set_default_properties(NULL, "fips=yes"))
> ++#else
> + 			if (FIPS_mode_set(1))
> ++#endif
> + 				WLog_INFO(TAG, "Openssl fips mode ENabled!");
> + 			else
> + 			{
> +-- 
> +2.20.1
> +
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch b/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch
> new file mode 100644
> index 000000000..728638e15
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch
> @@ -0,0 +1,28 @@
> +From 4dbf108c0ae5e997d5c432f3da4b4c5fd7b35373 Mon Sep 17 00:00:00 2001
> +From: Mike Gilbert <floppym@gentoo.org>
> +Date: Sun, 1 Aug 2021 12:14:43 -0400
> +Subject: [PATCH 2/2] winpr: avoid calling FIPS_mode() with OpenSSL 3.0
> +
> +Fixes: 26bf2816c3e0daeaf524c47cf0fcda8ae13b65ad
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + winpr/libwinpr/utils/ssl.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/winpr/libwinpr/utils/ssl.c b/winpr/libwinpr/utils/ssl.c
> +index 03b23af43..74ef156e7 100644
> +--- a/winpr/libwinpr/utils/ssl.c
> ++++ b/winpr/libwinpr/utils/ssl.c
> +@@ -364,6 +364,8 @@ BOOL winpr_FIPSMode(void)
> + {
> + #if (OPENSSL_VERSION_NUMBER < 0x10001000L) || defined(LIBRESSL_VERSION_NUMBER)
> + 	return FALSE;
> ++#elif defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
> ++	return (EVP_default_properties_is_fips_enabled(NULL) == 1);
> + #else
> + 	return (FIPS_mode() == 1);
> + #endif
> +-- 
> +2.20.1
> +
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
> index e37e71b32..57170f68a 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
> @@ -16,6 +16,8 @@ PKGV = "${GITPKGVTAG}"
>  SRCREV = "14c7f7aed7dd4e2454ee0cd81028b9f790885021"
>  SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
>      file://winpr-makecert-Build-with-install-RPATH.patch \
> +    file://0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch \
> +    file://0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch \
>  "
>  
>  S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94765): https://lists.openembedded.org/g/openembedded-devel/message/94765
> Mute This Topic: https://lists.openembedded.org/mt/88361254/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


