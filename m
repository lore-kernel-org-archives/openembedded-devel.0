Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EAD976076F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 04:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D002A20B68;
	Sat, 24 Feb 2018 04:40:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GbZbqK43Bkn7; Sat, 24 Feb 2018 04:40:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA51C2014D;
	Sat, 24 Feb 2018 04:40:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 363F41632CD; Fri, 23 Feb 2018 23:40:46 -0500 (EST)
Date: Fri, 23 Feb 2018 23:40:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180224044046.GH2786@denix.org>
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
	<CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
	<20180216220142.GS2786@denix.org>
	<CAMKF1spkGJpYTAmQ9gh+af51ya3qkZja8XMmVP5u=Q-ycc5qbw@mail.gmail.com>
	<20180216230846.GT2786@denix.org>
	<CAMKF1spcrZQ34imyqaXtcHRmphyU1Kfo5nNdo6qaaeOVSx51eg@mail.gmail.com>
	<CAMKF1soMJDnGmK08J+TVEw4dcVZqXfxqM=aAbO6ufg1DS8sjQg@mail.gmail.com>
	<20180221195541.GD2786@denix.org>
	<865fae21-e524-63d2-33e5-fc433a14b6ae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <865fae21-e524-63d2-33e5-fc433a14b6ae@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Sat, 24 Feb 2018 04:40:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 21, 2018 at 12:15:39PM -0800, Khem Raj wrote:
> On 2/21/18 11:55 AM, Denys Dmytriyenko wrote:
> > On Tue, Feb 20, 2018 at 10:20:03PM -0800, Khem Raj wrote:
> >> i can still see it with 5.10.1
> >>
> >>                  from
> >> /mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/git/src/gui/kernel/qgenericpluginfactory.cpp:40:
> >> /mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15:
> >> fatal error: stdlib.h: No such file or directory
> >>  #include_next <stdlib.h>
> >>                ^~~~~~~~~~
> >> compilation terminated.
> >> make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
> >> make[2]: Leaving directory
> >> '/mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/build/src/gui'
> >>
> >> On Fri, Feb 16, 2018 at 6:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> On Fri, Feb 16, 2018 at 3:08 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >>>> On Fri, Feb 16, 2018 at 10:59:39PM +0000, Khem Raj wrote:
> >>>>> I am using arch Linux for host distro and security flags enabled May be
> >>>>> that is something
> >>>>
> >>>> Could be... I'm on Ubuntu 16.04.
> >>>
> >>> maybe you can try to enable security flags and see if you see it
> > 
> > Do you have any specifics regarding enabling security flags?
> > 
> 
> add
> 
> require conf/distro/include/security_flags.inc
> 
> in local.conf

Ha, got confused - thought you were talking about security (SELinux?) on the 
host...

Anyway, got some time to try it with security_flags.inc included and it still 
builds fine here on latest master.

-- 
Denys

