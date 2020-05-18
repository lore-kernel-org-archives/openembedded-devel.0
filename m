Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1583.1589822586390403170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 10:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F01540B3E;
	Mon, 18 May 2020 17:23:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcVZj1dbqf9s; Mon, 18 May 2020 17:23:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A54840AF3;
	Mon, 18 May 2020 17:23:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3A4AE173145; Mon, 18 May 2020 13:23:03 -0400 (EDT)
Date: Mon, 18 May 2020 13:23:03 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 0/2] remove pycryptodome(x) and pyelftools
Message-ID: <20200518172303.GL11927@denix.org>
References: <160F47A92CF7AFC2.6323@lists.openembedded.org>
 <20200515184114.GC11927@denix.org>
 <d67d77d6-d3bc-3635-06c0-09a58a1ed8db@gmail.com>
 <160F481530632D33.6323@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <160F481530632D33.6323@lists.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2020 at 02:47:26PM -0400, Denys Dmytriyenko wrote:
> On Fri, May 15, 2020 at 11:42:13AM -0700, Khem Raj wrote:
> > 
> > 
> > On 5/15/20 11:41 AM, Denys Dmytriyenko wrote:
> > >Joshua,
> > >
> > >FYI
> > >
> > >
> > >On Fri, May 15, 2020 at 02:39:38PM -0400, Denys Dmytriyenko wrote:
> > >>From: Denys Dmytriyenko <denys@ti.com>
> > >>
> > >>python3-pycryptodome(x) and python3-pyelftools have been moved to OE-Core.
> > >>Remove from meta-python now.
> > >>
> > >>OE-Core changes are still in master-next, so may need to wait until merged
> > >>to master.
> > >>
> > 
> > thanks, if you are watching this please send a note once its in master.
> 
> Sure, will do.

So, OE-Core master-next got merged to master earlier today, but I see you 
already have these 2 in your master-next, so should be good. Thanks.


> > >>Denys Dmytriyenko (2):
> > >>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
> > >>   python3-pyelftools: moved to OE-Core, remove from meta-python
> > >>
> > >>  .../python/python-pycryptodome.inc                 | 29 ----------------------
> > >>  .../python/python3-pycryptodome_3.9.4.bb           |  2 --
> > >>  .../python/python3-pycryptodomex_3.9.4.bb          | 10 --------
> > >>  .../python/python3-pyelftools_0.25.bb              | 14 -----------
> > >>  4 files changed, 55 deletions(-)
> > >>  delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
> > >>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
> > >>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
> > >>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
> > >>
> > >>-- 
> > >>2.7.4
> > >>
> > >
> > >>
> > >
> > >
> > >
> > >
> 
> > 
> 

> 

