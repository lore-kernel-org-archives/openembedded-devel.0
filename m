Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 775FA781F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 20:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C988208FB;
	Fri, 23 Jun 2017 20:37:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XCtZs2yaedkM; Fri, 23 Jun 2017 20:37:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 113E620072;
	Fri, 23 Jun 2017 20:37:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A426D162513; Fri, 23 Jun 2017 16:37:30 -0400 (EDT)
Date: Fri, 23 Jun 2017 16:37:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alejandro Mery <amery@hanoverdisplays.com>
Message-ID: <20170623203729.GY28053@denix.org>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
MIME-Version: 1.0
In-Reply-To: <20170623202324.69194-1-amery@hanoverdisplays.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][morty][PATCH 0/6] merge devmem2 and gitver fixes from master
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
X-List-Received-Date: Fri, 23 Jun 2017 20:37:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Wasn't there already a submission for devmem2 backport on the list?

On Fri, Jun 23, 2017 at 09:23:18PM +0100, Alejandro Mery wrote:
> The following changes have been cherry-picked from master and are
> available in the git repository at:
> 
> https://github.com/amery/meta-openembedded for-morty
> 
> for you to fetch
> 
> Alejandro Mery (4):
>   gitver: fix try/except syntax for python3 support
>   gitver: extend class to use EXTERNALSRC if set
>   gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
>   gitver: skip packages instead of panic()ing if ${GITVER} fails to
>     expand
> 
> Denys Dmytriyenko (1):
>   devmem2: use different filename to avoid checksum conflicts
> 
> Nicolas Ferre (1):
>   devmem2: Change source URL to regain access to it
> 
>  meta-oe/classes/gitver.bbclass             | 51 ++++++++++++++++++------------
>  meta-oe/recipes-support/devmem2/devmem2.bb | 12 ++++---
>  2 files changed, 38 insertions(+), 25 deletions(-)
> 
> -- 
> 2.13.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

