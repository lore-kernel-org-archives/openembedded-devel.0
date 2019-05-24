Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6C92F7D264
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 04:05:22 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y11so4454524pfm.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kPx4IYH4u9VOisfjXqom3aUgiOVDLJAgjUsoRAMJ1is=;
	b=djU/pIWlUuXB2dIZh92HuDXJi5nG4MTq9Wsrs43tBWl/mR5dp50frbFSq7Wq8qjN/J
	PkRs6+C/6ks7cTY8wP2IW9aW5baqmgYBqYp7GQh1Fh4ossEfDKMYxgAHWef2wpKX6nHm
	BoOT44WrQ9B2B2w3X7zUUUdtbXxBwzpQJqhc8CXur3cBUi3ACnHoE1QGpPBwP2Bn6kvh
	doYjuHjJY4Y5jiU2luIUEW/KpoIS3ozTpJz62srqUq3IfpxcCjM+ldu8AQlnzNnnLBWc
	LnNEQM0SxAS37n+EWd4rn9leSH/BzbIY4EOAjg6z3RywmC+Z2tXkGV6f0GmaJHNzhc4B
	Wn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=kPx4IYH4u9VOisfjXqom3aUgiOVDLJAgjUsoRAMJ1is=;
	b=EHJ76S9Cu9uLwPAjUz21CaCiks11ZU3128Cvz1oFpXBCRS+HXzbeD4v5zwnbbBGMLn
	yG/lFu6kjk3lXbo+JfRm9ZXNZpK+h1iCNPdnCQ/YSQpVQKP0pi5QlQ4unenUu50lpO+f
	TK7o7z0wkiDi4kEGCqeLyI0zZ7AJ23jUGVvkRexM307UoE2eZhV0T/MYF38PpwdCXlhl
	pe7E3ZICYQWoSzyr+QjRPU8BoibB4JIx4Z9jDlFRu9mPlTNkROjGV5qCWQxwA6I1lQ4x
	diiDzDO5uebvZXOUCcwAKqCeJfA9ISW/CkPZrwjtmKKBRBABMtzFiq2tsKPRTJFV7Sz+
	oVzw==
X-Gm-Message-State: APjAAAWYUEGlKx2XS4tQh5Zd/aqJ+SxM3ALf0VqRtBoKwMJNu8m5ms2Q
	sHWCFgmvyvdl9USndh8Au9aZil1IhZI=
X-Google-Smtp-Source: APXvYqxyQDqNlipkB254v428V7FymVzFFf4/fWg9MZchA7oOEIB5fni+NlG0Dn4Kzxc/NRy2EF/sAQ==
X-Received: by 2002:aa7:942f:: with SMTP id y15mr50978656pfo.121.1558670722995;
	Thu, 23 May 2019 21:05:22 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:313d:8ef2:9687:9b74])
	by smtp.gmail.com with ESMTPSA id
	t78sm1098379pfa.154.2019.05.23.21.05.21
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 21:05:22 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
	<20190523064859.24336-8-schnitzeltony@gmail.com>
	<191e6e9a53294aae82f66761b91f6382@XBOX04.axis.com>
	<CALbNGRSfLNCph672ddFLXEYKVzC+t+UzjmYt9FD240qy=YUG0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ec1bf46e-c82f-fac8-8032-4747a4c29e97@gmail.com>
Date: Thu, 23 May 2019 21:05:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSfLNCph672ddFLXEYKVzC+t+UzjmYt9FD240qy=YUG0A@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
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
X-List-Received-Date: Fri, 24 May 2019 04:05:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/23/19 2:43 AM, Andreas Müller wrote:
> On Thu, May 23, 2019 at 10:55 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
>>> devel-bounces@lists.openembedded.org> On Behalf Of Andreas Müller
>>> Sent: den 23 maj 2019 08:48
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: [oe] [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files
>>> with new distro feature 'helpfiles'
>>>
>>> Gnome help file generation cannot be configured so handle files
>>> properly
>>>
>>> * Add a new distro feature 'helpfiles':
>>>     If set: split help file into ${PN}-help-*
>>>     If not set: delete help files on installation
>>> * Append ${PN}-help-.* to PACKAGES_DYNAMIC
>>>
>>> Once accepted / applied it takes a on-line patch to add help files based on
>>
>> I assume you mean "one-line"?
> Your assumption is correct :)

I cant apply this patch when taken from patchwork.

>>
>>> IMAGE_LINGUAS.
>>>
>>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>>
>> //Peter
>>
> Andreas
> 

