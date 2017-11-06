Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 238F96076F;
	Mon,  6 Nov 2017 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5DB73208DE;
	Mon,  6 Nov 2017 16:43:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oO6wQkkISwd4; Mon,  6 Nov 2017 16:43:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A4522031B;
	Mon,  6 Nov 2017 16:43:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A69DD162719; Mon,  6 Nov 2017 11:43:45 -0500 (EST)
Date: Mon, 6 Nov 2017 11:43:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20171106164345.GQ9221@denix.org>
References: <8075716d-066a-ec38-3787-fd64bb9c61d5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8075716d-066a-ec38-3787-fd64bb9c61d5@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [RFC] stable branch naming scheme
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
X-List-Received-Date: Mon, 06 Nov 2017 16:43:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 03, 2017 at 09:20:43AM -0700, akuster808 wrote:
> Hello,
> 
> The problem I hope to solve is that a Maintainer can stage changes in
> any branch in the contrib repos making it difficult for folks to track
> their back port requests. The also makes it harder to automate any kind
> of build automation.
> 
> I would like to propose a contrib naming scheme for the stable release
> branches. I am thinking of the following:
> 
> stable/{version}-next or {special char}_stable/{version}-next.
> 
>    "version" is either the code name or numeric like in bitbake.
> 
>    "special char" would be used to have these branches at the top of th
> list, if we wont that.

I like this branch unification!

I know we discussed this at OEDEM and there was some convenience reason given, 
but can we also standardize on the tree? I.e. openembedded-core-contrib vs. 
poky-contrib?


> We can apply this to all OE / Yocto repos that have stable branch
> maintenance process.
> 
> If we standardize on a naming scheme, We can then document this so
> contributers can monitor their requests more easily. The community can
> see what changes are being backport.  This will enable the possibility
> to automate builds, etc. 
> 
> let me know what you think.
> 
> Kind regards,
> 
> Armin
> 
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture

