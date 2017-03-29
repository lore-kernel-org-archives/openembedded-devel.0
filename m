Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AD68471D82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 22:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C9C020B7A;
	Wed, 29 Mar 2017 22:04:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id o8YYwGium0Rq; Wed, 29 Mar 2017 22:04:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 437D3208B3;
	Wed, 29 Mar 2017 22:04:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B7560162450; Wed, 29 Mar 2017 18:04:01 -0400 (EDT)
Date: Wed, 29 Mar 2017 18:04:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170329220401.GQ15664@denix.org>
References: <CAHUNapSj77gK_kExofCWaeREZOqwQoHQei4YZbqE1F5Uh=2CFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapSj77gK_kExofCWaeREZOqwQoHQei4YZbqE1F5Uh=2CFA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] calling all chromium recipe users
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
X-List-Received-Date: Wed, 29 Mar 2017 22:04:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 29, 2017 at 03:35:22PM -0400, Trevor Woerner wrote:
> When testing changes to the chromium[-wayland] recipes, it would be
> great to know the layers, configurations, and MACHINEs with which
> people are building.
> 
> For example I care about chromium running on X11 for minnow
> (meta-intel) and raspberry pi (meta-raspberrypi). How are other people
> running chromium?

chromium-wayland on TI platforms from meta-ti.


> Also, are you able to run with accelerated graphics? If so, what
> configuration are you using?

Full acceleration is still in the works for our platforms.
Very basic "hacky" way was to patch wayland.gyp to bypass the configure check 
for Mesa version:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-wayland.gyp-adjust-Mesa-version-to-work-with-TI-SGX-.patch;hb=HEAD

-- 
Denys


> Specifically, I assume the trick is the correct configuration of various
> 
>     PREFERRED_PROVIDER_virtual/X = Y
> 
> where X is one of {mesa|gl|egl|gles1|gles2} and Y is probably
> something BSP-specific. Is anything else needed to get accelerated
> graphics working with chromium?
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

