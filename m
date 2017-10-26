Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A5723780C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 13:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E96D20147;
	Thu, 26 Oct 2017 13:49:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id wXr1yWYViMKT; Thu, 26 Oct 2017 13:49:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36CC620074;
	Thu, 26 Oct 2017 13:49:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AA7A8162705; Thu, 26 Oct 2017 09:49:21 -0400 (EDT)
Date: Thu, 26 Oct 2017 09:49:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Stefan Sonski <s.sonski@gmail.com>
Message-ID: <20171026134921.GY9221@denix.org>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
	<20171026133646.GX9221@denix.org>
	<CAGR_wht0dmUeeK_umpjXaVP=U9K=j9P54kvnWsnZZGY=J+wtww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGR_wht0dmUeeK_umpjXaVP=U9K=j9P54kvnWsnZZGY=J+wtww@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Oct 2017 13:49:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 26, 2017 at 03:47:03PM +0200, Stefan Sonski wrote:
> On Thu, Oct 26, 2017 at 3:36 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Thu, Oct 26, 2017 at 03:07:36PM +0200, Daniel Mack wrote:
> >> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
> >> > On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
> >> >> Hi,
> >> >>
> >> >> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
> >> >>> Either this or the ptest change seems to cause:
> >> >>> http://errors.yoctoproject.org/Errors/Details/157417/
> >> >>
> >> >> FTR, I see the same error locally. Reverting both 8fd20e8b1
> >> >> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
> >> >> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
> >> >> branch of meta-qt5 fixes things for me.
> >> >
> >> > Have you tried bisecting by any chance?
> >>
> >> bisect what exactly? If I take your patch out of my stack, qtbase
> >> builds. If I don't it doesn't. Can I provide more information somehow?
> >
> > That's not what you said above - we are trying to figure out which of the 2
> > (*two*) patches causes the breakage, hence the question about bisecting...
> 
> OK, I misunderstood you. I will bisect it in the evening and check
> which of the patches causes the failure.

That was a reply to Daniel...

