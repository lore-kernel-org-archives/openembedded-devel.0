Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2443F6080F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 02:07:55 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e6so109004931pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=RpqZ2IGQUaxGBIXVJAo367Nbj92ROgfewXiIT3orrWM=;
	b=FRLChSdyFaYmwv6iLasvweMF5jC1hutz3ptZWjpv/YZwlzjC9x6ngJiZibd3QRZmLR
	g8ZJWtkYDm6Bl2iWaUIH+7zlE6SAEf9YFViPqdR4p0AHzpm2diD02EKsXy0rF87I637a
	eZImu9RJhKDv86ouukij9OAn7d30px+rQ0DJme30/i4Ot7HfCpLYloU7Ul7xNx2xYRPY
	madlvX1/DAbkis1jCepMcT11UKSa+05e4IuJP//YG39JvZ1tvASOB6L80mANkOT4c5ob
	hUuHxaCwYDARn5NWWHbzcJQs5BvyDOhOOvXPIOJTNzCLOe2b2H2WoexMElp3LvxvpXkG
	n6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RpqZ2IGQUaxGBIXVJAo367Nbj92ROgfewXiIT3orrWM=;
	b=P5vKjuZ7G6jfASKPYW9UhGTWesPVMs7nBtuwOh9rD7thjf8g41vxaTWz0gHrHZ4WdA
	cGSUx3naknxd96zaD/VCvMkLd6MX/oCX1kRnBRWql1P3rgghHhbekrG6QZMX3krtNpaK
	fLvF3A2wXy/RJBMzcEZvSXKFipwblMp5KacSWsN0uyjQYHosXV6auW6rBmtgbK4KxCHZ
	zaPIE26CXmaOrCIQ0TwwMHUch7yrcPIpa22u2asDh5fwKvfoTdDtLsUhIbsligjS9WiJ
	kBPQvbZ7Z7ENPkWV59JgZ1iw2F/iYh+jpA1iBoQ787yoHcUPLG8qUMnSCn4cQ24YECQ3
	U2+g==
X-Gm-Message-State: ABUngvfOx3s/bezsT04d7Yz/Xr5CK9nGsxnd457cCWjDNTe/7Jhz6DUXeduRPKEXXE93Fw==
X-Received: by 10.99.167.75 with SMTP id w11mr28760430pgo.16.1477361277171;
	Mon, 24 Oct 2016 19:07:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d933:aa55:d4e7:2b39?
	([2601:202:4001:9ea0:d933:aa55:d4e7:2b39])
	by smtp.gmail.com with ESMTPSA id
	g9sm28220086paw.40.2016.10.24.19.07.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 19:07:56 -0700 (PDT)
To: Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1960865a-ab12-9dd5-84ff-5dfac53fd36a@gmail.com>
Date: Mon, 24 Oct 2016 19:07:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <9278bc38-73d6-8593-aee4-ee981eb62b7c@windriver.com>
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
X-List-Received-Date: Tue, 25 Oct 2016 02:07:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Randy,


On 10/24/2016 05:51 PM, Randy MacLeod wrote:
>
>
> I saw that morty has been branched and there have been 38 commits
> made to master.  Woo-hoo and thanks Martin!


>
> Armin,
>
> Many of the master commits sh/could be cherry-picked back
> to morty since they are bug fixes rather than package uprevs.
> I have a list of commits to cherry-pick below. '?' indicates
> that I'm not sure from the oneline summary if it's just a bug
> fix as you might expect.

Thanks for providing commit ids you are interested in.

I have pushed the contrib morty-next  this morning.

http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/morty-next


>
> Are you going to do a dot release in the coming weeks or will
> it be more like early next year?

I am hoping to do a pull request request shortly after morty is 
announced by Richard.

Some of the commits listed below are in master-next so I need to wait 
for them to hit master before I  cherry-pick any additional changes.

Hope this is a satisfactory plan.


regards,
Armin

>
> ../Randy
>
> ec0fb46 openldap: use recommended backend mdb
>
> ? 64ebc30 android-tools: fix native build
> d2902a3 dhcp_%.bbappend: fix replaces original key warning
>
> ? 965d028 python-unidiff: python module for parsing diff data
>
> ? 1be8a35 joe: Fix build with clang
> ? 2084473 openl2tp: Fix build with clang
> ? 0004410 flashrom: Fix build with clang and aarch64
> ? 83fec86 gpm: Remove nested functions
> ? 9446302 lowpan-tools: Fix errors found with clang
>
> ? 5e0dc68 python-greenlet: Rename register from rX to xX for aarch64
> ? d8e9117 frame: Fix build with clang
> ? 612b2bb libplist: Squash warnings found by clang
> ? 2951547 libmbim: Fix build with clang
> ? c04bdbe libbonobo: Fix missing dep on orbit2-native and build with 
> clang
>
> 6b3e9ff linux-atm: fix do_compile error
>
> ? 9a83c34 adduser: always add -M option for useradd
>
> ? da12104 v4l-utils: add support for "native" build
>
>
> cfe1fba postgresql.inc: Fix do_configure error (could not find Python.h)
>
>
> ? 8ba31c9 gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now 
> empty EXTRA_OECONF
> ? f882db6 ipmiutil: uncomment PARALLEL_MAKE
>
> ? 54c7e78 pcsc-lite: Seperate GPLV3 portions from BSD
> fded4cf opencv: fix packaging and install
>
>
> 1c072cb gvfs: fix fetch error
> ? 0cc3d06 leptonica: add PACKAGECONFIG for giflib
> ? 8eef5ab wireshark: update to 2.2.1
>
> ? 812e940 ntp : Add openssl to default PACKAGECONFIG options
> ? 8760099 atftp: fixes musl libc build
> ? 5abe6ea arptables: add the directory for default 
> /etc/sysconfig/arptables
> ? a0e2240 arptables: add arptables systemd service file
> 93b0d65 iscsitarget: resolve build error with linux kernel 4.8
> 9e8d127 squid: fix ptest failure
> 6f54f29 squid: specify sysconfdir and logdir
> 307d1c9 libtdb: fixes for deterministic builds
> 5175c03 libldb: fixes for deterministic builds
> 5291715 libtevent: fixes for deterministic builds
> 778a2b6 libtalloc: fixes for deterministic builds
> fe652f8 libldb: fix for LIC_FILES_CHKSUM
> f25aa3d libtdb: fix for LIC_FILES_CHKSUM
> d4a36f6 libtevent: fix for LIC_FILES_CHKSUM
> 0014397 libtalloc: fix for LIC_FILES_CHKSUM
>
> a95726d samba: replace pam packageconfig by hard dependency
> 3fdfdd8 samba: un-blacklist
>


