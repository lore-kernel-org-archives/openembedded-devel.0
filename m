Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57686605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 15:02:54 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id k1-v6so12315196plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=a859av9Do5YMY791yqp1/deZ+g5HZPBQy/85mwlbnsw=;
	b=WvIp73n8pCPBl6ZgmCWLroMjXcYWMInhJFVpklvv9en5YlkNkWEGnWSsI/JkE/j7Vy
	l5eatPUntHQq1/1FRXRXRjFpFLq0Ln3St/PuPEPh4AUTQao79j83gxoqi8qf8JwAjKan
	6dC23/wKpx5gs39gnNCaCs4LFDvBVkgSwzHFwrcyKkstkXEc6OI5uYEk+Pc0se55H6yz
	SfzR4KDCR6wxr9iYuSuey8L0fK7EGKa0HQZUeRKEOqWtFtxNmLgZQMg3/jl4GILSabup
	U2vMCscje93UFZYVA0kxMrCg0w7l/p15uk55bzGotv2UuYyFQ3q+yDu9XC38oZD9vAT5
	pebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=a859av9Do5YMY791yqp1/deZ+g5HZPBQy/85mwlbnsw=;
	b=YfmZmuzVxoC0r1X6l9+RKzSz6amIIeHVM/cGZV1gWTeupdLrK/zg1aRG4I0as/WSOE
	o23sAAKChnF8n36amVA9JvwqcXDaN5TsQicOyuSifnQ4YzKxNkRqllrx05/Q3NxZpqmg
	vSGVDlIOqCo85JqPUiWNsTD0H5hvmslCy6s4GOAbQkOTNeVNeS6yatunYrCJfCIFAx7j
	QEWEQ/BCRoSkCVZuypauy1UHQQHDJ4kPQ+RdkZaNp7T4PTgmaMLzUc0KxhOkOMWAKZuk
	c3J3xr94ipX/gRwu+w4gXlX8CMWAev50Ltu9B37E7BMdu6VuFR9MTVj+OsbULJmfIBLk
	8LsA==
X-Gm-Message-State: AOUpUlFeAh34zb/1tGvIfFNSo3J07URtVoPTPcHxPGlPIMMzJgX8liRZ
	KQAUa9aVp/o0Ep+anfQ6d7oQ7w==
X-Google-Smtp-Source: AAOMgpfBQSju/VZEzNE97aFeF0PAOxPnRQXBQ9dnk2NqhjdsEG9BvTmj3hO9y0UEkammF6rZiqjHQA==
X-Received: by 2002:a17:902:6b84:: with SMTP id
	p4-v6mr6791445plk.272.1531494175445; 
	Fri, 13 Jul 2018 08:02:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:955f:e3a6:6fb7:17eb?
	([2601:202:4000:1184:955f:e3a6:6fb7:17eb])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm43378419pfb.91.2018.07.13.08.02.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 08:02:54 -0700 (PDT)
To: "Hongzhi, Song" <hongzhi.song@windriver.com>, raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<d3ce5260-4581-c1b8-53f0-7a521ba97e99@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cd12f3a2-ed7e-77a8-9d07-874cd3354bc4@gmail.com>
Date: Fri, 13 Jul 2018 08:02:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <d3ce5260-4581-c1b8-53f0-7a521ba97e99@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 0/1] Add a recipe on kernel selftest
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
X-List-Received-Date: Fri, 13 Jul 2018 15:02:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/13/2018 07:10 AM, Hongzhi, Song wrote:
> Attachment is my local.conf

Thanks.  Do you think this might qualify for an FAQ ?
https://wiki.yoctoproject.org/wiki/Technical_FAQ


- armin
>
> --Hongzhi
>
>
> On 2018年07月13日 22:06, Hongzhi.Song wrote:
>> 0001-kernel-selftest-Add-a-recipe-on-kernel-selftest.patch:
>>      1. This patch add support for musl libc.
>>      2. I don't reproduce the error about Makefile with your auto.conf.
>>      3. Boot failed using your auto.conf with error:
>>         ---
>>         [  576.229543] mount[2571]: segfault at 0 ip   (null) sp
>> bfb52e0c error
>>                        4 in mount.util-linux[8048000+9000]
>>         You are in emergency mode. After logging in, type "journalctl
>> -xb" to view
>>         system logs, "systemctl reboot" to reboot, "systemctl
>> default" or "exit"
>>         to boot into default mode.
>>         /sbin/sulogin terminated by signal SEGV.
>>         ---
>>         runqemu qemux86 nographic slirp qemuparams="-m 2048"
>>      4. With this patch set, I have fixed all musl related issues in
>> my build.
>>         It builds and works well. But I still have not met the error
>> in yours.
>>
>>         In my case, I just start build from latest poky without any
>> change
>>         other than a few necessary kernel config fragments. I'd like to
>>         reproduce your error but I can't. Could you please provide
>> more info
>>         about your build config?
>>
>> 0001-x86-remove-qemu-usermode-from-MACHINE_FEATURES_BACKF.patch:
>>      This patch is to fix gobject-introspection do_compile.
>>
>>      With m32, qemu-usermode will be back filled and
>> gobject-introspection
>>      tends to use qemu-i386. Is this the way to fix? If you have no
>> objection
>>      I will commit to oe-core next.
>>
>> Hongzhi.Song (1):
>>    kernel-selftest: Add a recipe on kernel selftest
>>
>>   .../kernel-selftest/kernel-selftest.bb             | 104 ++++++
>>   .../kernel-selftest/kernel-selftest/COPYING        | 356
>> +++++++++++++++++++++
>>   .../kernel-selftest/userfaultfd.patch              | 322
>> +++++++++++++++++++
>>   3 files changed, 782 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>>   create mode 100644
>> meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
>>   create mode 100644
>> meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
>>
>
>
>


