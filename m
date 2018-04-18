Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC717451A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:00:28 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 61BDE20853
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61BDE20853
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
Received: by mail-wr0-f172.google.com with SMTP id u4-v6so2104582wrg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 01:00:29 -0700 (PDT)
X-Gm-Message-State: ALQs6tDwCegcqEgvCtI6IIm9mZP2OPdiDILAs7r5Ip7Klcm4PU6vRoaW
	BHjfwPsDx4c1pGwGctr68yd/uC6lWPca9VwWlT8=
X-Google-Smtp-Source: AIpwx4+fff5SnjgDNy/2cSji9J/mQHBAvFVrpqmZuM6TTiGWHIrxKsxnUY2KaBoi5xH3+Iw1UeAvrt2hLpTwUEwHn8k=
X-Received: by 10.28.145.134 with SMTP id t128mr964567wmd.72.1524038427882;
	Wed, 18 Apr 2018 01:00:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.199.7 with HTTP; Wed, 18 Apr 2018 01:00:27 -0700 (PDT)
In-Reply-To: <efd852d7-daec-1d1e-8743-ae43d03d2560@gmail.com>
References: <1523967357-4158-1-git-send-email-krzk@kernel.org>
	<efd852d7-daec-1d1e-8743-ae43d03d2560@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 18 Apr 2018 10:00:27 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd0TQWkODYTsFKLVx5tNMt710ZBT_56KOQNXeB5vh_SWw@mail.gmail.com>
Message-ID: <CAJKOXPd0TQWkODYTsFKLVx5tNMt710ZBT_56KOQNXeB5vh_SWw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][rocko][PATCH] civetweb: Add new recipe for v1.10 version
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
X-List-Received-Date: Wed, 18 Apr 2018 08:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 18, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 4/17/18 5:15 AM, Krzysztof Kozlowski wrote:
>>
>> Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
>> server with optional CGI, SSL and Lua support, under MIT license.
>>
>> CivetWeb provides C and C++ libraries and a standalone server binary.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>   .../recipes-connectivity/civetweb/civetweb_1.10.bb | 34
>> ++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644
>> meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
>>
>> diff --git
>> a/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
>> b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
>> new file mode 100644
>> index 000000000000..35af45680818
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
>> @@ -0,0 +1,34 @@
>> +SUMMARY = "Civetweb embedded web server"
>> +HOMEPAGE = "https://github.com/civetweb/civetweb"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.md;md5=da079d81be91ff1d1ca56dcd751f897f"
>> +
>> +SRC_URI = " \
>> +    git://github.com/civetweb/civetweb.git;tag=v${PV} \
>
>
> its better to use SHA version corresponding to this tag, tags result in
> fetcher n/w access and builds might fail when n/w access is disabled,
> secondly tags are floating types and can be moved.

Right, thanks for feedback. I'll send v2.

BR,
Krzysztof

