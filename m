Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 917B37F51B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 05:55:50 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x17so2153437pln.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wWyVYfqK3Pi0hp63VPqBM6viNXX+P84A+f0E+TNWmzU=;
	b=Uo190bs/9Gt5KsUZrEtiIRXMq54oe+izQLFciloMbLIzujsv9QfIyyLN31miBVZC6f
	lp+ZQxXL88cA936remC2EdGZBDwdBXvd3WqDNBQHizO/tmdTJNr7GbvDX4T8dX6MoWDH
	HIBfWMtwNSQAp/2JgDRPhORUwfL9j9fNkeG4l19PoF7VcRv6X4G34gGRsIVemkOUEjge
	40+tLGodYwUs81CdFWtKizuJmYDzbIiRrVhKpW01MzxNkIDWtNgubyoqC087MJCX0mT0
	hTU6cBQOoVfCdYMHfSBhKsAaSXGb+jCkwtiCZd9tdZ7qaRzD44XxAhFsvN8VuWg5fvhL
	sbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wWyVYfqK3Pi0hp63VPqBM6viNXX+P84A+f0E+TNWmzU=;
	b=m3BVjKDNv0V1Ou643rGNCBDvLS8Qeug+n3yVZQKi7R/+e/12O72o5vsVDsC1xMeUU8
	/sUrmV/56Lxn7nPKqzFWdrMtvtLRj6Ju84wq1jD0E53HuAYIKwRp8VEAOHhjdAYY16DT
	e5Fxx53QZ6S/vcKbZnrd7hOkou1bG1ogYZYbjHGAH/VWrEp7EbBUO3buWNqMsqiDE+pX
	2G/SpN/yhznhggeP+adBuKTjJmOKv1oEtFoYqw3E6L5jLC2yQC2OOWRQiqDPerK0ffRW
	4cKF9DAXHcPtbY23Gw5oQYbus/UwUnKMt7oCtSTU4XG/WC7dvhF7J+YWxglwkmnfkmHf
	Mdlg==
X-Gm-Message-State: APjAAAVz+YkYvvynILD2xp9vdHz5L0UnwYrOQrb8H8pjZwHiu/H6lWQb
	yHsydgGE/ocuBT71+eyURR3uxV4uQIs=
X-Google-Smtp-Source: APXvYqw7QcE2aDBUg/6Np+DfbD80s1CXwHrOtwzQ4fjBtkEN+AWa9CgaEs0JfwV95SI+eLzez3/AGg==
X-Received: by 2002:a17:90a:3702:: with SMTP id
	u2mr3841017pjb.112.1576302951013; 
	Fri, 13 Dec 2019 21:55:51 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:15c5:f71b:d732:763f?
	([2601:646:9200:4e0:15c5:f71b:d732:763f])
	by smtp.gmail.com with ESMTPSA id
	o12sm11543295pjf.19.2019.12.13.21.55.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Dec 2019 21:55:50 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20191212202252.2786262-1-raj.khem@gmail.com>
	<20191212202252.2786262-3-raj.khem@gmail.com>
	<20191213043716.GA30893@localhost>
	<CAMKF1so-nxHanPu6Nv3arQmSNoMyHwVj43+Myd6ZNeY=qVHU6A@mail.gmail.com>
	<20191213225815.GA8776@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c195b79f-5c33-69d8-ab72-d432254d78ef@gmail.com>
Date: Fri, 13 Dec 2019 21:55:49 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213225815.GA8776@localhost>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: Fix latent issue found with musl
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
X-List-Received-Date: Sat, 14 Dec 2019 05:55:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/13/19 2:58 PM, Adrian Bunk wrote:
> On Fri, Dec 13, 2019 at 01:55:33PM -0800, Khem Raj wrote:
>> On Thu, Dec 12, 2019 at 8:37 PM Adrian Bunk <bunk@stusta.de> wrote:
>>> On Thu, Dec 12, 2019 at 12:22:52PM -0800, Khem Raj wrote:
>> ...
>>>> +_POSIX_SOURCE is app-defined not system
>>>
>>> This is true for musl, not for glibc.
>>>
>>> The handling of _POSIX_SOURCE and _POSIX_VERSION differs between musl
>>> and glibc due to glibc supporting older POSIX versions, and glibc also
>>> supporting developers of portable code to select some specific older
>>> POSIX version.
>>>
>> No thats not right.
>> _POSIX_SOURCE (like all FTMs) is
>> defined by the application to request a feature/standards profile
>> it's not libc telling you "this is posix" or anything like that.
> 
> It is also defined when _POSIX_C_SOURCE is defined, or _GNU_SOURCE,
> or when the default non-strict gcc mode is used.
> 
> The latter means that it is in practice nearly always defined when the
> libc supports applications written against older versions of POSIX.
> 
but these macros are not used in this case so its irrelevant here.

>> _POSIX_VERSION tells you that
>> ...
> 
> _POSIX_VERSION being defined tells you that you have unistd.h included.
> 
> With glibc the value of _POSIX_VERSION depends on what feature/standards
> profile the application has requested.

I would not look into how glibc does something and call it standard. It 
guards these definitions by its internal defines ( prefixed with __) 
which is internal to a libc implementation, applications are not exposed 
to private namespace.


> 
> cu
> Adrian
> 


