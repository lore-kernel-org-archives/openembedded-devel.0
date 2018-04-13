Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB9A72EA8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 01:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E550E2098D;
	Fri, 13 Apr 2018 01:35:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JPsfPu3BRv5r; Fri, 13 Apr 2018 01:35:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A50302017D;
	Fri, 13 Apr 2018 01:35:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 14AC016342E; Thu, 12 Apr 2018 21:34:53 -0400 (EDT)
Date: Thu, 12 Apr 2018 21:34:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20180413013453.GH3228@denix.org>
References: <1523394065-15465-1-git-send-email-andrea.adami@gmail.com>
	<pan70h$v8k$1@blaine.gmane.org>
	<CAAQYJAtv_KyDE5YLCVB3n18E9MgkokQ78sAwy0KmTemAd+m7WA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAtv_KyDE5YLCVB3n18E9MgkokQ78sAwy0KmTemAd+m7WA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: paul.eggleton@linux.intel.com, Koen Kooi <koen@dominion.thruhere.net>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld][PATCH] zaurusd: refresh patches (using devtool)
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
X-List-Received-Date: Fri, 13 Apr 2018 01:35:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 12, 2018 at 11:23:39AM +0200, Andrea Adami wrote:
> On Thu, Apr 12, 2018 at 10:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Op 10-04-18 om 23:01 schreef Andrea Adami:
> >> Silence warnings about ingnored context.
> >>
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >
> >
> >> --- a/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
> >> +++ b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
> >> @@ -1,17 +1,17 @@
> >> -From 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 2001
> >> +From 668a7bc50ca8f36df5a0eae73a5fa251aada9cc4 Mon Sep 17 00:00:00 2001
> >>  From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> >>  Date: Fri, 5 Aug 2011 16:00:10 +0400
> >>  Subject: [PATCH] zaurusd: add support for collie
> >> -Upstream-Status: Pending
> > Was that change intended?
> 
> No, not really.
> Let say I have spotted it and planned to read the devtool code...
> 
> I think it is tolerable in this context, because unfortunately not all
> patches have Upstream-Status.
> (I am wondering if there is still Upstream for zaurusd...)
> 
> So I have left the result unchanged., planning to update the
> Upstream-Status soon.

Related, but not exactly the same:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12674

Basically, in your case Upstream-status was above the empty line that 
separates patch header and patch description. Upstream-status should be 
in the patch description or it will be lost by devtool...

-- 
Denys

