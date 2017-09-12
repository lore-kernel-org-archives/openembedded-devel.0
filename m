Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 144BB783E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:26:08 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id q76so5587271pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=+GHtbmu7BsnHXzfv+wk8qCfLD+C2bvho+NqdxPUl8RI=;
	b=pI/AT2FnAXvvkRrcXZmUiQyRaHV6eZp60x/42gQcvK+CqzBhUlKTCox+XUqNqs8aRS
	xS2pCQcxGzQbuWXEEyuse/exCjSW6MxuOudeXUYzxgvooXdqiWrcIXkUbRb9fF3jwC60
	xpiWt3aFr5wwhzbeyVnLPustTpAWi6C0VC1hhM90IvX6q1UPBIIPX4bnPWqQJv/ABP0z
	GLysnJHsm+u++XQPiczibV70k1/lkLi/SbOZ2g9B5zGGjuU7ZyoMciGBO9BYWUqexY+E
	U3j3Q30ekry1Vg/S79feOKYHkwDUbw+2iPrLrOqV2BGDmHuaJlRTLB+Jcqh8NITypdJV
	7GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+GHtbmu7BsnHXzfv+wk8qCfLD+C2bvho+NqdxPUl8RI=;
	b=Y/w4oGpn37nT0b0D6fzZjGcVsBLkGKBgw8aWSV8ZL1JTBRfW6Lvkrc+GvNQyjpG++7
	EPn/Gbrp81lU9SjQOKqkRNac775FqtST7EXQfA1RK2mYdXktY35Ikv/teSktn0k0hX/f
	2OPAKUXG+MhEnXO9W28D39mRJPvCHvtCoTIk4PP9AY1FJ/OFajODjV4/OR7UjJv0V9ed
	l3Kzj+ZxyqTEcAkXE542BDUhZ5FY0zUOQJnOk9Jd5kUMoBlHgEZPYfseh5XmnunR7G8k
	XaU5dpNtbHSVHK8RlvcgA6u0D9FyJdzJIzBmAIpMpyVx+xGwUFVimoiSfTj569WBcfWe
	jaQg==
X-Gm-Message-State: AHPjjUhnQtqdFH1Lc3DLnXPytcWga/dbyWjAHQ5IIA+0+db1v/t7ZUlb
	synVj4c4Gp+6lhT6
X-Google-Smtp-Source: ADKCNb5jXmaUeXps9AGexvV4eTtc19nHKgL8gu3twEwEXvW9jOXcMZqWeYTB0AnwA8MFTxGL5yd/Sw==
X-Received: by 10.99.186.81 with SMTP id l17mr15029943pgu.170.1505229969624;
	Tue, 12 Sep 2017 08:26:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d402:d3c9:ca3b:9b54?
	([2601:202:4001:9ea0:d402:d3c9:ca3b:9b54])
	by smtp.gmail.com with ESMTPSA id
	g66sm26016477pfj.161.2017.09.12.08.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 08:26:09 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1505143034.git.akuster808@gmail.com>
	<20170911220704.GA4102@jama>
	<92fd35f1-193c-bd01-6266-3d85a6237f77@gmail.com>
	<20170912151245.GC4102@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f555be22-948e-0b63-6dfe-ee59566f659e@gmail.com>
Date: Tue, 12 Sep 2017 08:26:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170912151245.GC4102@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 000/126] Pyro-next pull request
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
X-List-Received-Date: Tue, 12 Sep 2017 15:26:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/12/2017 08:12 AM, Martin Jansa wrote:
> On Tue, Sep 12, 2017 at 07:55:14AM -0700, akuster808 wrote:
>>
>> On 09/11/2017 03:07 PM, Martin Jansa wrote:
>>> On Mon, Sep 11, 2017 at 08:21:02AM -0700, Armin Kuster wrote:
>>>> Please concider these changes for pyro
>>>>
>>>> The following changes since commit 5e82995148a2844c6f483ae5ddd1438d87ea9fb7:
>>>>
>>>>     opencv: disable broken Intel FP16 detection (2017-05-09 16:00:31 +0200)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-next
>>>>     http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/pyro-next
>>>>
>>>> Kai Kang (3):
>>>>     snort: enable static daq
>>> This one adds daq-native which depends on libpcap-native, but without
>>> this commit in oe-core/pyro:
>>> commit 12373003cc3753421321d558813b1de95667c192
>>> Author: Kai Kang <kai.kang@windriver.com>
>>> Date:   Wed May 24 17:33:58 2017 +0800
>>>
>>>       libpcap: add native package
>>>
>>>       Add package libpcap-native required by recipe daq-native in layer
>>>       meta-networking. And daq-native is added to fix snort start error.
>>>
>>> it fails with:
>>> ERROR: Nothing PROVIDES 'libpcap-native' (but virtual:native:meta-oe/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb DEPENDS on or otherwise requires it). Close matches:
>> I never saw this message during any of my  builds. That commit has been
>> sitting my queue for over a month. How are you building this? Maybe I
>> need to tweak my env.
> Building world should probably show it as well, I was seeing it from
> openembedded-core/scripts/sstate-diff-machines.sh
> script which is calling
> bitbake -S none world
hmmm.. will double check what I am doing. In the mean time I can respin 
the pull request to exclude the daq fix.

>
>>> Is there oe-core/pyro pull request with libpcap-native?
>> nope. that support has been in before pyro released and came in as part
>> of the 2.25 update. I do build with what gets queued in oe-core/pyro.
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-support/libcap/libcap_2.25.bb?h=pyro&id=e5043dbbccd05e27d0a020215c38de2be4829187
> This is libcap not libpcap.
ah, so it is.
>
> OE @ ~/openembedded-core $ git checkout origin/pyro
> ...
> OE @ ~/openembedded-core $ grep native -R ./meta/recipes-connectivity/libpcap
> ./meta/recipes-connectivity/libpcap/libpcap.inc:DEPENDS = "flex-native bison-native"
>
> OE @ ~/openembedded-core $ git checkout origin/master
> Previous HEAD position was 7b3584ace9... Revert "expat: Don't use getrandom() in the -native case"
> HEAD is now at 2ebbeb6111... staging: gracefully abort if two recipes conflict in the sysroot
> OE @ ~/openembedded-core $ grep native -R ./meta/recipes-connectivity/libpcap
> ./meta/recipes-connectivity/libpcap/libpcap.inc:DEPENDS = "flex-native bison-native"
> ./meta/recipes-connectivity/libpcap/libpcap.inc:BBCLASSEXTEND = "native"
>
> So it still isn't in pyro.
I found the change
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-connectivity/libpcap?id=5eed6c644f715783edb0d05926373e719442dd6a

The question is does adding "native" support qualify to be backported to 
a stable branch if it fixes other packages....

thanks,
Armin
>
>>> Why is this snort change needed in pyro?
>> To fix the issue noted in the commit message.
>> - Armin


