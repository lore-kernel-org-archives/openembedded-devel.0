Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF477261A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:50:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2015 08:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,524,1418112000"; d="scan'208";a="523129554"
Received: from mhgreen-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.49])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 08:41:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: 'Tom King' <ka6sox@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 05 Feb 2015 16:49:13 +0000
Message-ID: <3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
MIME-Version: 1.0
Cc: "Viguera, Javier" <Javier.Viguera@digi.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 16:50:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
> > -----Original Message-----
> > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > 
> > I agree, #2 is the best option to take care of the older branches.
> > 
> > Tom, can you please fetch the following files and add them to the OE
> > source
> > 
> > mirror:
> >   http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
> >   http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> > 
> > I've verified the md5sums match the recipe:
> >   29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
> >   e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
> 
> Good to know we agree on the best option.
> 
> Could I make a humble request to speed up the copy of the packages to OE
> source mirror?
> 
> We have a BSP layer that depends on this and currently our build is broken
> fetching crda.

I've been thinking about this, and this is getting ridiculous. Instead of 
manually adding files to the OE source mirror, I think it's time we simply had 
a populated fallback source mirror that has all the sources for at least the 
recipes in layers hosted on openembedded.org (if not other commonly used 
layers) aside from OE-Core which is already handled by the yoctoproject.org 
mirrors. This issue keeps coming up far too often.

Is there a possibility we can set this up?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

