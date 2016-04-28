Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3D36476988
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:09:33 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id g133so118511190ywb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7GiUuP0lrTGoceeVweNMAOJb9diE0bqhXsZT4dxD+k4=;
	b=rUW3ocYpJHJFuQ0ZtLbDvKSwWY56P9R/ga8ge67fMrI+vEfeGlWNzSllm468kNT58s
	WocUGWMqHQw96+dHlUPW32w6hn/THFf5YG3GVA4dUKBOS+K5E6Y6zMFMJXW1nXXbex+q
	ZzFvI7PBTjyvEOvQJL2+tcESmpkAoQ8/5YdmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7GiUuP0lrTGoceeVweNMAOJb9diE0bqhXsZT4dxD+k4=;
	b=GorxxYMoPpLe+TilwSczIBZgSOs2jbfsGG8fUl0NPfpqZQ+KHru1+ph2TYYPaJyPcN
	EIZiZe7jMID6kBchlzbeSkK2iH+BRCTlbsyMFdlLRpzZ+q+dD1Yk6ZvXPl/D4Rx9BnSL
	ZkQnG3ZthA0K26DYNnT1nfGy+Frxw281MegxfMWUFg+aCA52Vm1ydXy7HudyiUHxuesD
	y4CxAbRnAYV3OeNPI2PrlqKHexsIKSIo8nutA0qGjU6+k185CRMu+UIE8umPq1RIJH5F
	kx16I//G60Tc/iocQ1umpMtCh7pG2VS9OBxDj6sU6KkB8khEn+wc1FGsAdcS3JBu4Klk
	Jh3g==
X-Gm-Message-State: AOPr4FXagDhK5xetRj9EUVT3UdJsoqOuK0+fJj8AubE6i2Cnxv+IUUSEySe4+omC3owOSg==
X-Received: by 10.37.97.73 with SMTP id v70mr8930095ybb.39.1461866494216;
	Thu, 28 Apr 2016 11:01:34 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:a8f1:8916:9925:ea71])
	by smtp.gmail.com with ESMTPSA id r8sm5287981ywb.20.2016.04.28.11.01.32
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Apr 2016 11:01:33 -0700 (PDT)
Date: Thu, 28 Apr 2016 14:01:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160428180131.GN19598@bill-the-cat>
References: <CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<20160427221005.GA19598@bill-the-cat>
	<403123E7-85F1-4CBF-9D6C-E6377B89D5EA@gmail.com>
	<20160428121437.GJ19598@bill-the-cat>
	<CAMKF1spK=tkagRSRCyWzipHt8v1atfuhZahQOQ8UZ0FiCs+UsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spK=tkagRSRCyWzipHt8v1atfuhZahQOQ8UZ0FiCs+UsQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 18:09:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2016 at 07:01:34AM -0700, Khem Raj wrote:
> On Thu, Apr 28, 2016 at 5:14 AM, Tom Rini <trini@konsulko.com> wrote:
> > On Thu, Apr 28, 2016 at 12:08:46AM -0700, Khem Raj wrote:
> >>
> >> > On Apr 27, 2016, at 3:10 PM, Tom Rini <trini@konsulko.com> wrote:
> >> >
> >> > On Wed, Apr 27, 2016 at 10:53:52AM -0700, Khem Raj wrote:
> >> >> thanks I think most of them come to these categories. So any help in
> >> >> fixing them is welcome.
> >> >>
> >> >> 1. kernel older than 4.4, backport needed fixed into these branches or
> >> >> move to newer kernels.
> >> >> 2. uboot dont have gcc6 compiler header files, backport the needed fixes
> >> >
> >> > 9b2c282b348dfe966bbba967dc7a45ce817cce50 from mainline.
> >> >
> >> >> 2. meta-qt4 needs to use gnu++98
> >> >> 3. gcc6 providing its own stdlib.h in libstdc++
> >> >> 4. gcc6 swtiching to gnu++14 for C++ as default.
> >> >> 5. GPLv2-only versions of recipes are simply old will need fixing
> >> >>
> >> >> I will take a stab at fixing the nativesdk recipes which is mostly due
> >> >> to stdlib.h issue.
> >> >
> >> > Please do, I'd like to see some SDKs so I can get more U-Boot testing
> >> > done with gcc-6 :)
> >> >
> >>
> >> I have pushed couple of more fixes which should now fix the nativesdk issues and SDKs should be building
> >>
> >> Tree is here. Let me know how it goes.
> >>
> >> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
> >>
> >> and also to github
> >>
> >> https://github.com/kraj/openembedded-core/tree/kraj/master
> >
> > debian/jessie, nodistro, MACHINE=qemux86. bitbake busybox:
> > | make[1]: Leaving directory
> > '/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-i586/6.0.0-r0/gcc-6.0.0/build.x86_64-linux.i586-oe-linux/gcc'
> > | cp: cannot create regular file
> > '/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-i586/6.0.0-r0/image/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/lib/i586-oe-linux.gcc-cross-initial-i586/gcc/i586-oe-linux/6.0.1/include/limits.h':
> > No such file or directory
> >
> > Doing MACHINE=qemux86-64 provides a similar error.  Thanks!
> 
> I forgot to rename recipes to 6.1 after I did the gcc rebase since 6.1
> released yesterday. Anyway done now. please retry.

Making progress now, thanks!

-- 
Tom

