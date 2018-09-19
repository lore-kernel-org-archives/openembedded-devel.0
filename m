Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9017378D6F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:00:57 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id v77-v6so5612573lfa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=a3qIqkPG55e5Vtzrp+TENRkkHn63FaKSVGRss6W9+HM=;
	b=uUarzyVp6ts+lf3fkPCY5QL2z2func7T4Tm92oUTrXTTuz4Yot39tQxcUuJFiCRhOP
	lcuyX5FRLzNMhe/+nCgjXkDqH+O8NKLfzHwfftqLyigygQd8//C969Di6ArFwdW6Amj+
	BpLD8RNJ1UXtIFk9ogzo0iKUUyyt5iAx7V/tZbw4b1sweAwHCYvQoMsSm80gTTj1hxaw
	PZL3SdNr4ZKR3iXwjQb8NqELQuEjaBNTgyW/7YZyhAgbNW6YuFTo7pNg0n+aIftj2sni
	UvXDb5B6xPPlxM+BowgIKyEXTp8N0NWalx6ZlBjqWPQNKYC0Pms8adZS1tv+yZzYti8e
	bbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=a3qIqkPG55e5Vtzrp+TENRkkHn63FaKSVGRss6W9+HM=;
	b=iaq4egQ8vQ2bPOr34ndUU7FfRdReyj86Kw70kQ4LFw/tSO/i1EnJXTihyHvh9kqykc
	1qR/Ky+qFXZiAP23Kq1xAa/gfv89ueAY6gbdtWBtKgbMVH9ZUXu65HiaoGNVYmaSAgvc
	KUjTl/sSZqlpsK1w/rjZhm8X7wzM+H74SD1zrcNYB+NxpbsXr70tW3B5pEhIDCiUe1uC
	7KldandU2PXygvKG54f7uxV4UPlKoj8Yac/ytVbtd3qvgciChC7iakycAB5mPfWdM6dp
	1iRihI3QJLqbrrySw7CTV6WyDmJKSPkGMA4FUbzJ6M0BiBEsEWq7uslNUU8b0fqtq4W7
	K08g==
X-Gm-Message-State: APzg51CloNURIDf7Hjcc9YbnbRymJIBm3QEaeSBGdSCoalCkaYxkCE5L
	XaxOCnVlFtNNwn1h9Dhl16Z9/9/HhHg=
X-Google-Smtp-Source: ANB0VdbIRQxDIuUunv1rFT6VzJzMmfn44I6toUBV6Wwl00X7IoqqxzzMJfMaCsNQ5stSOthKlJxhNw==
X-Received: by 2002:a19:d0c2:: with SMTP id
	h185-v6mr2867283lfg.87.1537372857548; 
	Wed, 19 Sep 2018 09:00:57 -0700 (PDT)
Received: from ?IPv6:2a02:70:0:9:bdf0:af66:b584:4e8b?
	([2a02:70:0:9:bdf0:af66:b584:4e8b]) by smtp.gmail.com with ESMTPSA id
	u24-v6sm3913655lji.4.2018.09.19.09.00.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 09:00:56 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-2-git-send-email-yevgenyp@pointgrab.com>
	<a61039f1550ab18dd862f99506891423fcf28cd9.camel@andred.net>
	<359ca1e3-c6f2-af6f-933a-f2f03c957d77@pointgrab.com>
	<f664097cd5b4095dd7c6bdad00049bb4f5c96b73.camel@andred.net>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <bbc0eff7-7f24-8610-b395-4629a773c377@pointgrab.com>
Date: Wed, 19 Sep 2018 19:00:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f664097cd5b4095dd7c6bdad00049bb4f5c96b73.camel@andred.net>
Subject: Re: [meta-java][PATCH 1/3] ca-certificates-java: Fix sysconfdir for -native recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 16:00:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/19/2018 05:27 PM, André Draszik wrote:
> On Wed, 2018-09-19 at 12:48 +0300, Yevgeny Popovych wrote:
>>
>> On 09/17/2018 05:39 PM, André Draszik wrote:
>>> On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
>>>> When ca-certificates-java-native is built, sysconfdir variable will
>>>> be set to value that includes WORKDIR.
>>>
>>> What is your use-case for a -native version of this?
>>
>> I'm glad you asked as this should answer some questions..
>>
>> I am building a package that contains prebuilt ca-certificates
>> (including what ca-certificates itself build and JKS),
>> for this package I need -native version of ca-certificates-java.
>> We have an immutable (readonly) rootfs, so running scripts at runtime is
>> not an option.
>> With patches I have recently sent it works pretty well.
>>
>> The bottom line is that there is a use-case for -native version.
>> Even if you don't have an immutable (readonly) rootfs - you might want to
>> use it
>> that way because running scripts is quite error prone.
>>
>>>
>>>> Avoid patching source with this value - use sysconfdir_native.
>>>>
>>>> Change-Id: I8ac79c3cd5016a8139d9d8c8d58bc2976d0b6fa3
>>>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>>>> ---
>>>>  .../ca-certificates-java/ca-certificates-java_20180516.bb        | 9
>>>> +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/recipes-core/ca-certificates-java/ca-certificates-
>>>> java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-
>>>> java_20180516.bb
>>>> index 2db1915..7db5110 100644
>>>> --- a/recipes-core/ca-certificates-java/ca-certificates-
>>>> java_20180516.bb
>>>> +++ b/recipes-core/ca-certificates-java/ca-certificates-
>>>> java_20180516.bb
>>>> @@ -41,9 +41,14 @@ do_patch_append () {
>>>>      bb.build.exec_func('do_fix_sysconfdir', d)
>>>>  }
>>>>  
>>>> +# sysconfdir will include absolute native sysroot path in -native
>>>> builds,
>>>> avoid this
>>>> +# (see 36.24 of 
>>>> https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#faq
>>>> )
>>>> +SYSCONFDIR_VALUE_class-target = "${sysconfdir}"
>>>> +SYSCONFDIR_VALUE_class-native = "${sysconfdir_native}"
>>>> +
>>>>  do_fix_sysconfdir () {
>>>> -	sed -e 's|/etc/ssl/certs/java|${sysconfdir}/ssl/certs/java|g' \
>>>> -	    -i
>>>> ${S}/src/main/java/org/debian/security/UpdateCertificates.java
>>>> +    sed -e
>>>> 's|/etc/ssl/certs/java|${SYSCONFDIR_VALUE}/ssl/certs/java|g' \
>>>> +        -i
>>>> ${S}/src/main/java/org/debian/security/UpdateCertificates.java
>>>>  }
>>>>  
>>>
>>> No.
>>>
>>> It's probably best to remove the BBCLASSEXTEND statement in this recipe
>>> instead, as it was never tested, and is unlikely to be needed.
>>
>> We have a use-case for -native and this series fixes it.
>>
>>>
>>> The whole idea is to make this independent of the build machine paths.
>>> If
>>> you want a -native version of this, you still need to make sure to point
>>> this into the yocto sysroot. Otherwise this will try to write to the
>>> *build
>>> machine's* /etc/ directory!
>>>
>>> If you really want a -native version, you need to point this into the
>>> sysroot, and update this dynamically because of sstate usage, too.
>>
>> Ok, I suppose that ${sysconfdir_native} has mislead you -
>> it does _not_ resolve to an absolute path into native sysroot.
>> The value of ${sysconfdir_native} is always "/etc", it does not mangle in
>> any way (that's why I have used it).
> 
> Exactly, so the code in UpdateCertificates.java will try to access
> ${SYSCONFDIR_VALUE}/ssl/certs/java, i.e. /etc/ssl/certs/java, which is what
> your linux distro might or might not provide. It's not what yocto provides.

That's why we provide it with SYSROOT variable
(which is prepended to what becomes "/etc/ssl/certs/java")
because we want it to operate on a specific SYSROOT/file, not build host files.
Even if you forgot to specify SYSROOT - you are not going to screw up
your system because these files should be owned by root.

>> 
> Cheers,
> Andre'
> 
> 

-- 
Sincerely,
Yevgeny Popovych

