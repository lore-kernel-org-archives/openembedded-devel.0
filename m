Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C348360124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C98EF315D05E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:03:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MQosoLUYqDLU
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:03:16 +0100 (CET)
Received: from [172.22.22.61] (55d44396.access.ecotel.net [85.212.67.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6CB23315760C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:03:16 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1449449949-9463-1-git-send-email-obi@opendreambox.org>
	<BAF36F5B-C2CD-4F61-B1B4-20115B34FB6C@gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56655963.9010302@opendreambox.org>
Date: Mon, 7 Dec 2015 11:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <BAF36F5B-C2CD-4F61-B1B4-20115B34FB6C@gmail.com>
Subject: Re: [meta-python][PATCH] python-monotonic: new recipe, version 0.4
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
X-List-Received-Date: Mon, 07 Dec 2015 10:03:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 07.12.2015 03:13, Tim Orling wrote:
> This recipe has unmet dependencies:

Sorry, I mistakenly assumed all of them were part of python-core.

> import crypts

It's "ctypes".

> import ctypes.util
> import os
> import platform
> import re
> import sys
> import time

I'll send v2 adding python-ctypes and python-re as runtime dependencies.

Regards,
Andreas

> --Tim
> 
>> On Dec 6, 2015, at 4:59 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
>>
>> On Python 3.3 or newer, monotonic will be an alias of time.monotonic
>> from the standard library. On older versions, it will fall back to
>> an equivalent implementation.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> Tested on fido.
>>
>> meta-python/recipes-devtools/python/python-monotonic_0.4.bb | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>> create mode 100644 meta-python/recipes-devtools/python/python-monotonic_0.4.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
>> new file mode 100644
>> index 0000000..3583a7e
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
>> @@ -0,0 +1,8 @@
>> +SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>> +
>> +SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
>> +SRC_URI[sha256sum] = "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
>> +
>> +inherit pypi
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


