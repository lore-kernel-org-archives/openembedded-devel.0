Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 22C90600BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 14:51:56 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 197so17110954pfu.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=nBcQAR1dFa3PezWqmQ4w0lIjcDvb4HHewfBHLFSZFB4=;
	b=GBbyNq706oWovH0fZAAheZ/8b1E88o02RICyFmWtbQVSRRKSlWnvZh7XvYNEpIy9Uk
	qzVRta/X5mm7DfkqIwmyCEzlqPywWfYn9/7vVQ/Er7F1dPII5hzSufYM0kJjDCVh6vZJ
	Ni9MFBOFDh2tD/uFqZ0gSAH8Sw0pvWmMLVN8m/Hkgsehv8iV2WBuin444vW2Jezqo37H
	KASWYPiycrw7r5KxdlDqwv4GY3YBKDPQF6MSaMc0UZeBwbV4wuo5mTEXfsm55GAdr/B5
	oZsJJvS85sv4hFqXT+nr4filp9Y/R3yoFb1AHEBA+3hAexEHNiL/myNcMWXTLHCsrGX9
	AoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=nBcQAR1dFa3PezWqmQ4w0lIjcDvb4HHewfBHLFSZFB4=;
	b=X1aKiO1WelqA7amoaGE58nmOgEiW3NexjTZiwWeBHKGWDO3uirSDE/OAptX+Qat3Ph
	Bm7kbh9NrUDqmdakjX/pKKtDABARyMnojY9L45aThyXslD5zJFSZCr8slpRtC3KnSuRC
	ooNuWFsmgDIVC7rimL6q5FleUQi5kFfUCzIVpL3oiY4cCLkiWTsnUBnHFKYrgRhb/6Dq
	a1uELfDLy+R1o+4ZyAvXJes4dR8QXAIJtRml2QcJE8CX/AI7Wz1HnlVNEkGYNGT9Z0Kd
	TR9l6gRupRrd78u/syUCHZdZBk1QrZ8ffh59MQZC5p8DdXgPwR6p9JnTkx1HxhZyvnHS
	5I/A==
X-Gm-Message-State: ABUngvfNCJMmF7a1BfKRISyw3G6bO0ccdRHYwaxd+E1D0sxemw5XAx/VcrqU83mw2YOE1w==
X-Received: by 10.98.153.204 with SMTP id t73mr4904563pfk.144.1477493517663;
	Wed, 26 Oct 2016 07:51:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:1d4f:a9ed:1775:e72c?
	([2601:202:4001:9ea0:1d4f:a9ed:1775:e72c])
	by smtp.gmail.com with ESMTPSA id
	m129sm4946450pfm.13.2016.10.26.07.51.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Oct 2016 07:51:57 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
	<1960865a-ab12-9dd5-84ff-5dfac53fd36a@gmail.com>
	<20161026083316.GB4096@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <16fbbbc8-0525-a94c-9ea2-7e00a3de9324@gmail.com>
Date: Wed, 26 Oct 2016 07:51:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161026083316.GB4096@jama>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE plans for morty
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
X-List-Received-Date: Wed, 26 Oct 2016 14:51:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/2016 01:33 AM, Martin Jansa wrote:
> On Mon, Oct 24, 2016 at 07:07:55PM -0700, akuster808 wrote:
>> Randy,
>>
>>
>> On 10/24/2016 05:51 PM, Randy MacLeod wrote:
>>>
>>> I saw that morty has been branched and there have been 38 commits
>>> made to master.  Woo-hoo and thanks Martin!
>>
>>> Armin,
>>>
>>> Many of the master commits sh/could be cherry-picked back
>>> to morty since they are bug fixes rather than package uprevs.
>>> I have a list of commits to cherry-pick below. '?' indicates
>>> that I'm not sure from the oneline summary if it's just a bug
>>> fix as you might expect.
>> Thanks for providing commit ids you are interested in.
>>
>> I have pushed the contrib morty-next  this morning.
>>
>> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/morty-next
> What about using current master (I've pushed bunch of commits today) +
> hopefully following in meta-networking which should be pushed by Joe
> (currently waiting in master-next):

works for me. That is even better.

>
> pick 2c1d637 linux-atm: fix do_compile error
> pick bfb71d5 lowpan-tools: Fix errors found with clang
> pick 944cd7a openl2tp: Fix build with clang
> pick 9641512 libmnl, nftables: Update versions
> pick 8303d85 c-ares: update 1.11.0 -> 1.12.0
> pick 36c563d c-ares: fix metadata
> pick 7552201 lksctp-tools: 1.0.16 -> 1.0.17
> pick a0fcdac drbd-utils: 8.9.3 -> 8.9.6
>
> This gives us almost clean bitbake world status I've sent few minutes
> ago.
>
> I haven't merged the README update to morty yet, so we can do this sync
> with master as fast forward (and continue to do so until there is fist
> master-only change merged in master).

ok.

Thanks,
Armin
>
> Regards,
>
>>> Are you going to do a dot release in the coming weeks or will
>>> it be more like early next year?
>> I am hoping to do a pull request request shortly after morty is
>> announced by Richard.
>>
>> Some of the commits listed below are in master-next so I need to wait
>> for them to hit master before I  cherry-pick any additional changes.
>>
>> Hope this is a satisfactory plan.
>>
>>
>> regards,
>> Armin
>>
>>> ../Randy
>>>
>>> ec0fb46 openldap: use recommended backend mdb
>>>
>>> ? 64ebc30 android-tools: fix native build
>>> d2902a3 dhcp_%.bbappend: fix replaces original key warning
>>>
>>> ? 965d028 python-unidiff: python module for parsing diff data
>>>
>>> ? 1be8a35 joe: Fix build with clang
>>> ? 2084473 openl2tp: Fix build with clang
>>> ? 0004410 flashrom: Fix build with clang and aarch64
>>> ? 83fec86 gpm: Remove nested functions
>>> ? 9446302 lowpan-tools: Fix errors found with clang
>>>
>>> ? 5e0dc68 python-greenlet: Rename register from rX to xX for aarch64
>>> ? d8e9117 frame: Fix build with clang
>>> ? 612b2bb libplist: Squash warnings found by clang
>>> ? 2951547 libmbim: Fix build with clang
>>> ? c04bdbe libbonobo: Fix missing dep on orbit2-native and build with
>>> clang
>>>
>>> 6b3e9ff linux-atm: fix do_compile error
>>>
>>> ? 9a83c34 adduser: always add -M option for useradd
>>>
>>> ? da12104 v4l-utils: add support for "native" build
>>>
>>>
>>> cfe1fba postgresql.inc: Fix do_configure error (could not find Python.h)
>>>
>>>
>>> ? 8ba31c9 gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now
>>> empty EXTRA_OECONF
>>> ? f882db6 ipmiutil: uncomment PARALLEL_MAKE
>>>
>>> ? 54c7e78 pcsc-lite: Seperate GPLV3 portions from BSD
>>> fded4cf opencv: fix packaging and install
>>>
>>>
>>> 1c072cb gvfs: fix fetch error
>>> ? 0cc3d06 leptonica: add PACKAGECONFIG for giflib
>>> ? 8eef5ab wireshark: update to 2.2.1
>>>
>>> ? 812e940 ntp : Add openssl to default PACKAGECONFIG options
>>> ? 8760099 atftp: fixes musl libc build
>>> ? 5abe6ea arptables: add the directory for default
>>> /etc/sysconfig/arptables
>>> ? a0e2240 arptables: add arptables systemd service file
>>> 93b0d65 iscsitarget: resolve build error with linux kernel 4.8
>>> 9e8d127 squid: fix ptest failure
>>> 6f54f29 squid: specify sysconfdir and logdir
>>> 307d1c9 libtdb: fixes for deterministic builds
>>> 5175c03 libldb: fixes for deterministic builds
>>> 5291715 libtevent: fixes for deterministic builds
>>> 778a2b6 libtalloc: fixes for deterministic builds
>>> fe652f8 libldb: fix for LIC_FILES_CHKSUM
>>> f25aa3d libtdb: fix for LIC_FILES_CHKSUM
>>> d4a36f6 libtevent: fix for LIC_FILES_CHKSUM
>>> 0014397 libtalloc: fix for LIC_FILES_CHKSUM
>>>
>>> a95726d samba: replace pam packageconfig by hard dependency
>>> 3fdfdd8 samba: un-blacklist
>>>


