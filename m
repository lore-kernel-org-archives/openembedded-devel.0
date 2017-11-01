Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7364565CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 18:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 75E6F20A40;
	Wed,  1 Nov 2017 18:57:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UJru6TAN5jwc; Wed,  1 Nov 2017 18:57:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CD71204D6;
	Wed,  1 Nov 2017 18:57:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B909D16270A; Wed,  1 Nov 2017 14:57:01 -0400 (EDT)
Date: Wed, 1 Nov 2017 14:57:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20171101185701.GH9221@denix.org>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
	<20171026133646.GX9221@denix.org>
	<50f1d37c-2b92-e26b-2403-57c438b43381@zonque.org>
	<CA+chaQcd+9G5=BTnQTzrGVwj3AKz2tGB3zPc19ze0bkTtSq3JQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQcd+9G5=BTnQTzrGVwj3AKz2tGB3zPc19ze0bkTtSq3JQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Chris E. Rallis" <Chris.Rallis@ravenind.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Wed, 01 Nov 2017 18:57:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 27, 2017 at 09:05:39PM +0200, Martin Jansa wrote:
> I've dropped the "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY"
> change, so now I have only following 3 included:
> 
> 
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 2c3ef00 qt5: add missing commercial license
> not included in master yet:
> bbb3044 meta-qt5: Update to 5.9.2 release
> 8fd20e8 nativesdk-qtbase Enable objcopy for qmake
> 60329bc qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
> 
> 
> and it still fails the same as shown in:
> 
> http://errors.yoctoproject.org/Errors/Build/47776/
> 
> I'm going to drop the 2nd objcopy change and retrigger the builds.

Martin,

What's the latest status on this? I noticed you merged the other patch to 
master now...

-- 
Denys


> On Fri, Oct 27, 2017 at 7:53 AM, Daniel Mack <daniel@zonque.org> wrote:
> 
> > On Thursday, October 26, 2017 03:36 PM, Denys Dmytriyenko wrote:
> > > On Thu, Oct 26, 2017 at 03:07:36PM +0200, Daniel Mack wrote:
> > >> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
> > >>> On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
> > >>>> Hi,
> > >>>>
> > >>>> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
> > >>>>> Either this or the ptest change seems to cause:
> > >>>>> http://errors.yoctoproject.org/Errors/Details/157417/
> > >>>>
> > >>>> FTR, I see the same error locally. Reverting both 8fd20e8b1
> > >>>> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
> > >>>> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
> > >>>> branch of meta-qt5 fixes things for me.
> > >>>
> > >>> Have you tried bisecting by any chance?
> > >>
> > >> bisect what exactly? If I take your patch out of my stack, qtbase
> > >> builds. If I don't it doesn't. Can I provide more information somehow?
> > >
> > > That's not what you said above - we are trying to figure out which of
> > the 2
> > > (*two*) patches causes the breakage, hence the question about
> > bisecting...
> >
> > Ah, sorry, my bad.
> >
> > Only reverting "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY" fixes a
> > build that does not have a native sdk target. I assume the 2nd patch
> > would break a native sdk, but I can't tell.
> >
> > I can provide full build logs if you want.
> >
> >
> > Thanks,
> > Daniel
> >

