Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1788DC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 00:55:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.5535.1642640103039185253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 16:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=MT9it/iX;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E50AA832DA;
	Thu, 20 Jan 2022 01:54:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642640100;
	bh=8K6plgoyQ/WnyS1yEF1K2+B/SnZaQfd6vcWF+NBSZA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MT9it/iXD7l0Je7ioA+SQlkEnIyz6jjRXfbaoMz05zK3ItVbnQ7IjdgaFgf04qa1T
	 tJRIjjPVb8ZMFGhkSFc/790SH4yWMxjZm07EjQcI/WETnZmfS1aUF2fQb5CKZWd22a
	 zmp5gbN+4ZnVxS+CzAwMH0pVZcdZU3g47hwHropdynOUG+NfWckN7XyIKNRxMTFSAl
	 A8ssADvar5XPb9F5wqlgmoislVAZZ+FJ+AKFOnSUpNz/ZxWQQ8vRQHoNvM9SSzczbI
	 +H8x8uWqk4Y/BJ5P2UzVBNBolpQo59I9hm2+Zj2oFNJgwWP8OibTbcBSvwXdvICLyb
	 MDO4qRoviFiWA==
Message-ID: <bab59d35-2829-da0b-2fca-db062b778447@denx.de>
Date: Thu, 20 Jan 2022 01:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-oe][dunfell][PATCH 1/4] Bump sdbus-c++ version to v0.8.3
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org,
 Armin Kuster <akuster808@gmail.com>
Cc: raj.khem@gmail.com, Stanislav Angelovic <angelovic.s@gmail.com>
References: <20220111152814.1270957-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220111152814.1270957-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 00:55:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94949

On 1/11/22 16:28, Marek Vasut wrote:
> From: Stanislav Angelovic <angelovic.s@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit b6213e4dd595d7dd2dbd67c1cad09e958ffd9c2f)
> Signed-off-by: Marek Vasut <marex@denx.de>

It seems I was not CCed on your question, please include me next time 
you expect to get an answer.

"
Please sell me on the idea of why I should update this? Bug fix only,
this version is a stable or LTS version.
"

It fixes the following race:
https://github.com/Kistler-Group/sdbus-cpp/issues/92

And a bunch of other fixes:

6e8e5aa Bump up to v0.8.3
3b735bf Introduce CI workflow based on GitHub Actions (#114)
2f7b35c Fix unused variable warnings for release builds
d5867e1 Fix unused variable warning for release builds
250aa2b Add additional messages to CMake build for optional parts
e63357b Remove non-virtual-dtor warnings by making classes final
2c6be03 Update CMake configuration flag names
138a437 Fix #112: Address a few inconsistencies and make code more idiomatic
cc8d88c Fix GetObjectPath() in integration tests
bded067 Fix #43: Clean up integration tests
c1c4512 Fix build with gcc8.3
175c43e Bump revision up to v0.8.2
c137dfa Fix potential data race in Proxy's condition variable
a0dadcc Fix integration tests after getObjectPath() introduction failed them
0d01044 Fix build with clang 9.0.1 and libcxx
ae8849e Implement #104: add getObjectPath() for classes (#105)
fb35a9a Fix integration test cases failing in specific situations
6cbd49d Install proper public sd-bus headers in internal libsystemd build
fb0a70a Fix #101: sanitize names of 
namespaces/methods/signals/properties/arguments (#102)
9af20af Fixed integration tests for libsystemd older than 242
63bbb07 Fixup for 00d0837d985dcec32cd8446e8a4f701e5370083f
00d0837 Introduce support for cancellable async calls
e91bedd Fix #92: CallData race condition in Proxy::callMethod
dc66efb Fix #93: Get signals working for multiple proxies.
a23aadb Fix required CMake version to v3.13
ae57c67 sdbus-c++-xml2cpp: fixed file existence condition
21820f7 Update using-sdbus-c++.md

