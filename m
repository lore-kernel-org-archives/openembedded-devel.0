Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9376BEEB;
	Mon,  2 Sep 2013 21:39:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r82Ld7j8024510;
	Mon, 2 Sep 2013 16:39:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r82Ld7Ox027459;
	Mon, 2 Sep 2013 16:39:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 2 Sep 2013 16:39:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r82Ld6UR003191;
	Mon, 2 Sep 2013 16:39:07 -0500
Date: Mon, 2 Sep 2013 17:39:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130902213906.GA20096@edge>
References: <5772089.rktQrocuuR@helios>
MIME-Version: 1.0
In-Reply-To: <5772089.rktQrocuuR@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Heads up: _remove in recipe namespace - check your layers
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
X-List-Received-Date: Mon, 02 Sep 2013 21:39:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 02, 2013 at 10:54:20AM +0100, Paul Eggleton wrote:
> Hi all,
> 
> With the recent addition of a _remove operator into BitBake in master [1] any 
> use of _remove_ within a name or _remove at the end of a name within recipe 
> namespace (i.e. function and variable names) needs to be changed to avoid 
> unexpected behaviour. This change is now in master and will be in the upcoming 
> release. Please check the layers you maintain and change any instances of 
> these to avoid the use of _remove. You can use the following command to find 
> these (of course ignoring anything that's not in a recipe, bbclass, inc file 
> etc.):
> 
>   git grep _remove[^a-zA-Z]
> 
> In particular I've checked a number of layers that I have fetched locally, and 
> references exist in meta-arago-distro and meta-angstrom, so these will need to 
> be fixed as soon as possible.

Paul,

Thanks for the heads up! While meta-arago is currently based on Dylan, I've 
made the necessary change in my layer so it will be ready for the master. 
Thanks.

-- 
Denys

