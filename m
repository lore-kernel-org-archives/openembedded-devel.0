Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD8865C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:24:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 16 Feb 2015 05:24:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,587,1418112000"; d="scan'208";a="686347512"
Received: from mmettala-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.7.57])
	by orsmga002.jf.intel.com with ESMTP; 16 Feb 2015 05:24:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tom King <ka6sox@gmail.com>
Date: Mon, 16 Feb 2015 13:24:50 +0000
Message-ID: <37480247.FvVHZhi4X8@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.5-101.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: "Viguera, Javier" <Javier.Viguera@digi.com>,
	openembedded-devel@lists.openembedded.org, scerveau <scerveau@voxtok.com>
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
X-List-Received-Date: Mon, 16 Feb 2015 13:24:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 30 January 2015 17:23:55 Paul Eggleton wrote:
> On Friday 30 January 2015 16:51:22 Viguera, Javier wrote:
> > Seems that CRDA maintainers did some changes that broke the fetch of the
> > package for all those releases.
> > 
> > These are the URIs in the package recipe:
> > 
> > http://wireless.kernel.org/download/crda/crda-1.1.3.tar.bz2
> > http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01
> > .1 1-regulatory.bin
> > 
> > The correct ones are:
> > 
> > https://www.kernel.org/pub/software/network/crda/crda-1.1.3.tar.bz2
> > https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-> > 20 13.01.11.tar.bz2
> > 
> > Notice that they not only changed the address but also now the regulatory
> > binary is packed in a tarball.
> > 
> > So at this point there are two options here:
> > 
> > 1. Rework the recipe with the new locations, checksums and adapting the
> > 'do_install' to copy the regulatory binary from a different directory.
> > This
> > has to be done for all the releases in the subject.
> > 
> > 2. Just put the 'crda-1.1.3.tar.bz2' and '2013.01.11-regulatory.bin' in
> > the
> > openembedded mirror and let all the old releases work without changes in
> > the recipes.
> > 
> > My preference is number 2, along with an upgrade of the package to the new
> > version 3.13 for the not-yet-released 'master' branch (there is currently
> > a
> > patch for that in the mailing list).
> 
> I agree, #2 is the best option to take care of the older branches.
> 
> Tom, can you please fetch the following files and add them to the OE source
> mirror:
> 
>   http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
>   http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> 
> I've verified the md5sums match the recipe:
> 
>   29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
>   e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin

Tom could you please upload these files? People are still stumbling over this 
problem.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

