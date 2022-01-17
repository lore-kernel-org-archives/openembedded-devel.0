Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBC2C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 08:01:50 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.8630.1642406509665987398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=GEBGXzC9;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: esben@geanix.com)
Received: from localhost (87-49-44-216-mobile.dk.customer.tdc.net
 [87.49.44.216])
	by first.geanix.com (Postfix) with ESMTPSA id BC07EE1C31;
	Mon, 17 Jan 2022 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1642406505; bh=O4dVUL9kVfrtSzeIZc233EZGgJgZxH0xWuZK9vIctK8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=GEBGXzC9BRjijqkeBHGzyYbcECYgCJDxnRC9f7uQxLWx4KtXyJYWiVKYgXlwD7iaF
	 UKc2lC24tdXZbFgK7/kLYOXvh6WbnPEMKjXPCpa3hLcDgAgQaS/v8184cV8KC1xEyV
	 LKp0XaO+++Fj2f5UGACANTYuvAny0+gALenHj9P/VwQgXOe8Y7iaunhFnxuK6hU0ts
	 J15+ukG4nql7WcaOkqaOOgqzWQqZTCbtdCSc8HryOZ/kbmJPps39Ret/+Z3ViaHIz9
	 nHkdC8/u7OX5tn7a2TvEvWOHi+agwA1uGv4tg13xjeHLtnzDEjCYSuw3/lvmjKzKUF
	 cIWp3N3oPxMhA==
From: Esben Haabendal <esben@geanix.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,  Leon Anavi
 <leon.anavi@konsulko.com>,  Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [oe] [PATCH] python3-prompt-toolkit1: Add latest 1.0 version
References: 
 <0e2f97993408ba72440a4fa2677b17719a2b141d.1642019865.git.esben.haabendal@huawei.com>
	<ff2112bd-a860-6156-a6a6-7f0154e97281@gmail.com>
Date: Mon, 17 Jan 2022 09:01:45 +0100
In-Reply-To: <ff2112bd-a860-6156-a6a6-7f0154e97281@gmail.com> (Khem Raj's
	message of "Wed, 12 Jan 2022 19:22:35 -0800")
Message-ID: <87h7a223km.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 08:01:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94897

"Khem Raj" <raj.khem@gmail.com> writes:

> On 1/12/22 12:39 PM, Esben Haabendal wrote:
>> From: Esben Haabendal <esben.haabendal@huawei.com>
>> Old major version with different API (than 3.0) for use by recipes that is
>> still relying on that.
>> Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
>> ---
>>   .../python/python3-prompt-toolkit1_1.0.15.bb  | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644
>> meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
>> b/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
>> new file mode 100644
>> index 000000000000..a7a9bcf8c269
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY = "Library for building powerful interactive command lines in
>> Python (version 1.0)"
>> +HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>> +
>> +SRC_URI[sha256sum] = "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917"
>> +
>> +inherit pypi setuptools3
>> +
>> +PYPI_PACKAGE = "prompt_toolkit"
>> +
>> +RDEPENDS:${PN} += " \
>> +    ${PYTHON_PN}-core \
>> +    ${PYTHON_PN}-six \
>> +    ${PYTHON_PN}-terminal \
>> +    ${PYTHON_PN}-threading \
>> +    ${PYTHON_PN}-wcwidth \
>> +    ${PYTHON_PN}-datetime \
>> +    ${PYTHON_PN}-shell \
>> +"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> 
>
> I am not sure if we should add a version which has been deprecated upstream
> and moreover we dont have any other recipes needing this old version, 1.0.15
> was released in 2017. Perhaps its better to promote folks to migrate to 3.x
> version.

I am not entirely sure that it is deprecated.  I have not seen any such
declaration from upstream.

Of-course, with latest 1.0 release (1.0.18, sorry about sending a patch
with an outdated version) in October 2019, it could very well seem
deprecated.  But it could also just be in minimal maintenance mode.
Version 1.0.18 seems to work with latest Python version.

Anyway, I am fine keeping this recipe in the layer where I have the
recipe needing it.  I just thought that other people could maybe benefit
from having it readily available.

/Esben

