Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20253.1589568075939976585
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 11:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A49140AB5;
	Fri, 15 May 2020 18:41:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOvzKTgUfuLU; Fri, 15 May 2020 18:41:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50D3540A9E;
	Fri, 15 May 2020 18:41:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1971817314B; Fri, 15 May 2020 14:41:14 -0400 (EDT)
Date: Fri, 15 May 2020 14:41:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/2] remove pycryptodome(x) and pyelftools
Message-ID: <20200515184114.GC11927@denix.org>
References: <160F47A92CF7AFC2.6323@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <160F47A92CF7AFC2.6323@lists.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Joshua,

FYI


On Fri, May 15, 2020 at 02:39:38PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> python3-pycryptodome(x) and python3-pyelftools have been moved to OE-Core.
> Remove from meta-python now.
> 
> OE-Core changes are still in master-next, so may need to wait until merged
> to master.
> 
> Denys Dmytriyenko (2):
>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
>   python3-pyelftools: moved to OE-Core, remove from meta-python
> 
>  .../python/python-pycryptodome.inc                 | 29 ----------------------
>  .../python/python3-pycryptodome_3.9.4.bb           |  2 --
>  .../python/python3-pycryptodomex_3.9.4.bb          | 10 --------
>  .../python/python3-pyelftools_0.25.bb              | 14 -----------
>  4 files changed, 55 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
> 
> -- 
> 2.7.4
> 

> 

