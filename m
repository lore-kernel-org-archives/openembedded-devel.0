Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web10.41491.1622447747952270444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 00:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@guy-morand.ch header.s=20191114 header.b=jKgCXddQ;
 spf=pass (domain: guy-morand.ch, ip: 185.125.25.14, mailfrom: guy@guy-morand.ch)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Ftnf96JmxzMprpj;
	Mon, 31 May 2021 09:55:45 +0200 (CEST)
Received: from [10.10.254.185] (unknown [185.72.66.106])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Ftnf94bstzlh8TG;
	Mon, 31 May 2021 09:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=guy-morand.ch;
	s=20191114; t=1622447745;
	bh=SZ/YGb0t6dGyuWgY1Yd229ZPTwH24rVsQT7tjHRtJQ0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=jKgCXddQkHe30v83ve3KD/jSkRIsbRHcrzJb1jvELRt84YLDH0tHpNK0HVJASxzD1
	 dDAmSBLzVfaAOH3lHbVij2z7/WvdQw5rtYePzP5s67g2h5c3CGXWx9/GmwH2gUgthw
	 LlIPq+888p73fknAcnZ8YJaCYHHGGfaWw6Y8suFE=
Subject: Re: [oe] [meta-oe][PATCH] fish: add fish recipe
To: Khem Raj <raj.khem@gmail.com>, Guy Morand <guy@guy-morand.ch>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210528102902.13676-1-guy@guy-morand.ch>
 <CAMKF1spqeRFGOzx5uKq=anc9pJ++BGx-rkcX5wM8yz407hD6Dg@mail.gmail.com>
From: "Guy Morand" <guy@guy-morand.ch>
Message-ID: <e967bf7e-b038-dfc9-b41b-6b86d5d1b50f@guy-morand.ch>
Date: Mon, 31 May 2021 09:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spqeRFGOzx5uKq=anc9pJ++BGx-rkcX5wM8yz407hD6Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

Thanks for the feedback, very nice CI you have there, I will see if I 
can reproduce and fix the.

Best regards,

Guy

On 5/29/21 10:59 PM, Khem Raj wrote:
> Hello Guy
>
> Thanks for patch, it does not build in some configs e.g. with
> clang/arm64 I am seeing
>
> https://errors.yoctoproject.org/Errors/Details/585823/
>
> On Fri, May 28, 2021 at 3:29 AM Guy Morand <guy@guy-morand.ch> wrote:
>> Signed-off-by: Guy Morand <guy@guy-morand.ch>
>> ---
>>   meta-oe/recipes-shells/fish/fish_3.2.2.bb | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 meta-oe/recipes-shells/fish/fish_3.2.2.bb
>>
>> diff --git a/meta-oe/recipes-shells/fish/fish_3.2.2.bb b/meta-oe/recipes-shells/fish/fish_3.2.2.bb
>> new file mode 100644
>> index 000000000..6bbe92088
>> --- /dev/null
>> +++ b/meta-oe/recipes-shells/fish/fish_3.2.2.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "Finally, a command line shell for the 90s"
>> +DESCRIPTION = "fish is a smart and user-friendly command line shell \
>> +for Linux, macOS, and the rest of the family."
>> +HOMEPAGE = "https://fishshell.com/"
>> +AUTHOR = "fish-shell contributors"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=9dbc95a48a7b8859e3c6db4c9396f053"
>> +
>> +inherit cmake
>> +
>> +DEPENDS = " \
>> +    ncurses \
>> +    "
>> +
>> +SRC_URI = "https://github.com/fish-shell/fish-shell/releases/download/${PV}/fish-${PV}.tar.xz"
>> +SRC_URI[md5sum] = "606253699ce41991b03a93bcc6047d51"
>> +SRC_URI[sha256sum] = "5944da1a8893d11b0828a4fd9136ee174549daffb3d0adfdd8917856fe6b4009"
>> --
>> 2.31.1
>>
>>
>> 
>>
