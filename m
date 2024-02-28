Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A292C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 13:56:04 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.13618.1709128563634544811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 05:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WeSv3RxQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6093247d1acso14934357b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709128563; x=1709733363; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZfDbSg89IoFWoO5V4kbmMF2cZqOf01T2cYl5mG8DtM=;
        b=WeSv3RxQeccB2caN4QXZ7OssoBAdZUj0ZWgmX9/IbZQrYtZ5NXSFoIZbSsRh3Y4up7
         ZdekGLg0HTVJXhPaR38eOdEUBSgc7SIY7BKCy0KxAgNaqKM1jOidQl7S2TnJ0ZK+gzhe
         ppk/T9XgL8hmLljuGeRJqFnfaJYC1ve8CxpPeAmsk4d4vByi6yMhJtzYFLd3G/WVl40S
         Re59vmwUXzXQrSjYo9jB7yRsrQMuLG+6vDdjSiceNHwgAjiA7h3+5Wmh6N2AdUr3Ra3o
         LXg36Ovv9kB16BsZJg7ZRrAm4zO/p7CJAigqa1UPzVPWYCo53QZwmMtM0VtITzMwMWRw
         fyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128563; x=1709733363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZfDbSg89IoFWoO5V4kbmMF2cZqOf01T2cYl5mG8DtM=;
        b=AQi7qekv+B1lu4+R9K8u57lD2q3LJ4Vso1NVRgxSM7WHu47gTg0gIoioQo6R3nCtLe
         c2jKVnrz2xo6/Gq7AthMTKTlKjfd0ce2VovujuSIIHrFEaihYqgLl5OXExzRdFPA9N/y
         1goh3Xw9x/8wwRilgfk37KfjgGZBamizhFmJTea8eptn9jQtW61nB/fsA3acI3/1lKF3
         24zm31loZy7NGodjqInvBiYg2x3IJ2wjqULb8H++wMl3FdCLs9uIzTWJs/XhoGc+k78r
         adgGE+SMzEmK0i338uvZO2XQKcYr49jaX1MhXocKxGsd2CZSp014cejJtSMrwAHIxvJj
         ERjg==
X-Forwarded-Encrypted: i=1; AJvYcCVm1UDgtStHLesaE8w72RTtGi7JpB9n5KO/q9WrYK/llIJtDcogIcd/vpkW/LLmcaydbUpEs/H8p1PrDXJsMcKCIczBGY3B1k0uPP+ViYuKYT9M3G/ZnZwf2Q==
X-Gm-Message-State: AOJu0YxnRZ3Um+g2sqBWnefBFtMRI/Z0t95+zIolPfCcT2N+S32uE1Nn
	5QbCOPIMNfUeaM5TnTcsbCnXC5xka7/y+ZrxsGFDGqoQc28EUAGFCTSb9CZJ
X-Google-Smtp-Source: AGHT+IHNT6EQiTrkDP+7DpPWiTMzEIhAdtJJrWRxaWx2zuJt9hVRzi/snlJgO2aKlAkflvFo2MuBmA==
X-Received: by 2002:a0d:d744:0:b0:608:b7d6:753f with SMTP id z65-20020a0dd744000000b00608b7d6753fmr4734724ywd.33.1709128562569;
        Wed, 28 Feb 2024 05:56:02 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000::41? ([2600:1700:45dd:7000::41])
        by smtp.gmail.com with ESMTPSA id r135-20020a0de88d000000b006086a467647sm2403885ywe.56.2024.02.28.05.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:56:02 -0800 (PST)
Message-ID: <977716aa-d3a4-461c-b884-74b23d16e6ba@gmail.com>
Date: Wed, 28 Feb 2024 08:56:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21892
Content-Language: en-US
To: archana.polampalli@windriver.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240223083620.182565-1-archana.polampalli@windriver.com>
 <17B67113C7A30745.29888@lists.openembedded.org>
 <SJ0PR11MB5816D62994233C64DB982B3484592@SJ0PR11MB5816.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 xsDNBGNNaZMBDAC6/Mhpw3EGOOTPtIpcUHT4lI974zN/QqccMPxH4oyBPRJbjVImYs9avXwV
 Ae9xoWKMM/vocEZWm6SOESZSGf+7l05Eo6MxU50cIQh0/bcOcdDAtFRDk4pZIL6X7vGzvFe6
 17tfNwKrTPgDFSSvq6XLUOqukInaVMHPeZum5GNnfuJswSDEQdxGTgudLWhCYwwoJ1AsVhg1
 nJXjQLOGUHFAZPYMhTak5jFXwG+CFzJ1OPpoAfcjQGYEYY5k5Yr1dESl/zgZSwwRLAAXo6JZ
 lm1rdd0c54XG4ah6fvZkd8r05uBVvbvmrdw5OohqqWzMq7RB9DAsszLvOaxN1epwUYnpkQ6x
 yYRBQxt766hLxtW6+bIXUZdinUsc0cD+MlLfynTzpT3eJPhvU9EtpTkA7hlFtHrhENRlT5rE
 F1ZCGykIhg5J/BL/JO3AISgliu0pPLg9r6tgZKu8r2LBf05LJ1vT2P1wVwlzpAdgHKAmTDF8
 MFEASfeJ4o9TrVFGbt8+cA0AEQEAAc0hYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5j
 b20+wsEHBBMBCAAxFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZQCGwMECwkIBwUVCAkK
 CwUWAgMBAAAKCRB5KfJxvOuR703oDAC4coUucV3gE+pNQAJcNWqIQwZHiwxbMy2fBgvTP0bx
 TQj6ZFl4tkiXGydUy9c2lcOj4XfaJuG85Z24IIJE0d8hWZMOZkSv5bmyB/NxbM5xRnPkHb6M
 n58wMSRCfNj/fsOoJE9nj5s41ktg1CA9QFBl9Dt0/8J/Mq+TxOKqYvzL4L8KEIw9nsi/yHQX
 ukXDwI2V01hTPZ6P7a4cZsjuvzCVN/WK2N3LzoVhQZHOOHGgx3h8XmsXMZ2ZxKjIdFTO2gFS
 48zXa4+LW/ZyJIUlnBIUdSnpS826wSq6Zn3TyvLJrFD3KSviX0N48htIfiYFJmTcGdDU+Zqr
 wKnPQWdZXgWLsv+3deGZ8z0UCdt3n/OSwRML3gFfYd7QBLazXIkFyplFmgOLwXkf+YifwSbu
 P3KTOpYN9bcl1Og2zU1dPTEg7RndDAvRUUA+XWrp7VM5gZgc0UFRNkrf4CZhxuMwATCJQVPj
 aII+TOxThBkx6NJqXD3tvlNozjLy4fLNZd8sAsrOwM0EY01plAEMAJ5IoQo1AbOAoMYUytqx
 zi1uOQa+ak48yVg4llEs55D9h9ANFEY8C5CyEYyXYKjHCgepUUHDRKIMIMxxzYLKDkd8bgvt
 +cmi1Jj36Wrzrf9qGFq5SvGL66IoUBCTsN64UexxbnNWMDF8qO2aXLvJZtfFJfYGc1ATDw8i
 96pv+FpjE3N76RdYRSFv5UGRqSKhT6jGlVMHb+Z/h1BOIsEBmbtgCozzJ45zhOY9635B4D7w
 i6CB2Aau3/FycPrKk/ZvkSq28tGYWwuhr/fvfvowg+IeClP1oCdKbaWsEwkGTN/PsRM8dPPe
 n07jesJUgpiHCUTF9oY3wJ1a86otszmWbvtJieM7vOxP3YnzF/VVFgDhTzRS0VqAjNRNOMoF
 E7ENS8o7uj7jrrGPuuM9cOhuDqqHwla3Rh0VX+W0//8qGZJ61oGV9paoGUb4PoRqC8ZpLrMB
 Z+f1VQ4iH7rzSQTOLEqGMZ+A34266TtKZKgmBxyqgNFd1HEeO4PD46ycLpnZAQARAQABwsD2
 BBgBCAAgFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZUCGwwACgkQeSnycbzrke+SWgv/
 QvvX84fAHEl7dkhla/oPdqY2bULh+hOxpo3WZmFhHi+41z2GhOJ78S3mY3yD+O7rdXkQIgIu
 bZDOIBMJc0lY/qKfXGpFOg5b8/hW3pYdjmUP1NQmdFK4XRLRL4OhLttgxVgO2yqDtlt9x1o3
 RLgTSJNsy/gQzUJw4m1zYs9qPRz7xglHwrn0OdDwgk6UofiS31cTZgz7txdNJ5pMNEOcjsaD
 KE+3jd6mAOz/VTG7mH3/5z0t+g9onQmfxBFpgxSM8HVtmjT4KWkqqUJzyXLtawbxhdv+fcUv
 5qUSr9ktwA8NJHmIHHcXBqiZLtLWFMJrdsgTFvjCXmTpm3ncsHS9L+JLVwIVCmUQUUCN1LhG
 itDSpYIEGrZObj82rX1wvxf/ZQ8VXS+owIR2F4yeeqPH/CyrPA1ASdtt+Am28/dJ2krr72at
 J++uLxA0cein1kjcosFDpQscnDcPzohnGyyjgEd6VwelZboIS1jt4lIa1badtV+cWMGMgM8W
 ApZ86eOP
In-Reply-To: <SJ0PR11MB5816D62994233C64DB982B3484592@SJ0PR11MB5816.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 13:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109051



On 2/27/24 6:37 AM, Polampalli, Archana via lists.openembedded.org wrote:
> Kindly ignore this patch.

thanks for letting me know.

- Armin
>
> Regards,
> Archana
> ------------------------------------------------------------------------
> *From:* openembedded-devel@lists.openembedded.org 
> <openembedded-devel@lists.openembedded.org> on behalf of Polampalli, 
> Archana via lists.openembedded.org 
> <archana.polampalli=windriver.com@lists.openembedded.org>
> *Sent:* Friday, February 23, 2024 14:06
> *To:* openembedded-devel@lists.openembedded.org 
> <openembedded-devel@lists.openembedded.org>
> *Subject:* [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21892
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> On Linux, Node.js ignores certain environment variables if those may 
> have been
> set by an unprivileged user while the process is running with elevated 
> privileges
> with the only exception of CAP_NET_BIND_SERVICE. Due to a bug in the
> implementation of this exception, Node.js incorrectly applies this 
> exception
> even when certain other capabilities have been set. This allows 
> unprivileged
> users to inject code that inherits the process's elevated privileges.
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../nodejs/nodejs/CVE-2024-21892-0001.patch   | 97 +++++++++++++++++++
>  .../nodejs/nodejs/CVE-2024-21892-0002.patch   | 58 +++++++++++
>  .../recipes-devtools/nodejs/nodejs_16.20.2.bb |  2 +
>  3 files changed, 157 insertions(+)
>  create mode 100644 
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
>  create mode 100644 
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
>
> diff --git 
> a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch 
> b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
> new file mode 100644
> index 000000000..0eb988fac
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
> @@ -0,0 +1,97 @@
> +From 3f619407fe1e597657b598383d0b5003a064311b Mon Sep 17 00:00:00 2001
> +From: Daniel Bevenius <daniel.bevenius@gmail.com>
> +Date: Wed, 17 Mar 2021 13:48:51 +0100
> +Subject: [PATCH 2/5] src: allow CAP_NET_BIND_SERVICE in SafeGetenv
> +
> +This commit updates SafeGetenv to check if the current process has the
> +effective capability cap_net_bind_service set, and if so allows
> +environment variables to be read.
> +
> +The motivation for this change is a use-case where Node is run in a
> +container, and the is a requirement to be able to listen to ports
> +below 1024. This is done by setting the capability of
> +cap_net_bind_service. In addition there is a need to set the
> +environment variable `NODE_EXTRA_CA_CERTS`. But currently this
> +environment variable will not be read when the capability has been set
> +on the executable.
> +
> +PR-URL: https://github.com/nodejs/node/pull/37727
> +Reviewed-By: Anna Henningsen <anna@addaleax.net>
> +Reviewed-By: Richard Lau <rlau@redhat.com>
> +Reviewed-By: James M Snell <jasnell@gmail.com>
> +Reviewed-By: Michael Dawson <midawson@redhat.com>
> +
> +CVE: CVE-2024-21892
> +
> +Upstream-Status: Backport 
> [https://github.com/nodejs/node/commit/3f619407fe1e5976]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + src/node_credentials.cc | 38 +++++++++++++++++++++++++++++++++++++-
> + 1 file changed, 37 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/node_credentials.cc b/src/node_credentials.cc
> +index 4c098c9..7688af8 100644
> +--- a/src/node_credentials.cc
> ++++ b/src/node_credentials.cc
> +@@ -12,6 +12,11 @@
> + #include <unistd.h>  // setuid, getuid
> + #endif
> +
> ++#ifdef __linux__
> ++#include <linux/capability.h>
> ++#include <sys/syscall.h>
> ++#endif  // __linux__
> ++
> + namespace node {
> +
> + using v8::Array;
> +@@ -33,14 +38,45 @@ bool linux_at_secure = false;
> +
> + namespace credentials {
> +
> +-// Look up environment variable unless running as setuid root.
> ++#if defined(__linux__)
> ++// Returns true if the current process only has the passed-in 
> capability.
> ++bool HasOnly(int capability) {
> ++  DCHECK(cap_valid(capability));
> ++
> ++  struct __user_cap_data_struct cap_data[2];
> ++  struct __user_cap_header_struct cap_header_data = {
> ++    _LINUX_CAPABILITY_VERSION_3,
> ++    getpid()};
> ++
> ++
> ++  if (syscall(SYS_capget, &cap_header_data, &cap_data) != 0) {
> ++    return false;
> ++  }
> ++  if (capability < 32) {
> ++    return cap_data[0].permitted ==
> ++        static_cast<unsigned int>(CAP_TO_MASK(capability));
> ++  }
> ++  return cap_data[1].permitted ==
> ++      static_cast<unsigned int>(CAP_TO_MASK(capability));
> ++}
> ++#endif
> ++
> ++// Look up the environment variable and allow the lookup if the current
> ++// process only has the capability CAP_NET_BIND_SERVICE set. If the 
> current
> ++// process does not have any capabilities set and the process is 
> running as
> ++// setuid root then lookup will not be allowed.
> + bool SafeGetenv(const char* key,
> +                 std::string* text,
> +                 std::shared_ptr<KVStore> env_vars,
> +                 v8::Isolate* isolate) {
> + #if !defined(__CloudABI__) && !defined(_WIN32)
> ++#if defined(__linux__)
> ++  if ((!HasOnly(CAP_NET_BIND_SERVICE) && 
> per_process::linux_at_secure) ||
> ++      getuid() != geteuid() || getgid() != getegid())
> ++#else
> +   if (per_process::linux_at_secure || getuid() != geteuid() ||
> +       getgid() != getegid())
> ++#endif
> +     goto fail;
> + #endif
> +
> +--
> +2.40.0
> diff --git 
> a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch 
> b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
> new file mode 100644
> index 000000000..efb64db7d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
> @@ -0,0 +1,58 @@
> +From 10ecf400679e04eddab940721cad3f6c1d603b61 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Tobias=20Nie=C3=9Fen?= <tniessen@tnie.de>
> +Date: Sat, 4 Nov 2023 00:39:57 +0000
> +Subject: [PATCH 3/5] src: fix HasOnly(capability) in node::credentials
> +
> +SYS_capget with _LINUX_CAPABILITY_VERSION_3 returns the process's
> +permitted capabilities as two 32-bit values. To determine if the only
> +permitted capability is indeed CAP_NET_BIND_SERVICE, it is necessary to
> +check both of those values.
> +
> +Not doing so creates a vulnerability that potentially allows
> +unprivileged users to inject code into a privileged Node.js process
> +through environment variables such as NODE_OPTIONS.
> +
> +PR-URL: https://github.com/nodejs-private/node-private/pull/505
> +Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
> +
> +CVE-ID: CVE-2024-21892
> +
> +Upstream-Status: Backport 
> [https://github.com/nodejs/node/commit/10ecf400679e04ed]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + src/node_credentials.cc | 12 +++++-------
> + 1 file changed, 5 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/node_credentials.cc b/src/node_credentials.cc
> +index 7688af8..3dcbc8a 100644
> +--- a/src/node_credentials.cc
> ++++ b/src/node_credentials.cc
> +@@ -43,7 +43,7 @@ namespace credentials {
> + bool HasOnly(int capability) {
> +   DCHECK(cap_valid(capability));
> +
> +-  struct __user_cap_data_struct cap_data[2];
> ++  struct __user_cap_data_struct cap_data[_LINUX_CAPABILITY_U32S_3];
> +   struct __user_cap_header_struct cap_header_data = {
> +     _LINUX_CAPABILITY_VERSION_3,
> +     getpid()};
> +@@ -52,12 +52,10 @@ bool HasOnly(int capability) {
> +   if (syscall(SYS_capget, &cap_header_data, &cap_data) != 0) {
> +     return false;
> +   }
> +-  if (capability < 32) {
> +-    return cap_data[0].permitted ==
> +-        static_cast<unsigned int>(CAP_TO_MASK(capability));
> +-  }
> +-  return cap_data[1].permitted ==
> +-      static_cast<unsigned int>(CAP_TO_MASK(capability));
> ++  static_assert(arraysize(cap_data) == 2);
> ++  return cap_data[CAP_TO_INDEX(capability)].permitted ==
> ++             static_cast<unsigned int>(CAP_TO_MASK(capability)) &&
> ++         cap_data[1 - CAP_TO_INDEX(capability)].permitted == 0;
> + }
> + #endif
> +
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb 
> b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
> index b786c0273..9540ed44e 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
> @@ -28,6 +28,8 @@ SRC_URI = 
> "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
> file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch 
> <file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch> \
> file://CVE-2022-25883.patch <file://CVE-2022-25883.patch> \
> file://CVE-2024-22019.patch <file://CVE-2024-22019.patch> \
> + file://CVE-2024-21892-0001.patch <file://CVE-2024-21892-0001.patch> \
> + file://CVE-2024-21892-0002.patch <file://CVE-2024-21892-0002.patch> \
>             "
>  SRC_URI:append:class-target = " \
> file://0001-Using-native-binaries.patch 
> <file://0001-Using-native-binaries.patch> \
> -- 
> 2.40.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109039): https://lists.openembedded.org/g/openembedded-devel/message/109039
> Mute This Topic: https://lists.openembedded.org/mt/104600757/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


