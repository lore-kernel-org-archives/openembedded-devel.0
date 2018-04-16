Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 894BA744BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:45:15 +0000 (UTC)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3C1EA21789
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C1EA21789
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
Received: by mail-wr0-f176.google.com with SMTP id l49so22628989wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:45:16 -0700 (PDT)
X-Gm-Message-State: ALQs6tDcF3tXx1MgklQ7YbcINyNIFeavWdgbhN91Cg7yqMIpbDHp7yx/
	BfJQQQA/hlDVjvdahb2/oy5zNngNtCMNdJadWQ4=
X-Google-Smtp-Source: AIpwx48x7iHpdlx7XJypt7y7beaTvSYUG784AHXq7ixDNZtrk9zZxQeLRRdDpZSxYieF8yfv1HY7EZGxAHqaH83deV8=
X-Received: by 10.223.195.132 with SMTP id p4mr9350777wrf.279.1523861114657;
	Sun, 15 Apr 2018 23:45:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.199.7 with HTTP; Sun, 15 Apr 2018 23:45:14 -0700 (PDT)
In-Reply-To: <b9684482-6999-45c7-1ece-ebc247abffd1@gmail.com>
References: <1523440301-20150-1-git-send-email-krzk@kernel.org>
	<b9684482-6999-45c7-1ece-ebc247abffd1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 16 Apr 2018 08:45:14 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc8fYzjdfg30H4O==AYb09PdAA4jrPKBYn_fW+g73vdRQ@mail.gmail.com>
Message-ID: <CAJKOXPc8fYzjdfg30H4O==AYb09PdAA4jrPKBYn_fW+g73vdRQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Barrette <paul.barrette@windriver.com>,
	openembedded-devel@lists.openembedded.org, pascal.bach@nextrem.ch
Subject: Re: [meta-python][PATCH] python3-websockets: Add new recipe for v4.0.1 version
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
X-List-Received-Date: Mon, 16 Apr 2018 06:45:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 14, 2018 at 2:01 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 4/11/18 2:51 AM, Krzysztof Kozlowski wrote:
>>
>> Add recipe for python3-websockets v4.0.1.  Strictly speaking the package
>> does not require asyncio but instead builds on top of it and it is
>> essential for any work.
>>
>> Make this recipe a native one to allow usage for example in image tests
>> as a websocket client talking to a device under test.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>   .../recipes-devtools/python/python3-websockets_4.0.1.bb  | 16
>> ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644
>> meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
>> b/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
>> new file mode 100644
>> index 000000000000..414129c59d2f
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
>> +HOMEPAGE = "https://github.com/aaugustin/websockets"
>> +
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"
>> +
>> +inherit pypi setuptools3
>> +
>> +SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
>> +SRC_URI[sha256sum] =
>> "da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +RDEPENDS_${PN} = "\
>> +    ${PYTHON_PN}-asyncio \
>> +"
>>
>
> There are recipes in other layers whose maintainers should be CCed as well
> so they know its moving to a more common layer.
>
> https://github.com/Wind-River/meta-device-cloud/blob/master/recipes-devtools/python/python3-websockets_3.3.bb
>
> https://github.com/bachp/meta-homeassistant/blob/master/recipes-devtools/python/python3-websockets_3.2.bb

Sure, let me CC them here (+Cc Paul Barrette and Pascal Bach) unless
there is a need for resend?

Best regards,
Krzysztof

